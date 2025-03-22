WITH daily_visits AS (
    SELECT DISTINCT visit_date
    FROM person_visits
    WHERE person_id IN (1, 2)
      AND visit_date BETWEEN '2022-01-01' AND '2022-01-10'
),
missing_dates AS (
    SELECT days::DATE AS missing_date
    FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') AS days
    LEFT JOIN daily_visits ON days = daily_visits.visit_date
    WHERE daily_visits.visit_date IS NULL
)
SELECT missing_date
FROM missing_dates
ORDER BY missing_date;
