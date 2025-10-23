const axios = require('axios');
require('dotenv').config();

const YEAR_GAP = 5;
const MONTH_GAP = 6;
const DAY_GAP = 7;

function getDateRange(interval, offset) {
  const now = new Date();
  let from, until;

  if (interval === 'year') {
    const untilYear = now.getFullYear() - (offset * YEAR_GAP);
    const fromYear = untilYear - (YEAR_GAP - 1);
    from = `${fromYear}-01-01`;
    if (offset === 0) {
      // until = 내년 1월 1일
      until = `${now.getFullYear() + 1}-01-01`;
    } else {
      until = `${untilYear + 1}-01-01`;
    }
  } else if (interval === 'month') {
    // untilDate: 구간의 끝(포함X)
    const untilDate = (offset === 0)
      ? new Date(now.getFullYear(), now.getMonth() + 1, 1) // 다음 달 1일
      : new Date(now.getFullYear(), now.getMonth() + 1 - (offset * MONTH_GAP), 1);

    // fromDate: untilDate에서 6개월(=MONTH_GAP) 전의 1일
    const fromDate = new Date(untilDate.getFullYear(), untilDate.getMonth() - MONTH_GAP, 1);

    from = `${fromDate.getFullYear()}-${String(fromDate.getMonth() + 1).padStart(2, '0')}-01`;
    until = `${untilDate.getFullYear()}-${String(untilDate.getMonth() + 1).padStart(2, '0')}-01`;
  } else if (interval === 'day') {
    const untilDate = new Date(now);
    untilDate.setDate(untilDate.getDate() - (offset * DAY_GAP));
    const fromDate = new Date(untilDate);
    fromDate.setDate(fromDate.getDate() - (DAY_GAP - 1));
    from = fromDate.toISOString().slice(0, 10);
    if (offset === 0) {
      // until = 내일 날짜 (오늘 포함X)
      const tomorrow = new Date(now);
      tomorrow.setDate(now.getDate() + 1);
      until = tomorrow.toISOString().slice(0, 10);
    } else {
      untilDate.setDate(untilDate.getDate() + 1);
      until = untilDate.toISOString().slice(0, 10);
    }
  } else {
    throw new Error('Invalid interval');
  }
  console.log(`Interval: ${interval}, Offset: ${offset}, From: ${from}, Until: ${until}`);

  return { from, until };
}


async function callIssueFlowAPI(keyword, interval, offset, token) {
  const url = process.env.ISSUEFLOW_URL;
  const headers = {
    'Authorization': `Bearer ${token}`,
    'Content-Type': 'application/json'
  };
  const { from, until } = getDateRange(interval, offset);

  const data = {
    access_key: token,
    argument: {
      query: keyword,
      published_at: {
        from: from,
        until: until
      },
      provider: ['서울경제'],
      interval: interval,
      normalize: 'false'
    }
  };

  const response = await axios.post(url, data, { headers });
  const { total_hists, time_line } = response.data.return_object;
  return { interval, total_hists, time_line };
}

module.exports = { callIssueFlowAPI };