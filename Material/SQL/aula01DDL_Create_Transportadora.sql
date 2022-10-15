--COMENTÁRIO
--Aula de criação do banco de dados
-- SQL - DDL (Create | Alter | Drop)

create database Transportadora
go

use Transportadora

create table Motorista
(
	cod_motorista int identity(1,1) primary key,
	nome varchar(40) not null,
	telefone varchar(16) null
)
go

create table tipo_carga
(
	cod_tipo_carga int identity(1,1) primary key,
	descricao varchar(300) not null
)
go
create table veiculo
(
	cod_veiculo int identity(1,1) primary key,
	placa varchar(10) not null,
	cor varchar(30),
	modelo varchar(50) not null,
	ano int null,
	qtde_lugares int not null
)
go

create table viagem
(
	cod_viagem int identity(1,1) primary key,
	cod_veiculo int not null references veiculo(cod_veiculo),
	cod_tipo_carga int not null references tipo_carga(cod_tipo_carga),
	cidade_destino varchar(100) not null,
	numero_destino varchar(15) not null,
	bairro_destino varchar(50) not null,
	rua_destino varchar(150) not null,
	cep_destino varchar(10) null,
	data_saida datetime not null,
	data_retorto datetime null,
	cod_motorista int not null references motorista(cod_motorista)
)
go