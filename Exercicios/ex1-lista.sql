create database ecommerce;
use ecommerce;

create table editoras(
  id_edi int primary key,
  nome_edi varchar(100) not null,
  cnpj varchar(20)
);

create table livros(
  id_liv int primary key,
  nome_liv varchar(255) not null,
  isbn varchar(20),
  preco float,
  id_edi int,
  constraint fk_editora
  foreign key (id_edi) references editoras(id_edi)
);