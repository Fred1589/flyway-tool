CREATE TABLE ${schemaName}.car (
    id BIGSERIAL PRIMARY KEY,
    person_id BIGINT REFERENCES ${schemaName}.person (id),
    brand VARCHAR
);

GRANT ALL ON ALL TABLES IN SCHEMA ${schemaName} TO ${schemaUser};
