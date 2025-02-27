const express = require('express');
const cors = require('cors');
const app = express();
const PORT = 3000;

app.use(cors());

const microfrontends = [
  {
    name: "home",
    path: "/home",
    url: "https://nivekalexander.github.io/home-deploy/"
  },
  {
    name: "login",
    path: "/login",
    url: "https://nivekalexander.github.io/login-deploy/"
  }
];

app.get('/microfrontends', (req, res) => {
  res.json(microfrontends);
});

app.listen(PORT, () => {
  console.log(`🚀 Servidor ejecutándose en http://localhost:${PORT}`);
});
