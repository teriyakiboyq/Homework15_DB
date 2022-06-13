CREATE TABLE IF NOT EXISTS animal_type (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS animal_breed (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS animal_color (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS outcome_subtype (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS outcome_type (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS animals_final (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    animal_id VARCHAR(50) NOT NULL,
    age_upon_outcome VARCHAR(50) NOT NULL,
    name VARCHAR(50),
    date_of_birth VARCHAR(50),
    outcome_month INTEGER NOT NULL,
    outcome_year INTEGER NOT NULL,
    type_id INTEGER NOT NULL,
    breed_id INTEGER NOT NULL,
    color1_id INTEGER ,
    color2_id INTEGER,
    outcome_subtype_id INTEGER,
    outcome_type_id INTEGER,

    FOREIGN KEY (type_id) REFERENCES animal_type(id),
    FOREIGN KEY (breed_id) REFERENCES animal_breed(id),
    FOREIGN KEY (color1_id) REFERENCES animal_color(id),
    FOREIGN KEY (color2_id) REFERENCES animal_color(id),
    FOREIGN KEY (outcome_subtype_id) REFERENCES outcome_subtype(id),
    FOREIGN KEY (outcome_type_id) REFERENCES outcome_type(id)
);