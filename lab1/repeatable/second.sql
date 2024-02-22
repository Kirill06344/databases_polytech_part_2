-- Unrepeatable read
begin transaction isolation level repeatable read;

select *
from player
where id = 1;

select *
from player
where id = 1;
rollback;

--Fantom reading
begin transaction isolation level repeatable read;

select count(*) from player;

select count(*) from player;
commit;

--Serialization anomaly
begin transaction isolation level repeatable read;

select * from player where team_id = 1;

insert into player (name, salary, team_id) VALUES ('Vladimir Babin', 1200.00, 2);

commit;


