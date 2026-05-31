CREATE DATABASE vendas2026
USE vendas2026

-- criar a tabela marca já com a chave primária
CREATE TABLE marca (
	idMarca int PRIMARY KEY, -- este comando torna o campo PK
	nome varchar(80),
	situacao char(1)
)

-- cadastrar um de cada vez
INSERT INTO marca 
VALUES (1, 'COCA-COLA', 'A')

INSERT INTO marca
VALUES (2, 'PEPSI', 'A')

-- cadastrar vários marcas de uma vez
INSERT INTO marca
VALUES
	(3, 'ANTARCTICA', 'I'),
	(4, 'BRAHMA', 'A'),
	(5, 'SKOL', 'I')

-- testando propriedadede 'nâo nulo' da PK
INSERT INTO marca (nome, situacao)
VALUES ('TESTE', 'A')

-- testando propriedade de 'valor único' da PK
INSERT INTO marca
VALUES (1, 'NOVO TESTE', 'A')

SELECT * FROM marca
	
-- criar a tabela produto com PK mas ainda sem FK
CREATE TABLE produto (
	idProduto int PRIMARY KEY,
	nome varchar(100),
	preco money,
	cor varchar(40)
)

-- comando para excluir uma tebela já criada
DROP TABLE produto

-- criar tabela com PK com NÚMERAÇÃO AUTOMÁTICA e com FK para marca
CREATE TABLE produto (
	idProduto int PRIMARY KEY IDENTITY(1,1), -- (começar a contagem, valor do incremento)
	nome varchar(100),
	preco money,
	cor varchar(80),
	idMarca int FOREIGN KEY REFERENCES marca(idMarca) -- chave FK 
	-- os nomes fora e dentro do parênteses não podem ser diferentes da tabela referenciada
)

-- cadastrar produtos para testar AUTONUMERAÇÃO da PK
INSERT INTO produto (nome, preco)
VALUES ('COCA-COLA 340 ml', 8.94)

-- testar INTEGRIDADE REFERENCIAL da FK com update do registro
UPDATE produto set idMarca = 20
WHERE idProduto = 1

-- criar nova tabela para cadastro de fornecedores
CREATE TABLE fornecedor (
	idFor int PRIMARY KEY IDENTITY(1,1),
	razaoSocial varchar(50),
	cpnj varchar(20),
)

-- alterar a estrutura da tabela produto para uma nova FK ligando ao fornecedor
ALTER TABLE produto
	ADD idFor int FOREIGN KEY REFERENCES fornecedor(idFor)

-- EXERCÍCIOS:

-- 1. CADASTRE 3 PRODUTOS INFORMANDO SÓ O NOME E O PREÇO

INSERT INTO produto (nome, preco)
VALUES
	('FANTA LARANJA 350ML', 7.50),
	('GUARANA ANTARCTICA 350ML', 6.90),
	('PEPSI 2L', 10.99)

-- 2. CADASTRE 4 FORNECEDORES PREENCHENDO TODOS OS CAMPOS

INSERT INTO fornecedor (razaoSocial, cpnj)
VALUES
	('DISTRIBUIDORA ALFA', '111111111'),
	('BEBIDAS BETA', '222222222'),
	('COMERCIAL GAMA', '333333333'),
	('ATACADO DELTA', '444444444')

-- 3. ALTERE O NOME DA MARCA "SKOL" PARA "LEVÍSSIMA"

UPDATE marca
SET nome = 'LEVISSIMA'
WHERE nome = 'SKOL'

-- 4. CADASTRE 2 PRODUTOS INFORMANDO TODOS OS CAMPOS DA TABELA

INSERT INTO produto (nome, preco, cor, idMarca, idFor)
VALUES
	('AGUA MINERAL 500ML', 3.50, 'TRANSPARENTE', 1, 1),
	('SUCO DE UVA 1L', 12.90, 'ROXO', 2, 2)

-- 5. ATUALIZE O CPNJ DO FORNECEDOR CUJO idFor É 3 PARA TER O VALOR DE "123456789"

UPDATE fornecedor
SET cpnj = '123456789'
WHERE idFor = 3

-- 6. ATUALIZE TODOS OS PRODUTOS QUE NÃO TEM MARCA PARA TEREM ALGUM idMarca

UPDATE produto
SET idMarca = 1
WHERE idMarca IS NULL

-- 7. EXCLUA O PRODUTO DE CÓDIGO = 2

DELETE FROM produto
WHERE idProduto = 2

-- 8. EXCLUA A MARCA DE CÓDIGO = 4

DELETE FROM marca
WHERE idMarca = 4

-- 9. ACRESCENTE + 10% NO PREÇO DOS PRODUTOS QUE TEM PREÇO MAIOR QUE ZERO (0)

UPDATE produto
SET preco = preco * 1.10
WHERE preco > 0

-- 10. EXCLUA (APAGUE) A TABELA FORNECEDOR

ALTER TABLE produto
DROP COLUMN idFor

DROP TABLE fornecedor
