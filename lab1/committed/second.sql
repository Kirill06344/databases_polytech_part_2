-- Dirty read
begin transaction isolation level read committed;

select amount_of_trophies
from player
where id = 19;

commit;

-- Unrepeatable read
begin transaction isolation level read committed;

select *
from player
where id = 1;

select *
from player
where id = 1;
rollback;

--Lost update
begin transaction isolation level read committed;

select amount_of_trophies from player where id = 1;

update player set amount_of_trophies = 3 where id = 1;

commit;

select * from player where id = 1;