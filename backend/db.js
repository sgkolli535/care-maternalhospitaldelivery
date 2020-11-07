const Pool = require("pg").Pool;

const pool = new Pool({
  user: "admin",
  password: "admin123",
  host: "localhost",
  port: 5432,
  database: "maternaldeliveryapp",
});

module.exports = pool;
