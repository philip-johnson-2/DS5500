# Improving Hospital Inpatient Admissions Predictions Leveraging Temporal Relationships


## Background

Discuss the backrgound of the project and the resulting data.

Business case for the problem

## Goals and Outcomes

Can we prove that temporal relationships in a medical patients history improves the ability to predict future hospital admissions? In this project we analyze a health insurance dataset on patient outcomes to try to predict future hospital admissions. We will be looking specifically into the temporal nature of some of the features we pull into the dataset, and specifically at if we can improve model outcomes when incorporating more temporal features.

## Summary of Results

Overall we found reasonable evidence that adding temporal features to a previously non-temporal data set can help improve modeling outcomes of admission predictions. We looked at several time frames for features within the training data, as well as several timeframes for the response variable of "readmitted to hospital within x months". The timeframes we used were 12, 6, 3, and 1 months. We then compared this to the non-temporal version of the model dataset, containing only one of the flags for the feature variables, being the 12 month timeframe feature variables. We found that especially for the prediction of outcomes over a shorter timespan (1 or 3 months), there is strong evidence to suggest that adding in multiple features to create a dataset with temporal characteristics resulted in improved outcomes for the model over a range of measurements. We found model accuracy and AUC scores to be improved in models across all timeframes. We also found these improved differences to be statistically significant at the .05 level when predicting admission within 1 or 3 months. Moving forward with the project, for the second half of the semester, we have a number of outlets to continue exploring. These include: maximizing model accuracy/other scores, exploring the temporal nature of other features not yet analyzed, predicting specifically for preventable hospital admissions, and modeling specifically for the highest risk patients as this is the most pressing business case.

## Data Processing and Transformation

### Data Sources

We were able to secure historical data from health insurance companies that provides information tracked by the insurance company to track payments for services rendered to patients, medication prescriptions, and other relevant information pertaining to patients and the insurance company. This data is all cleansed and staged with the purpose of building out predictive modeling to support population health initiatives and improving patient care.

Example data elements include the following:

Patient Demographic Data

This is data collected on members of the insurance company when you enroll with a plan

- age
- race
- gender
- language

Enrollment Data

Historical information of what members were enrolled on the plan when tracks the enrollment segments of members on specific plan with their specific benefit packages

- duration on plan type
- insurance type
- duration with primary care provider


Medical Events Data

- ER visits
- inpatient admissions
- admissions
- PCP visits

Medications Data

Historical prescription fills for each members

- NDC (medication type)
- dosage
- supply
- recent prescription fill count
- drug type
- patient diseases

Disease/Condition list for each member

Examples:

- Asthma Indicator
- Diabetes Indicator


### Data Transformation


In order to perform analysis and modeling on our dataset, our goal was to flatten all of the above data sources into a patient record. The reason behind this is so that we have a representation of the current and past state of each patient contained within one record. In order to do this, we created a record with features representing the different aspects of each patient we want to model on, and ran aggregation across the different data sources to fill in the features for each patient.

Demographic Data

This data was already in the form of one line per patient so no transformation was needed

Event Data

This data source was structured as a one line per visit dataset, meaning that a single patient may have multiple lines containing data relevant to our analysisn. This data was collapsed down into indicator features which were one hot encoded. This included features such as ER visits within the last 12, 6, 3, and 1 months. We performed similar tranformation on PCP visits and inpatient admissions.

Patient Medication Data

This data source was structured on a one line per medication per fill basis. This means that each patient would have a record for every time they fill a medication, for each medication that they are currently perscribed. This data was collapsed down into indicators features and into count features. The count features represented how many times a patient had filled any perscription within the past 6 and 12 months. The indicator features represent one hot features indicating the class of medication that a patient might have filled, such as "high risk", "opioid", and "potentially harmful".

Disease Data

This data source was structured on a per disease per patient basis. This data was collapsed down into a high number of one hot features indicating whether or not a patient had been diagnosed with a given disease. For the majority of patients this resulted in a sparse data set with only one or two features that were relevent to them.


## Approach and Methods


Datasets for Analysis
For the analysis portion of the project, we reduced the data as described above into lists of observations of patient records. However, our intention is to analyze the effects of adding temporal features to the observations rather than using simple indicator variables. Because of this, we have created two datasets of these observations described above.

Non-Temporal

The non-temporal dataset contains all of the indicator variables for diseases, counts of medication, and medication indicators. For the event data described above, we have included only indicator variables for 12 month periods. This means that we are only tracking whether or not a certain event or visit occured for a patient at one time range rather than over a spectrum of time.

Temporal

The temporal dataset contains all of the same features as the non-temporal dataset, but also includes indicator variables for medical events over 6, 3, and 1 month periods. This means that medical events are encoded in 4 variables per event type rather than just 1 indicator variable.


Feature Importance Analysis

As an initial look at the various time based features and their effects on any modeling that is done, we ran an initial feature importance test on the temporal features within the temporal dataset. We sorted the variables in descending order of importance with the most important features being first and the least important being last. The importance scores that we used to rank the features were pulled from a binary tree classification model. Scores were given for all features within the dataset, but we ranked only the temporal features, any only looked at features which ranked inside the top 6 temporal features. A table summarizing the results is below.


The above table shows that there is a case for the importance of the additional temporal features over only the 12 month features. With the exception of the 12 month admission response variable, at least one of the 12mo temporal features is not included within the top 6 for that response variable. This means that some of the other time periods for these models are more important predictors, which suggests that excluding them may produce worse results.

One additional observation from the above table is that the shorter term features seem to become more important as the time range of the response variable becomes shorter. The 3 and 1 month features are more important for predicting 3 and 1 month admission, based on the model used to generate this table. This suggests that the temporal nature of these features may be more beneficial as the prediction period shortens.


Sampling Method: How we accounted for a biased outcome predictor.


Model Development:



## Results


Feature Importance Results:

Model Results:



## Discussion

Discuss the use case of leveraging the features developed and the output of the models for the use of care management for improving patient outcomes


## Contributions

Both members of the group contributed equally to the project thus far. Phil Johnson has acted as the point of contact between the group and the interested company, as well as contributed to the data modeling and transformation pieces. Nick Tyler has also contributed during the data transformation steps in addition to the modeling. Both members contributed equally to the report.

