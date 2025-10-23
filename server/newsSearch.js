const axios = require('axios');
require('dotenv').config();


function getDateRange(date) {
  if (!date) return { startDt: undefined, endDt: undefined };
  if (date.length === 4) {
    // 연도: 2025 -> 2025-01-01 ~ 2026-01-01
    const year = Number(date);
    return { startDt: `${year}-01-01`, endDt: `${year + 1}-01-01` };
  } else if (date.length === 6) {
    // 월: 202508 -> 2025-08-01 ~ 2025-09-01
    const year = Number(date.slice(0, 4));
    const month = Number(date.slice(4, 6));
    let nextMonth = month + 1;
    let nextYear = year;
    if (nextMonth > 12) {
      nextMonth = 1;
      nextYear = year + 1;
    }
    return {
      startDt: `${year}-${String(month).padStart(2, '0')}-01`,
      endDt: `${nextYear}-${String(nextMonth).padStart(2, '0')}-01`
    };
  } else if (date.length === 8) {
    // 일: 20250826 -> 2025-08-26 ~ 2025-08-27
    const year = date.slice(0, 4);
    const month = date.slice(4, 6);
    const day = date.slice(6, 8);
    const startDt = `${year}-${month}-${day}`;
    // endDt는 다음날
    const d = new Date(`${year}-${month}-${day}`);
    d.setDate(d.getDate() + 1);
    const endYear = d.getFullYear();
    const endMonth = String(d.getMonth() + 1).padStart(2, '0');
    const endDay = String(d.getDate()).padStart(2, '0');
    const endDt = `${endYear}-${endMonth}-${endDay}`;
    return { startDt, endDt };
  }
  return { startDt: undefined, endDt: undefined };
}

async function callNewsSearchAPI(keyword, date, token, returnSize) {
  const url = process.env.NEWSSEARCH_URL;
  const headers = {
    'Authorization': `Bearer ${token}`,
    'Content-Type': 'application/json'
  };

  // date 변환 적용
  const { startDt, endDt } = getDateRange(date);
  if (!startDt || !endDt) {
    return { error: 'date 파라미터가 올바르지 않습니다. (yyyy, yyyyMM, yyyyMMdd 형식만 지원)', raw: { date } };
  }

  const data = {
    access_key: token,
    argument: {
      query: keyword,
      published_at: {
        from: startDt,
        until: endDt
      },
      provider: ['서울경제'],
      return_from: 0,
      return_size: returnSize,
      fields: [
          "dateline",
          "provider_link_page",
          "title",
          "content"
      ]
    }
  };

  const response = await axios.post(url, data, { headers });
  if (!response.data || !response.data.return_object) {
    return { error: 'API 응답에 return_object가 없습니다.', raw: response.data };
  }
  const { total_hits, documents } = response.data.return_object;
  if (!documents || documents.length === 0) {
    console.log(keyword, ' 관련 뉴스가 없습니다.');
    return { documents: [] };
  }
  const filteredDocuments = documents.map(doc => {
    const { dateline, published_at, enveloped_at, provider, ...rest } = doc;
    return { ...rest, dateline };
  });
  // dateline 기준 최신순(내림차순) 정렬
  filteredDocuments.sort((a, b) => new Date(b.dateline) - new Date(a.dateline));
  console.log(keyword, ' 관련 뉴스 검색 완료');
  return { total_hits, documents: filteredDocuments };
}
module.exports = { callNewsSearchAPI };