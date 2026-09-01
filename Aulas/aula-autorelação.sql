create database ETEC;
use ETEC;

# Colocar no CODE do REFENDA...
create table funcionarios(
	id int primary key,
    nome varchar(40) not null,
    cargo enum("Diretor","Cordenador","Professor") default "Professor",
    id_chefe int null,
    constraint auto_fk
    foreign key (id_chefe) references funcionarios(id) on delete set null,
    constraint n_auto_fk
    check (id_chefe <> id)
);

insert into funcionarios values (1,"Samuel Alexandre", "Diretor",null),
(10,"Neymar Dellareti","Cordenador",1),
(11,"Mariana Vegian","Cordenador",1),
(12,"Luciana Monteiro","Cordenador",1),
(100,"Jean Carlos","Professor",10),
(101,"Claudiney Marcon","Professor",10),
(102,"Maximillian","Professor",11),
(103,"Ana Paula","Professor",12);


select fl.nome as Chefes, fl.cargo , fr.nome as "' Subordinados'",fr.cargo from funcionarios as fl INNER JOIN funcionarios as fr on fl.id = fr.id_chefe;
# FULL JOIN não existe no mysql, então ficará na mão se preciso...