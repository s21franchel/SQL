SELECT order_date,
( SELECT CONCAT(name,'(age:',person.age,')')) AS pers_inf
FROM person_order
JOIN person ON person.id = person_order.person_id
ORDER BY order_date,pers_inf
