CREATE DATABASE provaSofrida;

USE provaSofrida;

CREATE TABLE produtos(
	codigo INT,
	descricao VARCHAR(80),
	preco MONEY
);

SELECT * FROM produtos;

-- 1)
INSERT INTO produtos
	VALUES (100, 'Folha de Papel', 37);

-- 2)
CREATE TABLE cidades(
	codigoCidade INT,
	nomeCidade VARCHAR(80),
	UF CHAR(2)
);

SELECT * FROM cidades;

-- 3)
