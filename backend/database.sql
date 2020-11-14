CREATE DATABASE MaternalDeliveryApp
CREATE TABLE appointments(
    appointment_id SERIAL PRIMARY KEY,
    community_worker_id INT,
    CONSTRAINT fk_community_worker 
    FOREIGN KEY (community_worker_id) 
    REFERENCES community_workers(community_worker_id),
    facility_worker_id INT,
    CONSTRAINT fk_facility_worker 
    FOREIGN KEY (facility_worker_id) 
    REFERENCES facility_workers(facility_worker_id),
    date_time TIMESTAMP,
    appointment_type VARCHAR(255),

);
CREATE TABLE forms(
    form_id SERIAL PRIMARY KEY,
    patient_id INT,
    CONSTRAINT fk_patient 
    FOREIGN KEY (patient_id)
    REFERENCES patients(patiend_id),
    form_type VARCHAR(255),
    date_created DATE,
);
CREATE TABLE facilities(
    facility_id SERIAL PRIMARY KEY,
    facility_name VARCHAR(255),
    mlf_code VARCHAR(255),
    district VARCHAR(255),
);
CREATE TABLE community_workers(
    community_worker_id INT PRIMARY KEY,
    CONSTRAINT fk_community_user 
    FOREIGN KEY (community_worker_id)
    REFERENCES users(user_id),
    facility_worker_id INT
    CONSTRAINT fk_facility_worker
    FOREIGN KEY (facility_worker_id)
    REFERENCES facility_workers(facility_worker_id),
);
CREATE TABLE facility_workers(
    facility_worker_id INT PRIMARY KEY,
    CONSTRAINT fk_facility_user
    FOREIGN KEY (facility_worker_id)
    REFERENCES users(user_id),
    facility_id INT,
    CONSTRAINT fk_facility
    FOREIGN KEY (facility_id)
    REFERENCES facility(facility_id),
);

CREATE TABLE patients(
    patient_id SERIAL PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    dob DATE,
    location VARCHAR(255)
);

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255),
    password VARCHAR(255),
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    dob DATE,
    type CHAR(9) CHECK(type = 'community' or type = 'facility'),
    location VARCHAR(255)
);

ALTER TABLE patients ADD COLUMN patient_id SERIAL PRIMARY KEY;
INSERT INTO patients (first_name,last_name, dob, location) VALUES ('Jane','Doe','1998-01-20','123 Street St, CA');
INSERT INTO patients (first_name,last_name, dob, location) VALUES ('Emily','Day','1990-10-25','456 Drive Dr, WA');
