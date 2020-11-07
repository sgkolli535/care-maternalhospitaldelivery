CREATE DATABASE MaternalDeliveryApp
CREATE TABLE appointments();
CREATE TABLE forms();
CREATE TABLE users();
CREATE TABLE facilities(
    facility_id SERIAL PRIMARY KEY,
    facility_name VARCHAR(255),
    mlf_code VARCHAR(255),
    district VARCHAR(255),
);
CREATE TABLE users();
CREATE TABLE patients();

ALTER TABLE users ADD COLUMN user_id SERIAL PRIMARY KEY;



ALTER TABLE patients ADD COLUMN patient_id SERIAL PRIMARY KEY;
ALTER TABLE patients ADD COLUMN first_name VARCHAR(255);
ALTER TABLE patients ADD COLUMN last_name VARCHAR(255);
INSERT INTO patients (patient_id,first_name,last_name) VALUES (1,'Jane','Doe');
INSERT INTO patients (patient_id,first_name,last_name) VALUES (2,'Emily','Day'); 

ALTER COLUMN column_name [SET DATA] TYPE new_data_type;
