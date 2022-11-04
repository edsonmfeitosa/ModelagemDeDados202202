use master
go

if exists(select name from sys.databases where name = 'VendasED')
	drop database VendasED
go

create database VendasED
go
use VendasED

create table Cliente
(
	cod_cliente int identity(1,1) primary key,
	nome varchar(100) not null,
	telefone varchar(15) null,
	rg varchar(10) null,
	cpf varchar(15) not null,
	email varchar(50) null,
	sexo varchar(1), 
	endereco varchar(50),
	bairro varchar(30),
	cidade varchar(30),
	estado varchar(2),

)
go

create table Pedido
(
	cod_pedido int identity(1,1) primary key,
	cod_cliente int not null,
	cod_vendedor int not null,
	cod_condicao_pagto int not null,
	data datetime not null
)
go

create table Item_Pedido
(
	cod_pedido int not null,
	cod_produto int not null,
	quantidade int,
	valor numeric(10,2) not null,
	constraint pk_item_pedido primary key (cod_pedido, cod_produto)
)
go

create table Vendedor
(
	cod_vendedor int identity(1,1) primary key,
	nome varchar(30) not null,
	telefone varchar(15) null,
	rg varchar(10) null,
	cpf varchar(15) not null,
	email varchar(50) null,
	sexo char(1)
)
go

create table Condicao_Pagamento
(
	cod_condicao_pagto int identity(1,1) primary key,
	nome varchar(40) not null,
	descricao varchar(300)
)
go

create table Marca
(
	cod_marca int identity(1,1) primary key,
	nome varchar(50) not null
)
go

create table Produto
(
	cod_produto int identity(1,1) primary key,
	nome varchar(50) not null,
	descricao varchar(300),
	cod_marca int references marca(cod_marca)
)
go


create table Produto_Fornecedor
(
	cod_produto_fornecedor int identity(1,1) primary key,
	cod_produto int not null,
	cod_fornecedor int not null,
	valor numeric(10, 2) not null
)
go

create table Item_Compra
(
	cod_item_compra int identity(1,1) primary key,
	cod_compra int not null,
	cod_produto int not null,
	quantidade int not null,
	valor numeric(10,2) not null
)
go

create table Fornecedor
(
	cod_fornecedor int identity(1,1) primary key,
	cpf varchar(15) null,
	nome varchar(30) null,
	telefone varchar(15) not null,
	cnpj varchar(30) null,
	razao varchar(50) null
)
go

create table Compra
(
	cod_compra int identity(1,1) primary key,
	cod_fornecedor int not null,
	cod_condicao_pagto int not null,
	data datetime not null
)
go


--relacionamentos
alter table pedido add constraint fk_pedido_cliente foreign key(cod_cliente) references cliente (cod_cliente) 
alter table pedido add constraint fk_pedido_condicao_pagto foreign key (cod_condicao_pagto) references condicao_pagamento (cod_condicao_pagto)
alter table pedido add constraint fk_pedido_vendedor foreign key (cod_vendedor) references vendedor (cod_vendedor)

alter table item_pedido add constraint fk_item_pedido_pedido foreign key (cod_pedido) references pedido (cod_pedido)
alter table item_pedido add constraint fk_item_pedido_produto foreign key (cod_produto) references produto (cod_produto)

alter table produto_fornecedor add constraint fk_produto_fornecedor_produto foreign key (cod_produto) references produto (cod_produto)
alter table produto_fornecedor add constraint fk_produto_fornecedor_fornecedor foreign key (cod_fornecedor) references fornecedor (cod_fornecedor)

alter table item_compra add constraint fk_item_compra_produto foreign key (cod_produto) references produto (cod_produto)
alter table item_compra add constraint fk_item_compra_compra foreign key (cod_compra) references compra (cod_compra)

alter table compra add constraint fk_compra_condicao_pagto foreign key (cod_condicao_pagto) references condicao_pagamento (cod_condicao_pagto)
alter table compra add constraint fk_compra_fornecedor foreign key (cod_fornecedor) references fornecedor (cod_fornecedor)
go

--inserção de dados
insert into cliente values('edson martin feitosa', '(15)1234-5678', '12234565', '222.222.333-50', 'edsonfeitosa@ig.com.br', 'M', 'Rua Orlando Alvagenga, 1', 'Jd. Vera Cruz', 'Sorocaba', 'SP')
insert into cliente values('rafael moreno', '(15)0000-0000', null, '222.622.332-50', 'rafael@terra.com.br', 'M', 'Rua Mario Quintana, 123', 'Jd. Vera Cruz', 'São Roque', 'SP')
insert into cliente values('daniela martin feitosa', null, null, '222.622.332-50', null, 'F', 'Rua Guilherme Oliveira, 12', 'Jd. Vera das Acássicas', 'Votorantim', 'SP')
insert into cliente values('renata cristina scudeler', '(15)0001-0300', '246886', '111.622.332-50', 'renatacristina@uol.com', 'F', 'Rua Orlando Alvagenga, 1', 'Jd. Vera Cruz', 'Sorocaba', 'SP')
insert into cliente(nome, telefone, rg, cpf, email, sexo ) values('victor gabriel', '', '2847574', '222.622.332-xx', 'victor_gabriel@gmail.com', 'M')
insert into cliente values('maria chiquinha', '(15)1001-0320', '246886', '111.622.332-50', 'maria@uol', 'F', 'Jd. Vera Cruz', 'Sorocaba', NULL, NULL)
insert into cliente values('Vanessa Oliveira', '01-0300', '246886', '111.622.332-50', 'vanessa', 'F', 'Rua Orlando Alvagenga, 1', 'Jd. Vera Cruz', 'Sorocaba', 'SP')
insert into cliente values('Dom Pedro de Alcantara Albuquerque', '(11)1245-0300', '2225885', '122.445.786-50', 'pedro@hotmail.com', 'M', 'Rua Pedro José Sanger, 34', 'Jd. Novo Mundo', 'Sorocaba', 'SP')

insert into Vendedor values('Joãozinho', '123454', '2475766', '123.123-12', 'joaozinho@ig.com.br', 'M')
insert into Vendedor values('Maria', '333586', '5846585', '124578963', 'maria@aol.com.br', 'M')

insert into fornecedor values('222.555.888-80', 'Joaquim Silva', '(011)2344-6644', NULL, NULL)
insert into fornecedor values(null, null, '(19)7447-6685', '2746563863', 'XPTO Ltda')
insert into fornecedor values(null, null, '(16)3388-1123', '4568524', 'BlaBla Ltda')

insert into marca values('faber castell')
insert into marca values('labra')
insert into marca values('reggg')
insert into marca values('bic')
insert into marca values ('compactor 07')
insert into marca values ('Caderno Brasil')

insert into produto values('caneta', null, 4)
insert into produto values('caneta', null, 5)
insert into produto values('caderno', '10 matérias', 6)
insert into produto values('lápis', null, 1)
insert into produto values('régua', '30 centímetros', 3)

insert into Condicao_Pagamento values('Dinheiro', 'pagamento a vista')
insert into Condicao_Pagamento values('Cheque', 'pagamento em cheque')
insert into Condicao_Pagamento values('cartão', 'pagamento em cartão')

insert into pedido values(1, 2, 1, getdate())
insert into pedido values(1, 1, 2, getdate() + 1)
insert into pedido values(2, 2, 2, getdate() + 1)
insert into pedido values(3, 2, 1, getdate() + 2)
insert into pedido values(4, 1, 1, getdate())
insert into pedido values(5, 1, 1, getdate() - 1)
insert into pedido values(5, 1, 1, getdate() - 10) 

insert into Item_Pedido values(1, 1, 3, 1.5)
insert into Item_Pedido values(1, 3, 1, 10.0)
insert into Item_Pedido values(1, 4, 5, 1)
insert into Item_Pedido values(2, 5, 1, 2.5)
insert into Item_Pedido values(2, 1, 2, 1.6)
insert into Item_Pedido values(2, 4, 2, 0.95)
insert into Item_Pedido values(2, 3, 1, 10.50)
insert into Item_Pedido values(3, 1, 1, 1.5)
insert into Item_Pedido values(4, 3, 100, 9.55)
insert into Item_Pedido values(4, 1, 250, 1.45)
insert into Item_Pedido values(5, 4, 3, 0.95)

--produto_fornecedor

insert into Produto_Fornecedor values(1, 2,  0.45)
insert into Produto_Fornecedor values(1, 2, 0.4)
insert into Produto_Fornecedor values(2, 1,  0.55)
insert into Produto_Fornecedor values (3, 1,  9)
insert into Produto_Fornecedor values (3, 1,  8.95)
insert into Produto_Fornecedor values (3, 1,  9.15)
insert into Produto_Fornecedor values (4, 1,  0.15)
insert into Produto_Fornecedor values (4, 2,   0.15)
insert into Produto_Fornecedor values (5, 3,  0.40)

insert into Compra values (3, 2, getdate() -3)
insert into Compra values (3, 3, GETDATE())
insert into Compra values (2, 1, getdate()-1)

insert into item_compra values(1, 1, 20, 2)
insert into item_compra values(1, 2, 5, 1.90)
insert into item_compra values(2, 2, 3, 2 )
insert into item_compra values(2, 4, 5, 1.1)
insert into item_compra values(3, 5, 6, 1.25)


