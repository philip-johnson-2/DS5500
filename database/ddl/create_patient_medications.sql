/*
    Create table patient medications
*/
DROP TABLE patient_medications;

CREATE TABLE patient_medications (
    patient_id INT
    , fill_date DATE
    , ndc_code VARCHAR(25)
    , medication_generic_name VARCHAR(500)
    , days_supply INT
    , quantity NUMERIC(30,15) 
)

CREATE INDEX idx_patient_medications_patient_id ON patient_medications (patient_id)
