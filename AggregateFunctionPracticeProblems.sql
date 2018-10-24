/*
1) How many rows are in	the	Person.Person table? Use an	aggregate function NOT	“SELECT	*”.
*/

Select COUNT(*)
FROM Person.Person

/*
2) How	many rows in the Person.Person table do	not	have a NULL	value in the MiddleName	
column?
*/

SELECT COUNT(MiddleName)
FROM Person.Person
WHERE MiddleName IS NOT NULL

/*
3) What	is the average StandardCost	(located in	Production.Product)	for	each product	
where the StandardCost is greater than $0.00?
*/

SELECT AVG(StandardCost)
FROM Production.Product
WHERE StandardCost > 0

/*
4) What	is the average Freight amount for each sale	(found	in	Sales.SalesOrderHeader)	
where the sale took	place in TerritoryID 4?
*/

SELECT AVG(Freight)
FROM Sales.SalesOrderHeader
WHERE TerritoryID = 4

/*
5) How expensive is	the	most expensive product,	by ListPrice, in the table 
Production.Product?
*/

SELECT MAX(ListPrice)
FROM Production.Product

/*
Join the Production.Product table and the Production.ProductInventory table for only the
products that appear in both tables. Use the ProductID as the joining column. Production.
ProductInventory contains the quantity of each product (several rows can appear for each
product to indicate that the product appears in multiple locations). Your goal is to
determine how much money we would earn if we sold every product for its list price greater
than $0. That is, if you summed the product for each product's inventory by its list price,
what would that value be? (Hint: This is intentionally challenging. You	must use an	
aggregate function with	a mathematical expression to accomplish	your goal)
*/

select SUM(PP.ListPrice * P.Quantity)
from Production.ProductInventory P
INNER JOIN Production.Product PP
ON P.ProductID = PP.ProductID
WHERE PP.ListPrice > 0
