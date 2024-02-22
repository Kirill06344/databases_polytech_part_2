-- Dirty read
begin transaction isolation level read committed;

update player set salary = 500000 where id = 1;

rollback;

-- Unrepeatable read
begin transaction isolation level read committed;

update player set salary = 500000 where id = 1;

commit;

--Lost update
begin transaction isolation level read committed;

select salary from player where id = 1;

update player set salary = salary + 50000 where id = 1;

commit;

