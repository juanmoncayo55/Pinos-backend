import { Pool } from 'pg'; // Importa Pool de 'pg'
import dotenv from 'dotenv';
dotenv.config();

const conn = new Pool({
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_NAME,
  password: process.env.DB_PASS,
  port: process.env.DB_PORT || 5432,
  max: 10,
  idleTimeoutMillis: 30000,
  pool_mode: "transaction",
  ssl: {
    rejectUnauthorized: false // Deshabilitar la validación del certificado (solo para DEV)
  },
  connectionTimeoutMillis: 5000
});

conn.on('error', (err) => {
  console.error('Error inesperado en el pool de conexiones a la base de datos PostgreSQL:', err);
});

console.log('Pool de conexiones a PostgreSQL creado.');

export default conn;