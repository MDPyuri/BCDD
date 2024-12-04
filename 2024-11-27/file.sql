drop database if exists db;

create database db;

use db;

set global event_scheduler = ON;

create table actualHours (
    id int auto_increment not null primary key,
    dataHora datetime
)

delimiter $$
create event insertHour
on schedule every 5 day_second do
begin   
    insert into actualHours(dataHora) values (CURRENT_TIMESTAMP());
end ;
$$ delimiter ;

select * from actualHours;

select * from actualHours order by id desc limit 5;

alter event insertHour disable;