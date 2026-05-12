-- Comando para "entrar" no BD que fo criado:
USE Aula01

-- Comando para criar uma nova tabela:
CREATE TABLE aluno(
  RA int,
  nome varchar(80),
  fone varchar(30),
  pai varchar(80),
  mae varchar(80),
  data_nasc date
);

-- Comando para inserir (cadastrar) um registro na tabela:
INSERT INTO aluno
VALUES (102030, 'ANA', '16988177711', 'JOSÉ', 'MARIA', '2002/10/18');
INSERT INTO aluno
VALUES (203040, 'Jubileu', '16988115711', 'Ricardo', 'MARIA', '2004/08/05');
INSERT INTO aluno
VALUES (304050, 'Leonardo', '16988172311', 'Rabico', 'Larissa', '2003/07/01');

-- Comando para acrescentar uma coluna nova á tabela:
ALTER TABLE aluno
	ADD email varchar(50);

-- Comando para excluir uma coluna tabela:
ALTER TABLE aluno
	DROP COLUMN pai;

-- Comando para atualizar valores de uma coluna tabela:
-- CUIDADO! Este comando precisa de um filtro para não afetar todas as linhas da tabela!
UPDATE aluno SET email = 'contato@aluno.com.br'
	WHERE RA = 102030;
    
-- Comando para selecionar todos os registros de uma tabela:
SELECT * FROM aluno;

-- O comando WHERE pode ser usado para filtrar linhas da tabela junto com outros comandos. EX:
SELECT * FROM aluno
	WHERE RA > 150000;

SELECT * FROM aluno
	WHERE mae <> 'ANA';

-- Comando para excluir registros da tabela (apagar a linha):
DELETE aluno
	WHERE mae = 'Larissa';

-- Ver o conteudo da tabela após excluir todos os registros:
SELECT * FROM aluno

-- Ordenar o resultado de uma consulta:
SELECT * FROM aluno
	ORDER BY data_nasc DESC