const express = require('express');
const cors = require('cors'); // 🔹 Importamos CORS
const app = express();
const PORT = 3000;

// 🔹 Habilitar CORS para todas las solicitudes
app.use(cors());

// Definimos los microfrontends simulando AWS
const microfrontends = [
  {
    name: "home",
    path: "/home",
    url: "https://nivekalexander.github.io/home/"
  },
  {
    name: "login",
    path: "/login",
    url: "https://nivekalexander.github.io/login/"
  }
];

// Endpoint que devuelve la configuración de los microfrontends
app.get('/microfrontends', (req, res) => {
  res.json(microfrontends);
});

// Iniciar el servidor en el puerto 3000
app.listen(PORT, () => {
  console.log(`🚀 Servidor ejecutándose en http://localhost:${PORT}`);
});
