DROP DATABASE IF EXISTS db;

CREATE DATABASE db;

USE db;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    data TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE users_log (
    id INT AUTO_INCREMENT PRIMARY KEY,
    action_type VARCHAR(50), -- Tipo de ação (INSERT, UPDATE, DELETE)
    user_id INT, -- ID do usuário
    action_data JSON, -- Dados antigos ou novos (armazenados em JSON)
    data TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

delimiter $$
create trigger triggerAfterInsertUser
after insert on users
for each row
begin
    insert into users_log (action_type, user_id, action_data)
    values (
        'INSERT',
        new.id,
        JSON_OBJECT('new_name', new.name, 'new_email', new.email)
    );
end ;
$$ DELIMITER ;

insert into users (name, email) values ('Jhon', 'lopes.jhon@gmail.com');
select * from users;
select * from users_log;

delimiter $$
create trigger triggerAfterUpdateUser
after update on users
for each row
begin
    insert into users_log (action_type, user_id, action_data)
    values (
        'UPDATE',
        new.id,
        JSON_OBJECT('old_name', old.name, 'new_name', new.name, 'old_email', old.email, 'new_email', new.email)
    );
end ;   
$$ DELIMITER ;

update users
set email = 'lrodrigues@ifsp.edu.br'
where id = 1;

select * from users_log;