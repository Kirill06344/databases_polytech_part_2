-- Unrepeatable read
begin transaction isolation level repeatable read;

update player
set amount_of_trophies = amount_of_trophies + 1
where id = 1;

commit;

--Fantom reading
begin transaction isolation level repeatable read;

insert into player(name, salary, amount_of_trophies)
values ('Timofey Mozgov', 230000.00, 2);

commit;

--Serialization anomaly
begin transaction isolation level repeatable read;

select * from player where amount_of_trophies = 2;

insert into player (name, salary, amount_of_trophies) VALUES ('Yura Babin', 1200.00, 1);

commit;