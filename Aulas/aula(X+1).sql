#Code aula 1
create database cardinalidade;
use cardinalidade;

create table departamento(
	cod_depto int primary key,
    nome_depto varchar(40)
);

create table funcionario(
	cracha_func int primary key,
    cod_depto int not null,
    data_adm date,
    nome_func varchar(40) not null,
    RG_func varchar(20) not null,
    constraint fk_func_depto
    foreign key (cod_depto) references departamento(cod_depto) on delete cascade
);

insert into departamento values 
(1,"ADMINISTRATIVO"),
(2,"COMERCIAL"),
(3,"PRODUÇÃO");

INSERT INTO funcionario values 
(00001,3,"2011/01/22","Alberto Silva","22222222"),
(000002,2,"2011/02/25","Maria Souza","251602056"),
(0000003,3,"2011/03/01","Anderson Aves","302005419");

select nome_depto,nome_func,RG_func,cracha_func,data_adm from funcionario as F,departamento as D where F.cod_depto = D.cod_depto;
# Só se já houver criado:
#   alter table funcionario add constraint fk_func_depto foreign key (cod_depto) references departamento(cod_depto) on delete cascade

#Code aula 2

create database matrimonio;
use matrimonio;

create table esposa(
	cpf_esposa int primary key,
    nome varchar(40) not null,
    nascimento date not null,
    nacionalidade varchar(40)
);

create table marido(
	cpf_marido int primary key,
    nome varchar(40) not null,
    nascimento date not null,
    nacionalidade varchar(40),
    cpf_esposa int,
    constraint fk_marido_esposa
    foreign key (cpf_esposa) references esposa(cpf_esposa)
);

insert into esposa values (10010010007,"Alguma nome","2011/10/30","Brasil");
insert into marido values (45610020001,"Vinicius","2011/10/30","Brasil",10010010007);

select * from esposa,marido;

# code  aula 3
create database escola_etec;
use escola_etec;

create table curso
(
	id int not null,
    primary key(id),
    nome varchar(55),
    modalidade ENUM ('integral','noturno')  default 'integral' -- integral ou noturno
);

create table aluno
(
	id int not null,
    primary key(id),
    nome varchar(55) not null,
    nascimento date not null, -- 'aaaa-mm-dd'
    cod_curso int,
    constraint fk_aluno_curso
    foreign key(cod_curso)
    references curso(id)
);

describe curso;

insert into curso values
(10, 'DS', 'integral'),
(20, 'Log', 'noturno'),
(30, 'ADM', 'integral');

insert into curso values
(40, 'Automação', 'vespertino');

insert into aluno values
(100, 'João Maria', '2000-10-10',10),
(200, 'Maria João', '1999-11-11', 20),
(300, 'Mario Silva','1985-12-01', 40);

select C.nome as 'Nome do curso', C.modalidade, 
A.nome as 'Nome do aluno', A.nascimento 
from curso as C, aluno as A
where A.cod_curso = C.id;

# drop database escola_etec;

create database escola_etec;
use escola_etec;

create table curso
(
	id int primary key,
    nome varchar(55),
    modalidade ENUM ('integral','noturno','online')  default 'integral' -- integral ou noturno
);

create table aluno (
	ra int primary key,
    nome varchar(40),
    email varchar(40)
);

create table turma(
	id int primary key auto_increment,
    ra_aluno int,
    cod_curso int,
    constraint fk_aluno
    foreign key (ra_aluno) references aluno(ra) on delete cascade on update cascade,
    constraint fk_curso
    foreign key (cod_curso) references curso(id) on delete cascade on update cascade
);


insert into curso(id,nome) values (100,"DS"),(200,"LOG"),(300,"ADM");
insert into aluno values (210111,"VDCD","vinicius.dias10@aluno.cps.sp.gov.br"),(210112,"SPA","sophia.araujo@aluno.cps.sp.gov.br"),(210113,"KCS","kauan.silva@aluno.cps.sp.gov.br");
insert into turma values (1000,210111,100),(1001,210111,200),(1002,210112,300),(1003,210113,100),(1004,210113,200),(1005,210113,300);


select C.nome as "Nome do Curso",A.nome as "Nome do Aluno" from aluno as A,curso as C,turma as T where T.ra_aluno = A.ra and T.cod_curso = C.id 

-- Pesquisar sobre INNER JOIN, com o uso explícito
