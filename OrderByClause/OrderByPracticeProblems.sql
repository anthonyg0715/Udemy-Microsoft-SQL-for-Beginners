/*
We are going to go over the order by clause which is followed by group by and having in 
SEQUEL statements We will go over group by and having later. For now here is the following 
notation for using order by. 
SELECT Column 1, Column 2, ... , Column N
FROM [SchemaName].[TableName]
WHERE ColumnName [some operator] then [some filtering condition]
ORDER BY ColumnName, or ColumnOrdinal, or ColumnAlias then we choose [ASC/DESC]
*/

/*
1) From	the	HumanResources.vEmployeeDepartment	view,	return	the	FirstName,	
LastName	and	JobTitle	columns.		Sort	the	results	by	the	FirstName	column	in	
ascending	order.
*/

select FirstName, LastName, JobTitle
from HumanResources.vEmployeeDepartment
order by FirstName ASC /*Note that SQL automatically sorts in asc order so you don't need
to explicitly type it next time
*/

/*2) Modify	the	query	from	question	1	to	sort	
the	results	by	the	FirstName	column	in	
ascending	order	and	then	by	the	LastName	column	in	descending	order*/

select FirstName, LastName, JobTitle
from HumanResources.vEmployeeDepartment
order by FirstName, LastName DESC


/*3) From	the	Sales.vIndividualCustomer	view,	return	the	FirstName,	LastName	and	
CountryRegionName	columns.		Sort	the	results	by	the	CountryRegionName	column.		
Use	the	column	ordinal	in	the	ORDER	BY	clause*/

select FirstName, LastName, CountryRegionName
from Sales.vIndividualCustomer
order by 3

/*
4) From	the	Sales.vIndividualCustomer	view,	return	the	FirstName,	LastName	and	
CountryRegionName	columns	for	those	rows	with a	CountryRegionName	that	is	
either	�United	States�	or	�France�.		Sort	the	results	by	the	CountryRegionName	
column	in	ascending	order.	
*/

select FirstName, LastName, CountryRegionName
from Sales.vIndividualCustomer
where CountryRegionName IN('United States','France')
order by 3

/*
5) From	the	Sales.vStoreWithDemographics	view,	return	the	Name,	AnnualSales,	
YearOpened,	SquareFeet,	and	NumberEmployees	columns.		Give	the	SquareFeet	
column	the	alias	�Store	Size�	and	the	NumberEmployees	column	the	alias	�Total	
Employees�.	
Return	only those	rows with AnnualSales greater than 1,000,000 and with 
NumberEmployees	greater	than	or	equal	to	45.		Order	your	results by	the	
�Store	Size�	alias	in	descending	order	and	then	by	the	�Total	Employees�	alias	in	
descending	order
*/

select Name, AnnualSales, YearOpened, 
SquareFeet as [Store Size], 
NumberEmployees as [Total Employees]
from Sales.vStoreWithDemographics
where AnnualSales > 1000000 AND NumberEmployees >= 45
order by [Store Size] desc, [Total Employees] desc

