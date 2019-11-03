DROP TABLE medication_wrk

CREATE TABLE medication_wrk
(
	patient_id INT
	    , patient_prior_12_month_medication_count INT
        , patient_prior_6_month_medication_count INT
        , patient_medication_ace_inhibitor INT
        , patient_medication_antiboitic_of_concern INT
        , patient_medication_serious_bh INT
        , patient_medication_asthma INT
        , patient_medication_diabetes INT
        , patient_medication_dimentia INT
        , patient_medication_statin INT
        , patient_medication_high_risk INT
        , patient_medication_opioid INT
        , patient_medication_substance_abuse INT
        , patient_medication_potentially_harmful INT
)

insert into medication_wrk
SELECT m.patient_id
        , SUM(CASE WHEN m.fill_date BETWEEN '2024-06-30' AND '2025-06-30' THEN 1 ELSE 0 END) patient_prior_12_month_medication_count
        , SUM(CASE WHEN m.fill_date BETWEEN '2025-01-01' AND '2025-06-30' THEN 1 ELSE 0 END) patient_prior_6_month_medication_count
        , MAX(CASE WHEN dm.medication_class_id = 3 THEN 1 ELSE 0 END) patient_medication_ace_inhibitor
        , MAX(CASE WHEN dm.medication_class_id = 6 THEN 1 ELSE 0 END) patient_medication_antiboitic_of_concern
        , MAX(CASE WHEN dm.medication_class_id IN (7,8,9) THEN 1 ELSE 0 END) patient_medication_serious_bh
        , MAX(CASE WHEN dm.medication_class_id IN (11,12) THEN 1 ELSE 0 END) patient_medication_asthma
        , MAX(CASE WHEN dm.medication_class_id = 21 THEN 1 ELSE 0 END) patient_medication_diabetes
        , MAX(CASE WHEN dm.medication_class_id = 20 THEN 1 ELSE 0 END) patient_medication_dimentia
        , MAX(CASE WHEN dm.medication_class_id = 24 THEN 1 ELSE 0 END) patient_medication_statin
        , MAX(CASE WHEN dm.medication_class_id = 25 THEN 1 ELSE 0 END) patient_medication_high_risk
        , MAX(CASE WHEN dm.medication_class_id = 33 THEN 1 ELSE 0 END) patient_medication_opioid
        , MAX(CASE WHEN dm.medication_class_id IN (31,32) THEN 1 ELSE 0 END) patient_medication_substance_abuse
        , MAX(CASE WHEN dm.medication_class_id IN (37,38,39) THEN 1 ELSE 0 END) patient_medication_potentially_harmful
    FROM patient_medications m
    LEFT JOIN hedis_drug_mappings dm
        ON dm.ndc_code = CAST (m.ndc_code AS BIGINT)
    GROUP BY m.patient_id