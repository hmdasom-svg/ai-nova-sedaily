const axios = require('axios');
require('dotenv').config();

async function callNewsChatAPI(content, token) {
  const url = process.env.NEWSCHAT_URL;
  const data = { content, provider: '서울경제' };
  const headers = {
    'Authorization': `Bearer ${token}`,
    'Content-Type': 'application/json'
  };
  const response = await axios.post(url, data, { headers });
  const {
    token_count,
    input_token,
    output_token,
    total_token,
    ...rest
  } = response.data;
  return rest;
}

module.exports = { callNewsChatAPI };