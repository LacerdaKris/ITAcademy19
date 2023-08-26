--Scripts de exemplos sobre Produto Cartesiano e Junções
-- Criação das tabelas
CREATE TABLE TR
(
 A numeric(2),
 B numeric(2),
 CONSTRAINT PK_TRA PRIMARY KEY(A)
);
CREATE TABLE TS
(
 B numeric(2),
 C numeric(2),
 D numeric(2),
 CONSTRAINT PK_TSB PRIMARY KEY(B)
);

-- Dados
INSERT INTO TR (A,B) VALUES (1,2);
INSERT INTO TR (A,B) VALUES (3,4);
INSERT INTO TS (B,C,D) VALUES (2,5,6);
INSERT INTO TS (B,C,D) VALUES (4,7,8);
INSERT INTO TS (B,C,D) VALUES (9,10,11);

-- Verificação dos conteúdos
SELECT * FROM TR;
SELECT * FROM TS;

-- Acrescentar:
INSERT INTO TR (A,B) VALUES (9,NULL);
INSERT INTO TS (B,C,D) VALUES (15, NULL, NULL);

-- Depois remover:
DELETE FROM TR WHERE A=9;
DELETE FROM TS WHERE B=15;
--deletou linha inteira pois os demais cambos da linha eram null

-- Produto Cartesiano
SELECT * from TR,TS;
SELECT * from TR,TS WHERE TR.B IS NOT NULL;

-- Mais elaborado:
SELECT * FROM TR,TS WHERE TR.B = TS.B;

-- Junções
SELECT * from TR JOIN TS ON (TR.B = TS.B);
SELECT * from TR LEFT JOIN TS ON (TR.B = TS.B);
SELECT * from TR RIGHT JOIN TS ON (TR.B = TS.B);
SELECT * from TR FULL OUTER JOIN TS ON (TR.B = TS.B);
