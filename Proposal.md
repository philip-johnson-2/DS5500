# Improving Hospital Inpatient Admissions Predictions Leveraging Temporal Relationships

## Summary
Can we prove that temporal relationships in a medical patients
history improves the ability to predict future hospital admissions.
We are hoping to prove that the recency of prior utilization impacts
the ability to predict both long term and short term hospital
admissions and that we see greater improvement in model accuracy for
short term predictions.

## Data Source
Decision Point will provide data from their data warehouse that
will be wiped of all PHI in accordance with HIPPA standards.
This will include historical data from health insurance companies
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
    
##Approach and Methods

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
