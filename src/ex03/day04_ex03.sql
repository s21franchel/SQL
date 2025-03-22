CREATE VIEW v_symmetric_union AS(
(SELECT visit_date
FROM person_visits
WHERE visit_date = '2022-01-02'
EXCEPT
SELECT visit_date
FROM person_visits
WHERE visit_date = '2022-01-06')
UNION
(SELECT visit_date
FROM person_visits
WHERE visit_date = '2022-01-06'
EXCEPT
SELECT visit_date
FROM person_visits
WHERE visit_date = '2022-01-02')
);







