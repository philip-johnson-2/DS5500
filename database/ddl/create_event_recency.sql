CREATE TABLE event_recency (
    patient_id INT
    , months_since_last_admission INT
    , months_since_last_er INT
    , months_since_last_pcp_visit INT
    , prior_admission_count INT
    , prior_er_count INT
    , prior_pcp_visit_count INT
)

INSERT INTO event_recency
SELECT patient_id
    , MAX(CASE WHEN event_name = 'Admission' THEN DATEDIFF(MM,a.last_event,'2025-06-30') ELSE 0 END) months_since_last_admission
    , MAX(CASE WHEN event_name = 'ED Visit' THEN DATEDIFF(MM,a.last_event,'2025-06-30') ELSE 0 END) months_since_last_er
    , MAX(CASE WHEN event_name = 'PCP Visit' THEN DATEDIFF(MM,a.last_event,'2025-06-30') ELSE 0 END) months_since_last_pcp_visit
    , MAX(CASE WHEN event_name = 'Admission' THEN b.event_count ELSE 0 END) prior_admission_count
    , MAX(CASE WHEN event_name = 'ED Visit' THEN b.event_count ELSE 0 END) prior_er_count
    , MAX(CASE WHEN event_name = 'PCP Visit' THEN b.event_count ELSE 0 END) prior_pcp_visit_count
FROM patient_demographics d
LEFT JOIN (
    SELECT patient_id
        , event_name
        , MAX(start_date) last_event
    FROM patient_medical_events
    WHERE start_date < '2025-06-30'
    GROUP BY patient_id
        , event_name
) a ON a.patient_id = d.member_id
LEFT JOIN (
    SELECT patient_id
        , event_name
        , COUNT(*) event_count
    FROM patient_medical_events
    WHERE start_date < '2025-06-30'
    GROUP BY patient_id
        , event_name
) b ON b.patient_id = d.patient_id