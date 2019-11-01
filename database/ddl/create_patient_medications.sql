/*
    Create table patient medications
*/
DROP TABLE dbo.patient_medications;

CREATE TABLE dbo.patient_medications (
    patient_id INT
    , fill_date DATE
    , ndc_code VARCHAR(25)
    , medication_generic_name VARCHAR(500)
    , days_supply INT
    , quantity VARCHAR(25) 
);

CREATE INDEX idx_patient_medications_patient_id ON dbo.patient_medications (patient_id)
CREATE INDEX idx_patient_medications_ndc_code ON dbo.patient_medications (ndc_code)
