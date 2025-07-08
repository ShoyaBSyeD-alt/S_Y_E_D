const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.send('Hello from Dockerized Node.js App!');
});

const PORT = process.env.PORT || 8347;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});

