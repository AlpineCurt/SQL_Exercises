DROP DATABASE IF EXISTS medical_center_db;
CREATE DATABASE medical_center_db;
\c medical_center_db;

CREATE TABLE medical_centers (
  id SERIAL PRIMARY KEY,
  name TEXT
);

CREATE TABLE doctors (
  id SERIAL PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  employed_at INTEGER REFERENCES medical_centers ON DELETE SET NULL
);

CREATE TABLE diseases (
  id SERIAL PRIMARY KEY,
  name TEXT
);

CREATE TABLE patients (
  id SERIAL PRIMARY KEY,
  first_name TEXT,
  last_name TEXT
);

CREATE TABLE patient_diseases (
    id SERIAL PRIMARY KEY,
    patient INTEGER REFERENCES patients ON DELETE SET NULL,
    disease INTEGER REFERENCES diseases ON DELETE SET NULL
);

CREATE TABLE patients_doctors (
    id SERIAL PRIMARY KEY,
    patient INTEGER REFERENCES patients ON DELETE SET NULL,
    doctor INTEGER REFERENCES doctors ON DELETE SET NULL
);

INSERT INTO medical_centers (name) VALUES ('Bonesaw Memorial Hospital');

INSERT INTO doctors
(first_name, last_name, employed_at)
VALUES
('Fred', 'Evil', 1),
('Linda', 'Goode', 1);

INSERT INTO diseases
(name)
VALUES
('Derpese'),
('Shoe Lace Fungus'),
('Maga');

INSERT INTO patients
(first_name, last_name)
VALUES
('Hal', 'Murica'),
('Karen', 'Service'),
('Fakie', 'McGee');

INSERT INTO patient_diseases
(patient, disease)
VALUES
(1, 2),
(1, 3),
(3, 2);

INSERT INTO patients_doctors
(patient, doctor)
VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 2);