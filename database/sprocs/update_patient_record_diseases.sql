/*
    Update disease features on patient record table
*/
SET NOCOUNT ON
​
PRINT '***************update_ga_nvector_member_diseases*****************'
PRINT dbo.fn_prnt_date(CURRENT_TIMESTAMP)
PRINT ''
​

​
/***********************************************************************
						UPDATE ga_nvector
***********************************************************************/
​
--member diseases
UPDATE ga_nvector
SET member_neoplasm_indicator = 0
	, member_diabetes_indicator = 0
	, member_nutritional_indicator = 0
	, member_lipid_indicator = 0
	, member_metabolic_indicator = 0
	, member_coagulation_indicator = 0
	, member_anxiety_indicator = 0
	, member_developmental_indicator = 0
	, member_sa_indicator = 0
	, member_migraine_indicator = 0
	, member_hypertension_indicator = 0
	, member_heart_indicator = 0
	, member_cerebrovascular_indicator = 0
	, member_copd_indicator = 0
	, member_asthma_indicator = 0
	, member_respiratory_indicator = 0
	, member_gastrointestinal_indicator = 0
	, member_liver_indicator = 0
	, member_pregnancy_indicator = 0
	, member_skin_indicator = 0
	, member_mood_indicator = 0
	, member_congenital_indicator = 0
	, member_urinary_indicator = 0
	, member_epilepsy_indicator = 0
	, member_biliary_indicator = 0
	, member_paralysis_indicator = 0
	, member_pulmonary_indicator = 0
	, member_mental_indicator = 0
	, member_trauma_indicator = 0
	, member_nbr_diseases = 0;
​
​
UPDATE ga_nvector
SET   member_neoplasm_indicator      	= a.member_neoplasm_indicator
	, member_diabetes_indicator         = a.member_diabetes_indicator
	, member_nutritional_indicator      = a.member_nutritional_indicator
	, member_lipid_indicator            = a.member_lipid_indicator
	, member_metabolic_indicator        = a.member_metabolic_indicator
	, member_coagulation_indicator      = a.member_coagulation_indicator
	, member_anxiety_indicator          = a.member_anxiety_indicator
	, member_developmental_indicator    = a.member_developmental_indicator
	, member_sa_indicator               = a.member_sa_indicator
	, member_migraine_indicator         = a.member_migraine_indicator
	, member_hypertension_indicator     = a.member_hypertension_indicator
	, member_heart_indicator            = a.member_heart_indicator
	, member_cerebrovascular_indicator  = a.member_cerebrovascular_indicator
	, member_copd_indicator             = a.member_copd_indicator
	, member_asthma_indicator           = a.member_asthma_indicator
	, member_respiratory_indicator      = a.member_respiratory_indicator
	, member_gastrointestinal_indicator = a.member_gastrointestinal_indicator
	, member_liver_indicator            = a.member_liver_indicator
	, member_pregnancy_indicator        = a.member_pregnancy_indicator
	, member_skin_indicator             = a.member_skin_indicator
	, member_mood_indicator             = a.member_mood_indicator
	, member_congenital_indicator       = a.member_congenital_indicator
	, member_urinary_indicator          = a.member_urinary_indicator
	, member_epilepsy_indicator         = a.member_epilepsy_indicator
	, member_biliary_indicator          = a.member_biliary_indicator
	, member_paralysis_indicator        = a.member_paralysis_indicator
	, member_pulmonary_indicator        = a.member_pulmonary_indicator
	, member_mental_indicator           = a.member_mental_indicator
	, member_trauma_indicator           = a.member_trauma_indicator
	, member_nbr_diseases				= a.member_nbr_diseases
FROM (SELECT md.member_id
			, cq.as_of_date
			, member_neoplasm_indicator      	= MAX(CASE WHEN md.disease_short_name = 'neoplasm' THEN 1 ELSE 0 END)
			, member_diabetes_indicator         = MAX(CASE WHEN md.disease_short_name = 'diabetes' THEN 1 ELSE 0 END)
			, member_nutritional_indicator      = MAX(CASE WHEN md.disease_short_name = 'nutritional' THEN 1 ELSE 0 END)
			, member_lipid_indicator            = MAX(CASE WHEN md.disease_short_name = 'lipid' THEN 1 ELSE 0 END)
			, member_metabolic_indicator        = MAX(CASE WHEN md.disease_short_name = 'metabolic' THEN 1 ELSE 0 END)
			, member_coagulation_indicator      = MAX(CASE WHEN md.disease_short_name = 'coagulation' THEN 1 ELSE 0 END)
			, member_anxiety_indicator          = MAX(CASE WHEN md.disease_short_name = 'anxiety' THEN 1 ELSE 0 END)
			, member_developmental_indicator    = MAX(CASE WHEN md.disease_short_name = 'developmental' THEN 1 ELSE 0 END)
			, member_sa_indicator               = MAX(CASE WHEN md.disease_short_name = 'sa' THEN 1 ELSE 0 END)
			, member_migraine_indicator         = MAX(CASE WHEN md.disease_short_name = 'migraine' THEN 1 ELSE 0 END)
			, member_hypertension_indicator     = MAX(CASE WHEN md.disease_short_name = 'hypertension' THEN 1 ELSE 0 END)
			, member_heart_indicator            = MAX(CASE WHEN md.disease_short_name = 'heart' THEN 1 ELSE 0 END)
			, member_cerebrovascular_indicator  = MAX(CASE WHEN md.disease_short_name = 'cerebrovascular' THEN 1 ELSE 0 END)
			, member_copd_indicator             = MAX(CASE WHEN md.disease_short_name = 'copd' THEN 1 ELSE 0 END)
			, member_asthma_indicator           = MAX(CASE WHEN md.disease_short_name = 'asthma' THEN 1 ELSE 0 END)
			, member_respiratory_indicator      = MAX(CASE WHEN md.disease_short_name = 'respiratory' THEN 1 ELSE 0 END)
			, member_gastrointestinal_indicator = MAX(CASE WHEN md.disease_short_name = 'gastrointestinal' THEN 1 ELSE 0 END)
			, member_liver_indicator            = MAX(CASE WHEN md.disease_short_name = 'liver' THEN 1 ELSE 0 END)
			, member_pregnancy_indicator        = MAX(CASE WHEN md.disease_short_name = 'pregnancy' THEN 1 ELSE 0 END)
			, member_skin_indicator             = MAX(CASE WHEN md.disease_short_name = 'skin' THEN 1 ELSE 0 END)
			, member_mood_indicator             = MAX(CASE WHEN md.disease_short_name = 'mood' THEN 1 ELSE 0 END)
			, member_congenital_indicator       = MAX(CASE WHEN md.disease_short_name = 'congenital' THEN 1 ELSE 0 END)
			, member_urinary_indicator          = MAX(CASE WHEN md.disease_short_name = 'urinary' THEN 1 ELSE 0 END)
			, member_epilepsy_indicator         = MAX(CASE WHEN md.disease_short_name = 'epilepsy' THEN 1 ELSE 0 END)
			, member_biliary_indicator          = MAX(CASE WHEN md.disease_short_name = 'biliary' THEN 1 ELSE 0 END)
			, member_paralysis_indicator        = MAX(CASE WHEN md.disease_short_name = 'paralysis' THEN 1 ELSE 0 END)
			, member_pulmonary_indicator        = MAX(CASE WHEN md.disease_short_name = 'pulmonary' THEN 1 ELSE 0 END)
			, member_mental_indicator           = MAX(CASE WHEN md.disease_short_name = 'mental' THEN 1 ELSE 0 END)
			, member_trauma_indicator           = MAX(CASE WHEN md.disease_short_name = 'trauma' THEN 1 ELSE 0 END)
			, member_nbr_diseases				= COUNT(DISTINCT md.disease_id)
		FROM hf_staging_dev..member_diseases md
		JOIN calendar_quarters cq
			ON md.diagnosis_date <= cq.ended_on
			AND YEAR(md.diagnosis_date) = cq.calendar_year
		GROUP BY md.member_id
			, cq.as_of_date
		) a
WHERE ga_nvector.member_id = a.member_id
AND ga_nvector.as_of_date = a.as_of_date
​
PRINT 'ga_nvector records updated: ' + CONVERT(VARCHAR, @@ROWCOUNT)
PRINT dbo.fn_prnt_date(CURRENT_TIMESTAMP)
PRINT 'member diseases'
PRINT ''







