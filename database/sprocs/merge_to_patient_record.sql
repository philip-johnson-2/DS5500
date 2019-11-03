INSERT INTO patient_record
SELECT '2025-06-30'
	, r.patient_id
	, r.patient_race
	, r.patient_language
	, r.patient_gender
	, r.patient_age
	, d.patient_disease_add
	, d.patient_disease_alcohol
	, d.patient_disease_ami
	, d.patient_disease_anxiety
	, d.patient_disease_arrhythmia
	, d.patient_disease_arthrogryposis
	, d.patient_disease_asthma
	, d.patient_disease_autism
	, d.patient_disease_bipolar
	, d.patient_disease_bpd
	, d.patient_disease_breast_cancer
	, d.patient_disease_burn
	, d.patient_disease_cad
	, d.patient_disease_cah
	, d.patient_disease_cf
	, d.patient_disease_chd
	, d.patient_disease_chf
	, d.patient_disease_cleft_lip
	, d.patient_disease_colitis
	, d.patient_disease_colon_cancer
	, d.patient_disease_copd
	, d.patient_disease_cp
	, d.patient_disease_chrons as patient_disease_crohns
	, d.patient_disease_dementia
	, d.patient_disease_depression
	, d.patient_disease_depression_anxiety
	, d.patient_disease_diabetes
	, d.patient_disease_diverticulitis
	, d.patient_disease_downs
	, d.patient_disease_epilepsy
	, d.patient_disease_ftt
	, d.patient_disease_glaucoma
	, d.patient_disease_gynecological_cancer
	, d.patient_disease_hemophilia
	, d.patient_disease_hepc
	, d.patient_disease_hip_fracture
	, d.patient_disease_hiv_aids
	, d.patient_disease_hydrocephalus
	, d.patient_disease_hypertension
	, d.patient_disease_jo_disorder as patient_disease_joint_disorder
	, d.patient_disease_kidney_disease
	, d.patient_disease_leukemia
	, d.patient_disease_lumbar
	, d.patient_disease_lung_cancer
	, d.patient_disease_md
	, d.patient_disease_obesity
	, d.patient_disease_oi
	, d.patient_disease_opioid
	, d.patient_disease_osteoarthritis
	, d.patient_disease_pku
	, d.patient_disease_pneumonia
	, d.patient_disease_prostate_cancer
	, d.patient_disease_psychotic_disorder
	, d.patient_disease_rectal_cancer
	, d.patient_disease_reflux
	, d.patient_disease_rheumatoid_arthritis
	, d.patient_disease_sa
	, d.patient_disease_schizophrenia
	, d.patient_disease_seizure
	, d.patient_disease_sickle_cell
	, d.patient_disease_sinusitis
	, d.patient_disease_spina_bifida
	, d.patient_disease_spinal_cord_injury
	, d.patient_disease_stressors
	, d.patient_disease_stroke
	, d.patient_disease_tcs
	, d.patient_disease_tracheostomy
	, d.patient_disease_transplant
	, d.patient_disease_uri
	, r.patient_prior_12_month_medication_count
	, r.patient_prior_6_month_medication_count
	, r.patient_medication_ace_inhibitor
	, r.patient_medication_antiboitic_of_concern
	, r.patient_medication_serious_bh
	, r.patient_medication_asthma
	, r.patient_medication_diabetes
	, r.patient_medication_dimentia
	, r.patient_medication_statin
	, r.patient_medication_high_risk
	, r.patient_medication_opioid
	, r.patient_medication_substance_abuse
	, r.patient_medication_potentially_harmful
	, r.prev_admission
	, r.prev_admission_12mo
	, r.prev_admission_6mo
	, r.prev_admission_3mo
	, r.prev_admission_1mo
	, r.prev_admission_idx
	, r.fut_admission_12mo
	, r.fut_admission_6mo
	, r.fut_admission_3mo
	, r.fut_admission_1mo
FROM (
	SELECT r.patient_id
		, r.patient_race
		, r.patient_language
		, r.patient_gender
		, r.patient_age
		, m.patient_prior_12_month_medication_count
		, m.patient_prior_6_month_medication_count
		, m.patient_medication_ace_inhibitor
		, m.patient_medication_antiboitic_of_concern
		, m.patient_medication_serious_bh
		, m.patient_medication_asthma
		, m.patient_medication_diabetes
		, m.patient_medication_dimentia
		, m.patient_medication_statin
		, m.patient_medication_high_risk
		, m.patient_medication_opioid
		, m.patient_medication_substance_abuse
		, m.patient_medication_potentially_harmful
		, r.prev_admission
		, r.prev_admission_12mo
		, r.prev_admission_6mo
		, r.prev_admission_3mo
		, r.prev_admission_1mo
		, r.prev_admission_idx
		, r.fut_admission_12mo
		, r.fut_admission_6mo
		, r.fut_admission_3mo
		, r.fut_admission_1mo
	FROM (
		SELECT r.patient_id
			, r.race as patient_race
			, r.language as patient_language
			, r.gender as patient_gender
			, r.age as patient_age
			, e.prev_admission
			, e.prev_admission_12mo
			, e.prev_admission_6mo
			, e.prev_admission_3mo
			, e.prev_admission_1mo
			, e.prev_admission_idx
			, e.fut_admission_12mo
			, e.fut_admission_6mo
			, e.fut_admission_3mo
			, e.fut_admission_1mo
		FROM patient_demographics r
		LEFT JOIN event_wrk e
		on e.patient_id = r.patient_id
	) r LEFT JOIN medication_wrk m
	ON r.patient_id = m.patient_id
) r LEFT JOIN disease_wrk d
ON r.patient_id = d.patient_id