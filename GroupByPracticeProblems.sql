/*
We are now going to look at the group by clause and it is in the following notation
SELECT Column1, ..., ColumnN
FROM SchemaName.TableName
WHERE [Filter Criteria]
GROUP BY Column Name

ORDER BY Column Ordinal or Column Name and choose either Desc or Asc
So basically, the Group BY Statement is used with Aggregate functions to group the result
set by one or more of the Columns 
*/

/*
1) In the Person.Person	table, how many people are associated with each PersonType?
*/

select *
from Person.Person

SELECT PersonType, COUNT(*) 
FROM Person.Person
GROUP BY PersonType

/*
2) Using only one query, find out how many products	in Production.Product are the	
color “red”	and	how	many are	“black”.
*/

SELECT Color, COUNT(*) AS ProductCount
FROM Production.Product 
WHERE Color IN('red','black')
GROUP BY Color

/*
3) Using Sales.SalesOrderHeader, how many sales	occurred in	each territory between July 1, 
2005 and December 31, 2006?	 Order the results by the sale count in	descending	order.
*/

Select SOH.TerritoryID, COUNT(*) AS SalesCount
From Sales.SalesOrderHeader SOH
WHERE SOH.OrderDate BETWEEN '7/1/2005' AND '12/31/2006'
GROUP BY SOH.TerritoryID
Order By 2 desc

/*
4) Expanding on	the	previous example, group	the	results	not	by	the	TerritoryID	but	by	
the	name of	the	territory (found in	the	Sales.SalesTerritory table).
*/

Select ST.Name, COUNT(*) AS SalesCount
From Sales.SalesTerritory ST
Left Outer Join Sales.SalesOrderHeader SOH
ON ST.TerritoryID = SOH.TerritoryID
WHERE SOH.OrderDate BETWEEN '7/1/2005' AND '12/31/2006'
GROUP BY ST.Name

/*
5) Using the Book, BookAuthor, Author and/or Publisher tables, identify	how	many	
books each author either wrote or co-authored.
*/
/*
For some reason my database did not come with the book table, but this is how the query
would look like if I had it 
*/
Select AuthorName, COUNT(*) BookCount
From BookAuthor BA
Inner Join Author A
On BA.AuthorID = A.AuthorID
Group BY AuthorName