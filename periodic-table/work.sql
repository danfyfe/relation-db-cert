\c
ALTER TABLE properties RENAME weight TO atomic_mass;
ALTER TABLE properties RENAME melting_point TO melting_point_celsius;
ALTER TABLE properties RENAME boiling_point TO boiling_point_celsius;
ALTER TABLE properties ALTER COLUMN melting_point_celsius
SET
NOT NULL;

ALTER TABLE properties ALTER COLUMN boiling_point_celsius
SET
NOT NULL;

ALTER TABLE elements
ADD CONSTRAINT symbol UNIQUE (symbol);

ALTER TABLE elements
ADD CONSTRAINT name UNIQUE (name);

ALTER TABLE elements ALTER symbol
SET
NOT NULL;

ALTER TABLE elements ALTER name
SET
NOT NULL;

ALTER TABLE properties ADD CONSTRAINT atomic_number FOREIGN KEY (atomic_number) REFERENCES elements(atomic_number);

CREATE TABLE types
(
  type_id SERIAL PRIMARY KEY,
  type VARCHAR(30) NOT NULL
);

INSERT INTO types
  (type)
VALUES('nonmetal');
INSERT INTO types
  (type)
VALUES('metal');
INSERT INTO types
  (type)
VALUES('metalloid');

ALTER TABLE properties ADD COLUMN type_id INT;

UPDATE properties
SET type_id = types.type_id
FROM types
WHERE properties.type = types.type;


ALTER TABLE properties ALTER COLUMN type_id
SET
NOT NULL;

ALTER TABLE properties ADD CONSTRAINT type_id FOREIGN KEY (type_id) REFERENCES types(type_id);

UPDATE elements
SET symbol = INITCAP(symbol);

UPDATE properties
SET atomic_mass = regexp_replace(atomic_mass::TEXT, '\.?0*$', '')
::DECIMAL;

INSERT INTO elements
  (atomic_number, name, symbol)
VALUES(9, 'Fluorine', 'F');
INSERT INTO properties
  (atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, type, type_id)
VALUES(9, 18.998, -220, -188.1, 'nonmetal', (SELECT type_id
    FROM types
    WHERE type='nonmetal'));

INSERT INTO elements
  (atomic_number, name, symbol)
VALUES(10, 'Neon', 'Ne');
INSERT INTO properties
  (atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, type, type_id)
VALUES(10, 20.18, -248.6, -246.1, 'nonmetal', (SELECT type_id
    FROM types
    WHERE type='nonmetal'));

DELETE FROM properties WHERE atomic_number=1000;
DELETE FROM elements WHERE atomic_number=1000;


ALTER TABLE properties DROP COLUMN type;