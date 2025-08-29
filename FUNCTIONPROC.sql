-- Returns rankings for a given season, simplifying dynamic queries.

DELIMITER //
CREATE PROCEDURE GetDriverStandings(IN championship_year INT)
BEGIN
    SELECT d.driver_name, SUM(r.points) AS total_points
    FROM RaceResult r
    JOIN Driver d ON r.driver_id = d.driver_id
    JOIN GrandPrix g ON r.race_id = g.race_id
    JOIN Championship c ON g.championship_id = c.championship_id
    WHERE c.year = championship_year
    GROUP BY d.driver_name
    ORDER BY total_points DESC;
END //
DELIMITER ;

-- Lists all races a team has competed in, making team analysis more efficient.

DELIMITER //
CREATE PROCEDURE GetTeamGrandPrix(IN team_name VARCHAR(50))
BEGIN
    SELECT g.race_name, g.date
    FROM GrandPrix g
    JOIN CompetesIn c ON g.race_id = c.race_id
    JOIN Driver d ON c.driver_id = d.driver_id
    JOIN Team t ON d.team_id = t.team_id
    WHERE t.team_name = team_name;
END //
DELIMITER ;
