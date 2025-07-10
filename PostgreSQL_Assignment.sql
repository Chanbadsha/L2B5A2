-- Active: 1751977807135@@127.0.0.1@5432@assignment2

CREATE Table rangers(
    ranger_id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(50) NOT NULL,
    region VARCHAR(200) NOT NULL
)

-- Insert Sample Data

INSERT INTO rangers(name,region) VALUES('Meera Akter','Sundarbans East Wildlife Sanctuary'),('Faruk Hossain','Lawachara National Park'),('Nazmul Islam','Rema-Kalenga Wildlife Sanctuary'), ('Shirin Jahan','Satchari National Park'),('Arifur Rahman','Teknaf Wildlife Sanctuary')



CREATE Table species(
    species_id SERIAL PRIMARY KEY NOT NULL,
    common_name VARCHAR(50) NOT NULL,
    scientific_name VARCHAR(100) NOT NULL UNIQUE,
    discovery_date DATE NOT NULL,
    conservation_status VARCHAR(50) NOT NULL
)


INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status) VALUES
('Bengal Tiger', 'Panthera tigris', '1758-01-01', 'Endangered'),
('Fishing Cat', 'Prionailurus viverrinus', '1821-05-10', 'Vulnerable'),
('Asian Elephant', 'Elephas maximus', '1758-03-15', 'Endangered'),
('Ganges River Dolphin', 'Platanista gangetica', '1801-06-25', 'Endangered'),
('Masked Finfoot', 'Heliopais personatus', '1828-11-20', 'Endangered'),
('Indian Python', 'Python molurus', '1758-01-01', 'Near Threatened'),
('King Cobra', 'Ophiophagus hannah', '1836-01-01', 'Vulnerable'),
('Smooth-coated Otter', 'Lutrogale perspicillata', '1821-01-01', 'Vulnerable'),
('Great Hornbill', 'Buceros bicornis', '1758-01-01', 'Vulnerable'),
('Indian Peafowl', 'Pavo cristatus', '1758-01-01', 'Least Concern'),
('Clouded Leopard', 'Neofelis nebulosa', '1821-01-01', 'Vulnerable'),
('Hoolock Gibbon', 'Hoolock hoolock', '1917-01-01', 'Endangered'),
('Asian Golden Cat', 'Catopuma temminckii', '1827-01-01', 'Near Threatened'),
('Pallas’s Fish Eagle', 'Haliaeetus leucoryphus', '1776-01-01', 'Endangered'),
('Sambar Deer', 'Rusa unicolor', '1780-01-01', 'Vulnerable'),
('Indian Pangolin', 'Manis crassicaudata', '1820-01-01', 'Endangered'),
('Malayan Sun Bear', 'Helarctos malayanus', '1821-01-01', 'Vulnerable'),
('White-rumped Vulture', 'Gyps bengalensis', '1833-01-01', 'Critically Endangered'),
('Common Myna', 'Acridotheres tristis', '1766-01-01', 'Least Concern'),
('Spot-billed Pelican', 'Pelecanus philippensis', '1835-01-01', 'Near Threatened');


CREATE Table sightings(
    sighting_id SERIAL PRIMARY KEY NOT NULL,
    ranger_id INT REFERENCES rangers(ranger_id) NOT NULL,
    species_id INT REFERENCES species(species_id) NOT NULL,
    sighting_time TIMESTAMPTZ NOT NULL,
    location VARCHAR(100) NOT NULL,
    notes VARCHAR(200)
)


-- Inser Sample Data

INSERT INTO sightings (ranger_id, species_id, sighting_time, location, notes) VALUES
(1, 1, '2025-06-01 08:30:00+06', 'Sundarbans East Zone A', 'Spotted near the mangrove riverbank.'),
(2, 3, '2025-06-02 14:15:00+06', 'Lawachara Forest Sector 3', NULL),
(3, 5, '2025-06-03 09:45:00+06', 'Rema-Kalenga Wetlands', 'Seen wading in shallow water.'),
(5, 4, '2025-06-05 06:20:00+06', 'Teknaf Hill Range', NULL),
(1, 6, '2025-06-06 10:00:00+06', 'Sundarbans Central', 'Large python basking in sunlight.'),
(2, 7, '2025-06-07 13:30:00+06', 'Lawachara Core Zone', 'King cobra spotted crossing trail.'),
(3, 8, '2025-06-08 15:45:00+06', 'Rema-Kalenga Streamside', NULL),
(5, 9, '2025-06-09 11:10:00+06', 'Sundarbans West', 'Hornbill calling loudly.'),
(1, 10, '2025-06-10 09:00:00+06', 'Lawachara Entrance', 'Peafowl displaying feathers.'),
(2, 11, '2025-06-11 16:20:00+06', 'Satchari Reserve', 'Clouded leopard tracks found.');




SELECT * FROM sightings

