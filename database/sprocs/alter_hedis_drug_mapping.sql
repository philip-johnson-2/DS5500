ALTER TABLE dbo.hedis_drug_mappings ADD medication_class_id INT

UPDATE dbo.hedis_drug_mappings
SET medication_class_id = CASE WHEN medication_list = '5-ARI Medications' THEN 1
                            WHEN medication_list = 'AAB Antibiotic Medications' THEN 2
                            WHEN medication_list = 'ACE Inhibitor/ARB Medications' THEN 3
                            WHEN medication_list = 'ADHD Medications' THEN 4
                            WHEN medication_list = 'All Other Antibiotics by NCQA Drug Class Medications' THEN 5
                            WHEN medication_list = 'Antibiotics of Concern by NCQA Drug Class Medications' THEN 6
                            WHEN medication_list = 'Antidepressant Medications' THEN 7
                            WHEN medication_list = 'Antipsychotic Combination Medications' THEN 8
                            WHEN medication_list = 'Antipsychotic Medications' THEN 9
                            WHEN medication_list = 'Asthma Controller Medications' THEN 10 
                            WHEN medication_list = 'Asthma Exclusions Medications' THEN 11
                            WHEN medication_list = 'Asthma Reliever Medications' THEN 12
                            WHEN medication_list = 'Beta-Blocker Medications' THEN 13
                            WHEN medication_list = 'Bronchodilator Medications' THEN 14
                            WHEN medication_list = 'CWP Antibiotic Medications' THEN 15
                            WHEN medication_list = 'Contraceptive Medications' THEN 16
                            WHEN medication_list = 'Corticosteroid Medications' THEN 17
                            WHEN medication_list = 'Cox-2 Selective NSAIDs and Nonaspirin NSAIDs Medications' THEN 18
                            WHEN medication_list = 'DMARD Medications' THEN 19
                            WHEN medication_list = 'Dementia Medications' THEN 20
                            WHEN medication_list = 'Diabetes Medications' THEN 21
                            WHEN medication_list = 'Diuretic Medications' THEN 22
                            WHEN medication_list = 'Estrogen Agonists Medications' THEN 23
                            WHEN medication_list = 'High and Moderate-Intensity Statin Medications' THEN 24
                            WHEN medication_list = 'High-Risk Medications' THEN 25
                            WHEN medication_list = 'High-Risk Medications with Average Daily Dose Criteria Medications' THEN 26
                            WHEN medication_list = 'High-Risk Medications with Days Supply Criteria Medications' THEN 27
                            WHEN medication_list = 'Long-Acting Injections 14 Days Supply Medications' THEN 28
                            WHEN medication_list = 'Long-Acting Injections 28 Days Supply Medications' THEN 29
                            WHEN medication_list = 'Low-Intensity Statin Medications' THEN 30
                            WHEN medication_list = 'Medication Treatment for Alcohol Abuse or Dependence Medications' THEN 31
                            WHEN medication_list = 'Medication Treatment for Opioid Abuse or Dependence Medications' THEN 32
                            WHEN medication_list = 'Opioid Medications' THEN 33
                            WHEN medication_list = 'Oral Antipsychotic Medications' THEN 34
                            WHEN medication_list = 'Osteoporosis Medications' THEN 35
                            WHEN medication_list = 'Potentially Harmful Drugs—Rate 1 Medications' THEN 36
                            WHEN medication_list = 'Potentially Harmful Drugs—Rate 1 and Rate 2 Medications' THEN 37
                            WHEN medication_list = 'Potentially Harmful Drugs—Rate 2 Medications' THEN 38
                            WHEN medication_list = 'Retinoid Medications' THEN 39
                            WHEN medication_list = 'SSD Antipsychotic Medications' THEN 40
                            WHEN medication_list = 'Systemic Corticosteroid Medications' THEN 41
                            WHEN medication_list = 'UOD Opioid Medications' THEN 42
                            ELSE NULL END
FROM dbo.hedis_drug_mappings