create view player_view as
    select name, salary
    from player;

create view team_view as
    select name
    from team;