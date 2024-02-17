create or replace function check_salary()
    returns trigger
    language plpgsql
as
$$
begin
    if new.salary < 0.0 then
        raise exception 'Salary has to be >= 0.0';
    end if;
    return old;
end
$$;


create trigger salary_trigger
    before insert
    on player
    for each row
execute procedure check_salary();

insert into player (name, salary, amount_of_trophies)
VALUES ('asas', -213.0, 3);

begin transaction;

insert into player (name, salary, amount_of_trophies)
VALUES ('asas', 213.0, 3);
insert into player (name, salary, amount_of_trophies)
VALUES ('asas', -213.0, 3);

commit;

select *
from player;