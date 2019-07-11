--liquibase formatted sql
--changeset dummy_project:release_1.static_data.sql

INSERT INTO masterdata.person (id, name, job) VALUES (-1, 'John Doe', 'Engineer');
INSERT INTO masterdata.car (id, person_id, brand) VALUES (-1, -1, 'Mercedes');


--rollback DELETE FROM masterdata.car WHERE id = -1; DELETE FROM masterdata.person WHERE id = -1;