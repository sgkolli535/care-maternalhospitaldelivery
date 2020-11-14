const express = require("express");
const app = express();
const cors = require("cors");
const pool = require("./db");
app.use(cors());
app.use(express.json());

/* ROUTES */

/*PATIENTS */
// GET ALL PATIENTS
app.get("/patients", async (req, res) => {
  try {
    const patients = await pool.query(`SELECT * FROM patients;`);
    res.send(patients.rows);
  } catch (err) {
    console.error(err.message);
  }
});
// GET PATIENT INFO
app.get("/patients/:patient_id", async (req, res) => {
  try {
    const { patient_id } = req.params;
    const patient_info = await pool.query(
      `SELECT * from patients WHERE patient_id = ${patient_id};`
    );
    res.send(patient_info.rows);
  } catch (err) {
    console.error(err.message);
  }
});

//ADD NEW PATIENT
app.post("/patients", async (req, res) => {
  try {
    const { first_name, last_name, dob, location } = req.body;
    const new_patient = await pool.query(
      `INSERT INTO patients(first_name, last_name, dob, location) 
      VALUES ('${first_name}', '${last_name}', '${dob}', '${location}')
      RETURNING *;`
    );
    res.json(new_patient);
  } catch (err) {
    console.error(err.message);
  }
});

/* FORMS */
/* FACILITY */
//GET ALL FACILITIES
app.get("/facilities", async (req, res) => {
  try {
    const facilities = await pool.query(`SELECT * FROM facilities;`);
    res.send(facilities.rows);
  } catch (err) {
    console.error(err.message);
  }
});
// GET FACILITY INFO
app.get("/facilities/:facility_id", async (req, res) => {
  try {
    const { facility_id } = req.params;
    const facility = await pool.query(
      `SELECT * from facilities WHERE facility_id = ${facility_id};`
    );
    res.send(facility.rows);
  } catch (err) {
    console.error(err.message);
  }
});

//ADD NEW FACILITY
app.post("/facilities", async (req, res) => {
  try {
    const { facility_name, mlf_code, district, region } = req.params;
    const new_facility = await pool.query(
      `INSERT INTO facilities(facility_name, mlf_code, district, region) VALUES (${facility_name}, ${mlf_code}, ${district}, ${region});`
    );
    res.json(new_facility);
  } catch (err) {
    console.error(err.message);
  }
});


app.listen(5000, () => console.log("Server listening on port 5000..."));
