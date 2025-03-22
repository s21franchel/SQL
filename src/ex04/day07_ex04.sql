SELECT person.name,count(*)as visit_count
FROM person
INNER JOIN person_visits ON person_id = person.id
GROUP BY person.name
HAVING COUNT(*)> 3;