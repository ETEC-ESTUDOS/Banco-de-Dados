create database escola;

use escola;

create table aluno
(
	ra int primary key,
    nome varchar(55) not null,
    email varchar(50) unique,
    telefone varchar(15)
);

create table professor
(
	rm int primary key not null,
    nome varchar(55) not null,
    email varchar(75) not null unique,
    telefone varchar(15) not null,
    endereco varchar(65) not null
);

create table curso
(
	id int primary key not null,
    nome varchar(50) not null,
    duracao real not null,
    periodo varchar(50) not null
);


insert into aluno values (260210,"Vinicius Duarte","vinicius.dias10@aluno.cps.sp.gov.br","12 99144-2390");

insert into professor values
(1,"Jean Costa","jean.costa@cps.sp.gov.br","12 99999-8888","Rua Salmão, 215"),
(2,"Neymar Dellareti","neymar.dellareti@cps.sp.gov.br","12 99999-8888","Rua Salmão, 215");

insert into curso values
(1,"Desenvolvimento de Sistemas","3","Integral"),(2,"Desenvolvimento de Sistemas","1","Noturno");

select * from aluno;
select * from professor;
select * from curso;

select * from curso,aluno,professor;
select nome,duracao,periodo from curso where periodo like 'n%';


SELECT * FROM professor;



