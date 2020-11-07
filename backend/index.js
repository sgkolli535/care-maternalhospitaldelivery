const express = require("express");
const app = express();
const cors = require("cors");
const pool = require("./db");
app.use(cors());
app.use(express.json());

// ROUTES

app.get("/patients", async (req, res) => {
  try {
    const patients = await pool.query("SELECT * from patients");
    res.send(patients.rows);
  } catch (err) {
    console.error(err.message);
  }
});

app.get("/patients/:patient_id", async (req, res) => {
  try {
    const { patient_id } = req.params;
    const patient_info = await pool.query(
      "SELECT * from patients WHERE patient_id = $1",
      [patient_id]
    );
    res.send(patient_info.rows);
  } catch (err) {
    console.error(err.message);
  }
});

app.listen(5000, () => console.log("Server listening on port 5000..."));
