--criando tabelas e adicionando chave estrangeira
CREATE TABLE employee (
    Fname varchar(15) not null,
    Minit char(1),
    Lname varchar(15) not null,
    Ssn char(9) not null, 
    Bdate date,
    Address varchar(30),
    Sex char(1),
    Salary decimal(10,2),
    Super_ssn char(9),
    Dno int not null,
    constraint chk_salary_employee check (Salary > 2000.0),
    constraint pk_employee primary key (Ssn)
);

ALTER TABLE employee
    ADD CONSTRAINT fk_employee
    FOREIGN KEY (Super_ssn) REFERENCES employee (Ssn)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

ALTER TABLE employee
    ADD CONSTRAINT DF_Dno DEFAULT 1 FOR Dno;

sp_columns employee;

CREATE TABLE department (
    Dname varchar(15) not null,
    Dnumber int not null,
    Mgr_ssn char(9) not null,
    Mgr_start_date date, 
    Dept_create_date date,
    constraint chk_date_dept check (Dept_create_date < Mgr_start_date),
    constraint pk_dept primary key (Dnumber),
    constraint unique_name_dept unique(Dname),
    FOREIGN KEY (Mgr_ssn) REFERENCES employee (Ssn)
);

--Apagando e adicionando nova chave estrangeira com ações em cascata aplicadas quando registros forem atualizados
ALTER TABLE department
DROP CONSTRAINT FK__departmen__Mgr_s__2C3393D0;

ALTER TABLE department
ADD CONSTRAINT fk_dept FOREIGN KEY (Mgr_ssn) REFERENCES employee(Ssn) ON UPDATE CASCADE;

sp_columns department;

CREATE TABLE dept_locations (
    Dnumber int not null,
    Dlocation varchar(15) not null,
    constraint pk_dept_locations primary key (Dnumber, Dlocation),
    FOREIGN KEY (Dnumber) REFERENCES department (Dnumber)
);

--Apagando e adicionando nova chave estrangeira com ações em cascata aplicadas quando registros forem excluídos ou atualizados
ALTER TABLE dept_locations
DROP CONSTRAINT FK__dept_loca__Dnumb__300424B4;

ALTER TABLE dept_locations
ADD CONSTRAINT fk_dept_locations FOREIGN KEY (Dnumber) REFERENCES department(Dnumber) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE project (
    Pname varchar(15) not null,
    Pnumber int not null,
    Plocation varchar(15),
    Dnum int not null,
    PRIMARY KEY (Pnumber),
    constraint unique_project unique (Pname),
    FOREIGN KEY (Dnum) REFERENCES department (Dnumber)
);

CREATE TABLE works_on (
    Essn char(9) not null,
    Pno int not null,
    Hours decimal(3,1) not null,
    PRIMARY KEY (Essn, Pno),
    FOREIGN KEY (Essn) REFERENCES employee (Ssn),
    FOREIGN KEY (Pno) REFERENCES project (Pnumber)
);

IF OBJECT_ID('dependent', 'U') IS NOT NULL
    DROP TABLE dependent;

CREATE TABLE dependent (
    Essn char(9) not null,
    Dependent_name varchar(15) not null,
    Sex char,
    Bdate date,
    Relationship varchar(8),
    PRIMARY KEY (Essn, Dependent_name),
    FOREIGN KEY (Essn) REFERENCES employee (Ssn)
);

sp_columns dependent;

--consultando FKs
SELECT 
    OBJECT_NAME(parent_object_id) AS TabelaReferente,
    name AS NomeRestricaoChaveEstrangeira
FROM sys.foreign_keys;

--inserindo dados nas tabelas:
INSERT INTO employee
VALUES
    ('John', 'B', 'Smith', '123456789', '1965-01-09', '731-Fondren-Houston-TX', 'M', 30000, '333445555', 5),
    ('Franklin', 'T', 'Wong', '333445555', '1955-12-08', '638-Voss-Houston-TX', 'M', 40000, '888665555', 5),
    ('Alicia', 'J', 'Zelaya', '999887777', '1968-01-19', '3321-Castle-Spring-TX', 'F', 25000, '987654321', 4),
    ('Jennifer', 'S', 'Wallace', '987654321', '1941-06-20', '291-Berry-Bellaire-TX', 'F', 43000, '888665555', 4),
    ('Ramesh', 'K', 'Narayan', '666884444', '1962-09-15', '975-Fire-Oak-Humble-TX', 'M', 38000, '333445555', 5),
    ('Joyce', 'A', 'English', '453453453', '1972-07-31', '5631-Rice-Houston-TX', 'F', 25000, '333445555', 5),
    ('Ahmad', 'V', 'Jabbar', '987987987', '1969-03-29', '980-Dallas-Houston-TX', 'M', 25000, '987654321', 4),
    ('James', 'E', 'Borg', '888665555', '1937-11-10', '450-Stone-Houston-TX', 'M', 55000, NULL, 1);

INSERT INTO dependent
VALUES
    ('333445555', 'Alice', 'F', '1986-04-05', 'Daughter'),
    ('333445555', 'Theodore', 'M', '1983-10-25', 'Son'),
    ('333445555', 'Joy', 'F', '1958-05-03', 'Spouse'),
    ('987654321', 'Abner', 'M', '1942-02-28', 'Spouse'),
    ('123456789', 'Michael', 'M', '1988-01-04', 'Son'),
    ('123456789', 'Alice', 'F', '1988-12-30', 'Daughter'),
    ('123456789', 'Elizabeth', 'F', '1967-05-05', 'Spouse');

INSERT INTO department
VALUES
    ('Research', 5, '333445555', '1988-05-22', '1986-05-22'),
    ('Administration', 4, '987654321', '1995-01-01', '1994-01-01'),
    ('Headquarters', 1, '888665555', '1981-06-19', '1980-06-19');

INSERT INTO dept_locations
VALUES
    (1, 'Houston'),
    (4, 'Stafford'),
    (5, 'Bellaire'),
    (5, 'Sugarland'),
    (5, 'Houston');

INSERT INTO project
VALUES
    ('ProductX', 1, 'Bellaire', 5),
    ('ProductY', 2, 'Sugarland', 5),
    ('ProductZ', 3, 'Houston', 5),
    ('Computerization', 10, 'Stafford', 4),
    ('Reorganization', 20, 'Houston', 1),
    ('Newbenefits', 30, 'Stafford', 4);

INSERT INTO works_on
VALUES
    ('123456789', 1, 32.5),
    ('123456789', 2, 7.5),
    ('666884444', 3, 40.0),
    ('453453453', 1, 20.0),
    ('453453453', 2, 20.0),
    ('333445555', 2, 10.0),
    ('333445555', 3, 10.0),
    ('333445555', 10, 10.0),
    ('333445555', 20, 10.0),
    ('999887777', 30, 30.0),
    ('999887777', 10, 10.0),
    ('987987987', 10, 35.0),
    ('987987987', 30, 5.0),
    ('987654321', 30, 20.0),
    ('987654321', 20, 15.0),
    ('888665555', 20, 0.0);

-- Selecionar todos os registros da tabela employee
SELECT * FROM employee;

-- Contar o número de dependentes para cada funcionário
SELECT e.Ssn, COUNT(d.Essn) 
FROM employee e
LEFT JOIN dependent d ON e.Ssn = d.Essn
GROUP BY e.Ssn;

-- Selecionar todos os registros da tabela dependent
SELECT * FROM dependent;

-- Selecionar a data de nascimento e o endereço para o funcionário com nome 'John B Smith'
SELECT Bdate, Address
FROM employee
WHERE Fname = 'John' AND Minit = 'B' AND Lname = 'Smith';

-- Selecionar todos os registros da tabela departament onde Dname é 'Research'
SELECT *
FROM department
WHERE Dname = 'Research';

-- Selecionar o nome, sobrenome e endereço dos funcionários do departamento 'Research'
SELECT e.Fname, e.Lname, e.Address
FROM employee e
INNER JOIN department d ON e.Dno = d.Dnumber
WHERE d.Dname = 'Research';

-- Selecionar todos os registros da tabela project
SELECT * FROM project;

-- Recuperar informações dos departamentos presentes em Stafford
SELECT d.Dname AS Department, d.Mgr_ssn AS Manager
FROM department d
INNER JOIN dept_locations l ON d.Dnumber = l.Dnumber
WHERE l.Dlocation = 'Stafford';

-- Recuperar informações dos departamentos e projetos localizados em Stafford
SELECT p.Pnumber, p.Dnum, e.Lname, e.Address, e.Bdate
FROM project p
INNER JOIN department d ON p.Dnum = d.Dnumber
INNER JOIN employee e ON d.Mgr_ssn = e.Ssn
WHERE p.Plocation = 'Stafford';

-- Selecionar todos os funcionários cujo Dno está em (3, 6, 9)
SELECT * FROM employee
WHERE Dno IN (3, 6, 9);

-- Selecionar data de nascimento e endereço para funcionário com nome 'John B Smith'
SELECT Bdate, Address
FROM employee
WHERE Fname = 'John' AND Minit = 'B' AND Lname = 'Smith';

-- Selecionar nome, sobrenome e endereço dos funcionários do departamento 'Research'
SELECT e.Fname, e.Lname, e.Address
FROM employee e
INNER JOIN department d ON e.Dno = d.Dnumber
WHERE d.Dname = 'Research';

-- Recuperar o valor do INSS (0.011 vezes o salário) para os funcionários
SELECT Fname, Lname, Salary, Salary * 0.011 AS INSS
FROM employee;

-- Definir um aumento de salário em 10% para os gerentes que trabalham no projeto 'ProductX'
SELECT e.Fname, e.Lname, 1.1 * e.Salary AS increased_sal
FROM employee e
INNER JOIN works_on w ON e.Ssn = w.Essn
INNER JOIN project p ON w.Pno = p.Pnumber
WHERE p.Pname = 'ProductX';

-- Concatenar e fornecer alias para o nome do departamento e gerente
SELECT d.Dname AS Department, CONCAT(e.Fname, ' ', e.Lname) AS Manager
FROM department d
INNER JOIN dept_locations l ON d.Dnumber = l.Dnumber
INNER JOIN employee e ON d.Mgr_ssn = e.Ssn;

-- Recuperar dados dos funcionários que trabalham para o departamento de pesquisa
SELECT e.Fname, e.Lname, e.Address
FROM employee e
INNER JOIN department d ON e.Dno = d.Dnumber
WHERE d.Dname = 'Research';