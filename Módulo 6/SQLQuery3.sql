/*1. O gerente comercial pediu a voc� uma an�lise da Quantidade Vendida e Quantidade
Devolvida para o canal de venda mais importante da empresa: Store.
Utilize uma fun��o SQL para fazer essas consultas no seu banco de dados. Obs: Fa�a essa
an�lise considerando a tabela FactSales.*/
SELECT 
	SalesAmount AS QT_VENDIDA,
	ReturnAmount AS QT_DEVOLVIDA
FROM FactSales

/*
2. Uma nova a��o no setor de Marketing precisar� avaliar a m�dia salarial de todos os clientes
da empresa, mas apenas de ocupa��o Professional. Utilize um comando SQL para atingir esse
resultado.*/

SELECT 
AVG(YearlyIncome)
FROM DimCustomer
where Occupation = 'Professional'

/*
3. Voc� precisar� fazer uma an�lise da quantidade de funcion�rios das lojas registradas na
empresa. O seu gerente te pediu os seguintes n�meros e informa��es:
a) Quantos funcion�rios tem a loja com mais funcion�rios?
b) Qual � o nome dessa loja?
c) Quantos funcion�rios tem a loja com menos funcion�rios?
d) Qual � o nome dessa loja?*/

select * from DimStore
select 
max(EmployeeCount)
from DimStore

select top(1) *
from DimStore
order by (EmployeeCount) desc

select
min(EmployeeCount)
from DimStore

select top(1) *
from DimStore
order by (EmployeeCount) asc


/*
4. A �rea de RH est� com uma nova a��o para a empresa, e para isso precisa saber a quantidade
total de funcion�rios do sexo Masculino e do sexo Feminino.
a) Descubra essas duas informa��es utilizando o SQL.
b) O funcion�rio e a funcion�ria mais antigos receber�o uma homenagem. Descubra as
seguintes informa��es de cada um deles: Nome, E-mail, Data de Contrata��o.*/
 select * from DimEmployee
 select count (FirstName)
 from DimEmployee
 where Gender = 'F'

 select count (FirstName)
 from DimEmployee
 where Gender = 'M'

 select top (1) 
 FirstName as Nome,
 EmailAddress as Email,
 HireDate as Contrata��o
 from DimEmployee
 Where Gender = 'F'
 order by (HireDate) asc

  select top (1) 
 FirstName as Nome,
 EmailAddress as Email,
 HireDate as Contrata��o
 from DimEmployee
 Where Gender = 'M'
 order by (HireDate) asc
 
/*
5. Agora voc� precisa fazer uma an�lise dos produtos. Ser� necess�rio descobrir as seguintes
informa��es:
a) Quantidade distinta de cores de produtos.
b) Quantidade distinta de marcas
c) Quantidade distinta de classes de produto
Para simplificar, voc� pode fazer isso em uma mesma consulta.*/

select 
count (distinct ColorName) as 'cores',
count (distinct BrandName) as 'marcas',
count (distinct ClassName) as 'classes'
from DimProduct
