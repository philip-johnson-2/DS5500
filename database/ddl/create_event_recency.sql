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
SELECT d.patient_id
    , MIN(CASE WHEN a.event_name = 'Admission' THEN (DATE_PART('year', '2025-06-30'::date) - DATE_PART('year', a.last_event::date)) * 12 + DATE_PART('month', '2025-06-30'::date) - DATE_PART('month', a.last_event::date) ELSE 13 END) months_since_last_admission
    , MIN(CASE WHEN a.event_name = 'ED Visit' THEN (DATE_PART('year', '2025-06-30'::date) - DATE_PART('year', a.last_event::date)) * 12 + DATE_PART('month', '2025-06-30'::date) - DATE_PART('month', a.last_event::date) ELSE 13 END) months_since_last_er
    , MIN(CASE WHEN a.event_name = 'PCP Visit' THEN (DATE_PART('year', '2025-06-30'::date) - DATE_PART('year', a.last_event::date)) * 12 + DATE_PART('month', '2025-06-30'::date) - DATE_PART('month', a.last_event::date) ELSE 13 END) months_since_last_pcp_visit
    , MAX(CASE WHEN a.event_name = 'Admission' THEN b.event_count ELSE 0 END) prior_admission_count
    , MAX(CASE WHEN a.event_name = 'ED Visit' THEN b.event_count ELSE 0 END) prior_er_count
    , MAX(CASE WHEN a.event_name = 'PCP Visit' THEN b.event_count ELSE 0 END) prior_pcp_visit_count
FROM patient_demographics d
LEFT JOIN (
    SELECT p.patient_id
        , event_name
        , MAX(event_date) last_event
    FROM patient_medical_events p
    WHERE event_date < '2025-06-30'
    GROUP BY p.patient_id
        , event_name
) a ON a.patient_id = d.patient_id
LEFT JOIN (
    SELECT p.patient_id
        , event_name
        , COUNT(*) event_count
    FROM patient_medical_events p
    WHERE event_date < '2025-06-30'
    GROUP BY p.patient_id
        , event_name
) b ON b.patient_id = d.patient_id
GROUP BY d.patient_id
