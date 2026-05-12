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
ALTER TABLE produtos
	ADD codigoBarras VARCHAR(13);
    
SELECT * FROM produtos;

-- 4)
INSERT INTO produtos
	VALUES (200, 'Pincel para quadro branco', 13, 'ABS-1430');

SELECT * FROM produtos;

-- 5)
UPDATE produtos SET preco = 44
	WHERE codigo = 100;
    
SELECT * FROM produtos;
