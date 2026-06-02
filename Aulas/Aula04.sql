CREATE DATABASE aula03;

USE aula03;

CREATE TABLE especialidade (
    codEsp INT PRIMARY KEY IDENTITY(10, 10),
    nome VARCHAR(40)
);

CREATE TABLE medico (
    codMed INT PRIMARY KEY IDENTITY(1, 1),
    nome VARCHAR(80),
    idade INT, -- O correto seria armazenar a data de nascimento
    salario MONEY,
    codEsp INT FOREIGN KEY REFERENCES especialidade(codEsp)
);

-- Cadastro Das Especialilidades
INSERT INTO especialidade
VALUES ('OTORRINO'),
('OBSTETRA'),
('PEDIATRA'),
('CARDIOLOGISTA'),
('DERMATOLOGISTA'),
('ORTOPEDISTA');

SELECT * FROM especialidade;

-- Cadastro dos m�dico preechendo "todos" os campos:
INSERT INTO medico
VALUES ('JO�O', 48, 800, 10),
('JOS�', 35, 1200, 10),
('ANA', 47, 1400, 30),
('IVO', 51,750, NULL),
('SILVIO', NULL, 2550, 20),
('AD�O', 62, 1950, 50),
('EVA', 42, 800, NULL),
('JOANA', 39, 1200, 10),
('AFONSO', NULL, 800, 30);

-- Cadastro de m�dicos preechendo apenas alguns campos (mais usado):
INSERT INTO medico (nome, idade, salario)
VALUES ('KARINA', 40, 750),
('CARLA', 41, 1950);

-- Cadastro de m�dicos preechendo apenas alguns campos (mais usado):
INSERT INTO medico (nome, salario)
VALUES ('RODOLFO', 1330);

SELECT * FROM medico;

SELECT M.nome, E.nome 
FROM
	medico AS M INNER JOIN especialidade AS E
	ON
	M.codEsp = E.codEsp;

SELECT M.nome, E.nome 
FROM
	medico AS M LEFT JOIN especialidade AS E
	ON
	M.codEsp = E.codEsp
	WHERE E.codEsp IS NULL;
