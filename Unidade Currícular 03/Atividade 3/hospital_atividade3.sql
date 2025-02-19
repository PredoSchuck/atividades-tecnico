-- Criando o banco de dados
CREATE DATABASE hospitalAtividade3;
-- Acionar o banco de dados
USE hospitalAtividade3;


-- ATIVIDADE 1:
-- Criar tabela "dadosMedicos"
CREATE TABLE dadosMedicos(
	id int primary key not null auto_increment,
	nome varchar(100) not null,
	dataNascimento date not null,
    cpf varchar(30) not null,
    crm varchar(30) not null,
    ufCRM varchar(30) not null,
    telefone varchar(30) not null,
    endereco varchar(100) not null
);

-- Criar tabela "especialidadesMedicos"
CREATE TABLE especialidadesMedicos(
	id int primary key not null auto_increment,
    especialidade1 varchar(50) not null,
    especialidade2 varchar(50)
);

-- Criar tabela "dadosMedicos_has_especialidadesMedicos"
CREATE TABLE dadosMedicos_has_especialidadesMedicos(
	id int primary key not null auto_increment,
	id_dadosMedicos int not null,
    id_especialidadesMedicos int not null,
    foreign key (id_dadosMedicos) references dadosMedicos(id),
    foreign key (id_especialidadesMedicos) references especialidadesMedicos(id)
);

-- Criar tabela "dadosPacientes"
CREATE TABLE dadosPacientes(
	id int primary key not null auto_increment,
    nome varchar(100) not null,
    dataNascimento date not null,
    endereco varchar(100) not null,
    telefone varchar(30) not null,
    email varchar(100) not null,
    cpf varchar(30) not null,
    rg varchar(30) not null
);

-- Criar tabela "convenios"
CREATE TABLE convenios(
	id int primary key not null auto_increment,
	nomeConvenio varchar(100),
    numero varchar(30),
    cnpj varchar(30),
    tempoCarencia date
);

-- Criar tabela "consultas"
CREATE TABLE consultas(
	id int primary key not null auto_increment,
    dataConsulta date not null,
    horaConsulta time not null,
    medicoResponsavel varchar(100) not null,
    nomePaciente varchar(100) not null,
    valor decimal(9,2) not null,
    especialidadeMedico varchar(50) not null,
    receita text,
    id_dadosMedicos int not null,
    id_dadosPacientes int not null,
    id_convenios int not null,
    foreign key (id_dadosMedicos) references dadosMedicos(id),
    foreign key (id_dadosPacientes) references dadosPacientes(id),
    foreign key (id_convenios) references convenios(id)
);


-- ATIVIDADE 2:
-- Criar tabela "enfermeiro"
CREATE TABLE enfermeiros(
	id int primary key  not null auto_increment,
    nome varchar(100) not null,
    cpf varchar(30) not null,
	cre varchar(30) not null
);

-- Criar tabela "internacoes"
CREATE TABLE internacoes(
	id int primary key not null auto_increment,
    nomePaciente varchar(100) not null,
    medicoResponsavel varchar(100) not null,
	dataEntrada date not null,
	dataPrevAlta date not null,
    dataAlta date not null,
	procedimento text
);

-- Criar tabela "enfermeiro_has_internacao"
CREATE TABLE enfermeiros_has_internacao(
	id int primary key not null auto_increment,
	id_enfermeiros int not null,
	id_enfermeiros2 int not null,
	id_internacoes int not null,
    foreign key (id_enfermeiros) references enfermeiros(id),
    foreign key (id_enfermeiros2) references enfermeiros(id),
	foreign key (id_internacoes) references internacoes(id)
);

-- Criar tabela "quarto"
CREATE TABLE quartos(
	id int primary key not null auto_increment,
	numero varchar(5) not null,
    id_internacoes int not null,
    foreign key (id_internacoes) references internacoes(id)
);

-- Criar tabela "tipoQuartos" 
CREATE TABLE tipoQuartos(
	id int primary key not null auto_increment,
	descricao text, 
	valorDiaria decimal(9,2) not null,
    id_quartos int not null,
    foreign key (id_quartos) references quartos(id)
);


-- Atividade 3 Parte 1:
-- Criar tabela "dadosPacientes_has_internacao"
CREATE TABLE dadosPacientes_has_internacoes(
	id int primary key not null auto_increment,
	id_dadosPacientes int not null,
	id_internacoes int not null,
    foreign key (id_dadosPacientes) references dadosPacientes(id),
	foreign key (id_internacoes) references internacoes(id)
);

-- Criar tabela "dadosMedicos_has_internacao"
CREATE TABLE dadosMedicos_has_internacoes(
	id int primary key not null auto_increment,
	id_dadosMedicos int not null,
	id_internacoes int not null,
    foreign key (id_dadosMedicos) references dadosMedicos(id),
	foreign key (id_internacoes) references internacoes(id)
);

-- Criar informações da tabela "dadosMedicos"
INSERT INTO dadosMedicos (nome, dataNascimento, cpf, crm, ufCRM, telefone, endereco) VALUES
('Amanda Eliane Cardoso', '1999-09-02', '288.477.124-75', '124578', 'RR', '(95) 99652-8453', 'Rua NC-O, 956'),
('Ayla Juliana Farias', '1980-08-21', '925.605.009-72', '116668', 'PR', '(41) 98855-3314', 'Rua Nicolau Barra Rosa, 640'),
('Caroline Julia Josefa', '2000-01-01', '710.413.070-5', '951423', 'SP', '(11) 98563-1554', 'Rua Osório Hilário Pontes, 367'),
('Cauê Benjamin Martin Pereira', '1968-09-03', '037.489.230-07', '748962', 'MS', '(67) 98855-6666', 'Rua Nabor Barbosa, 405'),
('Heloisa Rayssa Mariane da Luz', '1970-03-15', '370.027.850-01', '756331', 'TO', '(63) 99375-4168', 'Avenida Raizal, 738'),
('Isabelle Francisca Rayssa', '1993-11-11', '348.377.673-70', '456452', 'RR', '(95) 94582-3145', 'Rua José Cassimiro da Silva, 584'),
('Josefa Juliana Carvalho', '1977-06-01', '862.550.429-95', '228889', 'RR', '(95) 98545-8547', 'Rua Francisco Anacleto da Silva, 919'),
('Noah Pedro Henrique Fernando Viana', '1964-05-22', '336.425.177-02', '856354', 'TO', '(63) 98313-4696', 'Rua das Savanas, 149'),
('Ricardo Giovanni Figueiredo', '1983-12-20', '374.128.935-30', '662255', 'MS', '(67) 93325-6412', 'Rua Cavaleiro da Rosa, 587'),
('Vitór Otávio Danilo Drumond', '1973-04-08', '017.664.467-95', '146582', 'TO', '(63) 91455-2325', 'Rua S-014, 502');
-- Procurar na tabela "dadosMedicos"
SELECT * FROM dadosMedicos;

-- Criar informações da tabela "dadosPacientes"
INSERT INTO dadosPacientes (nome, dataNascimento, endereco, telefone, email, cpf, rg) VALUES
('Antonio Manoel Sales', '1984-10-15', 'Rua Coronel Coelho, 798', '(84) 99801-7517', 'antonio_manoel_sales@hotmailo.com', '187.810.633-34', '47.164.839-5'),
('Giovanni Paulo Rezende', '1961-08-18', 'Travessa José da Rocha Lima, 769', '(41) 99777-0159', 'giovanni.paulo.rezende@inovasom.com', '440.688.282-02', '27.765.789-1'),
('Ian Leonardo Iago Aparício', '1961-04-20', 'Rua Seriema, 623', '(27) 98720-9841', 'ian.leonardo.aparicio@soupelli.com.br', '197.566.604-65', '37.020.218-1'),
('Isabelly Clarice Castro',	'1944-08-05', 'Rua Breno Gonçalves, 794', '(51) 99587-5318', 'isabelly-castro72@vianetfone.com.br', '283.598.493-31', '18.756.567-3'),
('Joaquim Carlos Levi Jesus', '1984-09-02', 'Rua Professora Igênia Moreira da Silva, 835', '(31) 98464-0144', 'joaquim_jesus@lagencemodelos.com.br', '155.409.009-10', '10.025.099-3'),
('Luan Fábio Diego Costa', '1951-11-24', 'Rua Tapajós, 401', '(43) 98447-2966', 'luan.fabio.costa@usa.com', '326.575.716-11', '33.364.530-3'),
('Melissa Ana Fernandes', '1984-10-10', 'Alameda NS-3, 837', '(91) 99247-7220', 'melissa_fernandes@meiryjoias.com.br', '707.422.576-22', '36.969.858-7'),
('Nina Daniela Nunes', '1990-02-24', 'Rua das Goiabeiras, 700', '(63) 99813-8843', 'nina-nunes93@uninet.com.br', '202.100.290-05', '27.624.384-5'),
('Pedro Murilo Emanuel Barros', '1992-11-10', 'Rua Domingos Silva, 433', '(71) 98556-2545', 'pedro.murilo.barros@zootecnista.com.br', '999.689.203-47', '46.154.865-3'),
('Renan Jorge Moraes', '2004-05-20', 'Rua Anísio Souza Passos, 403', '(27) 98147-1112', 'renan_jorge_moraes@meiryjoias.com.br', '241.108.898-12', '13.961.193-9');
-- Procurar na tabela "dadosPacientes"
SELECT * FROM dadosPacientes;

-- Criar informações da tabela "convenios"
INSERT INTO convenios (nomeConvenio, numero, cnpj, tempoCarencia) VALUES
('ProHealth', '145.785-55', '00.772.603/0001-01', '2022-10-25'),
('ProHealth', '332.584-65', '00.772.603/0001-01', '2023-12-13'),
('UniSaude', '741.852.963', '27.087.614/0001-09', '2021-02-26'),
(null, null, null, null),
(null, null, null, null),
('MedMais', '7891-2563', '26.327.461/0001-67', '2018-08-07'),
('SantPlanos', '78.586-52', '21.634.341/0001-99', '2017-12-31'),
(null, null, null, null),
(null, null, null, null),
('SantPlanos', '55.874-95', '21.634.341/0001-99', '2021-06-03'),
(null, null, null, null),
('UniSaude', '114.666.554', '27.087.614/0001-09', '2019-01-06'),
('UniSaude', '142.844.954', '27.087.614/0001-09', '2018-02-28'),
(null, null, null, null),
(null, null, null, null),
('SantPlanos', '87.662-84', '21.634.341/0001-99', '2019-04-23'),
('SantPlanos', '62.511-52', '21.634.341/0001-99', '2020-09-14');
-- Procurar na tabela "convenios"
SELECT * FROM convenios;

-- Criar informações da tabela "consultas"
INSERT INTO consultas (dataConsulta, horaConsulta, medicoResponsavel, nomePaciente, valor, especialidadeMedico, receita, id_dadosMedicos, id_dadosPacientes, id_convenios) VALUES
('2017-01-03', '15:00:00', 'Amanda Eliane Cardoso', 'Antonio Manoel Sales', 100, 'Oftalmologia', null, 1, 1, 1),
('2017-01-03', '16:00:00', 'Isabelle Francisca Rayssa', 'Luan Fábio Diego Costa', 150, 'Gastroenterologia', null, 6, 6, 2),
('2017-01-05', '08:00:00',	'Caroline Julia Josefa', 'Renan Jorge Moraes', 250, 'Dermatologia', null, 3, 10, 3),
('2017-01-05', '10:00:00', 'Isabelle Francisca Rayssa', 'Melissa Ana Fernandes', 200, 'Gastroenterologia', 'A paciente estava com falta de apetite e com náuseas após as refeições. Para tratar a falta de apetite foi indicado tomar Complexo B e Buclina ambos de 8 em 8 horas, quanto as náuseas foi indicado tomar Vonal antes do almoço e da janta, até concluir exames futuros.', 6, 7, 4),
('2017-01-09', '12:00:00', 'Heloisa Rayssa Mariane da Luz', 'Pedro Murilo Emanuel Barros', 202, 'Clinica Geral', null, 5, 9, 5),
('2017-01-11', '09:00:00', 'Cauê Benjamin Martin Pereira', 'Luan Fábio Diego Costa', 145, 'Psiquiatria', null, 4, 6, 6),
('2017-01-12', '13:00:00', 'Caroline Julia Josefa', 'Ian Leonardo Iago Aparício', 155, 'Dermatologia', null, 3, 3, 7),
('2017-01-12', '14:00:00',	'Josefa Juliana Carvalho', 'Antonio Manoel Sales', 175, 'Pediatria', 'A filha de Antonio estava com dores no corpo. Foi indicado tomar Novalgina 1g de 12 em 12 horas e também Tylenon 750g de 8 em 8 horas, os dois remedios devem serem usados por 5 dias.', 7, 1, 8),
('2017-01-13', '17:00:00', 'Josefa Juliana Carvalho', 'Joaquim Carlos Levi Jesus', 150, 'Dermatologia', null, 7, 5, 9),
('2017-01-17', '10:00:00', 'Vitór Otávio Danilo Drumond', 'Giovanni Paulo Rezende', 140, 'Otorrinolaringologia', null, 10, 2, 10),
('2017-01-17', '11:00:00', 'Vitór Otávio Danilo Drumond', 'Renan Jorge Moraes', 190, 'Otorrinolaringologia', 'O paciente estava com uma infecção no ouvido e uma irritação na garganta. Para a infecção foi indicado tomar Amoxicilina, que deverá tomar o remédio seguindo as instruções na embalagem, quanto a irritação foi indicado tomar o Ibuprofeno, após as refeições.', 10, 10, 11),
('2017-01-20', '09:00:00', 'Amanda Eliane Cardoso', 'Luan Fábio Diego Costa', 240, 'Gastroenterologia', null, 1, 6, 12),
('2017-01-22', '12:00:00', 'Noah Pedro Henrique Fernando Viana', 'Melissa Ana Fernandes', 260, 'Psiquiatria', null, 8, 7, 13),
('2017-01-24', '15:00:00', 'Ayla Juliana Farias', 'Isabelly Clarice Castro', 320, 'Oftalmologia', 'A paciente estava apresentando miopia e também pode ter um leve quadro de olho seco. Foi indicado usar um óculos para melhorar a visão, e para o olho seco usar o colírio Systane Ultra que as instruções estavam na embalagem.', 2, 4, 14),
('2017-01-25', '14:00:00', 'Ayla Juliana Farias', 'Ian Leonardo Iago Aparício', 380, 'Dermatologia', 'O paciente estava com alergia na pele e em alguns locais com inflamações, foi indicado passar a pomada Betametasona para as inflamações. E um antialérgico, Loratadina, um comprimido por dia pela manhã.', 2, 3, 15),
('2017-01-30', '14:00:00', 'Ricardo Giovanni Figueiredo', 'Antonio Manoel Sales', 50, 'Oftalmologia', null, 9, 1, 16), 
('2017-01-31', '11:00:00', 'Heloisa Rayssa Mariane da Luz', 'Nina Daniela Nunes', 240, 'Pediatria', null, 5, 8, 17);
-- Procurar na tabela "consultas"
SELECT * FROM consultas;

-- Criar informações da tabela "enfermeiros"
INSERT INTO enfermeiros (nome, cpf, cre) VALUES
('Renata Silvana Stella Aragão', '917.781.437-17', '1444-8863'),
('Agatha Isabela Rafaela Freitas', '516.378.039-58', '4714-8502'),
('Mateus Marcos Ferreira', '431.520.365-31', '1100-2503'),
('Emilly Vera Campos', '038.815.137-44', '0266-9877'),
('Débora Pietra Eliane da Costa', '816.036.607-80', '9863-3214'),
('Bruna Sarah Ferreira', '021.782.727-62', '1423-3521');
-- Procurar na tabela "enfermeiros"
SELECT * FROM enfermeiros;

-- Criar informações da tabela "internacoes"
INSERT INTO internacoes (nomePaciente, medicoResponsavel, dataEntrada, dataPrevAlta, dataAlta, procedimento) VALUES
('Joaquim Carlos Levi Jesus', 'Ricardo Giovanni Figueiredo', '2017-02-01', '2017-02-04', '2017-02-04', null),
('Renan Jorge Moraes', 'Caroline Julia Josefa', '2017-02-03', '2017-02-05', '2017-02-05', null),
('Renan Jorge Moraes', 'Isabelle Francisca Rayssa', '2017-02-06', '2017-02-15', '2017-02-20', null),
('Ian Leonardo Iago Aparício', 'Vitór Otávio Danilo Drumond', '2017-02-12', '2017-02-20', '2017-02-14', null),
('Nina Daniela Nunes', 'Ayla Juliana Farias', '2017-02-14', '2017-02-15', '2017-02-16', null),
('Antonio Manoel Sales', 'Heloisa Rayssa Mariane da Luz', '2017-02-15', '2017-02-20', '2017-02-18', null),
('Joaquim Carlos Levi Jesus', 'Heloisa Rayssa Mariane da Luz', '2017-02-24', '2017-02-26', '2017-02-28', null);
-- Procurar na tabela "internacoes"
SELECT * FROM internacoes;

-- Criar informações da tabela "quarto"
INSERT INTO quartos (numero, id_internacoes) VALUES
(403, 1),
(405, 2),
(102, 3),
(603, 4),
(104, 5),
(205, 6),
(310, 7);
-- Procurar na tabela "quartos"
SELECT * FROM quartos;

-- Criar informações da tabela "tipoQuartos"
INSERT INTO tipoQuartos (descricao, valorDiaria, id_quartos) VALUES
('Quartos Duplos', 100,	1),
('Quartos Duplos', 100,	2),
('Enfermaria', 50, 3),
('Apartamento', 200, 4),
('Enfermaria', 50, 5),
('Enfermaria', 50, 6),
('Quartos Duplos', 100, 7);
-- Procurar na tabela "tipoQuartos"
SELECT * FROM tipoQuartos;


-- Atividade 3 Parte 2:
-- Criando coluna "em atividade" em "dadosMedicos"
ALTER TABLE dadosMedicos
ADD column emAtividade bit;

-- Atualizando a coluna dos "dadosMedicos"
UPDATE dadosMedicos SET emAtividade = 1 WHERE id = 1 OR id = 2 OR id = 4 OR id = 5 OR id = 6 OR id = 7 OR id = 8 OR id = 10;
UPDATE dadosMedicos SET emAtividade = 0 WHERE id = 3 OR id = 9;
-- Conferir se as informações estão corretas
SELECT * FROM dadosMedicos;

-- Atualizando as datas das internações
UPDATE internacoes SET dataAlta = '2017-02-07' WHERE id = 1;
UPDATE internacoes SET dataAlta = '2017-02-08' WHERE id = 2;
UPDATE internacoes SET dataAlta = '2017-02-23' WHERE id = 3;
UPDATE internacoes SET dataAlta = '2017-02-17' WHERE id = 4;
UPDATE internacoes SET dataAlta = '2017-02-19' WHERE id = 5;
UPDATE internacoes SET dataAlta = '2017-02-21' WHERE id = 6;
UPDATE internacoes SET dataAlta = '2017-03-03' WHERE id = 7;
-- Conferir se as informações estão corretas
SELECT * FROM internacoes;

-- ON DELETE CASCADE
ALTER TABLE consultas
DROP foreign key consultas_ibfk_3;
ALTER TABLE consultas
ADD foreign key (id_convenios) references convenios(id) ON DELETE CASCADE;
DELETE FROM convenios WHERE nomeConvenio = 'SantPlanos';
SELECT * FROM convenios;