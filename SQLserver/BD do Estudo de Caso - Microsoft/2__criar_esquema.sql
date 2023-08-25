-- RELACIONAL

CREATE TABLE tipos_telefones (
	cod_tipo_telefone numeric ( 2 ) NOT NULL,
	descricao varchar ( 20 ) NOT NULL,
	CONSTRAINT PK_TIPOS_TELEFONES PRIMARY KEY (cod_tipo_telefone)
	)
GO

CREATE TABLE administradores (
	cod_administrador numeric ( 6 ) NOT NULL,
	nivel_privilegio numeric ( 1 ) NOT NULL,
	CONSTRAINT PK_ADMINISTRADORES PRIMARY KEY (cod_administrador)
	)
GO
CREATE TABLE clientes_enderecos (
	cod_cliente numeric ( 6 ) NOT NULL,
	cod_endereco numeric ( 3 ) NOT NULL,
	data_cadastro DATE NOT NULL,
	CONSTRAINT PK_CLIENTES_ENDERECOS PRIMARY KEY (cod_cliente, cod_endereco)
	)
GO
CREATE TABLE produtos (
	cod_produto numeric ( 5 ) NOT NULL,
	titulo varchar ( 200 ) NOT NULL,
	ano_lancamento DATE NOT NULL,
	importado CHAR ( 1 ) DEFAULT 'N' NOT NULL,
	preco numeric ( 10, 2 ) NOT NULL,
	prazo_entrega numeric ( 3 ) NOT NULL,
	CONSTRAINT PK_PRODUTOS PRIMARY KEY (cod_produto),
	CONSTRAINT CHK_PROD_IMPORTADO CHECK (importado in ('S','N'))
	)
GO
CREATE TABLE enderecos (
	cod_endereco numeric ( 3 ) NOT NULL,
	rua varchar ( 60 ) NOT NULL,
	numero numeric ( 5 ) NOT NULL,
	complemento varchar ( 20 ),
	cod_cidade numeric ( 4 ) NOT NULL,
	cep CHAR ( 8 ) NOT NULL,
	CONSTRAINT PK_ENDERECOS PRIMARY KEY (cod_endereco)
	)
GO
CREATE TABLE telefones (
	cod_cliente numeric ( 6 ) NOT NULL,
	cod_telefone numeric ( 2 ) NOT NULL,
	cod_tipo_telefone numeric ( 2 ) NOT NULL,
	ddd numeric ( 3 ),
	numero varchar ( 10 ) NOT NULL,
	CONSTRAINT PK_TELEFONES PRIMARY KEY (cod_cliente, cod_telefone)
	)
GO
CREATE TABLE clientes (
	cod_cliente numeric ( 6 ) NOT NULL,
	data_nascimento DATE,
	data_cadastro DATE NOT NULL,
	CONSTRAINT PK_CLIENTES PRIMARY KEY (cod_cliente)
	)
GO
CREATE TABLE estados (
	uf CHAR ( 2 ) NOT NULL,
	nome varchar ( 40 ) NOT NULL,
	regiao CHAR ( 2 ) NOT NULL,
	CONSTRAINT PK_ESTADOS PRIMARY KEY (uf)
	)
GO
CREATE TABLE usuarios (
	cod_usuario numeric ( 6 ) NOT NULL,
	nome varchar ( 100 ) NOT NULL,
	cpf CHAR ( 11 ) NOT NULL,
	email varchar ( 40 ) NOT NULL,
	username varchar ( 20 ) NOT NULL,
	password varchar ( 20 ) NOT NULL,
	CONSTRAINT PK_USUARIOS PRIMARY KEY (cod_usuario),
	CONSTRAINT AK_USU_CPF UNIQUE (cpf),
	CONSTRAINT AK_USU_USERNAME UNIQUE (username)
	)
GO
CREATE TABLE cidades (
	cod_cidade numeric ( 4 ) NOT NULL,
	nome varchar ( 60 ) NOT NULL,
	uf CHAR ( 2 ) NOT NULL,
	CONSTRAINT PK_CIDADES PRIMARY KEY (cod_cidade)
	)
GO
CREATE TABLE pedidos_produtos (
	num_pedido numeric ( 7 ) NOT NULL,
	cod_produto numeric ( 5 ) NOT NULL,
	quantidade numeric ( 3 ) NOT NULL,
	valor_unitario numeric ( 10, 2 ) NOT NULL,
	CONSTRAINT PK_PEDIDOS_PRODUTOS PRIMARY KEY (num_pedido, cod_produto)
	)
GO
CREATE TABLE autores (
	cod_autor numeric ( 4 ) NOT NULL,
	nome varchar ( 100 ) NOT NULL,
	descricao varchar ( 1024 ),
	CONSTRAINT PK_AUTORES PRIMARY KEY (cod_autor)
	)
GO
CREATE TABLE pedidos (
	num_pedido numeric ( 7 ) NOT NULL,
	cod_cliente numeric ( 6 ) NOT NULL,
	cod_endereco numeric ( 3 ) NOT NULL,
	data_emissao DATE NOT NULL,
	CONSTRAINT PK_PEDIDOS PRIMARY KEY (num_pedido)
	)
GO
CREATE TABLE autores_produtos (
	cod_autor numeric ( 4 ) NOT NULL,
	cod_produto numeric ( 5 ) NOT NULL,
	CONSTRAINT PK_AUTORES_PRODUTOS PRIMARY KEY (cod_autor, cod_produto)
	)
GO
ALTER TABLE administradores ADD  CONSTRAINT FK_USU_ADM FOREIGN KEY (cod_administrador) REFERENCES usuarios (cod_usuario)
GO
ALTER TABLE clientes_enderecos ADD CONSTRAINT FK_CLI_CLIEND FOREIGN KEY (cod_cliente) REFERENCES clientes (cod_cliente)
GO
ALTER TABLE clientes_enderecos ADD CONSTRAINT FK_END_CLIEND FOREIGN KEY (cod_endereco) REFERENCES enderecos (cod_endereco)
GO
ALTER TABLE enderecos ADD CONSTRAINT FK_CID_END FOREIGN KEY (cod_cidade) REFERENCES cidades (cod_cidade)
GO
ALTER TABLE telefones ADD CONSTRAINT FK_CLI_TEL FOREIGN KEY (cod_cliente) REFERENCES clientes (cod_cliente)
GO
ALTER TABLE telefones ADD CONSTRAINT FK_TIPTEL_TEL FOREIGN KEY (cod_tipo_telefone) REFERENCES tipos_telefones (cod_tipo_telefone)
GO
ALTER TABLE clientes ADD CONSTRAINT FK_USU_CLI FOREIGN KEY (cod_cliente) REFERENCES usuarios (cod_usuario)
GO
ALTER TABLE cidades ADD CONSTRAINT FK_EST_CID FOREIGN KEY (uf) REFERENCES estados (uf)
GO
ALTER TABLE pedidos_produtos ADD CONSTRAINT FK_PED_PEDPROD FOREIGN KEY (num_pedido) REFERENCES pedidos (num_pedido)
GO
ALTER TABLE pedidos_produtos ADD CONSTRAINT FK_PROD_PEDPROD FOREIGN KEY (cod_produto) REFERENCES produtos (cod_produto)
GO
ALTER TABLE pedidos ADD CONSTRAINT FK_CLIEND_PED FOREIGN KEY (cod_cliente, cod_endereco) REFERENCES clientes_enderecos (cod_cliente, cod_endereco)
GO
ALTER TABLE autores_produtos ADD CONSTRAINT FK_AUT_AUTPROD FOREIGN KEY (cod_autor) REFERENCES autores (cod_autor)
GO
ALTER TABLE autores_produtos ADD CONSTRAINT FK_PRD_AUTPROD FOREIGN KEY (cod_produto) REFERENCES produtos (cod_produto)
GO
