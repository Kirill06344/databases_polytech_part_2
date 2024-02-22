-- Unrepeatable read
begin transaction isolation level repeatable read;

update player
set salary = salary + 50000
where id = 1;

commit;

--Fantom reading
begin transaction isolation level repeatable read;

insert into player(name, salary, team_id, manager_id)
values ('Timofey Mozgov', 230000.00, 2, 2);

commit;

--Serialization anomaly
begin transaction isolation level repeatable read;

select * from player where team_id = 2;

insert into player (name, salary, team_id) VALUES ('Yura Babin', 1200.00, 1);

commit;