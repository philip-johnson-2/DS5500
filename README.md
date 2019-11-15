# Improving Hospital Inpatient Admissions Predictions Leveraging Temporal Relationships

## Summary
Can we prove that temporal relationships in a medical patients
history improves the ability to predict future hospital admissions.
We are hoping to prove that the recency of prior utilization impacts
the ability to predict both long term and short term hospital
admissions and that we see greater improvement in model accuracy for
short term predictions.

## Data Source
We were able to secure historical data from health insurance companies
that provides information tracked by the insurance company to
track payments for services rendered to patients, medication
prescriptions, and other relevant information pertaining to
patients and the insurance company. This data is all cleansed
and staged with the purpose of building out predictive modeling
to support population health initiatives and improving patient care.

Example data elements include the following:

Patient Demographic Data
- this is data collected on members of the insurance company when you enroll with a plan
- age, race, gender, language

Enrollment Data
- historical information of what members were enrolled on the plan when
- tracks the enrollment segments of members on specific plan with their specific benefit packages
- Example feature development:
    - Duration on plan type
    - Insurance Type
    - Duration with Primary Care Provider

Patient Medical Events
- historical events created for each member
- ER visits, inpatient admissions, readmissions, PCP visits
- Example feature development
    - Prior ER visit count/Prior Hospital admission count/recency of events
    - Prior PCP and Specialist Visit count/recency of events

Patient Medications
- historical prescription fills for each members
- NDC (medication type), dosage, supply
- Example feature development:
    - Recent prescription fill count
    - Drug type

Patient Diseases
- disease/condition list for each member
- Example feature development:
    - Asthma Indicator
    - Diabetes Indicator

## Approach and Methods

We plan to create a “profile” data point for each patient based on the 
data sources above. This profile will encompass various features from 
the above data that are used in current Decision Point models. 
Part of the profile for each patient will include time related features 
which will be the focus of our attempted improvement over Decision Point’s 
current models. From there we plan to create a predictive model for 
whether or not the patient will have a hospital stay within a set of 
timeframes (6-month, 1 year, etc.). We plan to use benchmark statistics 
from Decision Point to compare our model against current models with the 
goal of creating a new model with higher accuracy.

Technology:
- Database (postgreSQL, MySQL)
- Model Prep 
- Feature Selection 
- ML Packages (python)

## Results
We are currently working on pulling the data together from the 
different data sources. At this time we have confirmed the
above data points listed under datasources exist will be made available
to us. We will update with further results once we have accessed the
sample that we will be provided.



Feature Importance Analysis

As an initial look at the various time based features and their effects on any modeling that is done, we ran an initial feature importance test on the temporal features within the temporal dataset. We sorted the variables in descending order of importance with the most important features being first and the least important being last. The importance scores that we used to rank the features were pulled from a binary tree classification model. Scores were given for all features within the dataset, but we ranked only the temporal features, any only looked at features which ranked inside the top 6 temporal features. A table summarizing the results is below.


The above table shows that there is a case for the importance of the additional temporal features over only the 12 month features. With the exception of the 12 month readmission response variable, at least one of the 12mo temporal features is not included within the top 6 for that response variable. This means that some of the other time periods for these models are more important predictors, which suggests that excluding them may produce worse results.

One additional observation from the above table is that the shorter term features seem to become more important as the time range of the response variable becomes shorter. The 3 and 1 month features are more important for predicting 3 and 1 month readmission, based on the model used to generate this table. This suggests that the temporal nature of these features may be more beneficial as the prediction period shortens.


## Discussion

## Contributions

oth members of the group contributed equally to the project thus far. Phil Johnson has acted as the point of contact between the group and the interested company, as well as contributed to the data modeling and transformation pieces. Nick Tyler has also contributed during the data transformation steps in addition to the modeling. Both members contributed equally to the report.

## References

## Appendix