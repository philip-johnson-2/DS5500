/* 
    Create patient diseases table
*/
DROP TABLE dbo.patient_diseases 
GO

CREATE TABLE dbo.patient_diseases (
    patient_id INT
    , disease_name VARCHAR(125)
);

CREATE INDEX idx_patient_diseases_patient_id ON dbo.patient_diseases (patient_id)