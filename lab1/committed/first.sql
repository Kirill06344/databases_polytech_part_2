-- Dirty read
begin transaction isolation level read committed;

update player set amount_of_trophies = 1 where id = 19;

rollback;

-- Unrepeatable read
begin transaction isolation level read committed;

update player set amount_of_trophies = amount_of_trophies + 1 where id = 1;

commit;

--Lost update
begin transaction isolation level read committed;

select amount_of_trophies from player where id = 1;

update player set amount_of_trophies = 12 where id = 1;

commit;


