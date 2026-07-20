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
-- 1) Cadastre 6 pacientes

-- 2) Cadastre 10 consultas para médicos e pacientes diversos

-- 3) Atualize o nome do médico 'JOÃO' para 'JOÃO DA SILVA'

-- 4) Atualize a data da consulta número 3 para 15/05/2026

-- 5) Exclua a primeira consulta cadastrada

-- 6) Liste os nomes dos médicos e a especialidade de cada um

-- 7) Liste os médicos que não possuem especialidade

-- 8) Liste as consultas realizadas pelo convênio UNIMED no mês de abril

-- 9) Liste os nomes dos pacientes e os convênios utilizados em suas consultas

-- 10) Liste os telefones dos pacientes que nunca realizaram consultas

-- 11) Liste os convênios das consultas realizadas por ortopedistas

-- 12) Liste os nomes e telefones dos pacientes atendidos por pediatras ou dermatologistas em abril de 2026

-- 13) Cadastre a especialidade 'NEUROLOGISTA' e atualize a especialidade de 2 médicos para essa nova especialidade

-- 14) Cadastre 3 consultas para médicos neurologistas no mês de maio de 2026

-- 15) Atualize as consultas realizadas por pediatras em abril de 2026 para que utilizem exclusivamente o convênio 'SUS'
