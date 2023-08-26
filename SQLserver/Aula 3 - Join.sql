-- JUN��ES

--CROSS JOIN (multiplica registros da coluna 1 pela 2)
SELECT EST.uf, EST.nome, CID.uf, CID.nome
FROM ESTADOS EST CROSS JOIN CIDADES CID;

--EQUI-JOIN (une com base numa coluna q se repete em ambas, ent�o elimina ambiguidades)
select *
from estados JOIN cidades
	ON estados.uf = cidades.uf;

-- listar nome, data de nascimento e n� telefone dos clientes
select usuarios.nome, clientes.data_nascimento, telefones.numero
from usuarios join clientes
	on usuarios.cod_usuario = clientes.cod_cliente
	join telefones
	on clientes.cod_cliente = telefones.cod_cliente;

--titulos e pre�os p/ produtos importados iniciados com A, ordenados por pre�o
select titulo, preco
from produtos
where importado = 'S'
AND titulo like 'A%'
order by preco desc;

--anteriores mais uma coluna com autores
select titulo, preco, autores.nome
from produtos
	join autores_produtos
		on produtos.cod_produto = autores_produtos.cod_produto
	join autores
		on autores_produtos.cod_autor = autores.cod_autor
where importado = 'S'
AND titulo like 'A%'
order by preco desc;

--OUTER JOIN (LEFT, RIGHT OU FULL p/ ambos os lados)
--LEFT JOIN p/ permitir elementos da esquerda mesmo q n�o tenha na direita
select *
from estados left join cidades
	on estados.uf = cidades.uf;

--todos os clientes e seus telefones usando o left p/ pegar clientes sem telefone
select usuarios.nome, telefones.numero
from clientes
	join usuarios
		on clientes.cod_cliente = usuarios.cod_usuario
	left join telefones
		on clientes.cod_cliente = telefones.cod_cliente;

--EXERC�CIOS sobre JOIN
--1) t�tulo e nome do autor dos produtos importados, ordenados pelo t�tulo.
select titulo, autores.nome
from produtos
	join autores_produtos
		on autores_produtos.cod_produto = produtos.cod_produto
	join autores
		on autores.cod_autor = autores_produtos.cod_autor
where importado = 'S'
order by titulo;

--2) A quantidade de cidades cadastradas no estado de S�o Paulo.
select count (*) as cidadesSP
from cidades
where uf = 'SP';

--3) nome/e-mail/telefone dos clientes cujos numeros s�o do c�digo de �rea 51.
select nome, email, telefones.numero
from usuarios
	join clientes
		on clientes.cod_cliente = usuarios.cod_usuario
	join telefones
		on telefones.cod_cliente = clientes.cod_cliente
where telefones.ddd = 51;

--4. c�digo/nome/regi�o de cada cidade dos estados do Rio Grande do Sul, S�o Paulo e Pernambuco
     --cujo nome inicia por �Santa�. Ordenar pelo nome da cidade de forma decrescente.
select cod_cidade, cidades.nome, estados.regiao
from cidades
	join estados
		on estados.uf = cidades.uf
where (cidades.uf = 'RS' OR cidades.uf = 'SP' OR cidades.uf = 'PE')
	AND cidades.nome like 'Santa%'
order by cidades.nome desc;

--5. autores(ordenados e sem repetir) cujos produtos foram vendidos para algum cliente da regi�o norte.
select distinct autores.nome
from autores
	join autores_produtos
		on autores.cod_autor = autores_produtos.cod_autor
	join produtos
		on produtos.cod_produto = autores_produtos.cod_produto
	join pedidos_produtos
		on pedidos_produtos.cod_produto = produtos.cod_produto
	join pedidos
		on pedidos.num_pedido = pedidos_produtos.num_pedido
	join clientes_enderecos
		on clientes_enderecos.cod_cliente = pedidos.cod_cliente
	join enderecos
		on enderecos.cod_endereco = clientes_enderecos.cod_endereco
	join cidades
		on cidades.cod_cidade = enderecos.cod_cidade
	join estados
		on estados.uf = cidades.uf
where estados.regiao = 'N'
order by autores.nome;


-- UNIDADE 3 - Views
--passando sem dados sensiveis (cpf e password)
create view dados_dos_usuarios AS
	select cod_usuario, nome, email, username
	from usuarios;
select * from dados_dos_usuarios;

create view produtos_importados as
	select titulo, preco, prazo_entrega 
	from produtos
	where importado = 'S';
select * from produtos_importados;