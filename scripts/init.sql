create table player
(
    id                 serial primary key,
    name               text,
    salary             decimal(12, 2),
    amount_of_trophies int
);

create table team
(
    id   serial primary key,
    name text
);

create table manager
(
    id   serial primary key,
    name text
);

INSERT INTO player (name, salary, amount_of_trophies)
VALUES ('LeBron James', 35000000.00, 4),
       ('Kevin Durant', 38000000.00, 2),
       ('Stephen Curry', 34000000.00, 3),
       ('Kawhi Leonard', 33000000.00, 2),
       ('Giannis Antetokounmpo', 27000000.00, 2),
       ('James Harden', 32000000.00, 1),
       ('Luka Dončić', 8000000.00, 0),
       ('Anthony Davis', 31000000.00, 1),
       ('Damian Lillard', 31000000.00, 0),
       ('Joel Embiid', 29000000.00, 0),
       ('Nikola Jokić', 27000000.00, 0),
       ('Devin Booker', 29000000.00, 0),
       ('Jayson Tatum', 28000000.00, 0),
       ('Jimmy Butler', 34000000.00, 0),
       ('Karl-Anthony Towns', 31000000.00, 0),
       ('DeMar DeRozan', 26000000.00, 0),
       ('Zion Williamson', 10000000.00, 0),
       ('Trae Young', 9000000.00, 0),
       ('Rudy Gobert', 25000000.00, 0),
       ('Chris Paul', 30000000.00, 0);
