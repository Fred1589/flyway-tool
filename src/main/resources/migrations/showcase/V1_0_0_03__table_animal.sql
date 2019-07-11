--liquibase formatted sql
--changeset dummy_project:release_1.table_animal.sql

CREATE TABLE masterdata.animal (
    id BIGSERIAL PRIMARY KEY,
    person_id BIGINT REFERENCES masterdata.person (id),
    type VARCHAR
);

GRANT ALL ON ALL TABLES IN SCHEMA masterdata TO ${schemaUser};

--rollback DROP TABLE masterdata.animal;