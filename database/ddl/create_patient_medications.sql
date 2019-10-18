/*
    Create table patient medications
*/
DROP TABLE patient_medications 
GO

CREATE TABLE patient_medications (
    patient_id INT
    , ndc_code VARCHAR(25)
    , medication_generic_name VARCHAR(250)
    , days_supply INT
    , quantity INT 
)

CREATE INDEX idx_patient_medications_patient_id ON patient_medications (patient_id)
