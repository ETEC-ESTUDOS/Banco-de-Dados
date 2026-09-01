/*Questões:
Escreva as consultas SQL que respondem as seguintes questões:
1. Liste todas as cidades e os países aos quais pertencem.
2. Liste todas as cidades que são capitais.
3. Liste todos os atributos dos países onde a expectativa de vida é menor
que 70 anos.
4. Liste todas as capitais e as populações dos países cujos PIB é maior
que 1 trilhão de dólares.
5. Quais é o nome e a população da capital do país onde o rio St.
Lawrence tem sua nascente.
6. Qual é a média da população das cidades que não são capitais.
7. Para cada continente retorne o PIB médio de seus países.
8. Para cada país onde pelo menos 2 rios tem nascente, encontre o
comprimento do menor rio.
9. Liste os países cujo PIB é maior que o PIB é do Canada.
*/

create database Mundo;
use Mundo;

create table Pais(
id_pais int primary key auto_increment,
Nome varchar(35), 
Continente varchar(35), 
Pop real, 
PIB real,
Expec_vida real
);

create table Cidade(
id int primary key auto_increment,
Nome varchar(35), 
Pais varchar(35), 
Pop real, 
Capital enum("S","N") default "N",
cod_pais int,
foreign key (cod_pais) references Pais(id_pais)
);

create table Rio(
id int primary key auto_increment,
Nome varchar(35), 
Origem varchar(35), 
Comprimento integer
);

create table origem(
cod_rio int,
cod_cidade int,
primary key(cod_rio,cod_cidade),
foreign key (cod_rio) references Rio(id),
foreign key (cod_cidade) references Cidade(id)
);

insert into Pais(Nome, Continente, Pop,PIB,Expec_vida) values ("Canada","Am. Norte",30.1, 658, 77.08),("Mexico","Am. Norte", 107.5, 694, 69.1),("Brasil","Am. Sul", 183.3, 10004, 65.2),("USA","Am. Norte", 270, 8003, 75.5);
insert into Cidade(Nome, Pais, Pop, Capital, cod_pais) values ("Washington","USA",3.3,"S",4),("Monterrey","Mexico",2.0,"N",2),("Brasilia","Brasil",1.5,"N",3),("São Paulo","Brasil",15.0,"N",3),("Ottawa","Canada",0.8,"S",1),("Cid. Mexico","Mexico",14.1,"S",2);
insert into Rio(Nome, Origem, Comprimento) values (),(),(),();