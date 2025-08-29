-- Finds top 3 drivers based on total points for the 2025 season.
SELECT d.driver_name, SUM(r.points) AS total_points
FROM RaceResult r
JOIN Driver d ON r.driver_id = d.driver_id
JOIN GrandPrix g ON r.race_id = g.race_id
JOIN Championship c ON g.championship_id = c.championship_id
WHERE c.year = 2025
GROUP BY d.driver_name
ORDER BY total_points DESC
LIMIT 3;

-- Retrieves how many races were held in each championship season.
SELECT c.year, COUNT(g.race_id) AS total_races
FROM Championship c
LEFT JOIN GrandPrix g ON c.championship_id = g.championship_id
GROUP BY c.year
ORDER BY total_races DESC;

-- Identifies which team has won the most races.
SELECT t.team_name, COUNT(r.result_id) AS wins
FROM RaceResult r
JOIN Driver d ON r.driver_id = d.driver_id
JOIN Team t ON d.team_id = t.team_id
WHERE r.position = 1
GROUP BY t.team_name
ORDER BY wins DESC
LIMIT 1;

-- Finds the fastest lap recorded per race.
SELECT g.race_name, MIN(r.fastest_lap) AS fastest_lap_time
FROM RaceResult r
JOIN GrandPrix g ON r.race_id = g.race_id
GROUP BY g.race_name;

-- Determines which drivers participated in the most races in 2025.
SELECT d.driver_name, COUNT(DISTINCT g.race_id) AS races_participated
FROM Driver d
JOIN CompetesIn c ON d.driver_id = c.driver_id
JOIN GrandPrix g ON c.race_id = g.race_id
JOIN Championship ch ON g.championship_id = ch.championship_id
WHERE ch.year = 2025
GROUP BY d.driver_name
ORDER BY races_participated DESC;
