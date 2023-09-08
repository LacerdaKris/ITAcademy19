--excluindo tabela anterior de pessoas e criando nova
drop table pessoas;

CREATE TABLE PESSOAS
(
cpf VARCHAR(20) NOT NULL,
 nome VARCHAR(150) NOT NULL,
 idade NUMERIC(3) NULL,
endereco VARCHAR(150) NULL
);--incluir na nova  e vazia tabela pessoas os clientes do RS de estudo de casoINSERT INTO PESSOAS (cpf, nome, idade, endereco)
SELECT U.cpf, U.nome, 2023 - YEAR(C.data_nascimento) as idade,
	CONCAT(E.rua,', ',E.numero,' - ',cep) as endereco
FROM USUARIOS U
	JOIN CLIENTES C ON U.cod_usuario = C.cod_cliente
	JOIN clientes_enderecos CE ON C.cod_cliente= CE.cod_cliente
	JOIN enderecos E ON CE.cod_endereco= E.cod_endereco
	JOIN CIDADES CI ON E.cod_cidade = CI.cod_cidade
WHERE CI.uf = 'RS';select * from pessoas; 