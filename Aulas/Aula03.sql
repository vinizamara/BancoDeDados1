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
