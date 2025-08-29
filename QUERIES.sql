-- lists all Grand Prix races scheduled in 2025, including their location and date.
SELECT race_name, location, date
FROM GrandPrix
WHERE YEAR(date) = 2025;

-- Retrieves all drivers of British nationality.
SELECT driver_name, nationality
FROM Driver
WHERE nationality = 'British';

-- Finds the longest Formula 1 circuit by sorting circuits in descending order of length.
SELECT circuit_name, location, length_km
FROM Circuit
ORDER BY length_km DESC
LIMIT 1;

-- Retrieves the fastest recorded lap time in the Monaco Grand Prix.
SELECT race_name, fastest_lap
FROM RaceResult 
JOIN GrandPrix ON RaceResult.race_id = GrandPrix.race_id
WHERE GrandPrix.race_name = 'Monaco Grand Prix'
ORDER BY fastest_lap ASC
LIMIT 1;

-- Retrieves all teams and their constructors competing in the 2025 Formula 1 Championship.
SELECT team_name, constructor
FROM Team
WHERE championship_id = (SELECT championship_id FROM Championship WHERE year = 2025);
