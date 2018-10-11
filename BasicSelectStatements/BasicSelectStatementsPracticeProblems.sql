/*Now we are looking at the basic select statement which returns rows and columns 
but doesn't do much filtering
*/

/*general form of a select statement 
select [column1], [column2], ... , [column N]
from [schema name].[table name]
*/

/*Working on basic selesct statements practice problems
Notes: TOP returns that many number of rows in case a table has way too many rows
PERCENT returns a percentage of the number of rows you choose and AS is column aliasing
Finally if you choose to run these SQL commands please make sure you highlight the one
you are trying to do otherwise SQL just runs all lines of code 
*/

select NationalIDNumber
from HumanResources.Employee

select NationalIDNumber, JobTitle
from HumanResources.Employee

select top 20 percent 
NationalIDNumber, JobTitle, BirthDate
from HumanResources.Employee

select top 500 
NationalIDNumber as [SSN], JobTitle as [Job Title], BirthDate
from HumanResources.Employee

select *
from sales.SalesOrderHeader

select top 50 percent *
from Sales.Customer

select Name as [Product's Name]
from Production.vProductAndDescription

select top 400 *
from HumanResources.Department

select *
from Production.BillOfMaterials

select top 1500 *
from Sales.vPersonDemographics
