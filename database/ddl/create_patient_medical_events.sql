/*
    Create patient medical events
*/
DROP TABLE patient_medical_events
GO

CREATE TABLE patient_medical_events (
    patient_id INT
    , event_date DATE
    , event_name VARCHAR(125)
    , los INT
    , pos VARCHAR(125)
    , dx_code_1 VARCHAR(25)
    , dx_name VARCHAR(255)
    , lama_indicator INT
    , discharge_status VARCHAR(55)
)

CREATE INDEX idx_patient_medical_events_patient_id ON patient_medical_events (patient_id)