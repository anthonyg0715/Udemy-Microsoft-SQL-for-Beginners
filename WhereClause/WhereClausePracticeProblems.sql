/*Using the where clause to filter data and here is the common structure
select [column 1],...,[column N]
from [SchemaName].[TableName]
where [column name] comparision operator [some value]
Note: Here we use '' for strings the <> operator which is the not equals operator
We use the Disjunction OR and the Conjuction AND for logic and then also wrap them with
parenthesis to show order of operation. Then we cover IN which is just a neater way of 
writing so many OR statements. We also use the keyword BETWEEN so we dont have to use 
comparison operators. Then finally we go over LIKE and IS NOT NULL. When you use LIKE
in your where clause, it pretty much lets Sequel know that you should be expecting to see
wildcard statements. Then we went over the following wildcards %, _, and [chars]. Percent
means zero or more characters, the underscore means only one character, and the [chars] 
defines set and ranges of characters to match. IS NOT NULL means return the values you are 
checking for without NULL values.
*/

SELECT FirstName, LastName
FROM Person.Person
WHERE FirstName = 'Mark'

SELECT top 100 *
FROM Production.Product
WHERE ListPrice <> 0.00

SELECT *
FROM HumanResources.vEmployee
WHERE LastName < 'D'

SELECT *
FROM Person.StateProvince
WHERE CountryRegionCode = 'CA'

SELECT FirstName AS [Customer First Name], LastName AS [Customer Last Name]
FROM Sales.vIndividualCustomer
WHERE LastName = 'SMITH'

SELECT *
FROM Sales.vIndividualCustomer
WHERE CountryRegionName = 'Australia' OR (PhoneNumberType = 'Cell' And EmailPromotion = 0)

SELECT *
FROM HumanResources.vEmployeeDepartment
WHERE Department IN('Executive','Tool Design','Engineering')

SELECT *
FROM HumanResources.vEmployeeDepartment
WHERE Department = 'Executive' OR Department = 'Tool Design' OR Department = 'Engineering'

SELECT *
FROM HumanResources.vEmployeeDepartment
WHERE StartDate >= '7/1/2000' AND StartDate <= '6/30/2002'

SELECT *
FROM HumanResources.vEmployeeDepartment
WHERE StartDate BETWEEN '7/1/2000' AND '6/30/2002'

SELECT *
FROM Sales.vIndividualCustomer
WHERE LastName like 'R%'

SELECT *
FROM Sales.vIndividualCustomer
WHERE LastName like '%r'

SELECT *
FROM Sales.vIndividualCustomer
WHERE LastName IN('Lopez','Martin','Wood') AND FirstName LIKE '[C-L]%'

SELECT *
FROM Sales.SalesOrderHeader
WHERE SalesPersonID IS NOT NULL

SELECT SalesPersonID, TotalDue
FROM Sales.SalesOrderHeader
WHERE SalesPersonID IS NOT NULL AND TotalDue > 70000