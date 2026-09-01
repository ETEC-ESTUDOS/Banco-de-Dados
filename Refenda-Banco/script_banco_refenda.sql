create database db_teste;
use db_teste;
create table usuarios(
	id_user int primary key auto_increment,
    nome varchar(40) not null,
    email varchar(100) unique,
    senha varchar(255) not null,
    tipo enum("ALUNO","FUNCIONARIO","GESTOR") not null
);

create table cardapio(
	id_card int primary key auto_increment,
    data_card date not null,
    descricao text not null,
    ativo boolean not null,
    unique(data_card)
);

create table agendamentos(
	id_agen int primary key auto_increment,
    id_user int not null,
    id_card int not null,
    data_agen date not null,
    estado enum("AGENDADO","CANCELADO") not null,
    data_criacao timestamp default current_timestamp,
    
    unique(id_user,data_agen),
    foreign key (id_card) references cardapio(id_card) on delete cascade,
    foreign key (id_user) references usuarios(id_user) on delete cascade
);

create table consumo(
	id_cons int primary key auto_increment,
    id_user int not null,
    id_agen int not null,
    data_cons date not null,
    confirmado boolean not null,
    unique(id_user,data_cons),
    
    foreign key (id_agen) references agendamentos(id_agen) on delete cascade, 
    foreign key (id_user) references usuarios(id_user) on delete cascade
);
INSERT INTO usuarios (nome, email, senha, tipo) VALUES
('João Silva', 'joao@email.com', '123456', 'ALUNO'),
('Maria Souza', 'maria@email.com', '123456', 'ALUNO'),
('Carlos Lima', 'carlos@email.com', '123456', 'FUNCIONARIO'),
('Ana Costa', 'ana@email.com', '123456', 'GESTOR');
INSERT INTO cardapio (data_card, descricao, ativo) VALUES
('2026-04-24', 'Arroz, feijão, frango grelhado e salada', 1),
('2026-04-25', 'Macarrão ao molho bolonhesa e salada', 1),
('2026-04-26', 'Arroz, carne cozida e legumes', 1);
INSERT INTO agendamentos (id_user, data_agen, estado) VALUES
(1, '2026-04-24', 'AGENDADO'),
(2, '2026-04-24', 'AGENDADO'),
(1, '2026-04-25', 'CANCELADO'),
(3, '2026-04-24', 'AGENDADO');
INSERT INTO consumo (id_user, data_cons, confirmado) VALUES
(1, '2026-04-24', 1),
(2, '2026-04-24', 1),
(3, '2026-04-24', 0),
(1, '2026-04-25', 0);
