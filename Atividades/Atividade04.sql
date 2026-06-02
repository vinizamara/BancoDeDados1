CREATE DATABASE atividade04;

USE atividade04;

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

-- Exercícios de Fixação:

