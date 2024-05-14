/*1. O gerente comercial pediu a você uma análise da Quantidade Vendida e Quantidade
Devolvida para o canal de venda mais importante da empresa: Store.
Utilize uma função SQL para fazer essas consultas no seu banco de dados. Obs: Faça essa
análise considerando a tabela FactSales.*/
SELECT 
	SalesAmount AS QT_VENDIDA,
	ReturnAmount AS QT_DEVOLVIDA
FROM FactSales

/*
2. Uma nova ação no setor de Marketing precisará avaliar a média salarial de todos os clientes
da empresa, mas apenas de ocupação Professional. Utilize um comando SQL para atingir esse
resultado.*/

SELECT 
AVG(YearlyIncome)
FROM DimCustomer
where Occupation = 'Professional'

/*
3. Você precisará fazer uma análise da quantidade de funcionários das lojas registradas na
empresa. O seu gerente te pediu os seguintes números e informações:
a) Quantos funcionários tem a loja com mais funcionários?
b) Qual é o nome dessa loja?
c) Quantos funcionários tem a loja com menos funcionários?
d) Qual é o nome dessa loja?*/

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
4. A área de RH está com uma nova ação para a empresa, e para isso precisa saber a quantidade
total de funcionários do sexo Masculino e do sexo Feminino.
a) Descubra essas duas informações utilizando o SQL.
b) O funcionário e a funcionária mais antigos receberão uma homenagem. Descubra as
seguintes informações de cada um deles: Nome, E-mail, Data de Contratação.*/
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
 HireDate as Contratação
 from DimEmployee
 Where Gender = 'F'
 order by (HireDate) asc

  select top (1) 
 FirstName as Nome,
 EmailAddress as Email,
 HireDate as Contratação
 from DimEmployee
 Where Gender = 'M'
 order by (HireDate) asc
 
/*
5. Agora você precisa fazer uma análise dos produtos. Será necessário descobrir as seguintes
informações:
a) Quantidade distinta de cores de produtos.
b) Quantidade distinta de marcas
c) Quantidade distinta de classes de produto
Para simplificar, você pode fazer isso em uma mesma consulta.*/

select 
count (distinct ColorName) as 'cores',
count (distinct BrandName) as 'marcas',
count (distinct ClassName) as 'classes'
from DimProduct
