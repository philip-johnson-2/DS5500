/*
    Update disease features on patient record table
*/

CREATE OR REPLACE PROCEDURE dbo.update_patient_record_diseases ()
LANGUAGE plpgsql
AS 
$$
BEGIN

/***********************************************************************
						UPDATE patient_diseases
***********************************************************************/

--patient diseases
UPDATE dbo.patient_record
SET patient_disease_add = a.patient_disease_add
    , patient_disease_alcohol = a.patient_disease_alcohol
    , patient_disease_ami = a.patient_disease_ami
    , patient_disease_anxiety = a.patient_disease_anxiety
    , patient_disease_arrhythmia  = a.patient_disease_arrhythmia
    , patient_disease_arthrogryposis = a.patient_disease_arthrogryposis
    , patient_disease_asthma = a.patient_disease_asthma
    , patient_disease_autism = a.patient_disease_autism
    , patient_disease_bipolar = a.patient_disease_bipolar
    , patient_disease_bpd = a.patient_disease_bpd
    , patient_disease_breast_cancer = a.patient_disease_breast_cancer
    , patient_disease_burn = a.patient_disease_burn
    , patient_disease_cad = a.patient_disease_cad
    , patient_disease_cah = a.patient_disease_cah
    , patient_disease_cf = a.patient_disease_cf
    , patient_disease_chd = a.patient_disease_chd
    , patient_disease_chf = a.patient_disease_chd
    , patient_disease_cleft_lip = a.patient_disease_cleft_lip
    , patient_disease_colitis = a.patient_disease_colitis
    , patient_disease_colon_cancer = a. patient_disease_colon_cancer
    , patient_disease_copd = a.patient_disease_copd
    , patient_disease_cp = a.patient_disease_cp
    , patient_disease_crohns = a.patient_disease_chrons
    , patient_disease_dementia = a.patient_disease_dementia
    , patient_disease_depression = a.patient_disease_depression
    , patient_disease_depression_anxiety = a.patient_disease_depression_anxiety
    , patient_disease_diabetes = a.patient_disease_diabetes
    , patient_disease_diverticulitis = a.patient_disease_diverticulitis
    , patient_disease_downs = a.patient_disease_downs
    , patient_disease_epilepsy = a.patient_disease_epilepsy
    , patient_disease_ftt = a.patient_disease_ftt
    , patient_disease_glaucoma = a. patient_disease_glaucoma
    , patient_disease_gynecological_cancer = a.patient_disease_gynecological_cancer
    , patient_disease_hemophilia = a.patient_disease_hemophilia
    , patient_disease_hepc = a.patient_disease_hepc
    , patient_disease_hip_fracture = a.patient_disease_hip_fracture
    , patient_disease_hiv_aids = a.patient_disease_hiv_aids
    , patient_disease_hydrocephalus = a.patient_disease_hydrocephalus
    , patient_disease_hypertension = a.patient_disease_hypertension
    , patient_disease_joint_disorder = a.patient_disease_jo_disorder
    , patient_disease_kidney_disease = a.patient_disease_kidney_disease
    , patient_disease_leukemia = a.patient_disease_leukemia
    , patient_disease_lumbar = a.patient_disease_lumbar
    , patient_disease_lung_cancer = a.patient_disease_lung_cancer
    , patient_disease_md = a.patient_disease_md
    , patient_disease_obesity = a.patient_disease_obesity 
    , patient_disease_oi = a.patient_disease_oi
    , patient_disease_opioid = a.patient_disease_opioid
    , patient_disease_osteoarthritis = a.patient_disease_osteoarthritis
    , patient_disease_pku = a.patient_disease_pku
    , patient_disease_pneumonia = a.patient_disease_pneumonia
    , patient_disease_prostate_cancer = a.patient_disease_prostate_cancer
    , patient_disease_psychotic_disorder = a.patient_disease_psychotic_disorder
    , patient_disease_rectal_cancer = a.patient_disease_rectal_cancer
    , patient_disease_reflux = a.patient_disease_reflux
    , patient_disease_rheumatoid_arthritis = a.patient_disease_rheumatoid_arthritis
    , patient_disease_sa = a.patient_disease_sa
    , patient_disease_schizophrenia = a.patient_disease_schizophrenia
    , patient_disease_seizure = a.patient_disease_seizure
    , patient_disease_sickle_cell = a.patient_disease_sickle_cell
    , patient_disease_sinusitis = a.patient_disease_sinusitis
    , patient_disease_spina_bifida = a.patient_disease_spina_bifida
    , patient_disease_spinal_cord_injury = a.patient_disease_spinal_cord_injury
    , patient_disease_stressors = a.patient_disease_stressors
    , patient_disease_stroke = a.patient_disease_stroke
    , patient_disease_tcs = a.patient_disease_tcs
    , patient_disease_tracheostomy = a.patient_disease_tracheostomy
    , patient_disease_transplant = a.patient_disease_transplant
    , patient_disease_uri = a.patient_disease_uri
FROM dbo.patient_record r
LEFT JOIN (
    SELECT md.patient_id
        , MAX(CASE WHEN md.disease_name = 'add' THEN 1 ELSE 0 END) patient_disease_add 
        , MAX(CASE WHEN md.disease_name = 'alcohol' THEN 1 ELSE 0 END) patient_disease_alcohol
        , MAX(CASE WHEN md.disease_name = 'ami' THEN 1 ELSE 0 END) patient_disease_ami
        , MAX(CASE WHEN md.disease_name = 'anxiety' THEN 1 ELSE 0 END) patient_disease_anxiety
        , MAX(CASE WHEN md.disease_name = 'arrhythmia' THEN 1 ELSE 0 END) patient_disease_arrhythmia
        , MAX(CASE WHEN md.disease_name = 'arthrogryposis' THEN 1 ELSE 0 END) patient_disease_arthrogryposis
        , MAX(CASE WHEN md.disease_name = 'asthma' THEN 1 ELSE 0 END) patient_disease_asthma
        , MAX(CASE WHEN md.disease_name = 'autism' THEN 1 ELSE 0 END) patient_disease_autism
        , MAX(CASE WHEN md.disease_name = 'bipolar' THEN 1 ELSE 0 END) patient_disease_bipolar
        , MAX(CASE WHEN md.disease_name = 'bpd' THEN 1 ELSE 0 END) patient_disease_bpd
        , MAX(CASE WHEN md.disease_name = 'breast_cancer' THEN 1 ELSE 0 END) patient_disease_breast_cancer
        , MAX(CASE WHEN md.disease_name = 'burn' THEN 1 ELSE 0 END) patient_disease_burn
        , MAX(CASE WHEN md.disease_name = 'cad' THEN 1 ELSE 0 END) patient_disease_cad
        , MAX(CASE WHEN md.disease_name = 'cah' THEN 1 ELSE 0 END) patient_disease_cah
        , MAX(CASE WHEN md.disease_name = 'cf' THEN 1 ELSE 0 END) patient_disease_cf
        , MAX(CASE WHEN md.disease_name = 'chd' THEN 1 ELSE 0 END) patient_disease_chd
        , MAX(CASE WHEN md.disease_name = 'chf' THEN 1 ELSE 0 END) patient_disease_chf
        , MAX(CASE WHEN md.disease_name = 'cleft_lip' THEN 1 ELSE 0 END) patient_disease_cleft_lip
        , MAX(CASE WHEN md.disease_name = 'colitis' THEN 1 ELSE 0 END) patient_disease_colitis
        , MAX(CASE WHEN md.disease_name = 'colon_cancer' THEN 1 ELSE 0 END) patient_disease_colon_cancer
        , MAX(CASE WHEN md.disease_name = 'copd' THEN 1 ELSE 0 END) patient_disease_copd
        , MAX(CASE WHEN md.disease_name = 'cp' THEN 1 ELSE 0 END) patient_disease_cp
        , MAX(CASE WHEN md.disease_name = 'chrons' THEN 1 ELSE 0 END) patient_disease_chrons
        , MAX(CASE WHEN md.disease_name = 'dementia' THEN 1 ELSE 0 END) patient_disease_dementia
        , MAX(CASE WHEN md.disease_name = 'depression' THEN 1 ELSE 0 END) patient_disease_depression
        , MAX(CASE WHEN md.disease_name = 'depression_anxiety' THEN 1 ELSE 0 END) patient_disease_depression_anxiety
        , MAX(CASE WHEN md.disease_name = 'diabetes' THEN 1 ELSE 0 END) patient_disease_diabetes
        , MAX(CASE WHEN md.disease_name = 'diverticulitis' THEN 1 ELSE 0 END) patient_disease_diverticulitis
        , MAX(CASE WHEN md.disease_name = 'downs' THEN 1 ELSE 0 END) patient_disease_downs
        , MAX(CASE WHEN md.disease_name = 'epilepsy' THEN 1 ELSE 0 END) patient_disease_epilepsy
        , MAX(CASE WHEN md.disease_name = 'ftt' THEN 1 ELSE 0 END) patient_disease_ftt
        , MAX(CASE WHEN md.disease_name = 'glaucoma' THEN 1 ELSE 0 END) patient_disease_glaucoma
        , MAX(CASE WHEN md.disease_name = 'gynecological_cancer' THEN 1 ELSE 0 END) patient_disease_gynecological_cancer
        , MAX(CASE WHEN md.disease_name = 'hemophilia' THEN 1 ELSE 0 END) patient_disease_hemophilia
        , MAX(CASE WHEN md.disease_name = 'hepc' THEN 1 ELSE 0 END) patient_disease_hepc
        , MAX(CASE WHEN md.disease_name = 'hip_fracture' THEN 1 ELSE 0 END) patient_disease_hip_fracture
        , MAX(CASE WHEN md.disease_name = 'hiv_aids' THEN 1 ELSE 0 END) patient_disease_hiv_aids
        , MAX(CASE WHEN md.disease_name = 'hydrocephalus' THEN 1 ELSE 0 END) patient_disease_hydrocephalus
        , MAX(CASE WHEN md.disease_name = 'hypertension' THEN 1 ELSE 0 END) patient_disease_hypertension
        , MAX(CASE WHEN md.disease_name = 'jo_disorder' THEN 1 ELSE 0 END) patient_disease_jo_disorder
        , MAX(CASE WHEN md.disease_name = 'kidney_disease' THEN 1 ELSE 0 END) patient_disease_kidney_disease
        , MAX(CASE WHEN md.disease_name = 'leukemia' THEN 1 ELSE 0 END) patient_disease_leukemia
        , MAX(CASE WHEN md.disease_name = 'lumbar' THEN 1 ELSE 0 END) patient_disease_lumbar
        , MAX(CASE WHEN md.disease_name = 'lung_cancer' THEN 1 ELSE 0 END) patient_disease_lung_cancer
        , MAX(CASE WHEN md.disease_name = 'md' THEN 1 ELSE 0 END) patient_disease_md
        , MAX(CASE WHEN md.disease_name = 'obesity' THEN 1 ELSE 0 END) patient_disease_obesity
        , MAX(CASE WHEN md.disease_name = 'oi' THEN 1 ELSE 0 END) patient_disease_oi
        , MAX(CASE WHEN md.disease_name = 'opioid' THEN 1 ELSE 0 END) patient_disease_opioid
        , MAX(CASE WHEN md.disease_name = 'osteoarthritis' THEN 1 ELSE 0 END) patient_disease_osteoarthritis
        , MAX(CASE WHEN md.disease_name = 'pku' THEN 1 ELSE 0 END) patient_disease_pku
        , MAX(CASE WHEN md.disease_name = 'pneumonia' THEN 1 ELSE 0 END) patient_disease_pneumonia
        , MAX(CASE WHEN md.disease_name = 'prostate_cancer' THEN 1 ELSE 0 END) patient_disease_prostate_cancer
        , MAX(CASE WHEN md.disease_name = 'psychotic_disorder' THEN 1 ELSE 0 END) patient_disease_psychotic_disorder
        , MAX(CASE WHEN md.disease_name = 'rectal_cancer' THEN 1 ELSE 0 END) patient_disease_rectal_cancer
        , MAX(CASE WHEN md.disease_name = 'reflux' THEN 1 ELSE 0 END) patient_disease_reflux
        , MAX(CASE WHEN md.disease_name = 'rheumatoid_arthritis' THEN 1 ELSE 0 END) patient_disease_rheumatoid_arthritis
        , MAX(CASE WHEN md.disease_name = 'sa' THEN 1 ELSE 0 END) patient_disease_sa
        , MAX(CASE WHEN md.disease_name = 'schizophrenia' THEN 1 ELSE 0 END) patient_disease_schizophrenia
        , MAX(CASE WHEN md.disease_name = 'seizure' THEN 1 ELSE 0 END) patient_disease_seizure
        , MAX(CASE WHEN md.disease_name = 'sickle_cell' THEN 1 ELSE 0 END) patient_disease_sickle_cell
        , MAX(CASE WHEN md.disease_name = 'sinusitis' THEN 1 ELSE 0 END) patient_disease_sinusitis
        , MAX(CASE WHEN md.disease_name = 'spina_bifida' THEN 1 ELSE 0 END) patient_disease_spina_bifida
        , MAX(CASE WHEN md.disease_name = 'spinal_cord_injuary' THEN 1 ELSE 0 END) patient_disease_spinal_cord_injury
        , MAX(CASE WHEN md.disease_name = 'stressors' THEN 1 ELSE 0 END) patient_disease_stressors
        , MAX(CASE WHEN md.disease_name = 'stroke' THEN 1 ELSE 0 END) patient_disease_stroke
        , MAX(CASE WHEN md.disease_name = 'tcs' THEN 1 ELSE 0 END) patient_disease_tcs
        , MAX(CASE WHEN md.disease_name = 'tracheostomy' THEN 1 ELSE 0 END) patient_disease_tracheostomy
        , MAX(CASE WHEN md.disease_name = 'transplant' THEN 1 ELSE 0 END) patient_disease_transplant
        , MAX(CASE WHEN md.disease_name = 'uri' THEN 1 ELSE 0 END) patient_disease_uri
        , COUNT(DISTINCT md.disease_name) disease_count
    FROM dbo.patient_diseases md
    GROUP BY md.patient_id
	) a ON r.patient_id = a.patient_id;

END
$$









