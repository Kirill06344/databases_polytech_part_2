-- Dirty read
begin transaction isolation level read committed;

select salary
from player
where id = 1;

commit;

-- Unrepeatable read
begin transaction isolation level read committed;

select salary
from player
where id = 1;

select salary
from player
where id = 1;
rollback;

--Lost update
begin transaction isolation level read committed;

select salary from player where id = 1;

update player set salary = salary - 100000 where id = 1;

commit;

