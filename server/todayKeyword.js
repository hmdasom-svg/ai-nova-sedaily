const axios = require('axios');
require('dotenv').config();

const CLOUDFRONT_KEYWORD_URL = process.env.CLOUDFRONT_KEYWORD_URL;
const PREFIX_KEYWORD = 'keyword';

function getTargetDateAndBatchNum() {
  const now = new Date();
  const kstNow = new Date(now.getTime() + 9 * 60 * 60 * 1000);
  const hour = kstNow.getUTCHours();
  const min = kstNow.getUTCMinutes();
  let date = new Date(kstNow);
  // 18:10 ~ 23:59 오늘날짜_2
  // 00:00 ~ 09:09 어제날짜_2
  // 09:10 ~ 18:09 오늘날짜_1
  let batchNum = '1';
  if (hour > 18 || (hour === 18 && min >= 10)) {
    batchNum = '2';
  } else if (hour < 9 || (hour === 9 && min < 10)) {
    batchNum = '2';
    date.setUTCDate(date.getUTCDate() - 1);
  }
  const yyyy = date.getUTCFullYear();
  const mm = String(date.getUTCMonth() + 1).padStart(2, '0');
  const dd = String(date.getUTCDate()).padStart(2, '0');
  return { dateStr: `${yyyy}${mm}${dd}`, batchNum };
}

async function getTodayKeyword() {
  const { dateStr, batchNum } = getTargetDateAndBatchNum();
  const key = `${dateStr}_${batchNum}.json`; // 오전/오후 키워드 기준
  const keywordURL = `${CLOUDFRONT_KEYWORD_URL.replace(/\/$/, '')}/${PREFIX_KEYWORD}/${key}`;
  return { keywordURL };
}
module.exports = { getTodayKeyword };