CREATE TABLE aluno(
  RA int,
  nome varchar(80),
  fone varchar(30),
  pai varchar(80),
  mae varchar(80),
  data_nasc date
);

-- Insira três novos alunos com os nomes: Mateus, Marcos e Lucas.
INSERT INTO aluno
	VALUES (1, 'Mateus', '16988177711', 'RICARDO', 'ANA', '2002/10/18');
INSERT INTO aluno
	VALUES (1002, 'Marcos', '16988177711', 'JOSÉ', 'LAURA', '2007/05/06');
INSERT INTO aluno
	VALUES (103, 'Lucas', '16988177711', 'JEREMIAS', 'EDUARDA', '2000/03/18');

-- Exiba todos os dados dos alunos cadastrados na tabela.
SELECT * FROM aluno;

-- Mostre o nome e o CPF dos alunos cujas mães se chamam "Ana".
SELECT nome, RA FROM aluno
	WHERE mae = "ANA";

-- O aluno com RA 103 alterou o nome da mãe. Atualize para "Luciana Ferreira".
UPDATE aluno SET mae = "Luciana Ferreira"
	WHERE RA = 103;
SELECT * FROM aluno;

-- O aluno com RA 1002 foi transferido. Exclua esse aluno da tabela.
DELETE aluno
	WHERE RA = 1002;
SELECT * FROM aluno;

-- Liste todos os alunos em ordem alfabética (de A a Z).
SELECT * FROM aluno
	ORDER BY nome ASC;