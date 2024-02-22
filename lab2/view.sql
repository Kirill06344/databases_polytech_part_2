create view player_view as
    select name, salary
    from player;

create view team_view as
    select name
    from team;

GRANT SELECT on player_view to test;
GRANT UPDATE(name) on team_view to test;

update team_view set name='Lalala' where name = 'Lions FS';