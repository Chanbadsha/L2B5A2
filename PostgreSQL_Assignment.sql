-- Active: 1751977807135@@127.0.0.1@5432@assignment2

CREATE Table rangers(
    ranger_id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(50) NOT NULL,
    region VARCHAR(200) NOT NULL
)


CREATE Table species(
    species_id SERIAL PRIMARY KEY NOT NULL,
    common_name VARCHAR(50) NOT NULL,
    scientific_name VARCHAR(100) NOT NULL UNIQUE,
    discovery_date DATE NOT NULL,
    conservation_status VARCHAR(50) NOT NULL
)

CREATE Table sightings(
    sighting_id SERIAL PRIMARY KEY NOT NULL,
    ranger_id INT REFERENCES rangers(ranger_id) NOT NULL,
    species_id INT REFERENCES species(species_id) NOT NULL,
    sighting_time TIMESTAMP NOT NULL,
    location VARCHAR(100) NOT NULL,
    notes VARCHAR(100)
)