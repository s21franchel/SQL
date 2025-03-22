SELECT person.name, count(*) as "visit_count"
FROM person
INNER JOIN person_visits ON person.id = person_visits.person_id
GROUP BY person.name
ORDER BY 2 DESC,1 ASC
LIMIT 4;











