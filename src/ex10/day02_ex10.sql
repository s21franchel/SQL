SELECT p1.name,p2.name,p1.address 
FROM person AS p1
CROSS JOIN person AS p2
WHERE p1.name != p2.name AND p1.address = p2.address AND p1.id > p2.id
ORDER BY p1.name,p2.name,p1.address
