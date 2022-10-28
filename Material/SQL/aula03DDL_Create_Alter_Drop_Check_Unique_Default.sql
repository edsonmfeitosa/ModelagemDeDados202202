-- DDL - Alter | Drop
	-- Regras:
		-- Unique | Default | Check

-- Alterar coluna
	-- Alterar coluna Tel em motorista:
		-- 14 caracteres e obrigatório
alter table motorista 
		alter column telefone varchar(14) not null

	-- Adicionar a coluna cpf em motorista
alter table motorista
		add cpf varchar(20) null

	--retirar a coluna RG de passageiro
alter table passageiro drop column rg

-- Exemplo de Unique | Default | Check
create table usuario
(
	cod_usuario int identity(1,1) primary key,
	nome varchar(100) not null,
	usuario int not null 
		check(usuario > 0 and usuario < 10000),
	email varchar(100) not null unique,
	tipo varchar(2) default('PF')
)

alter table usuario 
	drop constraint DF__usuario__tipo__5EBF139D 