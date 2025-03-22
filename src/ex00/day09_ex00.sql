CREATE TABLE person_audit(
    created TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT current_timestamp,
    type_event char(1) DEFAULT 'I' NOT NULL,
    row_id bigint NOT NULL,
    name varchar,
    age integer,
    gender varchar,
    address varchar,
    constraint ch_type_event check(type_event in ('I','U','D'))
);

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit()
RETURNS trigger AS $person_audit$
BEGIN
    INSERT INTO person_audit (created, type_event, row_id, name, age, gender, address)
    VALUES (current_timestamp, 'I', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
    RETURN NEW;
END;
$person_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit AFTER INSERT
ON person
FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');
SELECT * from person_audit