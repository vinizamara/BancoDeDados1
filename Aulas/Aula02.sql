-- Comando para criar um novo banco de dados:
CREATE DATABASE EscolaTeste;

-- Comando para "entrar" em um BD:
USE EscolaTeste;

-- Comando para criar uma nova tabela neste BD:
CREATE TABLE alunos(
	RA int,
	nome char(400), -- mesmo que o varchar, porém utiliza sempre o mesmo o espaço, independente do tamanho do valor (ANA ocupa 400 lugares)
	fone varchar(20), -- mesmo que o char, porém utiliza somente o espaço necessário de acordo com o tamanho do valor (ANA ocupa 3 lugares)
	mae varchar(50), -- Caso eu quiera impedir de ser vazio: "NOT NULL"
	pai varchar(50),
	data_nasc datetime -- date é dia, mês e ano / datetime é data, mês, ano, horas, minutos e segundos / continua sendo uma data
);

SELECT * FROM alunos;

-- Cadastrar um novo registro na tabela preenchendo algumas colunas:
INSERT INTO alunos (RA, pai, mae, nome)
	VALUES (102030, 'MARIA', 'JOSÉ', 'ANA');

-- Cria uma nova coluna na tabela:
ALTER TABLE alunos
	ADD naturalidade VARCHAR(30);

-- Dara erro, pois algum registro já existente fere essa regra
ALTER TABLE alunos
	ALTER COLUMN data_nasc VARCHAR(80) NOT NULL;

-- Esse ocorrerá corretamente
ALTER TABLE alunos
	ALTER COLUMN nome VARCHAR(80) NOT NULL;
