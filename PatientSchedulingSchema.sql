CREATE DATABASE PatientScheduling;
USE PatientScheduling;
CREATE TABLE Patient(
	patient_ID INT (6),
	f_name VARCHAR (15),
    l_name VARCHAR (15),
    address VARCHAR (50),
    phoneNumber INT (10),
    emailAddress INT (10),
    PRIMARY KEY(patient_ID)
);

CREATE TABLE Doctor(
	doctor_ID INT (6),
    f_name VARCHAR(50),
    l_name VARCHAR(50),
    PRIMARY KEY(doctor_ID)
);

CREATE TABLE Appointment(
	appointment_ID INT (6),
    appt_Date DATE,
    appt_Time VARCHAR (5),
    doctor_ID INT (6),
    patient_ID INT (6),
    reason VARCHAR (200),
    FOREIGN KEY(doctor_ID) REFERENCES Doctor(doctor_ID),
    FOREIGN KEY(patient_ID) REFERENCES Patient(patient_ID),
    PRIMARY KEY(appointment_ID)
);

CREATE TABLE AppointmentResults(
	appointment_ID INT(6),
	notes VARCHAR(200), 
    FOREIGN KEY(appointment_ID) REFERENCES Appointment(appointment_ID),
    PRIMARY KEY(appointment_ID)
);

CREATE TABLE Availability(
	doctor_ID int (6),
	availability_Day VARCHAR (8),
    startTime VARCHAR (3),
    endTime VARCHAR (3),
    FOREIGN KEY(doctor_ID) REFERENCES Doctor(doctor_ID),
    PRIMARY KEY(doctor_ID, availability_Day)
);