import express from "express";
import dotenv from "dotenv";
import cors from 'cors';
import routes from "./routes/index.js";

const app = express();
dotenv.config();

app.use( express.json() );

app.use(cors({
  origin: 'https://timely-jelly-8e15d2.netlify.app', // Permite solo este origen
  //origin: 'http://localhost:3000', // Permite solo este origen
  methods: ['GET', 'POST', 'PUT', 'DELETE'], // Métodos HTTP permitidos
  allowedHeaders: ['Content-Type', 'Authorization'], // Encabezados permitidos
  credentials: true // Si necesitas manejar cookies o sesiones (opcional)
}));

app.use( "/api", routes );


app.listen(5000, () => console.log(`Servidor corriendo en la URL: http://localhost:${5000}`));