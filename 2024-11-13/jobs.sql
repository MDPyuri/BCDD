-- Criação do banco de dados
DROP DATABASE IF EXISTS jobsdb;

CREATE DATABASE jobsdb;

USE jobsdb;

-- (Candidatos)
CREATE TABLE applicants (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- (Vagas)
CREATE TABLE jobs (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL
);

-- (Candidaturas)
CREATE TABLE applications (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    applicant_id INT,
    job_id INT,
    FOREIGN KEY (applicant_id) REFERENCES applicants (id),
    FOREIGN KEY (job_id) REFERENCES jobs (id),
    CONSTRAINT unique_application UNIQUE (applicant_id, job_id) -- Chave composta para garantir aplicação única
);

-- Inserindo candidatos
INSERT INTO applicants (name) VALUES ('Aline'), ('Bob'), ('Charlie');

-- Inserindo vagas
INSERT INTO
    jobs (title)
VALUES ('Desenvolvedor Backend'),
    ('Designer UX/UI'),
    ('Gerente de Projeto');

-- Inserindo candidaturas
INSERT INTO
    applications (applicant_id, job_id)
VALUES (1, 1), -- Aline se candidatou para Desenvolvedor Backend
    (1, 2), -- Aline se candidatou para Designer UX/UI
    (2, 2);
-- Bob se candidatou para Designer UX/UI
-- (!) tentar cadastrar 2x a mesma linha
insert into applications (applicant_id, job_id) values (2, 2);

select * from applications;

-- testar com left join, right join e inner join
select j.title as job_title, a.name as applicant_name
from
    jobs as j
    left join applications as ap on j.id = ap.job_id
    left join applicants as a on a.id = ap.applicant_id;