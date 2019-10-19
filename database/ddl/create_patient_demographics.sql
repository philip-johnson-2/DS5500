/*
    Create patient demographics table
*/
DROP TABLE patient_demographics
GO

CREATE TABLE patient_demographics (
     as_of_date DATE
    , patient_id INT
    , age INT
    , race VARCHAR(35)
    , language VARCHAR(55)
    , gender VARCHAR(25)
)

CREATE INDEX idx_patient_demographics_patient_id ON patient_demographics (patient_id)