/*
Now we are looking at the Having Clause. The having cluase is similar to the where clause
except it filters data based on the aggregate function. Here is the folowwing notation.

SELECT Column1, ..., ColumnN, and then some aggregate functions if needed
FROM SchemaName.Tablename
WHERE [Filtered Criteria Based On Column]
Group BY Column Name, Column Ordinal
Having [Filtered Critera based On Aggregate Functions]
Order By Column Name, Column Ordinal, then choose desc or asc 
*/

/*
1) Find	the	total	sales	by	territory	for	all	rows	in	the	Sales.SalesOrderHeader	table.		
Return	only	those	territories	that	have	exceeded	$10	million	in	historical	sales.		
Return	the	total	sales	and	the	TerritoryID	column.
*/

SELECT
TerritoryID,
SUM(TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader
GROUP BY TerritoryID
HAVING SUM(TotalDue) > 10000000

/*
2) Using	the	query	from	the	previous	question,	join	to	the	Sales.SalesTerritory	table	
and	replace	the	TerritoryID	column	with	the	territory’s	name
*/

SELECT ST.Name, SUM(TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader SOH
Left Outer Join Sales.SalesTerritory ST
ON SOH.TerritoryID = ST.TerritoryID
Group By ST.Name
Having SUM(TotalDue) > 10000000

/*
3) Using the Production.Product	table, find	how	many products are associated with	
each color.	 Ignore	all	rows where the color has a NULL	value. Once	grouped, return	to	
the	results	only those colors that had at least	20 products	with that color.
*/

SELECT Color, COUNT(*) AS NumberOfProducts
FROM Production.Product
WHERE Color IS NOT NULL
GROUP BY COLOR
HAVING COUNT(*) >= 20

/*
4) Starting	with the Sales.SalesOrderHeader	table, join	to the Sales.SalesOrderDetail	
table. This	table contains the line	item details associated	with each sale. From	
Sales.SalesOrderDetail,	join to	the	Production.Product	table. Return the Name	
column from	Production.Product and assign it the column	alias “Product	Name”.		
For	each product, find out how many	of each	product	was	ordered	for	all	orders that	
occurred in	2006. Only output those	products where at least	200	were ordered.
*/

SELECT P.Name AS [Product Name], SUM(SOD.OrderQty) AS ProductOrderCount
FROM Sales.SalesOrderHeader SOH
Inner Join Sales.SalesOrderDetail SOD
ON SOH.SalesOrderID = SOD.SalesOrderID
Inner Join Production.Product P
ON SOD.ProductID = P.ProductID
WHERE SOH.OrderDate BETWEEN '1/1/2006' AND '12/31/2006'
GROUP BY P.Name
HAVING SUM(SOD.OrderQty) >= 200

/*
5) Find	the	first and last name	of each	customer who has placed	at least 6 orders	
between	July 1 , 2005 and December 31, 2006. Order your	results	by the number of	
orders placed in descending	order. (Hint: You will need	to join	to three tables	–
Sales.SalesOrderHeader,	Sales.Customer,	and	Person.Person. You will	use	every	
clause to complete this	query).
*/

SELECT P.FirstName, P.LastName, COUNT(*) OrderPlaced
FROM Sales.SalesOrderHeader SOH
INNER JOIN Sales.Customer C
ON SOH.CustomerID = C.CustomerID
INNER JOIN Person.Person P
ON C.PersonID = P.BusinessEntityID
WHERE SOH.OrderDate BETWEEN '7/1/2005' AND '12/31/2006'
GROUP BY P.FirstName, P.LastName
HAVING COUNT(*) >= 6
Order By 3 desc