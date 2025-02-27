const express = require('express');
const fs = require('fs');
const app = express();
const PORT = 3000;

app.get('/microfrontends', (req, res) => {
  const homeConfig = JSON.parse(fs.readFileSync('../home/lib/microfrontend_config.json'));
  const loginConfig = JSON.parse(fs.readFileSync('../login/lib/microfrontend_config.json'));

  res.json([homeConfig, loginConfig]);
});

app.listen(PORT, () => {
  console.log(`Servidor ejecutándose en http://localhost:${PORT}`);
});
