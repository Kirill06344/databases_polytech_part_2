--Serialization anomaly
begin transaction isolation level serializable;

select * from player where team_id = 2;

insert into player (name, salary, team_id) VALUES ('Yura Babin', 1200.00, 1);

commit;
