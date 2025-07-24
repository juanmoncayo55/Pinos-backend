import mysql from "mysql2/promise";
import dotenv from "dotenv";
dotenv.config()
const conn = mysql.createPool({
  host: process.env.BD_HOST,
  user: process.env.BD_USER,
  password: process.env.BD_PASS,
  database: process.env.BD_DATABASE,
  port: process.env.BD_PORT,
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

conn.on('error', (err) => {
  console.error('Error inesperado en el pool de conexiones a la base de datos:', err);
});

export default conn;