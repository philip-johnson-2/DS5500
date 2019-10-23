/*
    Create patient demographics table
*/
DROP TABLE dbo.patient_demographics;

CREATE TABLE dbo.patient_demographics (
    as_of_date DATE
    , patient_id INT
    , age INT
    , race VARCHAR(25)
    , language VARCHAR(55)
    , gender VARCHAR(25)
);

CREATE INDEX idx_patient_demographics_patient_id ON dbo.patient_demographics (patient_id)