CREATE DATABASE hospital_db;
USE hospital_db;

CREATE TABLE Patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    age INT,
    gender VARCHAR(10),
    phone VARCHAR(15)
);

CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    specialty VARCHAR(50)
);

CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    problem VARCHAR(200),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

INSERT INTO Patients (name, age, gender, phone) VALUES
('Rahul Patel', 38, 'Male', '9876500010'),
('Meera Iyer', 32, 'Female', '9876500020');

INSERT INTO Doctors (name, specialty) VALUES
('Dr. Asha Rao', 'General Physician'),
('Dr. Vikram Shah', 'Pediatrician');

INSERT INTO Appointments (patient_id, doctor_id, appointment_date, problem) VALUES
(1, 1, '2025-08-14', 'Fever and cold'),
(2, 2, '2025-08-15', 'Child vaccination');

SELECT a.appointment_id, p.name AS patient_name, d.name AS doctor_name, a.appointment_date, a.problem
FROM Appointments a
JOIN Patients p ON a.patient_id = p.patient_id
JOIN Doctors d ON a.doctor_id = d.doctor_id;
