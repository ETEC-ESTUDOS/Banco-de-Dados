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

#ex21
select prod_nome,prod_preco from tb_produto where prod_id_fornecedor = 2 and (prod_id_categoria = 1 or prod_id_categoria = 4);
#ex22
select prod_nome, prod_preco from tb_produto where prod_id_fornecedor in (select for_id from tb_fornecedor where for_cidade like "São Paulo");
#ex23
select prod_nome, prod_preco from tb_produto where prod_preco > (select avg(prod_preco) from tb_produto);
#ex24
select p.prod_nome as "Produto", f.for_nome as "Fornecedor" from tb_produto p, tb_fornecedor f
where p.prod_data_cadastro between "2023-01-01" and "2023-12-31" and p.prod_id_fornecedor = f.for_id;
#ex25
select count(*) from tb_produto p, tb_categoria c where c.cat_nome like "Eletrônicos" and p.prod_preco > 100 and p.prod_id_categoria = c.cat_id;