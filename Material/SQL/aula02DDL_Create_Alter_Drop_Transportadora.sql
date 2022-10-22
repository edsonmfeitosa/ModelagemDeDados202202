-- Aula do dia 21/10

-- Comandos DDL - Create | Alter | Drop


sp_help Viagem --sp_help mostra informações de tab
               --comando ALT + F1 (atalho)

-- Apagar a coluna cod_tipo_carga da tabela
-- viagem
-- apagar a regra de chave estrangeira
ALTER TABLE VIAGEM DROP 
	CONSTRAINT FK__viagem__cod_tipo__2B3F6F97

-- apagar a coluna cod_tipo_carga
ALTER TABLE VIAGEM DROP COLUMN cod_tipo_carga

-- Apagar a tabela Tipo_carga
drop table tipo_carga

-- Criar as tabelas: Pessoa, PessoaViagem
-- Carga, CargaViagem
create table carga
(
	cod_carga int identity(1,1) primary key,
	nome varchar(50) not null,
	descricao varchar(max)
)

create table passageiro
(
	cod_passageiro int identity(1,1) primary key,
	nome varchar(50) not null,
	telefone varchar(10) null,
	rg varchar(15)
)

create table viagemCarga
(
	cod_carga int not null 
			references carga(cod_carga),
	cod_viagem int not null
			references viagem (cod_viagem),
	quantidade int not null,
	primary key (cod_carga, cod_viagem)
)

create table viagemPassageiro
(
	cod_passageiro int not null references 
		passageiro (cod_passageiro),
	cod_viagem int not null references
		viagem (cod_viagem),
	data_cadastro datetime not null,
	primary key (cod_passageiro, cod_viagem)
)