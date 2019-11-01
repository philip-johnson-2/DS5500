/*
    Update disease features on patient record table
*/

CREATE OR REPLACE PROCEDURE dbo.update_patient_record_medications ()
LANGUAGE plpgsql
AS 
$$
BEGIN

/***********************************************************************
						UPDATE patient_diseases
***********************************************************************/

-- update patient medication counts
UPDATE dbo.patient_record
SET patient_prior_12_month_medication_count = CASE WHEN r.patient_id = a.patient_id THEN 1 ELSE 0 END
FROM dbo.patient_record r
LEFT JOIN (
    SELECT m.patient_id
        , COUNT(DISTINCT m.ndc_code)
    FROM dbo.medications m
    WHERE m.fill_date BETWEEN XXX AND XXX
) a ON a.patient_id = r.patient_id

-- update patient medication counts
UPDATE dbo.patient_record
SET patient_prior_12_month_medication_count = CASE WHEN r.patient_id = a.patient_id THEN 1 ELSE 0 END
FROM dbo.patient_record r
LEFT JOIN (
    SELECT m.patient_id
        , COUNT(DISTINCT m.ndc_code)
    FROM dbo.medications m
    WHERE m.fill_date BETWEEN XXX AND XXX
) a ON a.patient_id = r.patient_id


-- update patient medication types
UPDATE dbo.patient_record
SET 
FROM dbo.patient_record r
LEFT JOIN (
    SELECT md.patient_id
        , MAX(CASE WHEN dm.measure_list = '') 
    FROM dbo.patient_medications m
    LEFT JOIN dbo.hedis_drug_mappings dm
        ON dm.ndc_code = m.ndc_code
    GROUP BY md.patient_id
	) a ON r.patient_id = a.patient_id;



END
$$









