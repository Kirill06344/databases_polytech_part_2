--Serialization anomaly
begin transaction isolation level serializable;

select *
from player
where amount_of_trophies = 1;

insert into player (name, salary, amount_of_trophies)
VALUES ('Vladimir Babin', 1200.00, 2);

commit;


