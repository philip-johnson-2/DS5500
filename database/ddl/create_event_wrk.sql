CREATE TABLE event_wrk
(
 patient_id INT,
 prev_admission INT,
 prev_admission_12mo INT,
 prev_admission_6mo INT,
 prev_admission_3mo INT,
 prev_admission_1mo INT,
 prev_admission_idx INT,
 fut_admission_12mo INT,
 fut_admission_6mo INT,
 fut_admission_3mo INT,
 fut_admission_1mo INT
);

insert into event_wrk
select patient_id,
	MAX(case when event_date between '2024-06-30' and '2025-06-30' then 1 else 0 end),
	MAX(case when event_date between '2024-12-31' and '2025-06-30' then 1 else 0 end),
	MAX(case when event_date between '2025-03-30' and '2025-06-30' then 1 else 0 end),
	MAX(case when event_date between '2025-05-30' and '2025-06-30' then 1 else 0 end),
	0,
	MAX(case when event_date between '2025-06-30' and '2026-06-30' then 1 else 0 end),
	MAX(case when event_date between '2025-06-30' and '2025-12-31' then 1 else 0 end),
	MAX(case when event_date between '2025-06-30' and '2025-09-30' then 1 else 0 end),
	MAX(case when event_date between '2025-06-30' and '2025-07-30' then 1 else 0 end)
from patient_medical_events
where event_name = 'Admission'
group by patient_id;

CREATE INDEX idx_event_wrk_patient_id ON event_wrk (patient_id);
