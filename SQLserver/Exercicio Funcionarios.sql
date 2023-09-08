CREATE TABLE Funcionarios (
  Cod NUMERic(2) PRIMARY KEY,
  Nome Varchar(30) NOT NULL,
  Sexo Char(1),
  Depto Varchar(15),
  Salario Numeric(10,2)
);

INSERT INTO Funcionarios (Cod, Nome, Sexo, Depto, Salario) VALUES (10,'Joao'  ,'M','Compras'  ,1000.00);
INSERT INTO Funcionarios (Cod, Nome, Sexo, Depto, Salario) VALUES (12,'Maria'  ,'F','Vendas'  , 970.00);
INSERT INTO Funcionarios (Cod, Nome, Sexo, Depto, Salario) VALUES (35,'Pedro'  ,'M','Expedicao', 800.00);
INSERT INTO Funcionarios (Cod, Nome, Sexo, Depto, Salario) VALUES (08,'Ana'    ,'F','Expedicao', 790.00);
INSERT INTO Funcionarios (Cod, Nome, Sexo, Depto, Salario) VALUES (37,'Carlos' ,'M','Vendas'  ,2090.00);
INSERT INTO Funcionarios (Cod, Nome, Sexo, Depto, Salario) VALUES (47,'Marco'  ,'M','Compras'  ,1970.00);
INSERT INTO Funcionarios (Cod, Nome, Sexo, Depto, Salario) VALUES (18,'Tiago'  ,'M','Expedicao', 700.00);
INSERT INTO Funcionarios (Cod, Nome, Sexo, Depto, Salario) VALUES (32,'Lucas'  ,'M','Vendas'  ,4820.00);
INSERT INTO Funcionarios (Cod, Nome, Sexo, Depto, Salario) VALUES (09,'Claudia','F','Vendas'  ,2220.00);
INSERT INTO Funcionarios (Cod, Nome, Sexo, Depto, Salario) VALUES (15,'Joana'  ,'F','Compras'  , 770.00);

-- QUESTAO A. Escreva os SELECTs --

--1. Quantidade de Funcionários por Departamento
select depto, count(distinct nome) as QtdFuncionarios
from Funcionarios
group by depto;

--2. Que departamentos tem média salarial maior que R$ 1000?
select Depto, round(avg(Salario),2) as MediaSalario
from Funcionarios
group by Depto
	having avg(Salario) > 1000;

--3. Média salárial dos funcionários por sexo do setor de Compras
select sexo, avg(salario) as mediaSalarios
from Funcionarios
where depto = 'Compras'
group by sexo;

--4. O maior salário do departamento que possui pelo menos duas pessoas
select depto, max(salario)
from Funcionarios
group by depto
	having count(distinct nome) >= 2;

--5. Número de pessoas por sexo, por departamento
select sexo, depto, count(*) as qtdPessoas
from Funcionarios
group by sexo, depto;

--6. Qual o total da folha de pagamento de cada departamento?
select Depto, sum(salario) as FolhaPagamento 
from Funcionarios
group by Depto;

--7. Soma dos salários dos Departamentos com mais de 1 funcionário
select Depto, sum(salario) as FolhaPagamento 
from Funcionarios
group by Depto
	having count(*) > 1;

select * from Funcionarios;

-- QUESTÕES PARTE 2. Modifique o Esquema --
--1. Exporte a coluna de departamento para outra tabela (crie codigo e descrição).
CREATE TABLE Departamentos (
  CodDepto int identity(1, 1) PRIMARY KEY,
  Descricao Varchar(15) NOT NULL,
);

insert into Departamentos (Descricao)
select distinct depto
from Funcionarios;

alter table Funcionarios
add idDepto int NULL;

update Funcionarios
set idDepto = 1
where depto = 'Compras';

update Funcionarios
set idDepto = 2
where depto = 'Expedicao';

update Funcionarios
set idDepto = 3
where depto = 'Vendas';

alter table Funcionarios
add constraint FK_DEPTO foreign key (idDepto)
	references Departamentos(CodDepto);

ALTER TABLE Funcionarios
DROP COLUMN Depto;

select * from Departamentos;
select * from Funcionarios;

--2. Refaça as consultas anteriores usando joins quando for necessário
-- 2.1. Quantidade de Funcionários por Departamento
select Departamentos.Descricao, count(distinct Funcionarios.nome) as QtdFuncionarios
from Funcionarios
	join Departamentos
	on Funcionarios.idDepto = Departamentos.CodDepto
group by Departamentos.Descricao;

-- 2.2. Que departamentos tem média salarial maior que R$ 1000?
select Departamentos.Descricao, round(avg(Salario),2) as MediaSalario
from Funcionarios
	join Departamentos
	on Funcionarios.idDepto = Departamentos.CodDepto
group by Departamentos.Descricao
	having avg(Salario) > 1000;

-- 2.3. Média salárial dos funcionários por sexo do setor de Compras
select sexo, avg(salario) as mediaSalarios
from Funcionarios
where idDepto = 1
group by sexo;

-- 2.4. O maior salário do departamento que possui pelo menos duas pessoas
select Departamentos.Descricao, max(salario)
from Funcionarios
	join Departamentos
	on Funcionarios.idDepto = Departamentos.CodDepto
group by Departamentos.Descricao
	having count(distinct nome) >= 2;

-- 2.5. Número de pessoas por sexo, por departamento
select sexo, depto, count(*) as qtdPessoas
from Funcionarios
group by sexo, depto;

-- 2.6. Qual o total da folha de pagamento de cada departamento?
select Departamentos.Descricao, sum(salario) as FolhaPagamento 
from Funcionarios
	join Departamentos
	on Funcionarios.idDepto = Departamentos.CodDepto
group by Departamentos.Descricao;

-- 2.7. Soma dos salários dos Departamentos com mais de 1 funcionário
select Departamentos.Descricao, sum(salario) as FolhaPagamento 
from Funcionarios
	join Departamentos
	on Funcionarios.idDepto = Departamentos.CodDepto
group by Departamentos.Descricao
	having count(*) > 1;

--3. Crie uma nova tabela com pelo menos 3 SELECTs que contenham funções de agregação e/ou group by.
CREATE TABLE Dependentes (
	CodDependente int identity(1, 1) PRIMARY KEY,
	Nome Varchar(50) NOT NULL,
	Identificador numeric(2),
	constraint FK_DEPENDENTES foreign key (Identificador) references Funcionarios(cod)
);
insert into Dependentes (Nome, Identificador)values ('Maria', 8);insert into Dependentes (Nome, Identificador)values ('João', 8);insert into Dependentes (Nome, Identificador)values ('Julia', 12);insert into Dependentes (Nome, Identificador)values ('Enzo', 32);insert into Dependentes (Nome, Identificador)values ('Murilo', 47);--mostra os funcionários que tem pelo menos 1 dependente select Funcionarios.nomefrom Funcionarios	join Dependentes	on Funcionarios.cod = Dependentes.Identificadorgroup by Funcionarios.nome	having count(Dependentes.Identificador) > 0;--mostra media de salario dos funcionários que tem dependente(s)select avg(salario) as mediaSalariosfrom Funcionarioswhere Funcionarios.cod in (	select Funcionarios.cod	from Funcionarios		join Dependentes		on Funcionarios.cod = Dependentes.Identificador	group by Funcionarios.cod		having count(Dependentes.Identificador) > 0	);--mostra os dependentes de cada funcionárioselect Funcionarios.nome, Dependentes.nomefrom Funcionarios	join Dependentes	on Funcionarios.cod = Dependentes.Identificador;