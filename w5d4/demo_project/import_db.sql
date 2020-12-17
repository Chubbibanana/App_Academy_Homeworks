DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS houses;

CREATE TABLE houses(
    id INTEGER PRIMARY KEY,
    address_text TEXT
);

CREATE TABLE people(
    id INTEGER PRIMARY KEY,
    person_name TEXT,
    house_id INTEGER,

    FOREIGN KEY (house_id) REFERENCES houses(id)
);