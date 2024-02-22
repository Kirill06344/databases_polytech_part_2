create table team
(
    id   serial primary key,
    name text,
    trophies int
);

create table manager
(
    id   serial primary key,
    name text,
    age int
);

create table player
(
    id                 serial primary key,
    name               text,
    salary             decimal(12, 2),
    team_id integer references team(id),
    manager_id integer references manager(id)
);

INSERT INTO manager (name, age)
VALUES
    ('Maria Garcia', 73),
    ('John Williams', 81),
    ('Laura Brown', 52),
    ('Mohammed Ali', 38),
    ('Emma Wilson', 49);


INSERT INTO team (name, trophies)
VALUES
    ('Lions FC', 3),
    ('Eagles United', 5),
    ('Thunder Strikers', 2),
    ('Golden Stars', 1),
    ('Phoenix FC', 4),
    ('River City Rovers', 0),
    ('Royal Blues', 2),
    ('Unity Squad', 3),
    ('Victory FC', 1),
    ('Dream Team', 6);



INSERT INTO player (name, salary, team_id, manager_id)
VALUES
    ('LeBron James', 35000000.00, 1, 1),
    ('Kevin Durant', 38000000.00, 2, 2),
    ('Stephen Curry', 34000000.00, 3, 3),
    ('Kawhi Leonard', 33000000.00, 4, 4),
    ('Giannis Antetokounmpo', 27000000.00, 5, 5),
    ('James Harden', 32000000.00, 6, 1),
    ('Luka Dončić', 8000000.00, 7, 2),
    ('Anthony Davis', 31000000.00, 8, 3),
    ('Damian Lillard', 31000000.00, 9, 4),
    ('Joel Embiid', 29000000.00, 10, 5),
    ('Nikola Jokić', 27000000.00, 1, 1),
    ('Devin Booker', 29000000.00, 2, 2),
    ('Jayson Tatum', 28000000.00, 3, 3),
    ('Jimmy Butler', 34000000.00, 4, 4),
    ('Karl-Anthony Towns', 31000000.00, 5, 5),
    ('DeMar DeRozan', 26000000.00, 6, 1),
    ('Zion Williamson', 10000000.00, 7, 2),
    ('Trae Young', 9000000.00, 8, 3),
    ('Rudy Gobert', 25000000.00, 9, 4),
    ('Chris Paul', 30000000.00, 10, 5);

