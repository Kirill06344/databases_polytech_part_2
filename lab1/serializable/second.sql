--Serialization anomaly
begin transaction isolation level serializable;

select * from player where team_id = 1;

insert into player (name, salary, team_id) VALUES ('Vladimir Babin', 1200.00, 2);

commit;


