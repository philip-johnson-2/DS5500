/*
    Create patient record table used to store 
    all features for each patient that will 
    be leveraged for modeling
*/
DROP TABLE dbo.patient_record;

CREATE TABLE dbo.patient_record (
    as_of_date DATE
    , patient_id INT
    , patient_race VARCHAR(55)
    , patient_language VARCHAR(55)
    , patient_gender VARCHAR(55)
    , patient_age INT
    , patient_disease_add INT
    , patient_disease_alcohol INT
    , patient_disease_ami INT
    , patient_disease_anxiety INT
    , patient_disease_arrhythmia  INT
    , patient_disease_arthrogryposis INT
    , patient_disease_asthma INT
    , patient_disease_autism INT
    , patient_disease_bipolar INT
    , patient_disease_bpd INT
    , patient_disease_breast_cancer INT
    , patient_disease_burn INT
    , patient_disease_cad INT
    , patient_disease_cah INT
    , patient_disease_cf INT
    , patient_disease_chd INT
    , patient_disease_chf INT
    , patient_disease_cleft_lip INT
    , patient_disease_colitis INT
    , patient_disease_colon_cancer INT
    , patient_disease_copd INT
    , patient_disease_cp INT
    , patient_disease_crohns INT
    , patient_disease_dementia INT
    , patient_disease_depression INT
    , patient_disease_depression_anxiety INT
    , patient_disease_diabetes INT
    , patient_disease_diverticulitis INT
    , patient_disease_downs INT
    , patient_disease_epilepsy INT
    , patient_disease_ftt INT
    , patient_disease_glaucoma INT
    , patient_disease_gynecological_cancer INT
    , patient_disease_hemophilia INT
    , patient_disease_hepc INT
    , patient_disease_hip_fracture INT
    , patient_disease_hiv_aids INT
    , patient_disease_hydrocephalus INT
    , patient_disease_hypertension INT
    , patient_disease_joint_disorder INT
    , patient_disease_kidney_disease INT
    , patient_disease_leukemia INT
    , patient_disease_lumbar INT
    , patient_disease_lung_cancer INT
    , patient_disease_md INT
    , patient_disease_obesity INT
    , patient_disease_oi INT
    , patient_disease_opioid INT
    , patient_disease_osteoarthritis INT
    , patient_disease_pku INT
    , patient_disease_pneumonia INT
    , patient_disease_prostate_cancer INT
    , patient_disease_psychotic_disorder INT
    , patient_disease_rectal_cancer INT
    , patient_disease_reflux INT
    , patient_disease_rheumatoid_arthritis INT
    , patient_disease_sa INT
    , patient_disease_schizophrenia INT
    , patient_disease_seizure INT
    , patient_disease_sickle_cell INT
    , patient_disease_sinusitis INT
    , patient_disease_spina_bifida INT
    , patient_disease_spinal_cord_injury INT
    , patient_disease_stressors INT
    , patient_disease_stroke INT
    , patient_disease_tcs INT
    , patient_disease_tracheostomy INT
    , patient_disease_transplant INT
    , patient_disease_uri INT
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
    , prev_admission_12mo INT
    , prev_admission_6mo INT
    , prev_admission_3mo INT
    , prev_admission_1mo INT
    , prev_er_12mo INT
    , prev_er_6mo INT
    , prev_er_3mo INT
    , prev_er_1mo INT
    , prev_pcp_12mo INT
    , prev_pcp_6mo INT
    , prev_pcp_3mo INT
    , prev_pcp_1mo INT
    , months_since_last_admission INT
    , months_since_last_er INT
    , months_since_last_pcp_visit INT
    , prior_admission_count INT
    , prior_er_count INT
    , prior_pcp_visit_count INT
    , fut_admission_12mo INT
    , fut_admission_6mo INT
    , fut_admission_3mo INT
    , fut_admission_1mo INT
);


CREATE INDEX idx_patient_record_patient_id ON dbo.patient_record (patient_id)
