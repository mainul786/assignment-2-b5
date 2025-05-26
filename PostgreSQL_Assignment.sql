-- Active: 1747452479950@@localhost@5432@conservation_db
CREATE  TABLE rangers(ranger_id SERIAL PRIMARY KEY, "name" VARCHAR(50), region VARCHAR(50));
CREATE TABLE species(species_id SERIAL PRIMARY KEY, common_name VARCHAR(50), scientific_name VARCHAR(100), discovery_date DATE, conservation_status VARCHAR(70));
CREATE TABLE sightings(sighting_id SERIAL PRIMARY KEY, ranger_id INT REFERENCES rangers(ranger_id),species_id INTEGER REFERENCES species(species_id), sighting_time TIMESTAMP, "location" VARCHAR(100), notes VARCHAR(100) );
INSERT INTO rangers("name", region) VALUES
('Alice Green','Northern Hills'),
('Bob White','River Delta'),
('Carol King','Mountain Range');
INSERT INTO species(common_name, scientific_name,discovery_date,conservation_status) VALUES
('Snow Leopard','Panthera uncia','1775-01-01','Endangered'),
('Bengal Tiger','Panthera tigris tigris','1758-01-01','Endangered'),
('Red Panda','Ailurus fulgens','1825-01-01','Vulnerable'),
('Asiatic Elephant','Elephas maximus indicus','1758-01-01','Endangered');
INSERT INTO sightings(ranger_id,species_id,sighting_time,"location",notes) VALUES
(1,1,'2024-05-10 07:45:00','Peak Ridge','Camera trap image captured'),
(2,2,'2024-05-12 16:20:00','Bankwood Area','Juvenile seen'), 
(3,3,'2024-05-15 09:10:00','Bamboo Grove East','Feeding observed'),         
(1,2,'2024-05-18 18:30:00','Snowfall Pass',NULL);        


SELECT * FROM rangers;
SELECT * FROM species;

SELECT * FROM sightings;

-- problem-I
INSERT INTO rangers ("name", region) VALUES ('Derek Fox', 'Coastal Plains');
-- problem-II
SELECT COUNT(DISTINCT species_id) AS unique_species_sighted
FROM sightings;
--problem-III
SELECT *  FROM sightings
WHERE location ILIKE'%Pass';
--problem-IV
SELECT "name" , count(*) FROM sightings
JOIN rangers USING(ranger_id) GROUP BY  "name";

--problem-V
SELECT common_name FROM sightings
FULL JOIN species USING(species_id) WHERE sighting_id IS NULL;

--problem-VI
SELECT  common_name,sighting_time, "name" FROM sightings 
JOIN rangers USING(ranger_id)
JOIN species USING(species_id) ORDER BY sighting_time DESC LIMIT  2;

--Problem-VII
UPDATE species SET conservation_status = 'Historic'
WHERE  EXTRACT(YEAR FROM discovery_date)   < 1800;
--problem-VIII
SELECT 
sighting_id,
CASE 
    WHEN EXTRACT(HOUR FROM sighting_time)<12 THEN 'Morning'
    WHEN EXTRACT(HOUR FROM sighting_time)>=12 AND EXTRACT(HOUR FROM sighting_time)  <17 THEN 'Afternoon'
    ELSE  'Evening'
END AS time_of_day
FROM sightings;

--problem-IX
DELETE FROM rangers
WHERE ranger_id NOT IN (
    SELECT DISTINCT ranger_id FROM sightings
);

