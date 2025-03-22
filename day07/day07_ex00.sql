SELECT person_id, count(*) as "visit_count"
FROM person_visits
GROUP BY person_id
ORDER BY 2 DESC,1 ASC;













