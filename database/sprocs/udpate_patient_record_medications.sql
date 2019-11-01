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
SET patient_prior_6_month_medication_count = CASE WHEN r.patient_id = a.patient_id THEN 1 ELSE 0 END
FROM dbo.patient_record r
LEFT JOIN (
    SELECT m.patient_id
        , COUNT(DISTINCT m.ndc_code)
    FROM dbo.medications m
    WHERE m.fill_date BETWEEN XXX AND XXX
) a ON a.patient_id = r.patient_id


-- update patient medication types
UPDATE dbo.patient_record
SET patient_medication_ace_inhibitor = a.patient_medication_ace_inhibitor
    , patient_medication_antiboitic_of_concern = a.patient_medication_antiboitic_of_concern
    , patient_medication_serious_bh = a.patient_medication_serious_bh
    , patient_medication_asthma = a.patient_medication_asthma
    , patient_medication_diabetes = a.patient_medication_diabetes
    , patient_medication_dimentia = a.patient_medication_dimentia
    , patient_medication_statin = a.patient_medication_statin
    , patient_medication_high_risk = a.patient_medication_high_risk
    , patient_medication_opioid = a.patient_medication_opioid
    , patient_medication_substance_abuse = a.patient_medication_substance_abuse
    , patient_medication_potentially_harmful = a.patient_medication_potentially_harmful
FROM dbo.patient_record r
LEFT JOIN (
    SELECT md.patient_id
        , MAX(CASE WHEN dm.medication_list = 'ACE Inhibitor/ARB Medications') patient_medication_ace_inhibitor 
        , MAX(CASE WHEN dm.medication_list = 'Antibiotics of Concern by NCQA Drug Class Medications') patient_medication_antiboitic_of_concern 
        , MAX(CASE WHEN dm.medication_list  'Antidepressant Medications') patient_medication_serious_bh 
        , MAX(CASE WHEN dm.medication_list IN '') patient_medication_asthma 
        , MAX(CASE WHEN dm.medication_list = '') patient_medication_diabetes
        , MAX(CASE WHEN dm.medication_list = '') patient_medication_dimentia
        , MAX(CASE WHEN dm.medication_list = '') patient_medication_statin
        , MAX(CASE WHEN dm.medication_list = '') patient_medication_high_risk
        , MAX(CASE WHEN dm.medication_list = '') patient_medication_opioid
        , MAX(CASE WHEN dm.medication_list = '') patient_medication_substance_abuse
        , MAX(CASE WHEN dm.medication_list = '') patient_medication_potentially_harmful
    FROM dbo.patient_medications m
    LEFT JOIN dbo.hedis_drug_mappings dm
        ON dm.ndc_code = m.ndc_code
    GROUP BY md.patient_id
	) a ON r.patient_id = a.patient_id;



END
$$









