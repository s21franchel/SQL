SELECT order_date,
        (SELECT
            CONCAT(newperson.name, ' (age:', newperson.age, ')')
        ) AS person_inf
FROM person_order
NATURAL JOIN
    (SELECT id AS person_id, name, age FROM person) AS newperson
ORDER BY order_date,person_inf
