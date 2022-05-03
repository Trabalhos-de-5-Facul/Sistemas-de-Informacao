const db = require("mysql2");

const pool = db.createPool({
  host: process.env.MYSQL_HOST,
  port: process.env.MYSQL_PORT,
  user: process.env.MYSQL_USER,
  password: "102030",
  database: process.env.MYSQL_DATABASE,
});

exports.pool = pool;
