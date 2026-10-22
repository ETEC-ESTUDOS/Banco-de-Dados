
# Ex1 
create database if not exists loja_prova;
use loja_prova;
create table if not exists produtos(
	id int primary key auto_increment,
    nome varchar(50) not null,
    categoria varchar(30),
    preco decimal(8,2),
    estoque int,
    fornecedor varchar(40)
);

describe produtos;
# Ex 2
insert into produtos(nome,categoria,preco,estoque,fornecedor) values 
("Mouse Óptico","Perifericos",45.90,30,"TechSul"),
("Teclado Mecânico","Perifericos",289.90,12,"TechSul"),
("Monitor 24 pol","Monitores",899,8,"VisionMax"),
("Monitor 27 pol","Monitores",1450,4,"VisionMax"),
("SSD 480GB","Armazenamento",259.90,25,"DataPro"),
("HD Externo 1TB","Armazenamento",349.00,10,"DataPro"),
("Headset Gamer","Perifericos",199.90,15,"SoundX"),
("Webcam HD","Perifericos",159.90,0,"VisionMax"),
("Pendrive 64GB","Armazenamento",39.90,50,"DataPro"),
("Cabo HDMI 2m","Acessorios",29.90,60,"TechSul");
select count(*) from produtos;

#Ex3
select nome,preco from produtos where categoria like "perifericos" order by preco desc;
#Ex4
select distinct fornecedor from produtos;
#Ex5
select * from produtos where preco between 100 and 500;
#Ex6
select * from produtos where nome like "monitor%";
#Ex7
select count(*) from produtos where estoque < 10;
#Ex8
select max(preco),min(preco),avg(preco) from produtos;
#Ex9
select * from produtos where nome like "%GB";
#Ex10
select * from produtos where nome like "%HD%";
# Ex Bônus
select sum(preco * estoque) from produtos;