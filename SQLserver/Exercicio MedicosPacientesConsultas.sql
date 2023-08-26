-- criando tabela medicos
create table medicos (
	crm char(9),
	nome varchar(80) not null,
	especialidade varchar(30) not null,
	constraint pk_medicos primary key (crm)
);

-- criando tabela pacientes
create table pacientes (
	cpf char(11),
	nome varchar(80) not null,
	sexo varchar(2) not null,
	constraint pk_pacientes primary key (cpf),
    constraint ck_sexo check(sexo in ('M', 'F', 'NB'))
);

-- criando tabela MedicosPacientes
create table medicosPacientes (
	idMedPac numeric identity(1, 1),
	crmMedico char(9),
	cpfPaciente char(11),
	constraint pk_medicosPacientes primary key (crmMedico, cpfPaciente),
	constraint uk_medicosPacientes unique (idMedPac),
	constraint fk_medicos foreign key (crmMedico) references medicos (crm),
	constraint fk_pacientes foreign key (cpfPaciente) references pacientes (cpf)
);
drop table medicosPacientes;

-- inserindo medicos
insert into Medicos (crm, nome, especialidade)
values ('123456/RS', 'João Lima', 'Cardiologia');
insert into Medicos (crm, nome, especialidade)
values ('573496/RS', 'Márcia Cardoso', 'Ortopedia');
insert into Medicos(crm, nome, especialidade)
values ('456123/RS', 'José Leôncio', 'Cardiologia');
insert into Medicos (crm, nome, especialidade)
values ('789234/RS', 'Filomena da Silva', 'Neurologia');
insert into Medicos (crm, nome, especialidade)
values ('453678/RS', 'Joventino Leôncio', 'Psiquiatria');

-- inserindo pacientes
insert into Pacientes (cpf, nome, sexo)
values ('12345678910', 'José Almeida', 'M');
insert into Pacientes (cpf, nome, sexo)
values ('32111078906', 'Carla Souza', 'F');
INSERT INTO PACIENTES (CPF, NOME, SEXO)
VALUES ('56389900020', 'Maria Marta', 'F');
INSERT INTO PACIENTES (CPF, NOME, SEXO)
VALUES ('00011022099', 'Maria Clara', 'F');
INSERT INTO PACIENTES (CPF, NOME, SEXO)
VALUES ('99925896374', 'José Pedro', 'M');

-- inserindo Médicos/Pacientes
insert into MedicosPacientes(crmMedico, cpfPaciente)
values ('123456/RS','12345678910');
insert into MedicosPacientes(crmMedico, cpfPaciente)
values ('573496/RS','32111078906');
insert into MedicosPacientes (crmMedico, cpfPaciente)
values ('456123/RS', '56389900020');
insert into MedicosPacientes(crmMedico, cpfPaciente) 
values('573496/RS', '00011022099');
insert into MedicosPacientes(crmMedico, cpfPaciente)
values ('789234/RS', '56389900020');

-- criando tabela consultas
create table consultas (
	idMedicoPaciente numeric,
	dataConsulta date,
	constraint pk_consultas primary key (idMedicoPaciente, dataConsulta),
	constraint fk_idMedicosPacientes foreign key (idMedicoPaciente) references medicosPacientes (idMedPac)
);

-- inserindo consultas
--Consultas

insert into consultas (idMedicoPaciente, dataConsulta)
values (1, convert (date, '24/08/2023',103));

insert into consultas (idMedicoPaciente, dataConsulta)
values (2, convert (date, '24/08/2023',103));

insert into consultas (idMedicoPaciente, dataConsulta)
values (2, convert(date, '06/02/2023',103));

insert into consultas (idMedicoPaciente, dataConsulta)
values (3, convert(date, '20/08/2023',103));

insert into consultas (idMedicoPaciente, dataConsulta)
values (4, convert(date, '21/08/2023',103));

insert into consultas (idMedicoPaciente, dataConsulta)
values(5, convert(date, '22/07/2023',103));

insert into consultas (idMedicoPaciente, dataConsulta)
values(5, convert(date, '20/08/2023',103));

select * from medicos;
select * from pacientes;
select * from medicosPacientes;
select * from consultas;