/* Shows all data from EmployeeDemographics table */
SELECT *
FROM master.dbo.EmployeeDemographics

/* Shows all data from EmployeeSalary table */
SELECT *
FROM master.dbo.EmployeeSalary

/* Merges all data from EmployeeDemographics and EmployeeSalary tables and shows it to us (Intersection of all data) */
SELECT *
FROM master.dbo.EmployeeDemographics
JOIN master.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

/* Merges all data from EmployeeDemographics and EmployeeSalary tables and shows it to us (Intersection of all data) */
SELECT *
FROM master.dbo.EmployeeDemographics
Inner JOIN master.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

/* Combines all data from EmployeeDemographics and EmployeeSalary tables and shows it to us (UNION of all data) */
SELECT *
FROM master.dbo.EmployeeDemographics
Full Outer JOIN master.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

/* Takes intersection of all data from EmployeeDemographics and EmployeeSalary tables */
/* Shows it to us alongwith all data of Left (EmployeeDemographics) table */
SELECT *
FROM master.dbo.EmployeeDemographics
Left Outer JOIN master.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
	
/* Takes intersection of all data from EmployeeDemographics and EmployeeSalary tables */
/* Shows it to us alongwith all data of Right (EmployeeSalary) table */
SELECT *
FROM master.dbo.EmployeeDemographics
Right Outer JOIN master.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

/* Takes the intersection of both tables data and shows the specific columns */
SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
FROM master.dbo.EmployeeDemographics
Inner JOIN master.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

/* Takes the intersection of both tables data and shows the specific columns */
SELECT EmployeeSalary.EmployeeID, FirstName, LastName, JobTitle, Salary
FROM master.dbo.EmployeeDemographics
Inner JOIN master.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

/* Takes intersection of all data from EmployeeDemographics and EmployeeSalary tables */
/* Shows specific columns to us alongwith specific columns of Right (EmployeeSalary) table */
SELECT EmployeeSalary.EmployeeID, FirstName, LastName, JobTitle, Salary
FROM master.dbo.EmployeeDemographics
Right Outer JOIN master.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

/* Takes intersection of all data from EmployeeDemographics and EmployeeSalary tables */
/* Shows specific columns to us alongwith specific columns of Right (EmployeeSalary) table */
SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
FROM master.dbo.EmployeeDemographics
Right Outer JOIN master.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

/* Takes intersection of all data from EmployeeDemographics and EmployeeSalary tables */
/* Shows specific columns to us alongwith specific columns of Left (EmployeeDemographics) table */
SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
FROM master.dbo.EmployeeDemographics
Left Outer JOIN master.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

/* Takes intersection of all data from EmployeeDemographics and EmployeeSalary tables */
/* Shows specific columns to us alongwith specific columns of Left (EmployeeDemographics) table */
SELECT EmployeeSalary.EmployeeID, FirstName, LastName, JobTitle, Salary
FROM master.dbo.EmployeeDemographics
Left Outer JOIN master.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

/* Finds the highest salary (overlooking Michael's) data from EmployeeDemographics and EmployeeSalary tables */
/* Shows the specific columns in a descending order of Salary from the EmployeeDemographics table */
SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, Salary
FROM master.dbo.EmployeeDemographics
Inner JOIN master.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE FirstName <> 'Michael'
ORDER BY Salary DESC

/* Finds the highest salary (overlooking Michael's) data from EmployeeDemographics and EmployeeSalary tables */
/* Shows the specific columns in a descending order of Salary from the EmployeeDemographics table */
SELECT JobTitle, AVG(Salary)
FROM master.dbo.EmployeeDemographics
Inner JOIN master.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE JobTitle = 'Salesman'
GROUP BY JobTitle
