DROP DATABASE IF EXISTS empresabd;
CREATE DATABASE empresabd;
USE empresabd;

CREATE TABLE clientes (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50),
email VARCHAR(50),
telefone VARCHAR(20),
cidade VARCHAR(50),
cpf VARCHAR(14)
);

CREATE TABLE fornecedores (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50),
email VARCHAR(50),
telefone VARCHAR(20),
cidade VARCHAR(50),
cnpj VARCHAR(18)
);

INSERT INTO clientes (nome, email, telefone, cidade, cpf) VALUES
('Maria Silva', 'maria.silva@example.com', '(11) 91234-5678', 'São Paulo', '123.456.789-00'),
('João Oliveira', 'joao.oliveira@example.com', '(21) 99876-5432', 'Rio de Janeiro', '987.654.321-00');

INSERT INTO fornecedores (nome, email, telefone, cidade, cnpj) VALUES
('Comercial ABC', 'contato@comercialabc.com.br', '(11) 93456-7890', 'São Paulo', '12.345.678/0001-90'),
('Distribuidora XYZ', 'vendas@distribuidoraxyz.com.br', '(21) 92345-6789', 'Rio de Janeiro', '98.765.432/0001-10');

-- comando para unir duas tabelas
select nome, email, cpf as clientes
UNION
select nome, email, cnpj, 'fornecedor'
ORDER BY nome ASC;

-- comando para unir duas tabelas e adicionar uma coluna para identificar o tipo
SELECT tipo, COUNT(*) AS quantidade
FROM (
    SELECT nome, email, cpf AS identificacao, 'cliente' AS tipo
    FROM clientes

    UNION

    SELECT nome, email, cnpj AS identificacao, 'fornecedor' AS tipo
    FROM fornecedores
) AS combinados
GROUP BY tipo
ORDER BY tipo;
