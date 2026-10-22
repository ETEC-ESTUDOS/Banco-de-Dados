CREATE DATABASE if not EXISTS db_loja;
use db_loja;
CREATE TABLE if not EXISTS tb_categoria(
    cat_id int primary key AUTO_INCREMENT,
    cat_nome varchar(50) not NULL
);

CREATE TABLE if not EXISTS tb_fornecedor(
    for_id int PRIMARY KEY AUTO_INCREMENT,
    for_nome varchar(60) not NULL,
    for_cidade varchar(50) not NULL
);

CREATE TABLE if not EXISTS tb_produto(
    prod_id int PRIMARY key AUTO_INCREMENT,
    prod_nome varchar(80) not null,
    prod_data_cadastro DATE,
    prod_preco DECIMAL(6,2),
    prod_id_categoria int not NULL,
    prod_id_fornecedor int not NULL,
    CONSTRAINT fk_prod_for FOREIGN KEY (prod_id_fornecedor) REFERENCES tb_fornecedor(for_id),
    CONSTRAINT fk_prod_cat FOREIGN KEY (prod_id_categoria) REFERENCES tb_categoria(cat_id)
);
#ex 5
/*
insert into tb_categoria(cat_nome) values ("Informática"),("Eletrônicos"),("Papelaria"),("Games");
insert into tb_fornecedor(for_nome,for_cidade) values ("TechSul","Porto Alegre"),("DistriMax","São Paulo"), ("Papel & Cia","Campinas"),("GameHouse","São Paulo");
insert into tb_produto(prod_nome,prod_data_cadastro,prod_preco,prod_id_categoria,prod_id_fornecedor) values ("Mouse sem fio","2024-02-10",79.90,1,1),("Teclado mecânico","2023-11-05",249.00,1,2),("Monitor 24 polegadas","2024-06-20",899.00,1,2),("Fone Bluetooth","2023-08-14",159.90,2,2),("Caixa de som portátil","2022-12-01",199.00,2,1),("Carregador USB-C","2024-03-18",59.90,2,1),("Caderno 10 matérias","2023-01-25",32.50,3,3),("Caneta gel (kit 6)","2024-01-08",24.90,3,3),("Mochila escolar","2023-07-30",149.00,3,3),("Controle sem fio","2024-05-02",349.90,4,4),("Jogo de corrida","2022-10-15",199.90,4,4),("Headset gamer","2024-09-12",289.00,4,2);
*/
#ex 6
select prod_nome as "Nome Produto", prod_preco as "Preço Produto" from tb_produto  where prod_id_fornecedor = 3;
# ex 7
SELECT * FROM tb_fornecedor where for_cidade not like "São Paulo";
#Ex 8
select prod_nome as "Nome do Produto", prod_preco as "Preço do Produto" from tb_produto where prod_preco > 200;
#Ex 9
select prod_nome, prod_preco from tb_produto where prod_id_categoria = 2 and prod_preco < 100;
#Ex 10
select prod_nome, prod_id_categoria, prod_id_fornecedor from tb_produto where prod_id_categoria = 1 or prod_id_fornecedor = 4;
# ex11
select prod_nome, prod_preco from tb_produto where not prod_preco > 100;
#Ex 12
select prod_nome, prod_id_categoria from tb_produto where prod_id_categoria in (1,4);
#Ex 13
select * from tb_fornecedor where for_cidade not in("São paulo","Campinas");