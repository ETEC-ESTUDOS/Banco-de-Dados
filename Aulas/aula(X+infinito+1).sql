-- Apaga o banco se ele já existir (útil para recomeçar do zero)
DROP DATABASE IF EXISTS db_biblioteca;
-- Cria o banco e passa a usá-lo
CREATE DATABASE db_biblioteca;
USE db_biblioteca;
-- Tabela de autores
CREATE TABLE IF NOT EXISTS tb_autor (
aut_id INT AUTO_INCREMENT PRIMARY KEY, -- número gerado automaticamente
aut_nome VARCHAR(50) NOT NULL,
aut_sobrenome VARCHAR(50) NOT NULL
);
-- Tabela de editoras
CREATE TABLE IF NOT EXISTS tb_editora (
edi_id INT AUTO_INCREMENT PRIMARY KEY,
edi_nome VARCHAR(60) NOT NULL
);
-- Tabela de livros: precisa ser criada por último,
-- porque depende das outras duas (chaves estrangeiras)
CREATE TABLE IF NOT EXISTS tb_livro (
liv_id INT AUTO_INCREMENT PRIMARY KEY,
liv_nome VARCHAR(100) NOT NULL,
liv_data_pub DATE, -- formato 'AAAA-MM-DD'
liv_preco DECIMAL(8,2), -- até 999999.99
liv_id_autor INT NOT NULL,
liv_id_editora INT NOT NULL,
FOREIGN KEY (liv_id_autor) REFERENCES tb_autor(aut_id),
FOREIGN KEY (liv_id_editora) REFERENCES tb_editora(edi_id)
);

-- Autores (os IDs serão 1 a 6, na ordem de inserção)
/* INSERT INTO tb_autor (aut_nome, aut_sobrenome) VALUES
('William', 'Stanek'), -- 1
('Joe', 'Carter'), -- 2
('Luciana', 'Silva'), -- 3
('Paulo', 'Oliveira'), -- 4
('Ana', 'Souza'), -- 5
('Marcos', 'Pereira'); -- 6

-- Editoras (IDs 1 a 5)
INSERT INTO tb_editora (edi_nome) VALUES
('Wiley'), -- 1
('Microsoft Press'), -- 2
('Novatec'), -- 3
('Érica'), -- 4
('Casa do Código'); -- 5

-- Livros: (nome, data de publicação, preço, id do autor, id da editora)
INSERT INTO tb_livro (liv_nome, liv_data_pub, liv_preco, liv_id_autor, liv_id_editora) VALUES
('Windows Server 2019 Guia de Bolso', '2019-03-10', 89.90, 1, 2),
('SQL Server Administração', '2010-06-15', 59.90, 1, 2),
('PowerShell Essencial', '2015-11-20', 45.00, 1, 1),
('Redes de Computadores na Prática', '2008-02-01', 72.50, 2, 1),
('Linux para Iniciantes', '2012-08-30', 38.00, 2, 3),
('Banco de Dados com MySQL', '2018-05-12', 55.00, 3, 3),
('Python do Zero', '2021-01-25', 64.90, 3, 5),
('Lógica de Programação', '2005-09-09', 32.00, 4, 4),
('Estruturas de Dados', '2011-04-17', 49.90, 4, 4),
('HTML e CSS Modernos', '2020-10-05', 42.00, 5, 5),
('JavaScript Avançado', '2022-07-14', 78.00, 5, 3),
('Docker na Prática', '2023-03-03', 60.00, 6, 5); */

