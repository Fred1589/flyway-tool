--liquibase formatted sql
--changeset dummy_project:release_1.initial_schema.sql

CREATE SCHEMA masterdata;
GRANT USAGE ON SCHEMA masterdata TO ${schemaUser};

CREATE TABLE masterdata.person (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    job VARCHAR
);

GRANT ALL ON ALL TABLES IN SCHEMA masterdata TO ${schemaUser};

--rollback DROP SCHEMA masterdata CASCADE;