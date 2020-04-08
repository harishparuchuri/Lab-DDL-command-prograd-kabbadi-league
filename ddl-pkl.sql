-- PROGRESSION - 1


-- 1. **Create table city**

create table city
( id number(11),
  name varchar(50) not null,
 constraint pk_city primary key(id)
  );


-- 2. **Create table referee**

create table referee
(
id number(11),
name varchar(50) not null,
 constraint pk_referee primary key(id)
);


-- 3. **Create table innings**
create table innings
(
id number(11),
innings_number number(11) not null,
constraint pk_innings primary key(id)
);

-- 4. **Create table extra_type**
create table extra_type
(
id number(11),
name varchar(50) not null,
constraint pk_extra_type primary key(id)

);

-- 5. **Create table skill**
create table skill
(
id number(11),
name varchar(50) not null,
constraint pk_skill primary key(id)
);

-- 6. **Create table team**

CREATE table team
(
id number(11),
name varchar(50) not null,
coach varchar(50)  NOT null,
home_city number(11) not null,
captain number(11) not null,
constraint pk_team primary key(id),
constraint fk_home_city foreign key(home_city) references city(id)

);

-- 7. **Create table player**

create table player
(
id number(11),
name varchar(50) not null,
country varchar(50) not null,
skill_id number(11)not null,
team_id number(11) references team(id),
constraint pk_player primary key(id),
constraint fk_skill_id foreign key(skill_id) references skill(id)


);

-- 8. **Create table venue**

create table venue
(
id number(11),
stadium_name varchar(50) not null,
city_id number(11) not null,
constraint pk_venue primary key(id),
constraint fk_city_id foreign key(city_id)  references city(id)
);

-- 9. **Create table event**
create table event(
id number(11),
innings_id number(11) not null,
event_no number(11) not null,
raider_id number(11) not null,
raid_points number(11) not null,
defecting_points number(11) not null,
clock_in_seconds number(11) not null,
team_one_score number(11) not null,
team_two_score number(11) not null,
constraint pk_event primary key(id),
constraint fk_raider_id foreign key(raider_id) references player(id),
constraint fk_innings_id foreign key(innings_id) references innings(id)

);



-- 10. **Create table extra_event**
create table extra_event
(
id number(11),
event_id number(11) references event(id),
extra_type_id number(11) not null,
points number(11) not null,
scoring_team_id references team(id),
constraint pk_extra_event primary key(id),
constraint fk_extra_type_id foreign key(extra_type_id) references extra_type(id)
);


-- 11. **Create table outcome**
create table outcome
(
id number(11),
status varchar(50) not null,
winner_team_id number(11) not null,
score number(11),
player_of_match number(11) not null,
constraint pk_outcome primary key(id),
constraint fk_winner_team_id foreign key(winner_team_id) references team(id),
constraint fk_player_of_match foreign key(player_of_match) references player(id)


);


-- 12. **Create table game**

create table game
(
id number(11),
game_date date,
team_id_1 number(11) not null,
team_id_2 number(11) not null,
venue_id number(11) not null,
outcome_id number(11) not null,
referee_id_1 number(11) not null,
referee_id_2 number(11) not null,
first_innings_id number(11) not null,
second_innings_id number(11) not null,
constraint pk_game primary KEY (id),
constraint fk_team_id_1 foreign key(team_id_1) REFERENCES team(id),
constraint fk_team_id_2 foreign key(team_id_2) REFERENCES team(id),
constraint fk_venue_id foreign key(venue_id) REFERENCES venue(id),
constraint fk_outcome_id foreign key(outcome_id)REFERENCES outcome(id),
constraint fk_referee_id_1 foreign key(referee_id_1) REFERENCES referee(id),
constraint fk_referee_id_2 foreign key(referee_id_2) REFERENCES referee(id),
constraint fk_first_innings_id foreign key(first_innings_id) REFERENCES innings(id),
constraint fk_second_innings_id foreign key(second_innings_id) REFERENCES innings(id)
);

-- 13. **Drop table city**

alter table team drop constraint fk_home_city;

alter table venue drop constraint fk_city_id;
Drop table city;

-- 14. **Drop table innings**
alter table event drop constraint fk_innings_id;

alter table game drop constraint fk_first_innings_id;

alter table game drop constraint fk_second_innings_id;

drop table innings;

-- 15. **Drop table skill**
alter table player drop constraint fk_skill_id;

drop table skill;

-- 16. **Drop table extra_type**
alter table extra_event drop constraint fk_extra_type_id;

drop table extra_type;
