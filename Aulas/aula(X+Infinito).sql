#Exemplo 1 - banco para uma biblioteca
create database if not exists db_biblioteca;
use db_biblioteca;
create table if not exists tb_autores(
	aut_id smallint primary key,
    aut_nome varchar(50),
    aut_sobrenome varchar(60) 
);
create table if not exists tb_editoras(
	edi_id smallint primary key auto_increment,
    edi_nome varchar(50) not null
);
create table if not exists tb_livro(
	liv_id smallint primary key,
    liv_nome varchar(100) not null
);
alter table tb_livro modify column liv_id smallint;
alter table tb_livro change column liv_nome liv_nome varchar(150);
alter table tb_livro modify column liv_nome varchar(150);
# -----------------------------------------------------
#Exemplo 2 - BD Qualquer
create database  if not exists db_qualquer;
use db_qualquer;
create table if not exists tb_qualquer(
	qua_id1 smallint,
    qua_id2 smallint,
    qua_nome varchar(50)
);
alter table tb_qualquer add primary key (qua_id1,qua_id2);
alter table tb_qualquer add column qua_qua char(3) not null;
update tb_qualquer as qua_id1 = 1 and qua_id2 = 1