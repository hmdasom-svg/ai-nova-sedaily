require('dotenv').config();

const express = require('express');
const app = express();
app.use(express.json());

const { callNewsChatAPI } = require('./newsChat');
const { callIssueFlowAPI } = require('./issueFlow');
const { callNewsSearchAPI } = require('./newsSearch');
const { getTodayKeyword } = require('./todayKeyword');

const AI_KEY = process.env.BK_AI_KEY;
const API_KEY = process.env.BK_API_KEY;

// AI 채팅 API
app.post('/v1/newsChat', async (req, res) => {
  try {
    const { content } = req.body;
    const result = await callNewsChatAPI(content, AI_KEY);
    res.json(result);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// 이슈 흐름도 API
app.post('/v1/issueFlow', async (req, res) => {
  try {
    const { keyword, interval, offset } = req.body;
    const result = await callIssueFlowAPI(keyword, interval, offset, API_KEY);
    res.json(result);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// 뉴스 검색 API
app.post('/v1/newsSearch', async (req, res) => {
  try {
    const { keyword, date } = req.body;
    const result = await callNewsSearchAPI(keyword, date, API_KEY, 20);
    res.json(result);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// 오늘의 키워드 API
app.get('/v1/todayKeyword', async (req, res) => {
  try {
    const result = await getTodayKeyword();
    res.json(result);
  } catch (err) {
    res.status(500).json({ error: err.message });
  } 
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`API Gateway listening on port ${PORT}`);
});

const serverless = require('@vendia/serverless-express');
exports.handler = serverless({ app });