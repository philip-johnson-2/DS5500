/*
    Create table patient medications
*/
DROP TABLE dbo.patient_medications 
GO

CREATE TABLE dbo.patient_medications (
    patient_id INT
    , ndc_code VARCHAR(25)
    , medication_generic_name VARCHAR(250)
    , days_supply INT
    , quantity INT 
);

CREATE INDEX idx_patient_medications_patient_id ON dbo.patient_medications (patient_id)
