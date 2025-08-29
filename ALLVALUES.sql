INSERT INTO Championship (championship_id, year) VALUES
(1, 2025),
(2, 2026),
(3, 2027),
(4, 2028),
(5, 2029);

INSERT INTO Circuit (circuit_id, circuit_name, location, length_km) VALUES
(1, 'Monaco Circuit', 'Monte Carlo, Monaco', 3.34),
(2, 'Silverstone', 'UK', 5.89),
(3, 'Suzuka Circuit', 'Japan', 5.81),
(4, 'Interlagos', 'Brazil', 4.31),
(5, 'Marina Bay Street Circuit', 'Singapore', 5.06),
(6, 'Hockenheimring', 'Germany', 4.57),
(7, 'Spa-Francorchamps', 'Belgium', 7.00),
(8, 'Circuit of the Americas', 'USA', 5.51),
(9, 'Bahrain International Circuit', 'Bahrain', 5.41),
(10, 'Yas Marina Circuit', 'Abu Dhabi', 5.28);

INSERT INTO GrandPrix (race_id, race_name, location, track_type, date, championship_id, circuit_id) VALUES
(1, 'Monaco Grand Prix', 'Monte Carlo', 'Street', '2025-05-26', 1, 1),
(2, 'British Grand Prix', 'Silverstone', 'Road', '2025-07-14', 1, 2),
(3, 'Japanese Grand Prix', 'Suzuka', 'Road', '2025-10-10', 1, 3),
(4, 'Brazilian Grand Prix', 'Interlagos', 'Road', '2026-11-15', 2, 4),
(5, 'Singapore Grand Prix', 'Marina Bay', 'Street', '2026-09-22', 2, 5),
(6, 'German Grand Prix', 'Hockenheim', 'Road', '2025-07-30', 1, 6),
(7, 'Belgian Grand Prix', 'Spa', 'Road', '2025-08-27', 1, 7),
(8, 'United States Grand Prix', 'Austin', 'Road', '2025-10-20', 2, 8),
(9, 'Bahrain Grand Prix', 'Sakhir', 'Road', '2026-03-12', 2, 9),
(10, 'Abu Dhabi Grand Prix', 'Yas Marina', 'Road', '2026-12-01', 3, 10);

INSERT INTO Team (team_id, team_name, constructor, championship_id) VALUES
(1, 'Red Bull Racing', 'Honda', 1),
(2, 'Mercedes-AMG', 'Mercedes', 1),
(3, 'Ferrari', 'Ferrari', 1),
(4, 'McLaren', 'Mercedes', 2),
(5, 'Aston Martin', 'Honda', 2),
(6, 'Alpine', 'Renault', 2),
(7, 'Williams', 'Mercedes', 2),
(8, 'Haas', 'Ferrari', 3),
(9, 'AlphaTauri', 'Honda', 3),
(10, 'Alfa Romeo', 'Ferrari', 3);

INSERT INTO Driver (driver_id, driver_name, nationality, dob, team_id) VALUES
(1, 'Max Verstappen', 'Dutch', '1997-09-30', 1),
(2, 'Lewis Hamilton', 'British', '1985-01-07', 2),
(3, 'Charles Leclerc', 'Monégasque', '1997-10-16', 3),
(4, 'Lando Norris', 'British', '1999-11-13', 4),
(5, 'Fernando Alonso', 'Spanish', '1981-07-29', 5),
(6, 'Sergio Perez', 'Mexican', '1990-01-26', 1),
(7, 'George Russell', 'British', '1998-02-15', 2),
(8, 'Carlos Sainz', 'Spanish', '1994-09-01', 3),
(9, 'Oscar Piastri', 'Australian', '2001-04-06', 4),
(10, 'Lance Stroll', 'Canadian', '1998-10-29', 5),
(11, 'Pierre Gasly', 'French', '1996-02-07', 6),
(12, 'Esteban Ocon', 'French', '1996-09-17', 6),
(13, 'Alex Albon', 'Thai', '1996-03-23', 7),
(14, 'Logan Sargeant', 'American', '2000-12-31', 7),
(15, 'Nico Hülkenberg', 'German', '1987-08-19', 8),
(16, 'Kevin Magnussen', 'Danish', '1992-10-05', 8),
(17, 'Yuki Tsunoda', 'Japanese', '2000-05-11', 9),
(18, 'Daniel Ricciardo', 'Australian', '1989-07-01', 9),
(19, 'Zhou Guanyu', 'Chinese', '1999-05-30', 10),
(20, 'Valtteri Bottas', 'Finnish', '1989-08-28', 10);


INSERT INTO RaceResult (result_id, race_id, driver_id, position, points, fastest_lap) VALUES
(1, 1, 1, 1, 25.0, '01:32:45'),
(2, 1, 2, 2, 18.0, '01:33:20'),
(3, 1, 3, 3, 15.0, '01:34:05'),
(4, 2, 4, 1, 25.0, '01:31:50'),
(5, 2, 5, 2, 18.0, '01:32:10'),
(6, 2, 6, 3, 15.0, '01:33:00'),
(7, 3, 7, 1, 25.0, '01:30:25'),
(8, 3, 8, 2, 18.0, '01:31:15'),
(9, 3, 9, 3, 15.0, '01:32:00'),
(10, 4, 10, 1, 25.0, '01:29:50'),
(11, 6, 11, 1, 25.0, '01:30:05'),
(12, 6, 12, 2, 18.0, '01:30:20'),
(13, 6, 13, 3, 15.0, '01:30:45'),
(14, 7, 14, 1, 25.0, '01:29:50'),
(15, 7, 15, 2, 18.0, '01:30:10'),
(16, 7, 16, 3, 15.0, '01:30:30'),
(17, 8, 17, 1, 25.0, '01:31:50'),
(18, 8, 18, 2, 18.0, '01:32:10'),
(19, 8, 19, 3, 15.0, '01:32:25'),
(20, 9, 20, 1, 25.0, '01:31:05');


INSERT INTO CompetesIn (driver_id, race_id) VALUES
(1, 1), (2, 1), (3, 1), (4, 2), (5, 2),
(6, 2), (7, 3), (8, 3), (9, 3), (10, 4),
(1, 5), (2, 5), (3, 5), (4, 5), (5, 5),
(11, 6), (12, 6), (13, 6), (14, 7), (15, 7), (16, 7),
(17, 8), (18, 8), (19, 8), (20, 9),
(1, 10), (2, 10), (3, 10), (4, 10), (5, 10),
(6, 6), (7, 6), (8, 7), (9, 7), (10, 8);

