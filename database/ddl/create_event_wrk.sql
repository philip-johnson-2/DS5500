CREATE TABLE event_wrk
(
 patient_id INT,
 prev_admission_12mo INT,
 prev_admission_6mo INT,
 prev_admission_3mo INT,
 prev_admission_1mo INT,
 prev_er_12mo INT,
 prev_er_6mo INT,
 prev_er_3mo INT,
 prev_er_1mo INT,
 prev_pcp_12mo INT,
 prev_pcp_6mo INT,
 prev_pcp_3mo INT,
 prev_pcp_1mo INT,
 fut_admission_12mo INT,
 fut_admission_6mo INT,
 fut_admission_3mo INT,
 fut_admission_1mo INT
);

insert into event_wrk
select patient_id,
	-- admissions
	MAX(case when event_name = 'Admission' AND event_date between '2024-06-30' and '2025-06-30' then 1 else 0 end),
	MAX(case when event_name = 'Admission' AND event_date between '2024-12-31' and '2025-06-30' then 1 else 0 end),
	MAX(case when event_name = 'Admission' AND event_date between '2025-03-30' and '2025-06-30' then 1 else 0 end),
	MAX(case when event_name = 'Admission' AND event_date between '2025-05-30' and '2025-06-30' then 1 else 0 end),
	-- er visits
	MAX(case when event_name = 'ER' AND event_date between '2024-06-30' and '2025-06-30' then 1 else 0 end),
	MAX(case when event_name = 'ER' AND event_date between '2024-12-31' and '2025-06-30' then 1 else 0 end),
	MAX(case when event_name = 'ER' AND event_date between '2025-03-30' and '2025-06-30' then 1 else 0 end),
	MAX(case when event_name = 'ER' AND event_date between '2025-05-30' and '2025-06-30' then 1 else 0 end),
	-- pcp visits 
	MAX(case when event_name = 'PCP Visit' AND event_date between '2024-06-30' and '2025-06-30' then 1 else 0 end),
	MAX(case when event_name = 'PCP Visit' AND event_date between '2024-12-31' and '2025-06-30' then 1 else 0 end),
	MAX(case when event_name = 'PCP Visit' AND event_date between '2025-03-30' and '2025-06-30' then 1 else 0 end),
	MAX(case when event_name = 'PCP Visit' AND event_date between '2025-05-30' and '2025-06-30' then 1 else 0 end),
	-- future admissions
	MAX(case when event_name = 'Admission' AND event_date between '2025-06-30' and '2026-06-30' then 1 else 0 end),
	MAX(case when event_name = 'Admission' AND event_date between '2025-06-30' and '2025-12-31' then 1 else 0 end),
	MAX(case when event_name = 'Admission' AND event_date between '2025-06-30' and '2025-09-30' then 1 else 0 end),
	MAX(case when event_name = 'Admission' AND event_date between '2025-06-30' and '2025-07-30' then 1 else 0 end)	
from patient_medical_events
group by patient_id;

CREATE INDEX idx_event_wrk_patient_id ON event_wrk (patient_id);
