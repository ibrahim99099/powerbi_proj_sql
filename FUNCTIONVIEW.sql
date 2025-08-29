CREATE VIEW DriverStandings AS
SELECT d.driver_name, t.team_name, SUM(r.points) AS total_points
FROM RaceResult r
JOIN Driver d ON r.driver_id = d.driver_id
JOIN Team t ON d.team_id = t.team_id
GROUP BY d.driver_name, t.team_name
ORDER BY total_points DESC;

CREATE VIEW GrandPrixWinners AS
SELECT g.race_name, g.date, d.driver_name, t.team_name, r.position, r.points
FROM RaceResult r
JOIN Driver d ON r.driver_id = d.driver_id
JOIN Team t ON d.team_id = t.team_id
JOIN GrandPrix g ON r.race_id = g.race_id
WHERE r.position = 1
ORDER BY g.date;


