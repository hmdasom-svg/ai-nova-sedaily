require('dotenv').config();
const axios = require('axios');
const AWS = require('aws-sdk');
const FormData = require('form-data');
const { callNewsSearchAPI } = require('./newsSearch');

const S3 = new AWS.S3();
const TODAYKW_URL = process.env.TODAYKW_URL;
const ISSUEMAP_URL = process.env.ISSUEMAP_URL;
const AI_KEY = process.env.BK_AI_KEY;
const API_KEY = process.env.BK_API_KEY;
const S3_ISSUE_MAP_BUCKET = process.env.S3_ISSUE_MAP_BUCKET;
const S3_KEYWORD_BUCKET = process.env.S3_KEYWORD_BUCKET;
const SUMMARY_API_URL = process.env.SUMMARY_API_URL;
const MAX_KEYWORD = 5;
const MAX_GRAPH_NODES = 10;

// 오늘의 키워드 5개 추출 (외부 API)
async function getTopKeywords() {
    const res = await axios.post(TODAYKW_URL, {
        access_key: API_KEY,
        argument: {}
    });
    return res.data.return_object.cate_keyword
        .filter(k => k.category_name === '전체')
        .sort((a, b) => b.named_entity_count - a.named_entity_count)
        .slice(0, MAX_KEYWORD)
    .map(k => ({
      keyword_name: k.named_entity,
      mention_count: k.named_entity_count,
      named_entity_type: k.named_entity_type
    }));
}

// 관계도 API 호출
async function fetchIssueMap(keyword) {
    const res = await axios.post(ISSUEMAP_URL, {
        access_key: API_KEY,
        argument: { query: keyword }
    });
    console.log(keyword, ' 관련 이슈맵 검색 완료');
    return res.data;
}

async function saveToS3(date, keyword, obj, suffix = '.json', prefix, bucket) {
    const key = `${prefix}/${date}_${keyword}${suffix}`;
    await S3.putObject({
        Bucket: bucket,
        Key: key,
        Body: JSON.stringify(obj),
        ContentType: 'application/json'
    }).promise();
    return key;
}

function convertToGraph(apiResult, maxNodes = MAX_GRAPH_NODES) {
  let nodes = apiResult.return_object.nodes
    .filter(n => n.type !== 'NEWS')
    .sort((a, b) => b.weight - a.weight)
    .slice(0, maxNodes);
  const weights = nodes.map(n => n.weight);
  const minW = Math.min(...weights);
  const maxW = Math.max(...weights);
  function normalize(w) {
    return minW === maxW ? 40 : 20 + (w - minW) * (60 - 20) / (maxW - minW);
  }
  const idMap = Object.fromEntries(nodes.map((n, i) => [n.node_id, String(i)]));
  nodes = nodes.map((n, i) => ({
    id: String(i),
    name: n.label,
    value: n.weight,
    symbolSize: normalize(n.weight),
    category: n.type
  }));
  const links = [];
  if (apiResult.return_object.needges) {
    for (const edge of apiResult.return_object.needges) {
      const source = idMap[edge.source];
      const target = idMap[edge.target];
      if (source !== undefined && target !== undefined) {
        links.push({
          source,
          target,
          lineStyle: { width: edge.weight ? Math.max(2, edge.weight * 3) : 3 }
        });
      }
    }
  }
  const categories = [...new Set(nodes.map(n => n.category))].map(name => ({ name }));
  return { nodes, links, categories };
}

// 뉴스 검색 후 content 합치기
async function getKeywordContents(keyword, date) {
    const { documents } = await callNewsSearchAPI(keyword, date, API_KEY, 5);
    // 뉴스가 없다면 전날로 다시 검색
    if (!documents || documents.length === 0) {
      // KST 기준 어제 날짜 및 배치 번호 계산
      const prevDate = new Date(Date.now() + 9 * 60 * 60 * 1000 - 24 * 60 * 60 * 1000); // KST 기준 어제
      const prevDateStr = prevDate.toISOString().slice(0, 10).replace(/-/g, '');
      const res = await callNewsSearchAPI(keyword, prevDateStr, API_KEY, 5);
      if (res.documents?.length) {
        return res.documents.map(doc => doc.content).filter(Boolean);
      }
    }
    return documents.map(doc => doc.content).filter(Boolean);
}

// 요약 API 호출 (form-data)
async function callSummaryAPI(txt, content) {
    const form = new FormData();
    form.append('file', Buffer.from(txt), { filename: 'news.txt', contentType: 'text/plain' });
    form.append('content', content);
    const response = await axios.post(SUMMARY_API_URL, form, {
        headers: {
            ...form.getHeaders(),
            Authorization: `Bearer ${AI_KEY}`
        }
    });
  return response.data && response.data.content ? response.data.content : response.data;
}


// 1. 오늘의 키워드 5개를 조회하고 S3에 저장하는 handler
exports.saveTodayKeywordsToS3Handler = async (event) => {
  const keywords = await getTopKeywords();
  if (keywords.length === 0) {
    throw new Error('No keywords found');
  }
  // KST 기준 오늘 날짜 및 배치 번호 계산
  const kstNow = new Date(new Date().getTime() + 9 * 60 * 60 * 1000);
  const dateStr = kstNow.toISOString().slice(0, 10);
  const dateStrForSave = dateStr.replace(/-/g, '');
  // 오전 실행이면 오늘날짜_1, 오후 실행이면 오늘날짜_2
  const hour = kstNow.getHours();
  const batchNum = hour < 12 ? '1' : '2';
  // S3에 저장 (keyword/{date}_1.json 또는 {date}_2.json)
  const saveObj = { search_date: `${dateStrForSave}_${batchNum}`, keywords };
  await saveToS3(dateStrForSave, batchNum, saveObj, '.json', 'keyword', S3_KEYWORD_BUCKET);
  return { date: dateStr, dateForSave: dateStrForSave, batchNum, keywords };
};

// 2. 키워드별 관계도 API 호출 및 S3 저장 handler
exports.fetchAndSaveIssueMapHandler = async (event) => {
  const { date, dateForSave, keywords } = event;
  const issueMap = await fetchIssueMap(keywords.keyword_name);
  const graph = convertToGraph(issueMap);
  await saveToS3(dateForSave, keywords.keyword_name, graph, '.json', 'issue-map', S3_ISSUE_MAP_BUCKET);
  return { date, dateForSave, keywords };
};

// 3. 키워드별 기사 검색/요약 및 S3 저장 handler
exports.summarizeAndSaveNewsHandler = async (event) => {
  const { date, dateForSave, keywords } = event;
  const endStr = new Date();
  endStr.setDate(endStr.getDate() + 1);
  const contents = await getKeywordContents(keywords.keyword_name, dateForSave);
  if (contents.length > 0) {
    const txt = contents.join('\n\n');
    const summary = await callSummaryAPI(txt, `주어진 파일 내용으로만 ${keywords.keyword_name}에 관해 500자 내로 요약해주고, 요약 내용 외에는 다른 문구(글자수나 참고사항 등)를 절대 쓰지 마세요.`);
    await saveToS3(dateForSave, keywords.keyword_name, summary, '.json', 'summary', S3_ISSUE_MAP_BUCKET);
  }
  return { date: dateForSave, keywords };
};

// (선택) 전체 orchestrator handler (테스트/로컬용)
exports.orchestratorHandler = async (event) => {
  const res1 = await exports.saveTodayKeywordsToS3Handler(event);
  const res2 = await exports.fetchAndSaveIssueMapHandler(res1);
  const res3 = await exports.summarizeAndSaveNewsHandler(res2);
  return { res1, res2, res3 };
};
