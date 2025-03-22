CREATE INDEX idx_person_name on person(upper(name));
SET enable_seqscan = off;
EXPLAIN ANALYZE
SELECT *
FROM person
WHERE upper(name) = 'Kate'