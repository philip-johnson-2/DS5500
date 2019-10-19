/*
    Create patient record table used to store 
    all features for each patient that will 
    be leveraged for modeling
*/
DROP TABLE patient_record 
GO

CREATE patient_record (
    as_of_date DATE
    , patient_id INT
    
    --diseases 
    , patient_asthma_indicator INT
    --events
    , patient_prior_admission INT

    --medications


    -- dv

)