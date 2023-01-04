DROP DATABASE medical_center_db;
CREATE DATABASE medical_center_db;
\c medical_center_db;

CREATE TABLE medical_center (
  id SERIAL PRIMARY KEY,
  name TEXT
);

CREATE TABLE doctors (
  id SERIAL PRIMARY KEY,
  employer_id integer REFERENCES medical_center,
  name text
);

CREATE TABLE patients (
  id SERIAL PRIMARY KEY,
  name text
);

CREATE TABLE patient_visit (
  id SERIAL PRIMARY KEY,
  medical_center_id integer REFERENCES medical_center,
  patient_id integer REFERENCES patients,
  doctor_id integer REFERENCES doctors,
  visit_date date
);

CREATE TABLE diseases (
  id SERIAL PRIMARY KEY,
  name text
);

CREATE TABLE visit_diagnosis (
  id SERIAL PRIMARY KEY,
  visit_id integer REFERENCES patient_visit,
  patient_symptoms text,
  disease_id integer REFERENCES diseases
);

INSERT INTO medical_center (name) VALUES ('Lower Bucks');

INSERT INTO doctors (employer_id, name)
VALUES
(1, 'Freya Hall'),
(1, 'Henry Scoop'),
(1, 'Spoon McDermott');

INSERT INTO patients (name)
VALUES
('Goofball Tutupants'),
('Square Boxers'),
('Cinderella');

INSERT INTO patient_visit (medical_center_id, patient_id, doctor_id, visit_date)
VALUES
(1, 1, 3, '2020-02-14'),
(1, 2, 1, '2020-02-15'),
(1, 3, 3, '2022-04-05');

INSERT INTO diseases (name)
VALUES
('Silly Goose Syndrome'),
('Too Much Poop Disease'),
('Cheese Foot');

INSERT INTO visit_diagnosis (visit_id, patient_symptoms, disease_id)
VALUES
(1, 'Scans revealed patient was full of poop', 2),
(1, 'Patient foot growing cheese', 3),
(2, 'Patient was being real silly', 1),
(3, 'Nothing wrong with patient', NULL);


SELECT m.name as hospital_name, p.name as patient_name, d.name as doctor_name, vd.patient_symptoms, dis.name as disease_name  FROM patient_visit
JOIN medical_center m ON medical_center_id = m.id
JOIN doctors d ON d.id = doctor_id
JOIN patients p ON patient_id = p.id
JOIN visit_diagnosis vd ON visit_id = patient_visit.id
JOIN diseases dis on disease_id = dis.id;