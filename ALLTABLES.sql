CREATE TABLE Championship (
    championship_id INT PRIMARY KEY,
    year YEAR
);

CREATE TABLE Circuit (
    circuit_id INT PRIMARY KEY,
    circuit_name VARCHAR(50),
    location VARCHAR(60),
    length_km DECIMAL(5,2) CHECK (length_km > 0)
);

CREATE TABLE GrandPrix (
    race_id INT PRIMARY KEY,
    race_name VARCHAR(40),
    location VARCHAR(60),
    track_type VARCHAR(30),
    date DATE,
    championship_id INT,
    circuit_id INT,
    FOREIGN KEY (championship_id) REFERENCES Championship(championship_id),
    FOREIGN KEY (circuit_id) REFERENCES Circuit(circuit_id)
);

CREATE TABLE Team (
    team_id INT PRIMARY KEY,
    team_name VARCHAR(50) UNIQUE,
    constructor VARCHAR(50),
    championship_id INT,
    FOREIGN KEY (championship_id) REFERENCES Championship(championship_id)
);

CREATE TABLE Driver (
    driver_id INT PRIMARY KEY,
    driver_name VARCHAR(50),
    nationality VARCHAR(50),
    dob DATE,
    team_id INT,
    FOREIGN KEY (team_id) REFERENCES Team(team_id)
);

CREATE TABLE RaceResult (
    result_id INT PRIMARY KEY,
    race_id INT,
    driver_id INT,
    position INT CHECK (position > 0),
    points DECIMAL(5,2) CHECK (points >= 0),
    fastest_lap TIME NULL,
    FOREIGN KEY (race_id) REFERENCES GrandPrix(race_id),
    FOREIGN KEY (driver_id) REFERENCES Driver(driver_id)
);

CREATE TABLE CompetesIn (
    driver_id INT,
    race_id INT,
    PRIMARY KEY (driver_id, race_id),
    FOREIGN KEY (driver_id) REFERENCES Driver(driver_id),
    FOREIGN KEY (race_id) REFERENCES GrandPrix(race_id) 
);


