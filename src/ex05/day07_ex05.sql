SELECT DISTINCT person.name 
FROM person
INNER JOIN person_order ON person_id = person.id
ORDER BY person.name