CREATE OR REPLACE FUNCTION fnc_trg_person_delete_audit()
RETURNS trigger AS $person_audit$
BEGIN
    INSERT INTO person_audit (created, type_event, row_id, name, age, gender, address)
    VALUES (current_timestamp, 'D', old.id, old.name, old.age, old.gender, old.address);
    RETURN NULL;
END;
$person_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_delete_audit AFTER DELETE
ON person
FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_delete_audit();

DELETE FROM person WHERE id = 10;
SELECT * from person_audit