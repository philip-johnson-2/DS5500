/*
    Leverage the patient demographics data
    to insert the population of patients 
    that will be included in the dataset 
    for modeling
*/

CREATE OR REPLACE PROCEDURE dbo.update_patient_record_diseases ()
LANGUAGE plpgsql
AS 
$$
BEGIN

INSERT INTO dbo.patient_record (
	as_of_date
	, patient_id
	, patient_race
	, patient_language
	, patient_gender
	, patient_age
)

SELECT d.as_of_date
    , d.patient_id
    , d.race
    , d.language
    , d.gender
    , d.age
FROM dbo.patient_demographics d

END
$$