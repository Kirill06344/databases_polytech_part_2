--Serialization anomaly
begin transaction isolation level serializable;

select *
from player
where amount_of_trophies = 2;

insert into player (name, salary, amount_of_trophies)
VALUES ('Yura Babin', 1200.00, 1);

commit;
