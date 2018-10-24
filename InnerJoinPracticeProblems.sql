/*
The format for inner join is done the following way
select firstTableAlias.column 1, ..., secondTableAlias.column n, 
from schema.tableName1 {give the table name an alias}
inner join schemaname.tablename2 {also give an alias}
ON firstTableAlias.[column of choice] = secondTableAlias.[column of choice]
*/

/*
1) Using	the	Person.Person	and	Person.Password	tables,	INNER	JOIN	the	two	tables	
using	the	BusinessEntityID	column	and	return	the	FirstName	and	LastName	
columns	from	Person.Person	and	then	PasswordHash	column	from	
Person.Password
*/

select P.FirstName, P.LastName, PW.PasswordHash
from Person.Person P
inner join Person.[Password] PW 
ON P.BusinessEntityID = PW.BusinessEntityID

/*
2) Join	the	HumanResources.Employee	and	the	
HumanResources.EmployeeDepartmentHistory	tables	together	via	an	INNER	JOIN	
using	the	BusinessEntityID	column.		Return	the	BusinessEntityID,	
NationalIDNumber	and	JobTitle	columns	from	HumanResources.Employee	and	the	
DepartmentID,	StartDate,	and	EndDate	columns	from	
HumanResources.EmployeeDepartmentHistory.		Notice	the	number	of	rows	
returned.		Why	is	the	row	count	what	it	is? Since BusinessEntityID has
some duplicates, it is returning a few extra rows hence making it more than 290 rows
as expected
*/

select HR.BusinessEntityID, HR.NationalIDNumber, HR.JobTitle, HRD.DepartmentID, 
HRD.StartDate, HRD.EndDate
from HumanResources.Employee HR
inner join HumanResources.EmployeeDepartmentHistory HRD
on HR.BusinessEntityID = HRD.BusinessEntityID

/*
3) Expand	upon	the	query	used	in	question	1.		
Using	the	existing	query,	add	another	
INNER	JOIN	to	the	Person.EmailAddress	table	and	include	the	EmailAddress	column	
in	your	select	statement
*/

select P.FirstName, P.LastName, PW.PasswordHash, PE.EmailAddress
from Person.Person P
inner join Person.[Password] PW 
ON P.BusinessEntityID = PW.BusinessEntityID
inner join Person.EmailAddress PE
on P.BusinessEntityID = PE.BusinessEntityID

/*For question 4 and 5 my database does not contain the Books tables for some reason*/
