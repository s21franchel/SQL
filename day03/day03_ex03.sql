WITH female_pizzerias AS (
    SELECT DISTINCT pizzeria.name
    FROM person
    INNER JOIN person_visits ON person_visits.person_id = person.id
    INNER JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
    WHERE person.gender = 'female'
),
male_pizzerias AS (
    SELECT DISTINCT pizzeria.name
    FROM person
    INNER JOIN person_visits ON person_visits.person_id = person.id
    INNER JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
    WHERE person.gender = 'male'
)
SELECT DISTINCT pizzeria_name
FROM (
    SELECT name FROM female_pizzerias
    UNION ALL
    SELECT name FROM male_pizzerias
) pizzeria_name
ORDER BY pizzeria_name;


