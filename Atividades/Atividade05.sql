CREATE DATABASE exerciciosRevisao;

USE exerciciosRevisao;

CREATE TABLE Mesa(
    NroMesa INT PRIMARY KEY IDENTITY (1,1),
    Setor VARCHAR(80),
    Capacidade INT,
    Situacao VARCHAR(80)
);

CREATE TABLE Garcom(
    CodGarcom INT PRIMARY KEY IDENTITY (1,1),
    Nome VARCHAR(80),
    CalcularComissao MONEY
);

CREATE TABLE Produto(
    CodPro INT PRIMARY KEY IDENTITY (1,1),
    Descricao VARCHAR(100),
    Preco MONEY
);

CREATE TABLE Atendimento(
    CodAtendimento INT PRIMARY KEY IDENTITY (1,1),
    Situacao VARCHAR(80),
    DtHrChegada DATETIME,
    NroPessoas INT,

    NroMesa INT,
    CodGarcom INT,

    FOREIGN KEY (NroMesa) REFERENCES Mesa(NroMesa),
    FOREIGN KEY (CodGarcom) REFERENCES Garcom(CodGarcom)
);

CREATE TABLE Consumo(
    CodAtendimento INT,
    CodPro INT,
    Qtde INT,
    VlUni MONEY,

    PRIMARY KEY (CodAtendimento, CodPro),

    FOREIGN KEY (CodAtendimento) REFERENCES Atendimento(CodAtendimento),
    FOREIGN KEY (CodPro) REFERENCES Produto(CodPro)
);

-- 1.	Cadastrar 5 mesas, 10 produtos, 5 garçons, 10 atendimentos e 15 produtos consumidos nesses atendimentos (com dados diferentes).

INSERT INTO Mesa (Setor, Capacidade, Situacao)
VALUES
('Interno', 4, 'Livre'),
('Externo', 6, 'Ocupada'),
('Varanda', 2, 'Livre'),
('Interno', 8, 'Reservada'),
('Externo', 4, 'Livre');

INSERT INTO Produto (Descricao, Preco)
VALUES
('Coca-Cola Lata', 7.50),
('Guarana Lata', 7.00),
('Agua Mineral', 3.50),
('Suco de Laranja', 8.00),
('Hamburguer Artesanal', 28.90),
('Batata Frita', 18.50),
('Pizza Calabresa', 45.00),
('Pizza Mussarela', 42.00),
('Sorvete', 12.00),
('Cafe Expresso', 5.00);

INSERT INTO Garcom (Nome, CalcularComissao)
VALUES
('Joao Silva', 0.10),
('Maria Oliveira', 0.12),
('Carlos Souza', 0.08),
('Ana Santos', 0.15),
('Pedro Lima', 0.11);

INSERT INTO Atendimento
(Situacao, DtHrChegada, NroPessoas, NroMesa, CodGarcom)
VALUES
('Fechado', '2025-06-01 12:00:00', 2, 1, 1),
('Fechado', '2025-06-01 12:30:00', 4, 2, 2),
('Aberto',  '2025-06-01 13:00:00', 3, 3, 3),
('Fechado', '2025-06-01 13:15:00', 5, 4, 4),
('Aberto',  '2025-06-01 14:00:00', 2, 5, 5),
('Fechado', '2025-06-02 12:00:00', 6, 1, 2),
('Aberto',  '2025-06-02 12:45:00', 4, 2, 3),
('Fechado', '2025-06-02 13:30:00', 2, 3, 4),
('Aberto',  '2025-06-02 14:15:00', 7, 4, 5),
('Fechado', '2025-06-02 15:00:00', 3, 5, 1);

INSERT INTO Consumo
(CodAtendimento, CodPro, Qtde, VlUni)
VALUES
(1, 1, 2, 7.50),
(1, 5, 1, 28.90),

(2, 2, 3, 7.00),
(2, 6, 1, 18.50),

(3, 3, 2, 3.50),
(3, 7, 1, 45.00),

(4, 4, 2, 8.00),
(4, 8, 1, 42.00),

(5, 1, 1, 7.50),

(6, 5, 2, 28.90),
(6, 9, 3, 12.00),

(7, 10, 4, 5.00),

(8, 6, 2, 18.50),

(9, 7, 1, 45.00),

(10, 8, 2, 42.00);

-- 2.	Atualize o nome do garçom que possui o maior código para o seu nome.
SELECT * FROM Garcom;

UPDATE Garcom 
SET Nome = 'Vinicius' 
WHERE CodGarcom = (
    SELECT MAX (CodGarcom) FROM Garcom
);

-- 3.	Crie um campo para guardar o salário dos garçons.
SELECT * FROM Garcom;

ALTER TABLE Garcom 
ADD salarioGarcom MONEY;
