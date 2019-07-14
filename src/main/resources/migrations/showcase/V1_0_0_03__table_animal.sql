CREATE TABLE ${schemaName}.animal (
    id BIGSERIAL PRIMARY KEY,
    person_id BIGINT REFERENCES ${schemaName}.person (id),
    type VARCHAR
);

GRANT ALL ON ALL TABLES IN SCHEMA ${schemaName} TO ${schemaUser};
