--1. Qual a quantidade de endereços por estado?
select uf, count(distinct enderecos.cod_endereco) as qtdEnderecos
from cidades
	join enderecos
	on cidades.cod_cidade = enderecos.cod_cidade
group by uf;

--2. Qual a quantidade de clientes de cada estado?
select uf, count(distinct clientes_enderecos.cod_cliente) as qtdClientes
from cidades
	join enderecos
	on cidades.cod_cidade = enderecos.cod_cidade
	join clientes_enderecos
	on enderecos.cod_endereco = clientes_enderecos.cod_endereco
group by uf;

--3. Ranking de estados por quantidade de clientes, em ordem decrescente de quantidade de clientes.
select uf, count(distinct clientes_enderecos.cod_cliente) as qtdClientes
from cidades
	join enderecos
	on cidades.cod_cidade = enderecos.cod_cidade
	join clientes_enderecos
	on enderecos.cod_endereco = clientes_enderecos.cod_endereco
group by uf
order by qtdClientes DESC;

--4. Ranking de regiões por quantidade de clientes, em ordem decrescente de quantidade de clientes.
select regiao, count(distinct clientes_enderecos.cod_cliente) as qtdClientes
from estados
	join cidades
	on estados.uf = cidades.uf
	join enderecos
	on cidades.cod_cidade = enderecos.cod_cidade
	join clientes_enderecos
	on enderecos.cod_endereco = clientes_enderecos.cod_endereco
group by regiao
order by qtdClientes DESC;

--5. Qual a quantidade de pedidos por região?
select regiao, count(distinct pedidos.num_pedido) as qtdPedidos
from estados
	join cidades
	on estados.uf = cidades.uf
	join enderecos
	on cidades.cod_cidade = enderecos.cod_cidade
	join clientes_enderecos
	on enderecos.cod_endereco = clientes_enderecos.cod_endereco
	join pedidos
	on clientes_enderecos.cod_cliente = pedidos.cod_cliente
group by regiao;

--6. Quantidade de pedidos por ano e região, considerando apenas os feitos nos anos de 2000 até 2004.
select regiao, year(pedidos.data_emissao) as anoPedido, count(distinct pedidos.num_pedido) as qtdPedidos
from estados
	join cidades
	on estados.uf = cidades.uf
	join enderecos
	on cidades.cod_cidade = enderecos.cod_cidade
	join clientes_enderecos
	on enderecos.cod_endereco = clientes_enderecos.cod_endereco
	join pedidos
	on clientes_enderecos.cod_cliente = pedidos.cod_cliente
where year(pedidos.data_emissao) between 2000 and 2004
group by regiao, year(pedidos.data_emissao)
order by regiao, anoPedido;

--no oracle seria:
select to_char(data_emissao,'yyyy'), regiao, count(num_pedido)
from estados join cidades using(uf)
             join enderecos using(cod_cidade)
             join clientes_enderecos using(cod_endereco)
             join pedidos using(cod_cliente,cod_endereco)
where to_char(data_emissao,'yyyy') >= '2000' and to_char(data_emissao,'yyyy') <= '2004' 
group by to_char(data_emissao,'yyyy'), regiao
order by to_char(data_emissao,'yyyy'), regiao;

--7. Qual o valor total gasto por cliente, ordenado em ordem decrescente de valor total?
select nome, sum(pedido_total)
from usuarios
join (
	SELECT pedidos.cod_cliente, pedidos_produtos.num_pedido, 
		SUM(pedidos_produtos.quantidade * pedidos_produtos.valor_unitario) AS pedido_total
	from pedidos
	join pedidos_produtos
	on pedidos.num_pedido = pedidos_produtos.num_pedido
	group by pedidos.cod_cliente, pedidos_produtos.num_pedido
	) pedidos_totais on usuarios.cod_usuario = pedidos_totais.cod_cliente
group by nome
order by sum(pedido_total) desc;

--no oracle seria:
select cod_cliente, sum(quantidade * valor_unitario) 
from estados join cidades using(uf)
             join enderecos using(cod_cidade)
             join clientes_enderecos using(cod_endereco)
             join pedidos using(cod_cliente,cod_endereco)
             join pedidos_produtos using(num_pedido)
group by cod_cliente
order by sum(quantidade * valor_unitario) desc;

--8. Valor total gasto por cliente, em ordem decrescente de valor total, apenas do Rio Grande do Sul.
select usuarios.nome, sum(pedido_total)
from usuarios
join (
	SELECT pedidos.cod_cliente, pedidos_produtos.num_pedido, 
		SUM(pedidos_produtos.quantidade * pedidos_produtos.valor_unitario) AS pedido_total
	from pedidos
	join pedidos_produtos
	on pedidos.num_pedido = pedidos_produtos.num_pedido
	group by pedidos.cod_cliente, pedidos_produtos.num_pedido
	) pedidos_totais on usuarios.cod_usuario = pedidos_totais.cod_cliente
	join clientes_enderecos
	on usuarios.cod_usuario = clientes_enderecos.cod_cliente
	join enderecos
	on clientes_enderecos.cod_endereco = enderecos.cod_endereco
	join cidades
	on enderecos.cod_cidade = cidades.cod_cidade
where cidades.uf = 'RS'
group by usuarios.nome
order by sum(pedido_total) desc;

--no oracle seria:
select cod_cliente, sum(quantidade * valor_unitario)
from estados join cidades using(uf)
             join enderecos using(cod_cidade)
             join clientes_enderecos using(cod_endereco)
             join pedidos using(cod_cliente,cod_endereco)
             join pedidos_produtos using(num_pedido)
where uf = 'RS'
group by cod_cliente
order by sum(quantidade * valor_unitario) desc;

--9. Qual o valor total vendido por autor?
select nome, sum(totalPedido) as totalVendido
from autores
join (
	select autores_produtos.cod_autor, pedidos_produtos.num_pedido,
		sum(pedidos_produtos.quantidade * pedidos_produtos.valor_unitario) AS totalPedido
	from pedidos_produtos
		join autores_produtos
		on pedidos_produtos.cod_produto = autores_produtos.cod_produto
	group by autores_produtos.cod_autor, pedidos_produtos.num_pedido
	) totaisPedidos on autores.cod_autor = totaisPedidos.cod_autor
group by nome;

--no oracle seria:
select cod_autor, sum( quantidade * valor_unitario )
from autores join autores_produtos using(cod_autor)
             join produtos using( cod_produto )
             join pedidos_produtos using( cod_produto )
group by cod_autor;

--10. Qual o valor médio faturado com as vendas por produto?
select titulo, avg(totalPedido) as mediaFaturamento
from produtos
	join (
		select num_pedido, cod_produto, sum(valor_unitario * quantidade) as totalPedido
		from pedidos_produtos
		group by num_pedido, cod_produto
	) totalDosPedidos on produtos.cod_produto = totalDosPedidos.cod_produto
group by titulo;

--no oracle seria:
select cod_produto, avg( quantidade * valor_unitario )
from produtos join pedidos_produtos using( cod_produto )
group by cod_produto;

--11. Qual o valor total de cada pedido?
select num_pedido, sum(valor_unitario * quantidade) as totalPedido
from pedidos_produtos
group by num_pedido;

--12. Qual o valor médio dos pedidos por estado?
select cidades.uf, avg(totalPedido) as valorMedioPedidos
from cidades
join (
	select pedidos.num_pedido, cidades.uf, sum(valor_unitario * quantidade) as totalPedido
	from pedidos_produtos
		join pedidos
		on pedidos_produtos.num_pedido = pedidos.num_pedido
		join enderecos
		on pedidos.cod_endereco = enderecos.cod_endereco
		join cidades
		on enderecos.cod_cidade = cidades.cod_cidade
	group by pedidos.num_pedido, cidades.uf
	) totaldosPedidos on cidades.uf = totaldosPedidos.uf
group by cidades.uf;

--no oracle seria:
select uf, sum(quantidade * valor_unitario) / count(distinct num_pedido)
from estados join cidades using(uf)
             join enderecos using(cod_cidade)
             join clientes_enderecos using(cod_endereco)
             join pedidos using(cod_cliente,cod_endereco)
             join pedidos_produtos using(num_pedido)
group by uf;

-- VIEWS (VISÕES)
--Crie uma visão com os dados dos produtos importados.
create view produtosImportados as
select cod_produto, titulo, ano_lancamento, preco
from produtos
where importado = 'S';

select * from produtosImportados;

--Crie uma visão que relacione a quantidade de pedidos por estado.
create view QtdPedidosPorEstado as
select estados.uf, count(distinct pedidos.num_pedido) as qtdPedidos
from estados
	join cidades
	on estados.uf = cidades.uf
	join enderecos
	on cidades.cod_cidade = enderecos.cod_cidade
	join clientes_enderecos
	on enderecos.cod_endereco = clientes_enderecos.cod_endereco
	join pedidos
	on clientes_enderecos.cod_cliente = pedidos.cod_cliente
group by estados.uf;

--Crie uma visão contendo o nome de cada cliente e o total de todos os seus pedidos.
create view totalPedidosPorCliente as
select nome, sum(pedido_total)
from usuarios
join (
	SELECT pedidos.cod_cliente, pedidos_produtos.num_pedido, 
		SUM(pedidos_produtos.quantidade * pedidos_produtos.valor_unitario) AS pedido_total
	from pedidos
	join pedidos_produtos
	on pedidos.num_pedido = pedidos_produtos.num_pedido
	group by pedidos.cod_cliente, pedidos_produtos.num_pedido
	) pedidos_totais on usuarios.cod_usuario = pedidos_totais.cod_cliente
group by nome
order by sum(pedido_total) desc;

--Experimente criar uma visão sobre outra visão anteriormente definida.
create view apenasTitulosImportados as
select titulo
from produtosImportados;

-- SUBCONSULTAS
--a) Listar o nome, o endereço (rua, número e complemento) e o número dos pedidos dos clientes.
select usuarios.nome, enderecos.rua, enderecos.numero, enderecos.complemento, pedidosCliente.num_pedido
from usuarios
	join clientes_enderecos
	on usuarios.cod_usuario = clientes_enderecos.cod_cliente
	join enderecos
	on clientes_enderecos.cod_endereco = enderecos.cod_endereco
	join (
		select cod_cliente, num_pedido
		from pedidos
		group by cod_cliente, num_pedido
	) as pedidosCliente on usuarios.cod_usuario = pedidosCliente.cod_cliente
group by usuarios.nome, enderecos.rua, enderecos.numero, enderecos.complemento, pedidosCliente.num_pedido;

--b) Listar o nome e os telefones de todos os clientes cadastrados há menos de 4 meses.
select nome, telefones.numero
from usuarios
	join telefones
	on usuarios.cod_usuario = telefones.cod_cliente
	join (
		select cod_cliente, data_cadastro
		from clientes
		where DATEDIFF(month, clientes.data_cadastro, getdate()) < 4
	) as cadastradosRecentes on telefones.cod_cliente = cadastradosRecentes.cod_cliente
group by nome, telefones.numero;

--c) Listar o nome das cidades do estado do Tocantins que possuam algum endereço cadastrado.
select nome
from cidades
	join (
		select enderecos.cod_cidade
		from enderecos
			join cidades
			on enderecos.cod_cidade = cidades.cod_cidade
		where cidades.uf = 'TO'
	) as cidadesTocantins on cidades.cod_cidade = cidadesTocantins.cod_cidade;

--d) Usuários q são clientes e administradores, ordenados pela data de cadastro (se não possui vai p/o final).
select nome, dataCadastros.data_cadastro
from usuarios
	join administradores
	on usuarios.cod_usuario = administradores.cod_administrador
	join (
		select cod_cliente, data_cadastro
		from clientes
	) as dataCadastros on usuarios.cod_usuario = dataCadastros.cod_cliente
order by dataCadastros.data_cadastro;

--e) Listar (uma única vez) o nome de cada administrador de nível 2 que reside no Paraná
	-- e adquiriu produto do autor 'Paulo Coelho' em ordem de nome e inversa de data de cadastro.
select usuarios.nome
from administradores
	join usuarios
	on administradores.cod_administrador = usuarios.cod_usuario
	join clientes
	on usuarios.cod_usuario = clientes.cod_cliente
	join (
		select cod_cliente
		from clientes_enderecos
			join enderecos
			on clientes_enderecos.cod_endereco = enderecos.cod_endereco
			join cidades
			on enderecos.cod_cidade = cidades.cod_cidade
		where cidades.uf = 'PR'
	) as clientesParana on usuarios.cod_usuario = clientesParana.cod_cliente
	join (
		select cod_cliente
		from pedidos
			join pedidos_produtos
			on pedidos.num_pedido = pedidos_produtos.num_pedido
			join autores_produtos
			on pedidos_produtos.cod_produto = autores_produtos.cod_produto
			join autores
			on autores_produtos.cod_autor = autores.cod_autor
		where autores.nome = 'Paulo Coelho'
	) as clientesPedidosAutor on administradores.cod_administrador = clientesPedidosAutor.cod_cliente
where nivel_privilegio = 2
order by usuarios.nome, clientes.data_cadastro desc;

--f) Título dos produtos importados, nome do autor (pode ser em linhas separadas), preço e prazo de entrega.
select titulo, autores.nome as nomeAutor, preco, prazo_entrega
from produtos
	join autores_produtos
	on produtos.cod_produto = autores_produtos.cod_produto
	join autores
	on autores_produtos.cod_autor = autores.cod_autor
where importado = 'S';

--g) Título dos produtos cujo autor é cliente da loja, levando em consideração somente possuir o mesmo nome.
select titulo, autores.nome
from produtos
	join autores_produtos
	on produtos.cod_produto = autores_produtos.cod_produto
	join autores
	on autores_produtos.cod_autor = autores.cod_autor
	join pedidos_produtos
	on produtos.cod_produto = pedidos_produtos.cod_produto
	join pedidos
	on pedidos_produtos.num_pedido = pedidos.num_pedido
	join usuarios
	on pedidos.cod_cliente = usuarios.cod_usuario
where autores.nome = usuarios.nome;

--h) Listar, para cada ano desde 1998, o valor total comercializado dos produtos importados,
	-- somente para aqueles anos em que o número de produtos importados vendidos foi maior que 1000 unidades.
select year(data_emissao) as ano, sum(valor_unitario * quantidade) as valorTotalVendido
from produtosImportados
	join pedidos_produtos
	on produtosImportados.cod_produto = pedidos_produtos.cod_produto
	join pedidos
	on pedidos_produtos.num_pedido = pedidos.num_pedido
group by year(data_emissao)
	having year(data_emissao) >= 1998 and
		count(quantidade) > 1000
order by year(data_emissao);

--i) Listar nome e prazo dos produtos do último pedido de clientes iniciados com 'Paul'.
select titulo, prazo_entrega, nome as nomeCliente, data_emissao as dataUltimoPedido
from pedidos_produtos
	join produtos
	on pedidos_produtos.cod_produto = produtos.cod_produto
	join (
		select usuarios.nome, MAX(data_emissao) AS data_emissao, pedidos.num_pedido
		from pedidos
			join usuarios
			on pedidos.cod_cliente = usuarios.cod_usuario
		where usuarios.nome like 'Paul%'
		group by usuarios.nome, pedidos.num_pedido
	) as pedidosPaulo on pedidos_produtos.num_pedido = pedidosPaulo.num_pedido
where data_emissao = pedidosPaulo.data_emissao;

--j) Título dos produtos importados com total vendido após nov/2002 em mais de 10 pedidos.
select titulo, sum(quantidade * valor_unitario) as totalVendido
from produtosImportados
	join pedidos_produtos
	on produtosImportados.cod_produto = pedidos_produtos.cod_produto
	join pedidos
	on pedidos_produtos.num_pedido = pedidos.num_pedido
where year(data_emissao) >= 1900
	and month(data_emissao) >= 11
group by titulo
	having count(pedidos.num_pedido) > 10;