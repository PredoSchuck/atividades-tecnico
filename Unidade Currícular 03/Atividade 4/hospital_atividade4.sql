-- Criando o banco de dados!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
DROP DATABASE IF EXISTS hospitalAtividade4;
CREATE DATABASE hospitalAtividade4;
-- Acionar o banco de dados
USE hospitalAtividade4;


-- Estrutura!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- Criar tabela "dadosMedicos"
CREATE TABLE dadosMedicos(
	id_dadosMedicos int primary key not null auto_increment,
	nome_dadosMedicos varchar(100) not null,
	dataNascimento_dadosMedicos date not null,
    cpf_dadosMedicos varchar(30) not null,
    crm_dadosMedicos varchar(30) not null,
    ufCRM_dadosMedicos varchar(30) not null,
    telefone_dadosMedicos varchar(30) not null,
    endereco_dadosMedicos varchar(100) not null
);

-- Criar tabela "especialidadesMedicos"
CREATE TABLE especialidadesMedicos(
	id_especialidadesMedicos int primary key not null auto_increment,
    especialidade1_especialidadesMedicos varchar(50) not null,
    especialidade2_especialidadesMedicos varchar(50)
);

-- Criar tabela "dadosMedicos_has_especialidadesMedicos"
CREATE TABLE dadosMedicos_has_especialidadesMedicos(
	id_dadosMedicos_has_especialidadesMedicos int primary key not null auto_increment,
	id_dadosMedicos int not null,
    id_especialidadesMedicos int not null,
    foreign key (id_dadosMedicos) references dadosMedicos(id_dadosMedicos),
    foreign key (id_especialidadesMedicos) references especialidadesMedicos(id_especialidadesMedicos)
);

-- Criar tabela "dadosPacientes"
CREATE TABLE dadosPacientes(
	id_dadosPacientes int primary key not null auto_increment,
    nome_dadosPacientes varchar(100) not null,
    dataNascimento_dadosPacientes date not null,
    endereco_dadosPacientes varchar(100) not null,
    telefone_dadosPacientes varchar(30) not null,
    email_dadosPacientes varchar(100) not null,
    cpf_dadosPacientes varchar(30) not null,
    rg_dadosPacientes varchar(30) not null
);

-- Criar tabela "convenios"
CREATE TABLE convenios(
	id_convenios int primary key not null auto_increment,
	nome_convenios varchar(100),
    numero_convenios varchar(30),
    cnpj_convenios varchar(30),
    tempoCarencia_convenios date
);

-- Criar tabela "consultas"
CREATE TABLE consultas(
	id_consultas int primary key not null auto_increment,
    dataHora_consultas datetime not null,
    medicoResponsavel_consultas varchar(100) not null,
    nomePaciente_consultas varchar(100) not null,
    valor_consultas decimal(9,2) not null,
    especialidadeMedico_consultas varchar(50) not null,
    receita_consultas text,
    id_dadosMedicos int not null,
    id_dadosPacientes int not null,
    id_convenios int not null,
    foreign key (id_dadosMedicos) references dadosMedicos(id_dadosMedicos),
    foreign key (id_dadosPacientes) references dadosPacientes(id_dadosPacientes),
    foreign key (id_convenios) references convenios(id_convenios)
);

-- Criar tabela "enfermeiros"
CREATE TABLE enfermeiros(
	id_enfermeiros int primary key  not null auto_increment,
    nome_enfermeiros varchar(100) not null,
    cpf_enfermeiros varchar(30) not null,
	cre_enfermeiros varchar(30) not null
);

-- Criar tabela "internacoes"
CREATE TABLE internacoes(
	id_internacoes int primary key not null auto_increment,
    nomePaciente_internacoes varchar(100) not null,
    medicoResponsavel_internacoes varchar(100) not null,
    enfermeiro1_internacoes varchar(100) not null,
    enfermeiro2_internacoes varchar(100) not null,
	dataEntrada_internacoes date not null,
	dataPrevAlta_internacoes date not null,
    dataAlta_internacoes date not null,
	procedimento_internacoes text
);

-- Criar tabela "enfermeiro_has_internacao"
CREATE TABLE enfermeiros_has_internacao(
	id_enfermeiros_has_internacao int primary key not null auto_increment,
	id_enfermeiros int not null,
	id_enfermeiros2 int not null,
	id_internacoes int not null,
    foreign key (id_enfermeiros) references enfermeiros(id_enfermeiros),
    foreign key (id_enfermeiros2) references enfermeiros(id_enfermeiros),
	foreign key (id_internacoes) references internacoes(id_internacoes)
);

-- Criar tabela "dadosPacientes_has_internacao"
CREATE TABLE dadosPacientes_has_internacoes(
	id int primary key not null auto_increment,
	id_dadosPacientes int not null,
	id_internacoes int not null,
    foreign key (id_dadosPacientes) references dadosPacientes(id_dadosPacientes),
	foreign key (id_internacoes) references internacoes(id_internacoes)
);

-- Criar tabela "dadosMedicos_has_internacao"
CREATE TABLE dadosMedicos_has_internacoes(
	id int primary key not null auto_increment,
	id_dadosMedicos int not null,
	id_internacoes int not null,
    foreign key (id_dadosMedicos) references dadosMedicos(id_dadosMedicos),
	foreign key (id_internacoes) references internacoes(id_internacoes)
);

-- Criar tabela "quarto"
CREATE TABLE quartos(
	id_quartos int primary key not null auto_increment,
	numero_quartos varchar(5) not null,
    id_internacoes int not null,
    foreign key (id_internacoes) references internacoes(id_internacoes)
);

-- Criar tabela "tipoQuartos" 
CREATE TABLE tipoQuartos(
	id_tipoQuartos int primary key not null auto_increment,
	descricao_tipoQuartos text, 
	valorDiaria_tipoQuartos decimal(9,2) not null,
    id_quartos int not null,
    foreign key (id_quartos) references quartos(id_quartos)
);

-- Informações Gerais!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- Inserir informações na tabela "dadosMedicos"
INSERT INTO dadosMedicos (nome_dadosMedicos, dataNascimento_dadosMedicos, cpf_dadosMedicos, crm_dadosMedicos, ufCRM_dadosMedicos, telefone_dadosMedicos, endereco_dadosMedicos) VALUES
('Amanda Eliane Cardoso', '1999-09-02', '288.477.124-75', '124578', 'RR', '(95) 99652-8453', 'Rua NC-O, 956'),
('Ayla Juliana Farias', '1980-08-21', '925.605.009-72', '116668', 'PR', '(41) 98855-3314', 'Rua Nicolau Barra Rosa, 640'),
('Benício Yuri Ruan Ribeiro', '1963-01-02', '574.993.195-12', '254878', 'PA', '(91) 99312-4262', 'Alameda dos Evangélicos, 689'),
('Cauê Benjamin Martin Pereira', '1968-09-03', '037.489.230-07', '748962', 'MS', '(67) 98855-6666', 'Rua Nabor Barbosa, 405'),
('Heloisa Rayssa Mariane da Luz', '1970-03-15', '370.027.850-01', '756331', 'TO', '(63) 99375-4168', 'Avenida Raizal, 738'),
('Isabelle Francisca Rayssa', '1993-11-11', '348.377.673-70', '456452', 'RR', '(95) 94582-3145', 'Rua José Cassimiro da Silva, 584'),
('Josefa Juliana Carvalho', '1977-06-01', '862.550.429-95', '228889', 'RR', '(95) 98545-8547', 'Rua Francisco Anacleto da Silva, 919'),
('Noah Pedro Henrique Fernando Viana', '1964-05-22', '336.425.177-02', '856354', 'TO', '(63) 98313-4696', 'Rua das Savanas, 149'),
('Raquel Emily da Rosa', '2001-01-05', '951.984.722-71', '110456', 'PI', '(86) 99939-9780', 'Quadra M3, 241'),
('Vitór Otávio Danilo Drumond', '1973-04-08', '017.664.467-95', '146582', 'TO', '(63) 91455-2325', 'Rua S-014, 502');

-- Inserir informações na tabela "especialidadeMedicos"
INSERT INTO especialidadesMedicos (especialidade1_especialidadesMedicos, especialidade2_especialidadesMedicos) VALUES
('gastroenterologia', 'oftalmologia'),
('dermatologia', 'oftalmologia'),
('dermatologia', null),
('pedriatria', 'psiquiatria'),
('clinica geral', 'otorrinolaringologia'),
('gastroenterologia', null),
('dermatologia', 'pedriatria'),
('clinica geral', 'psiquiatria'),
('gastroenterologia', 'pedriatria'),
('otorrinolaringologia', 'pedriatria');

-- Criar informações da tabela "dadosPacientes"
INSERT INTO dadosPacientes (nome_dadosPacientes, dataNascimento_dadosPacientes, endereco_dadosPacientes, telefone_dadosPacientes, email_dadosPacientes, cpf_dadosPacientes, rg_dadosPacientes) VALUES
('Agatha Luciana Costa', '1964-04-01', 'Rua do Ouvidor, 997', '(27) 99154-4603', 'agatha_costa@lins.net.br', '167.905.336-13', '15.682.497-8'),
('Daiane Ana Duarte', '2014-01-02', 'Vila Santa Terezinha, 184', '(84) 99573-4330', 'daiane_ana_duarte@molsanto.com', '223.918.714-06', '18.412.149-8'),
('Eduardo Filipe Castro', '1974-03-09', 'Rua Monsenhor Alencar, 459', '(88) 99650-6436', 'eduardofilipecastro@expressoforte.com.br', '138.362.362-73', '48.111.215-7'),
('Leandro Thiago Mendes', '1989-12-31', 'Rua I, 985', '(31) 98926-8496', 'leandro-mendes75@com.br', '002.970.639-44', '36.039.943-5'),
('Luís Renan Nicolas Novaes', '2016-03-01', 'Quadra ARSO 151 HM 10, 594', '(63) 98607-8681', 'luis-novaes86@cedda.com.br', '943.192.169-38', '35.604.826-3'),
('Nelson Edson da Cruz', '1970-01-02', 'Rua Comandante Paulo Varela, 585', '(92) 98420-0498', 'nelsonedsondacruz@cabletech.com.br', '491.506.336-43', '10.178.460-0'),
('Rayssa Antonella Baptista', '1961-07-04', 'Rua Dario Pereira, 167', '(85) 98228-5710', 'rayssa.antonella.baptista@lojasrayton.com', '460.343.857-50', '31.406.663-9'),
('Rayssa Vitória Josefa Aragão', '2010-12-25', 'Rua Santo Antônio, 254', '(83) 98631-2179', 'rayssa-aragao98@aguianet.com.br', '812.382.668-00', '15.266.507-9'),
('Rodrigo Vinicius Lopes', '2008-08-15', 'Travessa Mato Grosso, 671', '(75) 99529-3161', 'rodrigo.vinicius.lopes@ohms.com.br', '508.239.980-29', '47.629.697-3'),
('Thales Vinicius Castro', '1978-04-20', 'Rua Juriti, 367', '(68) 98111-0261', 'thales_castro@valedesign.com.br', '589.064.885-30', '35.048.648-7');

-- Criar informações da tabela "convenio"
INSERT INTO convenios (nome_convenios, numero_convenios, cnpj_convenios, tempoCarencia_convenios) VALUES
('ProHealth', '142.325-98', '00.772.603/0001-01', '2021-10-20'),
(null, null, null, null),
('UniSaude', '223.414.321', '27.087.614/0001-09', '2024-12-31'),
('UniSaude', '115.755.123', '27.087.614/0001-09', '2021-01-15'),
('MedMais', '8855-1101', '26.327.461/0001-67', '2022-06-24'),
(null, null, null, null),
('MedMais', '1465-3502', '26.327.461/0001-67', '2023-01-01'),
('SantPlanos', '23.124-65', '21.634.341/0001-99', '2021-03-07'),
(null, null, null, null),
(null, null, null, null),
('SantPlanos', '51.741-65', '21.634.341/0001-99', '2021-03-28'),
('ProHealth', '252.111-62', '00.772.603/0001-01', '2023-12-13');

-- Criar informações da tabela "consulta"
INSERT INTO consultas (dataHora_consultas, medicoResponsavel_consultas, nomePaciente_consultas, valor_consultas, especialidadeMedico_consultas, receita_consultas, id_dadosMedicos, id_dadosPacientes, id_convenios) VALUES 
('2020-01-03 10:00:00',	'Noah Pedro Henrique Fernando Viana', 'Thales Vinicius Castro', 250, 'Clinica Geral', 'O paciente falou que sentia dores no peito enquanto estava em repouso, além de que tem hipertensão e seu avô teve um ataque cardíaco, foi indicado fazer alguns exames para ver essa situação.', 8, 10, 1),
('2020-02-08 08:45:00', 'Vitór Otávio Danilo Drumond', 'Rayssa Vitória Josefa Aragão', 110, 'Otorrinolaringologia','menor de 18 e não pediatria', 10, 8, 2),
('2020-02-17 16:30:00', 'Cauê Benjamin Martin Pereira', 'Rayssa Vitória Josefa Aragão', 225, 'Psiquiatria', 'menor de 18 e não pediatria', 4, 8, 3),
('2020-03-29 15:30:00', 'Vitór Otávio Danilo Drumond', 'Luís Renan Nicolas Novaes', 250, 'Pediatria', null, 10, 5, 4),
('2020-04-03 09:30:00', 'Ayla Juliana Farias', 'Agatha Luciana Costa', 300, 'Oftalmologia', null, 2, 1, 5),
('2020-04-21 16:00:00', 'Amanda Eliane Cardoso', 'Luís Renan Nicolas Novaes', 150, 'Oftalmologia', 'menor de 18 e não pediatria', 1, 5, 6),
('2020-06-14 11:15:00', 'Isabelle Francisca Rayssa', 'Eduardo Filipe Castro', 220, 'Gastroenterologia', null, 6, 3, 7),
('2020-07-01 14:00:00', 'Benício Yuri Ruan Ribeiro', 'Rodrigo Vinicius Lopes', 240, 'Dermatologia', 'menor de 18 e não pediatria', 3, 9, 8),
('2020-08-09 16:00:00', 'Josefa Juliana Carvalho', 'Nelson Edson da Cruz', 270, 'Dermatologia', null, 7, 6, 9),
('2020-10-14 16:15:00', 'Rayssa Antonella Baptista', 'Raquel Emily da Rosa', 175, 'Gastroenterologia', null, 9, 7, 10),
('2020-11-11 14:30:00', 'Heloisa Rayssa Mariane da Luz', 'Leandro Thiago Mendes', 310, 'Clinica Geral', null, 5, 4, 11),
('2020-12-15 15:30:00', 'Cauê Benjamin Martin Pereira', 'Daiane Ana Duarte', 125, 'Pediatria', null, 4,	2, 12);

-- Criar informações da tabela "enfermeiros"
INSERT INTO enfermeiros (nome_enfermeiros, cpf_enfermeiros, cre_enfermeiros) VALUES
('Agatha Isabela Rafaela Freitas', '516.378.039-58', '4714-8502'),
('Bruna Sarah Ferreira', '021.782.727-62', '1423-3521'),
('Débora Pietra Eliane da Costa', '816.036.607-80', '9863-3214'),
('Emilly Vera Campos', '038.815.137-44', '0266-9877'),
('Mateus Marcos Ferreira', '431.520.365-31', '1100-2503'),
('Renata Silvana Stella Aragão', '917.781.437-17', '1444-8863');

-- Criar informações da tabela "internacoes"
INSERT INTO internacoes (nomePaciente_internacoes, medicoResponsavel_internacoes, enfermeiro1_internacoes, enfermeiro2_internacoes, dataEntrada_internacoes, dataPrevAlta_internacoes, dataAlta_internacoes, procedimento_internacoes) VALUES
('Daiane Ana Duarte', 'Raquel Emily da Rosa', 'Agatha Isabela Rafaela Freitas', 'Mateus Marcos Ferreira', '2020-02-01', '2020-02-04', '2020-02-04', 'gastro e enfermaria'),
('Eduardo Filipe Castro', 'Ayla Juliana Farias', 'Débora Pietra Eliane da Costa', 'Renata Silvana Stella Aragão', '2020-04-03', '2020-04-05', '2020-04-05', null),
('Nelson Edson da Cruz', 'Benício Yuri Ruan Ribeiro', 'Bruna Sarah Ferreira', 'Mateus Marcos Ferreira', '2020-05-06', '2020-05-15', '2020-05-20', null),
('Leandro Thiago Mendes', 'Heloisa Rayssa Mariane da Luz', 'Agatha Isabela Rafaela Freitas', 'Mateus Marcos Ferreira', '2020-07-12', '2020-07-20', '2020-07-14', null),
('Rayssa Vitória Josefa Aragão', 'Isabelle Francisca Rayssa', 'Mateus Marcos Ferreira', 'Renata Silvana Stella Aragão', '2020-07-14', '2020-07-15', '2020-07-16', 'gastro e enfermaria'),
('Thales Vinicius Castro', 'Heloisa Rayssa Mariane da Luz', 'Agatha Isabela Rafaela Freitas', 'Bruna Sarah Ferreira', '2020-10-15', '2020-10-20', '2020-10-18', null),
('Luís Renan Nicolas Novaes', 'Amanda Eliane Cardoso', 'Débora Pietra Eliane da Costa', 'Emilly Vera Campos', '2020-12-24', '2020-12-26', '2020-12-28', null);

-- Criar informações da tabela "quartos"
INSERT INTO quartos (numero_quartos, id_internacoes) VALUES
(202, 1),
(410, 2),
(120, 3),
(608, 4),
(114, 5),
(201, 6),
(306, 7);

-- Criar informações da tabela "tipoQuartos"
INSERT INTO tipoQuartos (descricao_tipoQuartos, valorDiaria_tipoQuartos, id_quartos) VALUES
('Enfermaria', 50, 1),
('Quartos Duplos', 100, 2),
('Enfermaria', 50, 3),
('Apartamento', 200, 4),
('Enfermaria', 50, 5),
('Enfermaria', 50, 6),
('Quartos Duplos', 100, 7);

-- ATIVIDADE 4!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- Todos os dados e o valor médio das consultas do ano de 2020 realizadas sem convênio
-- Todos os Dados
SELECT * FROM consultas AS cs 
JOIN convenios AS cv ON cs.id_convenios = cv.id_convenios
WHERE cv.nome_convenios IS NULL;
-- Valor Médio
SELECT AVG (valor_consultas) AS media
FROM consultas AS cs JOIN convenios AS cv
ON cs.id_consultas = cv.id_convenios
WHERE cv.nome_convenios IS NULL;

-- Todos os dados e o valor médio das consultas do ano de 2020 realizadas por convênio
-- Todos os Dados
SELECT * 
FROM consultas 
JOIN convenios ON consultas.id_convenios = convenios.id_convenios
WHERE nome_convenios IS NOT NULL;
-- Valor Médio
SELECT AVG (valor_consultas) AS media
FROM consultas AS cs 
JOIN convenios AS cv ON cs.id_consultas = cv.id_convenios
WHERE cv.nome_convenios IS NOT NULL;

-- Todos os dados das internações que tiveram data de alta maior que a data prevista para a alta
SELECT * FROM internacoes
WHERE DATEDIFF (dataAlta_internacoes, dataPrevAlta_internacoes) >= 1;

-- Receituário completo da primeira consulta registrada com receituário associado
SELECT receita_consultas
FROM consultas 
WHERE id_consultas = 1;

-- Todos os dados da consulta de maior valor e também da de menor valor (ambas as consultas não foram realizadas sob convênio)
-- Maior valor
SELECT cs.*
FROM consultas AS cs
JOIN convenios AS cv ON cs.id_convenios = cv.id_convenios
WHERE cv.nome_convenios IS NULL
ORDER BY cs.valor_consultas DESC
LIMIT 1;
-- Menor Valor
SELECT cs.*
FROM consultas AS cs
JOIN convenios AS cv ON cs.id_convenios = cv.id_convenios
WHERE cv.nome_convenios IS NULL
ORDER BY cs.valor_consultas ASC
LIMIT 1;

-- Todos os dados das internações em seus respectivos quartos, calculando o total da internação a partir do valor de diária do quarto e o número de dias entre a entrada e a alta
SELECT i.*, q.*, DATEDIFF(i.dataAlta_internacoes, i.dataEntrada_internacoes) AS diferenca,
		tq.valorDiaria_tipoQuartos as valorDiaria,
       (DATEDIFF(i.dataAlta_internacoes, i.dataEntrada_internacoes) * tq.valorDiaria_tipoQuartos) AS custoTotal
FROM internacoes AS i
JOIN quartos AS q ON i.id_internacoes = q.id_internacoes
JOIN tipoQuartos AS tq ON q.id_quartos = tq.id_quartos;

-- Data, procedimento e número de quarto de internações em quartos do tipo “apartamento”
SELECT i.dataEntrada_internacoes, i.dataPrevAlta_internacoes, i.dataAlta_internacoes, i.procedimento_internacoes, q.numero_quartos
FROM internacoes AS i 
JOIN quartos AS q ON i.id_internacoes = q.id_internacoes
JOIN tipoQuartos AS tq ON q.id_quartos = tq.id_quartos
WHERE tq.descricao_tipoQuartos = 'Apartamento';

-- Nome do paciente, data da consulta e especialidade de todas as consultas em que os pacientes eram menores de 18 anos na data da consulta e cuja especialidade não seja “pediatria”, ordenando por data de realização da consulta
SELECT cs.nomePaciente_consultas, DATE(cs.dataHora_consultas) AS data_consulta, cs.especialidadeMedico_consultas
FROM consultas AS cs 
JOIN dadosPacientes AS dp ON cs.id_dadosPacientes = dp.id_dadosPacientes
WHERE cs.especialidadeMedico_consultas <> 'Pediatria' AND TIMESTAMPDIFF(YEAR, dp.dataNascimento_dadosPacientes, cs.dataHora_consultas) < 18;

-- Nome do paciente, nome do médico, data da internação e procedimentos das internações realizadas por médicos da especialidade “gastroenterologia”, que tenham acontecido em “enfermaria”.
SELECT i.nomePaciente_internacoes, i.medicoResponsavel_internacoes, i.dataEntrada_internacoes, i.procedimento_internacoes, tq.descricao_tipoQuartos, em.especialidade1_especialidadesMedicos
FROM internacoes AS i
JOIN quartos AS q ON i.id_internacoes = q.id_quartos
JOIN tipoQuartos AS tq ON q.id_quartos = tq.id_tipoQuartos
JOIN dadosMedicos AS dm ON dm.id_dadosMedicos = i.id_internacoes
JOIN especialidadesMedicos AS em ON dm.id_dadosMedicos = em.id_especialidadesMedicos
WHERE (em.especialidade1_especialidadesMedicos = 'Gastroenterologia' OR em.especialidade2_especialidadesMedicos = 'Gastroenterologia') AND  tq.descricao_tipoQuartos = 'Enfermaria';

-- Os nomes dos médicos, seus números de registro no CRM e a quantidade de consultas que cada um realizou
SELECT dm.nome_dadosMedicos, dm.crm_dadosMedicos, COUNT(*) AS quantidade_consultas
FROM dadosMedicos AS dm
JOIN consultas AS cs ON dm.id_dadosMedicos = cs.id_dadosMedicos
GROUP BY dm.nome_dadosMedicos, dm.crm_dadosMedicos;

-- Os nomes, os números de registro no CRE dos enfermeiros que participaram de mais de uma internação e os números de internações referentes a esses profissionais.
SELECT e.nome_enfermeiros, e.cre_enfermeiros, COUNT(*) AS internacoesParticipadas
FROM enfermeiros_has_internacao AS ei
JOIN enfermeiros AS e ON ei.id_enfermeiros = e.id_enfermeiros
JOIN internacoes AS i ON ei.id_internacoes = i.id_internacoes
GROUP BY e.nome_enfermeiros, e.cre_enfermeiros
HAVING COUNT(*) > 1;

-- Quantas consultas foram realizadas por cada convenio, sem incluir os "sem convenio"
SELECT cv.nome_convenios, COUNT(*)
FROM convenios AS cv
WHERE cv.nome_convenios IS NOT NULL
GROUP BY cv.nome_convenios