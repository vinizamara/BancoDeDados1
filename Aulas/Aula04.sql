CREATE DATABASE aula04;

USE aula04;

CREATE TABLE especialidades (
    codEsp INT PRIMARY KEY IDENTITY(10, 10),
    nome VARCHAR(40)
);

CREATE TABLE medicos (
    codMed INT PRIMARY KEY IDENTITY(1, 1),
    nome VARCHAR(80),
    idade INT, -- O correto seria armazenar a data de nascimento
    salario MONEY,
    codEsp INT FOREIGN KEY REFERENCES especialidades(codEsp)
);

CREATE TABLE pacientes (
    codPac INT PRIMARY KEY IDENTITY(1, 1),
    nome VARCHAR(40),
    fone VARCHAR(30)
);

CREATE TABLE consultas (
    codCons INT PRIMARY KEY IDENTITY(1, 1),
    data DATE,
    convenio varchar(50),
    codMed INT FOREIGN KEY REFERENCES medicos(codMed) NOT NULL,
    codPac INT FOREIGN KEY REFERENCES pacientes(codPac) NOT NULL
);

-- Cadastro das Especialidades
INSERT INTO especialidades
VALUES ('OTORRINO'),
       ('OBSTETRA'),
       ('PEDIATRA'),
       ('CARDIOLOGISTA'),
       ('DERMATOLOGISTA'),
       ('ORTOPEDISTA');

SELECT * FROM especialidades;

-- Cadastro dos médicos preenchendo todos os campos
INSERT INTO medicos
VALUES ('JOÃO', 48, 800, 10),
       ('JOSÉ', 35, 1200, 10),
       ('ANA', 47, 1400, 30),
       ('IVO', 51, 750, NULL),
       ('SILVIO', NULL, 2550, 20),
       ('ADÃO', 62, 1950, 50),
       ('EVA', 42, 800, NULL),
       ('JOANA', 39, 1200, 10),
       ('AFONSO', NULL, 800, 30);

-- Cadastro de médicos preenchendo apenas alguns campos
INSERT INTO medicos (nome, idade, salario)
VALUES ('KARINA', 40, 750),
       ('CARLA', 41, 1950);

-- Cadastro de médicos preenchendo apenas alguns campos
INSERT INTO medicos (nome, salario)
VALUES ('RODOLFO', 1330);

SELECT * FROM medicos;

SELECT M.nome, E.nome
FROM medicos AS M
INNER JOIN especialidades AS E
    ON M.codEsp = E.codEsp;

SELECT M.nome, E.nome
FROM medicos AS M
LEFT JOIN especialidades AS E
    ON M.codEsp = E.codEsp
WHERE E.codEsp IS NULL;

-- RECUPERAR TODAS AS CONSULTAS FEITAS POR PEDIATRAS EM MAIOI/2026:
SELECT M.nome as nomeMedico, P.nome as nomePaciente
FROM
    medicos AS M INNER JOIN consultas AS C
        ON M.codMed = C.codMed
        INNER JOIN pacientes AS P
        ON P.codPac = C.codPac
        INNER JOIN especialidades AS E
        ON E.codEsp = M.codEsp
WHERE
    C.data >= '2026/05/01' AND C.data <= '2026/05/31'
    AND
    E.nome = 'PEDIATRA'
