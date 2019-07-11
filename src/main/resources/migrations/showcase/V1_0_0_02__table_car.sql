--liquibase formatted sql
--changeset dummy_project:release_1.table_car.sql

CREATE TABLE masterdata.car (
    id BIGSERIAL PRIMARY KEY,
    person_id BIGINT REFERENCES masterdata.person (id),
    brand VARCHAR
);

GRANT ALL ON ALL TABLES IN SCHEMA masterdata TO ${schemaUser};

--rollback DROP TABLE masterdata.car;