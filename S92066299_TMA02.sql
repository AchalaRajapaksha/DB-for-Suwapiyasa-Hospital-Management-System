-- Drop database to run script multiple times
DROP DATABASE IF EXISTS Suwapiyasa;

-- Crate database suwapiyasa
CREATE DATABASE Suwapiyasa;

-- use the database
USE Suwapiyasa;

-- Create the 'employee' table
CREATE TABLE employee (
    emp_Id INT PRIMARY KEY,
    name VARCHAR(100),
    gender CHAR(1),
    address VARCHAR(200),
    telephone_no VARCHAR(20)
);

-- Create the 'head_doctor' table
CREATE TABLE head_doctor (
    HD_number INT PRIMARY KEY,
    specialty VARCHAR(100),
    salary DECIMAL(10, 2),
    emp_Id INT UNIQUE,
    FOREIGN KEY (emp_Id) REFERENCES employee(emp_Id)
);
-- Create the 'doctor' table
CREATE TABLE doctor (
    specialty VARCHAR(100),
    salary DECIMAL(10, 2),
    HD_number INT,
    emp_Id INT UNIQUE,
    FOREIGN KEY (HD_number) REFERENCES head_doctor(HD_number),
    FOREIGN KEY (emp_Id) REFERENCES employee(emp_Id)
);

-- Create the 'surgeon' table
CREATE TABLE surgeon (
    specialty VARCHAR(100),
    type_of_contract VARCHAR(50),
    length_of_contract INT,
    emp_Id INT UNIQUE,
    FOREIGN KEY (emp_Id) REFERENCES employee(emp_Id)
);

-- Create the 'patient' table
CREATE TABLE patient (
    patient_Id INT PRIMARY KEY,
    initials VARCHAR(10),
    surname VARCHAR(100),
    address VARCHAR(200),
    age INT,
    blood_type VARCHAR(5),
    allergies VARCHAR(200),
    telephone_no VARCHAR(20),
    doctor_Id INT,
    FOREIGN KEY (doctor_Id) REFERENCES doctor(emp_Id)
);

-- Create the 'surgery' table
CREATE TABLE surgery (
    surgery_Id INT PRIMARY KEY,
    patient_Id INT,
    surgery_name VARCHAR(100),
    date DATE,
    theatre VARCHAR(50),
    time TIME,
    surgeon_Id INT,
    category VARCHAR(100),
    special_needs VARCHAR(200),
    no_of_nurses INT,
    FOREIGN KEY (patient_Id) REFERENCES patient(patient_Id),
    FOREIGN KEY (surgeon_Id) REFERENCES surgeon(emp_Id)
);

-- Create the 'nurse' table
CREATE TABLE nurse (
    grade INT,
    salary DECIMAL(10, 2),
    surgery_skill_type VARCHAR(100),
    years_of_experience INT,
    emp_Id INT UNIQUE,
    surgery_Id INT,
    FOREIGN KEY (emp_Id) REFERENCES employee(emp_Id),
    FOREIGN KEY (surgery_Id) REFERENCES surgery(surgery_Id)
);
-- Create the 'location' table
CREATE TABLE location (
    bed_no INT,
    room_no INT,
    nursing_unit VARCHAR(100),
    patient_Id INT,
    FOREIGN KEY (patient_Id) REFERENCES patient(patient_Id)
);

-- Create the 'medication' table
CREATE TABLE medication (
    medication_Id INT PRIMARY KEY,
    name VARCHAR(100),
    cost DECIMAL(10, 2),
    expiration_date DATE,
    qty_ordered INT,
    qty_on_hand INT
);

-- Create the 'patient_medication' table
CREATE TABLE patient_medication (
    medication_Id INT PRIMARY KEY,
    patient_Id INT,
    medicine_qty_taken INT,
    FOREIGN KEY (patient_Id) REFERENCES patient(patient_Id),
    FOREIGN KEY (medication_Id) REFERENCES medication(medication_Id)
);

-- Insert values into the 'employee' table
INSERT INTO employee (emp_Id, name, gender, address, telephone_no)
VALUES
    (1, 'Nimal', 'M', '123 Main St', '0771234567'),
    (2, 'Janny', 'F', '456 Oak Ave', '0789234563'),
    (3, 'Michael', 'M', '789 Elm Rd', '0789982462'),
    (4, 'Roshani', 'F', '101 Maple St', '0789234585'),
    (5, 'Kamal', 'M', '222 Pine Rd', '0789234574'),
	(6, 'Sunil', 'M', '123 Main St', '0771234567'),
    (7, 'Rani', 'F', '456 Oak Ave', '0789234563'),
    (8, 'Roshan', 'M', '789 Elm Rd', '0789982462'),
    (9, 'Roshani', 'F', '101 Maple St', '0789234585'),
    (10, 'Ajith', 'M', '222 Pine Rd', '0789234574'),
	(11, 'Gayani', 'F', '101 Maple St', '0789234585'),
    (12, 'Suresh', 'M', '222 Pine Rd', '0789234574');


-- Insert values into the 'head_doctor' table
INSERT INTO head_doctor (HD_number, specialty, salary, emp_Id)
VALUES
    (101, 'Cardiology', 120000, 1),
    (102, 'Neurology', 130000, 2),
    (103, 'Oncology', 110000, 3);
    
-- Insert values into the 'doctor' table
INSERT INTO doctor (specialty, salary, HD_number, emp_Id)
VALUES
    ('Cardiology', 100000, 101, 4),   
    ('Neurology', 105000, 102, 5),    
    ('Oncology', 95000, 103, 6);      
   
   
-- Insert values into the 'surgeon' table
INSERT INTO surgeon (specialty, type_of_contract, length_of_contract, emp_Id)
VALUES
    ('Cardiothoracic', 'Permanent', 2, 7),     
    ('Orthopedic', 'Temporary', 1, 8),        
    ('Plastic', 'Permanent', 3, 9);          
    

-- Insert values into the 'patient' table
INSERT INTO patient (patient_Id, initials, surname, address, age, blood_type, allergies, telephone_no, doctor_Id)
VALUES
    (1001, 'A. B.', 'Gayan', '789 Elm Rd', 35, 'O+', 'None', '0789234741', 6),
    (1002, 'C. D.', 'Nimali', '222 Pine Rd', 45, 'A-', 'Peanuts', '07892347758', 4),
    (1003, 'E. F.', 'Thilini', '101 Maple St', 60, 'B+', 'Penicillin', '0789234251', 5),
    (1004, 'G. H.', 'Achala', '123 Main St', 28, 'AB-', 'None', '0789234678', 4),
    (1005, 'I. J.', 'Sumith', '456 Oak Ave', 50, 'O-', 'Sulfa', '0789347548', 6);

-- Insert values into the 'surgery' table
INSERT INTO surgery (surgery_Id, patient_Id, surgery_name, date, theatre, time, surgeon_Id, category, 
special_needs, no_of_nurses)
VALUES
    (2001, 1001, 'Heart Bypass', '2023-08-01', 'Theatre A', '10:00:00', 7, 'Cardiac', 'None', 3),
    (2002, 1002, 'Knee Replacement', '2023-08-02', 'Theatre B', '14:30:00', 8, 'Orthopedic', 'None', 2),
    (2003, 1003, 'Breast Augmentation', '2023-08-03', 'Theatre C', '09:45:00', 9, 'Plastic', 'Antibiotics', 2),
    (2004, 1004, 'Brain Tumor Removal', '2023-08-04', 'Theatre D', '13:15:00', 9, 'Neurological', 'None', 4),
    (2005, 1005, 'Appendectomy', '2023-08-05', 'Theatre E', '11:30:00', 7, 'General', 'None', 3);

-- Insert values into the 'nurse' table
INSERT INTO nurse (grade, salary, surgery_skill_type, years_of_experience, emp_Id, surgery_Id)
VALUES
    (1, 60000, 'Cardiac', 10, 10, 2001),
    (2, 55000, 'Orthopedic', 11, 11, 2002),
    (2, 57000, 'Plastic', 4, 12, 2003);
   

-- Insert values into the 'location' table
INSERT INTO location (bed_no, room_no, nursing_unit, patient_Id)
VALUES
    (101, 201, 'Cardiology', 1001),
    (102, 202, 'Orthopedic', 1002),
    (103, 203, 'Plastic', 1003),
    (104, 204, 'Neurology', 1004),
    (105, 205, 'General', 1005);

-- Insert values into the 'medication' table
INSERT INTO medication (medication_Id, name, cost, expiration_date, qty_ordered, qty_on_hand)
VALUES
    (3001, 'Aspirin', 10.99, '2024-12-31', 100, 500),
    (3002, 'Ibuprofen', 8.49, '2023-10-31', 80, 200),
    (3003, 'Penicillin', 15.75, '2025-06-30', 50, 150),
    (3004, 'Acetaminophen', 12.25, '2024-08-31', 120, 300),
    (3005, 'Amoxicillin', 18.50, '2023-11-30', 70, 180);

-- Insert values into the 'patient_medication' table
INSERT INTO patient_medication (medication_Id, patient_Id, medicine_qty_taken)
VALUES
    (3001, 1001, 2),
    (3002, 1002, 1),
    (3003, 1003, 3),
    (3004, 1004, 1),
    (3005, 1005, 2);


