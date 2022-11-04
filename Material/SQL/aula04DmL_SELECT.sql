-- Aula 04/11/2022 - DML - Select
	-- DML - Linguagem de Manipula��o de Dados
		-- Select | Insert | Update | Delete

-- Quais s�o os meus clientes?
select * -- * significa todas as col
from Cliente

select nome, telefone, email
from Cliente

-- Mostre os clientes do sexo feminino
Select *
from Cliente
where sexo = 'F'

--tabela de compara��o
--   = igual
--   > maior
--   < menor
--   >= maior ou igual
--   <= menor ou igual
--   != diferente
--   <> diferente


-- Mostre os clientes do sexo feminino
-- da cidade de Sorocaba
Select *
from Cliente
where sexo = 'F'
and cidade = 'Sorocaba'

-- E   -> AND
-- OU  -> OR
-- N�O -> NOT

-- Mostre todos os clientes
-- do sexo masculino
-- da cidade de sorocaba e Votorantim
select *
from cliente
where sexo = 'M'
and (cidade = 'Sorocaba'
or cidade = 'Votorantim')

select * 
from cliente
where sexo = 'M'
and cidade in ('Sorocaba', 'Votorantim')

--Consulta por nome
-- Like
	-- % (qualquer coisa)
	-- _ (qualquer letra)
select * 
from cliente
where nome like '_a%'

---Mostre os e-mails de clientes v�lidos
select nome, email
from cliente
where email not like '_%@_%._%'
or email is null


-- nulo
select * 
from Cliente
where cidade is not null

----------
select nome Nome, telefone Tel, rg RG, 'Edson' as Teste
from Cliente

select 1 + 2 as resultado

-- ordena��o 
select cidade, nome
from cliente
order by cidade asc, nome desc -- desc

-- Trazer nome de cidade sem repeti��o
select DISTINCT CIDADE
FROM CLIENTE
