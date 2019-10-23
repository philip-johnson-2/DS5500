/*
    Update disease features on patient record table
*/

CREATE PROCEDURE update_patient_record_diseases
SET NOCOUNT ON
​
PRINT '***************update_patient_record_diseases*****************'
PRINT dbo.fn_prnt_date(CURRENT_TIMESTAMP)
PRINT ''
​

​
/***********************************************************************
						UPDATE patient_diseases
***********************************************************************/
​
--patient diseases
UPDATE ga_nvector
SET   patient_neoplasm_indicator      	= a.patient_neoplasm_indicator
	, patient_diabetes_indicator         = a.patient_diabetes_indicator
	, patient_nutritional_indicator      = a.patient_nutritional_indicator
	, patient_lipid_indicator            = a.patient_lipid_indicator
	, patient_metabolic_indicator        = a.patient_metabolic_indicator
	, patient_coagulation_indicator      = a.patient_coagulation_indicator
	, patient_anxiety_indicator          = a.patient_anxiety_indicator
	, patient_developmental_indicator    = a.patient_developmental_indicator
	, patient_sa_indicator               = a.patient_sa_indicator
	, patient_migraine_indicator         = a.patient_migraine_indicator
	, patient_hypertension_indicator     = a.patient_hypertension_indicator
	, patient_heart_indicator            = a.patient_heart_indicator
	, patient_cerebrovascular_indicator  = a.patient_cerebrovascular_indicator
	, patient_copd_indicator             = a.patient_copd_indicator
	, patient_asthma_indicator           = a.patient_asthma_indicator
	, patient_respiratory_indicator      = a.patient_respiratory_indicator
	, patient_gastrointestinal_indicator = a.patient_gastrointestinal_indicator
	, patient_liver_indicator            = a.patient_liver_indicator
	, patient_pregnancy_indicator        = a.patient_pregnancy_indicator
	, patient_skin_indicator             = a.patient_skin_indicator
	, patient_mood_indicator             = a.patient_mood_indicator
	, patient_congenital_indicator       = a.patient_congenital_indicator
	, patient_urinary_indicator          = a.patient_urinary_indicator
	, patient_epilepsy_indicator         = a.patient_epilepsy_indicator
	, patient_biliary_indicator          = a.patient_biliary_indicator
	, patient_paralysis_indicator        = a.patient_paralysis_indicator
	, patient_pulmonary_indicator        = a.patient_pulmonary_indicator
	, patient_mental_indicator           = a.patient_mental_indicator
	, patient_trauma_indicator           = a.patient_trauma_indicator
	, patient_nbr_diseases				= a.patient_nbr_diseases
FROM (SELECT md.patient_id
			, cq.as_of_date
			, patient_neoplasm_indicator      	= MAX(CASE WHEN md.disease_short_name = 'neoplasm' THEN 1 ELSE 0 END)
			, patient_diabetes_indicator         = MAX(CASE WHEN md.disease_short_name = 'diabetes' THEN 1 ELSE 0 END)
			, patient_nutritional_indicator      = MAX(CASE WHEN md.disease_short_name = 'nutritional' THEN 1 ELSE 0 END)
			, patient_lipid_indicator            = MAX(CASE WHEN md.disease_short_name = 'lipid' THEN 1 ELSE 0 END)
			, patient_metabolic_indicator        = MAX(CASE WHEN md.disease_short_name = 'metabolic' THEN 1 ELSE 0 END)
			, patient_coagulation_indicator      = MAX(CASE WHEN md.disease_short_name = 'coagulation' THEN 1 ELSE 0 END)
			, patient_anxiety_indicator          = MAX(CASE WHEN md.disease_short_name = 'anxiety' THEN 1 ELSE 0 END)
			, patient_developmental_indicator    = MAX(CASE WHEN md.disease_short_name = 'developmental' THEN 1 ELSE 0 END)
			, patient_sa_indicator               = MAX(CASE WHEN md.disease_short_name = 'sa' THEN 1 ELSE 0 END)
			, patient_migraine_indicator         = MAX(CASE WHEN md.disease_short_name = 'migraine' THEN 1 ELSE 0 END)
			, patient_hypertension_indicator     = MAX(CASE WHEN md.disease_short_name = 'hypertension' THEN 1 ELSE 0 END)
			, patient_heart_indicator            = MAX(CASE WHEN md.disease_short_name = 'heart' THEN 1 ELSE 0 END)
			, patient_cerebrovascular_indicator  = MAX(CASE WHEN md.disease_short_name = 'cerebrovascular' THEN 1 ELSE 0 END)
			, patient_copd_indicator             = MAX(CASE WHEN md.disease_short_name = 'copd' THEN 1 ELSE 0 END)
			, patient_asthma_indicator           = MAX(CASE WHEN md.disease_short_name = 'asthma' THEN 1 ELSE 0 END)
			, patient_respiratory_indicator      = MAX(CASE WHEN md.disease_short_name = 'respiratory' THEN 1 ELSE 0 END)
			, patient_gastrointestinal_indicator = MAX(CASE WHEN md.disease_short_name = 'gastrointestinal' THEN 1 ELSE 0 END)
			, patient_liver_indicator            = MAX(CASE WHEN md.disease_short_name = 'liver' THEN 1 ELSE 0 END)
			, patient_pregnancy_indicator        = MAX(CASE WHEN md.disease_short_name = 'pregnancy' THEN 1 ELSE 0 END)
			, patient_skin_indicator             = MAX(CASE WHEN md.disease_short_name = 'skin' THEN 1 ELSE 0 END)
			, patient_mood_indicator             = MAX(CASE WHEN md.disease_short_name = 'mood' THEN 1 ELSE 0 END)
			, patient_congenital_indicator       = MAX(CASE WHEN md.disease_short_name = 'congenital' THEN 1 ELSE 0 END)
			, patient_urinary_indicator          = MAX(CASE WHEN md.disease_short_name = 'urinary' THEN 1 ELSE 0 END)
			, patient_epilepsy_indicator         = MAX(CASE WHEN md.disease_short_name = 'epilepsy' THEN 1 ELSE 0 END)
			, patient_biliary_indicator          = MAX(CASE WHEN md.disease_short_name = 'biliary' THEN 1 ELSE 0 END)
			, patient_paralysis_indicator        = MAX(CASE WHEN md.disease_short_name = 'paralysis' THEN 1 ELSE 0 END)
			, patient_pulmonary_indicator        = MAX(CASE WHEN md.disease_short_name = 'pulmonary' THEN 1 ELSE 0 END)
			, patient_mental_indicator           = MAX(CASE WHEN md.disease_short_name = 'mental' THEN 1 ELSE 0 END)
			, patient_trauma_indicator           = MAX(CASE WHEN md.disease_short_name = 'trauma' THEN 1 ELSE 0 END)
			, patient_nbr_diseases				= COUNT(DISTINCT md.disease_id)
		FROM dbo.patient_diseases md
		) a
WHERE patient_record.patient_id = a.patient_id

​
PRINT 'patient_record_updated: ' + CONVERT(VARCHAR, @@ROWCOUNT)
PRINT dbo.fn_prnt_date(CURRENT_TIMESTAMP)
PRINT 'patient diseases'
PRINT ''







