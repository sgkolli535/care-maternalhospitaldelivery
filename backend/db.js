const Pool = require("pg").Pool;

const pool = new Pool({
  user: "admin",
  password: "admin123",
  host: "localhost",
  port: 5432,
  database: "care_somali_mhd",
});

module.exports = pool;
