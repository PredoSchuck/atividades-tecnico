-- Excluindo antigo banco de dados
DROP DATABASE IF EXISTS script_uc4_atividade4;
-- Criando o banco de dados
CREATE DATABASE script_uc4_atividade4;
-- Acionar o banco de dados
USE script_uc4_atividade4;

CREATE TABLE usuario(
	id int primary key not null auto_increment,
    login varchar(100) not null,
	senha varchar(100) not null,
    ultimo_login datetime
);

CREATE TABLE cargo(
	id int primary key not null auto_increment,
    descricao varchar(45),
    salario decimal(9,2),
    comissao float
);

CREATE TABLE funcionario(
	nome varchar(255) not null,
    telefone varchar(45),
    cpf varchar(11),
    id int primary key not null auto_increment,
    cargo_id int,
    usuario_id int,
    foreign key (cargo_id) references cargo(id),
    foreign key (usuario_id) references usuario(id)
);

CREATE TABLE cliente(
	id int primary key not null auto_increment,
    nome varchar(255) not null,
    cpf varchar(30) not null,
    rg varchar(30) not null,
    usuario_id int
);

CREATE TABLE endereco(
	logradouro varchar(255) not null,
    numero varchar(10) not null,
    bairo varchar(255) not null,
    cidade varchar(255) not null,
    estado varchar(255) not null,
    cep varchar(10) not null,
    cliente_id int not null,
    foreign key (cliente_id) references cliente(id)
);

CREATE TABLE telefone(
	telefone_id int not null,
    telefone varchar(30) not null,
    cliente_id int not null,
    foreign key (cliente_id) references cliente(id)
);

CREATE TABLE venda_data(
	id int primary key not null auto_increment,
    data datetime,
    data_envio datetime,
    status varchar(45)
);

CREATE TABLE venda_pagamento (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    valor_total DECIMAL(9 , 2 ),
    tipo_pagamento CHAR(1) NOT NULL,
    numero_cartao_pagamento VARCHAR(16),
    numero_parcelas_pagamento INT,
    data_pagamento DATETIME
);

CREATE TABLE venda_chave(
	id int primary key not null auto_increment,
    cliente_id int not null,
    funcionario_id int not null,
    data_venda_id int not null,
	pagamento_venda_id int not null,
    foreign key (cliente_id) references cliente(id),
    foreign key (funcionario_id) references funcionario(id),
    foreign key (data_venda_id) references venda_data(id),
    foreign key (pagamento_venda_id) references venda_pagamento(id)
);

CREATE TABLE item(
	id int primary key not null auto_increment,
    quantidade int not null,
    valor_unitario decimal(9,2),
    subtotal decimal(9,2),
    nome_produto varchar(255)
);

CREATE TABLE produto(
	id int primary key not null auto_increment,
    nome varchar(255) not null,
    descricao varchar(255),
    estoque int,
    fabricante varchar(255)
);

CREATE TABLE item_chave(
	venda_chave_id int not null,
    produto_id int not null,
    item_venda_id int not null,
    foreign key (venda_chave_id) references venda_chave(id)
);