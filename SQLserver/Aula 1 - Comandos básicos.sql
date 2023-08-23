-- AULA 1
------------------------------------------------------------------------------------

-- criando tabela
create table veiculos
(
	placa char(8),
	ano numeric(4),
	km numeric(6),
	marca varchar(50),
	modelo varchar(50)
);

-- inserindo dados numa tabela
--maneira errada de inserir dados na tabela pois n�o h� garantias de q ir� pra coluna certa
insert into veiculos
values ('IJK-1212', 2012, 0, 'Chevrolet', 'Vectra');

--maneira correta de inserir dados na tabela, citando as colunas
insert into veiculos (placa, ano, km, marca, modelo)
values ('IJM-1556', 2001, 72045, 'Volkswagen', 'Gol');

insert into veiculos
values ('IOP-9012', 2022, 19841, 'Fiat', 'Uno');

insert into VEICULOS (placa, ano, km, marca, modelo)
values ('IAS-2203', 2022, 65500, 'VOLKSWAGEM','POLO');

INSERT INTO veiculos (placa, ano, km, marca, modelo)
VALUES ('JKA-1603', 2015, 62230, 'Toyota', 'Corolla');

insert into veiculos
values ('IZZ-1211', 2014,0,'BMW', 'X1');

INSERT INTO VEICULOS (placa, ano, km, marca, modelo)
VALUES('IVO-2158', 2022, 72045, 'Ford', 'New Fiesta');

INSERT INTO veiculos (placa, ano, km, marca, modelo)
VALUES ('KBB-0101', 2023, 100, 'Hyundai', 'Creta');

INSERT INTO veiculos (placa, ano, km, marca, modelo)
VALUES ('KAC-9999', 2022, 1500, 'Jeep', 'Renegade');

insert into veiculos
values ('JLS-4530', 2012, 30000, 'Chevrolet', 'Spin');

INSERT INTO VEICULOS (placa, ano, km, marca, modelo)
VALUES ('IDC-3942', 2021, 10181, 'Ford', 'Ka');

insert into veiculos (placa, ano, km, marca, modelo)
VALUES ('KMN-547', 2022, 29888, 'Chevrolet', 'Onix');

INSERT INTO VEICULOS (placa, ano, km, marca, modelo)
values ('WKL-0255', 1990, 20001, 'Chevrolet', 'Escort');

INSERT INTO VEICULOS (placa, ano, km, marca, modelo)
VALUES('IMC-2348', 2019, 19890, 'Volkswagen', 'Virtus');

INSERT INTO VEICULOS (placa, ano, km, marca, modelo)
VALUES ('LDY-2602', 2008, 29563, 'Ford', 'Fiesta');

insert into veiculos (placa, ano, km, marca, modelo)
values ('ISQ-3025', 2013, 50872, 'Volkswagen', 'Polo');

INSERT INTO veiculos (placa, ano, km, marca, modelo)
VALUES ('LMT-9617', 2021, 15821, 'Toyota', 'Hilux');

insert into veiculos (placa, ano, km, marca, modelo)
VALUES ('PKE-874', 2021, 45180, 'Renault', 'Logan');

INSERT INTO VEICULOS (placa, ano, km, marca, modelo)
VALUES ('IST-4623', 2001, 5400, 'Chervrolet', 'Celta');

INSERT INTO VEICULOS (placa, ano, km, marca, modelo)
VALUES ('IXR-1422', 2020, 59231, 'Nissan', 'Versa');

insert into veiculos (placa, ano, km, marca, modelo)
values ('JYK-6572', 2015, 8356, 'Chevrolet', 'Tracker');

insert into veiculos (placa, ano, km, marca, modelo)
values ('ILP', 2007, 15987, 'HB20', 'Hyundai');

insert into veiculos (placa, ano, km, marca, modelo)
values ('TSI-4090', 2020, 3560, 'Chevrolet', 'Tracker');

INSERT INTO VEICULOS (placa, ano, km, marca, modelo)
VALUES ('IXB0549', 2009, 21058, 'Fiat', 'Uno');

INSERT INTO veiculos (placa, ano, km, marca, modelo)
VALUES ('IGM-5794', 2019,58601,'Chevrolet','Onix');

-- ver todos os dados da tabela
select * from veiculos;

-- ordenar por uma coluna em ordem crescente
select *
from veiculos
order by km;

-- ordenar por uma coluna em ordem decrescente
select *
from veiculos
order by km DESC;

-- ordenar considerando mais de uma coluna (sendo a 2� como desempate)
select *
from veiculos
order by marca, km;

-- selecionar pra ver colunas(na ordem) de uma condi��o espec�fica
select km, placa, marca
from veiculos
where km = 0;

select placa, ano, modelo
from veiculos
where ano < 2015;

-- alterar um dado da tabela
update veiculos
set modelo = 'Vectra Elite 2.0'
where placa = 'IJK-1212';

update veiculos
set km = km + 1
where marca = 'Chevrolet';

-- update aumentando 100km em todos os veiculos num periodo de anos
update veiculos
set km = km + 100
where ano between 1990 and 2010;

-- alterando uma placa que faltou um digito no final (espa�o em branco na busca entao por ser varchar)
update veiculos
set placa = 'KMN-5471'
where PLACA = 'KMN-547 ';

-- diferente de � com simbolo <>
select placa, marca, km, ano
from veiculos
where km <> 0;

-- selec condicional e ordenado
select placa, marca, km, ano
from veiculos
where km <> 0;

-- usando AND, OR ou NOT
select placa, marca, ano
from veiculos
where ano < 2020
order by ano;

-- DELETE
delete from veiculos
where placa = 'IJM-1556';

delete from veiculos
where marca = 'Chervrolet';

-- contador de quantos veiculos no total da tabela
select count(*)
from veiculos;

-- contador de quantos veiculos s�o zero km, trocando o nome da coluna p/ quantidade
select count(*) as quantidade
from veiculos
where km = 0;

-- alterando dados e adicionando a uma coluna com novo nome a direita
select placa, km, km -1000 as km_adulterada
from veiculos;

-- mostra marcas sem repetir a mesma
select distinct marca
from veiculos;


-- EXERCÍCIO da aula 1 (criar tabela pessoas):

create table pessoas
(
	cpf char(11),
	nome varchar(100),
	idade smallint,
	sexo varchar(11),
	email varchar(50)
);

insert into pessoas (cpf, nome, idade, sexo, email)
values ('02562421058', 'Kelen Cristine Lacerda', 31, 'Feminino', 'cristinelacerda@protonmail.com');

insert into pessoas (cpf, nome, idade, sexo, email)
values ('65488987832', 'Alice Lauxen Gomes', 12, 'Feminino', 'alicelauxen@gmail.com');

insert into pessoas (cpf, nome, idade, sexo, email)
values ('00121145639', 'Raphael Martins Gomes', 40, 'Masculino', 'raphael@gauchafix.com.br');

insert into pessoas (cpf, nome, idade, sexo, email)
values ('34054495002', 'Aurora Carolina Lauxen', 65, 'Feminino', 'aurora.lauxen@gmail.com');

insert into pessoas (cpf, nome, idade, sexo, email)
values ('66666666666', 'Ozzy Cappucino Tino', 2, 'Masculino', 'buchinho@cats.com.br');

insert into pessoas (cpf, nome, idade, sexo, email)
values ('01522379156', 'Charles Marconatto', 31, 'Masculino', 'xmarconatto@hotmail.com');

insert into pessoas (cpf, nome, idade, sexo, email)
values ('03655817962', 'Fernanda Gomes', 36, 'Feminino', 'fezzocagomes@gmail.com');

insert into pessoas (cpf, nome, idade, sexo, email)
values ('84655921377', 'Cora Marconatto', 1, 'Feminino', 'cora.marconatto@gmail.com');

insert into pessoas (cpf, nome, idade, sexo, email)
values ('00159866347', 'Daniel Lauxen', 38, 'Masculino', 'daniellx@hotmail.com');

insert into pessoas (cpf, nome, idade, sexo, email)
values ('04758377914', 'Simone Oslaj', 34, 'Feminino', 'sihluizaoslaj@hotmail.com');

select count(*)
from pessoas;

select * from pessoas
order by nome;

-- como relacionaria cada carro da tabela veículos a uma pessoa, ou vários veiculos a uma mesma pessoa? Primeiro incluindo a coluna "proprietario" na tabela "veiculos", e depois relacionando colocando o nome:
UPDATE veiculos
SET proprietario = 'Alice Lauxen Gomes'
WHERE placa = 'IJK-1212';

