CREATE TABLE PRODS
(
 codigo NUMERIC(3) NOT NULL,
 nome VARCHAR(50) NOT NULL,
 preco NUMERIC (5,2) NOT NULL,
 tipo CHAR(1) NULL, 
 -- [S]uprimento, [C]omponente, [P]eriférico
 CONSTRAINT PK1 PRIMARY KEY (codigo)
);

INSERT INTO PRODS 
VALUES( 10, 'HD', 200, 'C');
INSERT INTO PRODS 
VALUES( 11, 'Memoria', 250, 'C');
INSERT INTO PRODS 
VALUES( 12, 'Impressora', 680,'P');
INSERT INTO PRODS 
VALUES( 13, 'Processador', 600, 'C');
INSERT INTO PRODS 
VALUES( 14, 'DVD-RW', 2, 'S');
INSERT INTO PRODS 
VALUES( 15, 'Papel A4', 19, 'S');
INSERT INTO PRODS 
VALUES( 16, 'Scanner', 199, 'P');

select * from prods;

--a) Quantos produtos existem na tabela PRODS?
select count(*) as qtd
from prods;

--b) Quantos tipos de produtos existem na tabela PRODS?
select count(distinct tipo)
from prods;

--c) Quantos produtos existem de cada tipo?
select tipo, count(*)
from prods
group by tipo;

--d) Qual a média de preço de todos os produtos?
select avg(preco)
from prods;

--e) Qual a média de preço dos suprimentos (tipo ‘S’)?
select avg(preco)
from prods
where tipo = 'S';

--f) Qual a média de preço dos produtos de cada tipo?
select tipo, avg(preco) as mediaPreco
from prods
group by tipo;

--inclui coluna usuario e insere valores 1 ou 2
ALTER TABLE PRODS ADD usuario NUMERIC(1) NULL;

UPDATE PRODS
SET usuario = 1
WHERE codigo IN (10,12,13,14);

UPDATE PRODS
SET usuario = 2
WHERE usuario IS NULL;

--agrupa a média de preço por tipo e usuario
SELECT usuario, TIPO, AVG(preco) as mediaPreco
FROM PRODS
GROUP BY tipo, usuario
ORDER BY tipo, usuario;

--HAVING é seletor de grupos
--agrupa por tipo quando o preço for maior que 100
SELECT tipo, AVG(preco)
FROM PRODS
GROUP BY tipo
	HAVING AVG(preco) > 100
;