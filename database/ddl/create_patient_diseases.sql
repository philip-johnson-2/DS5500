/* 
    Create patient diseases table
*/
DROP TABLE patient_diseases 
GO

CREATE TABLE patient_diseases (
    patient_id INT
    , disease_name VARCHAR(125)
)

CREATE INDEX idx_patient_diseases_patient_id ON patient_diseases (patient_id)