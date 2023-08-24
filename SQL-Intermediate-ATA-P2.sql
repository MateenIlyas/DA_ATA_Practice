/* Shows all data from EmployeeSalary table */
SELECT *
FROM master.dbo.EmployeeSalary

/* Adding some more data into EmployeeDemographics table */
Insert into EmployeeDemographics VALUES
(1011, 'Ryan', 'Howard', 26, 'Male'),
(NULL, 'Holly', 'Flax', NULL, NULL),
(1013, 'Darryl', 'Philbin', NULL, 'Male')

/* Creating a new table WareHouseEmployeeDemographics */
Create Table WareHouseEmployeeDemographics
(
EmployeeID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50)
)

/* Adding data into WareHouseEmployeeDemographics table */
Insert into WareHouseEmployeeDemographics VALUES
(1013, 'Darryl', 'Philbin', NULL, 'Male'),
(1050, 'Roy', 'Anderson', 31, 'Male'),
(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
(1052, 'Val', 'Johnson', 31, 'Female')

/* Shows all data from EmployeeDemographics table */
SELECT *
FROM master.dbo.EmployeeDemographics

/* Shows all data from WareHouseEmployeeDemographics table */
SELECT *
FROM master.dbo.WareHouseEmployeeDemographics

/* Combines all data from EmployeeDemographics and WareHouseEmployeeDemographics tables and shows it to us (UNION of all data) */
SELECT *
FROM master.dbo.EmployeeDemographics
Full Outer JOIN master.dbo.WareHouseEmployeeDemographics
	ON EmployeeDemographics.EmployeeID = WareHouseEmployeeDemographics.EmployeeID

/* Combining both tables EmployeeDemographics and WareHouseEmployeeDemographics by taking their UNION */
/* It will take away the duplicate results and show the distinct/unique results only*/
SELECT *
FROM master.dbo.EmployeeDemographics
UNION
SELECT *
FROM master.dbo.WareHouseEmployeeDemographics

/* Combining both tables EmployeeDemographics and WareHouseEmployeeDemographics by using UNION ALL */
/* This statement will show even the duplicate results too*/
SELECT *
FROM master.dbo.EmployeeDemographics
UNION ALL
SELECT *
FROM master.dbo.WareHouseEmployeeDemographics
ORDER BY EmployeeID

/* Returns the specific columns based on the condition that Age column can't have a NULL value */
/* Also, orders the data in Ascending (By Default) manner */
SELECT FirstName, LastName, Age
FROM master.dbo.EmployeeDemographics
WHERE Age IS NOT NULL
ORDER BY Age

/* Returns the specific columns based on the condition that Age column can't have a NULL value */
/* Also, orders the data in Ascending (By Default) manner */
/* Shows three different cases for the fourth column with the alias "AgeCategory"*/
SELECT FirstName, LastName, Age,
CASE
	WHEN Age > 30 THEN 'Old'
	WHEN Age BETWEEN 27 AND 30 THEN 'Young'
	ELSE 'Baby'
END AS AgeCategory
FROM master.dbo.EmployeeDemographics
WHERE Age IS NOT NULL
ORDER BY Age

/* Returns the specific columns based on the condition that Age column can't have a NULL value */
/* Also, orders the data in Ascending (By Default) manner */
/* Shows three different cases for the fourth column with the alias "AgeCategory" */
/* If multiple cases become true, action of only the very first case will get performed */
SELECT FirstName, LastName, Age,
CASE
	WHEN Age > 30 THEN 'Old'
	WHEN Age = 38 THEN 'Stanley'
	ELSE 'Baby'
END AS AgeCategory
FROM master.dbo.EmployeeDemographics
WHERE Age IS NOT NULL
ORDER BY Age

SELECT FirstName, LastName, Age,
CASE
	WHEN Age = 38 THEN 'Stanley'
	WHEN Age > 30 THEN 'Old'
	ELSE 'Baby'
END AS AgeCategory
FROM master.dbo.EmployeeDemographics
WHERE Age IS NOT NULL
ORDER BY Age

/* Putting the CASE statements for the salary increments */
/* Salary raise for Salesman is 10%, for Accountant is 5%, for HR is 1%, and for everyone else the raise is 3%*/
SELECT FirstName, LastName, JobTitle, Salary,
CASE
	WHEN JobTitle = 'Salesman' THEN Salary + (Salary * 0.10)
	WHEN JobTitle = 'Accountant' THEN Salary + (Salary * 0.05)
	WHEN JobTitle = 'HR' THEN Salary + (Salary * 0.01)
	ELSE Salary + (Salary * 0.03)
END AS RaisedSalary
FROM master.dbo.EmployeeDemographics
JOIN master.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

SELECT FirstName, LastName, JobTitle, Salary,
CASE
	WHEN JobTitle = 'Salesman' THEN (Salary * 0.10)
	WHEN JobTitle = 'Accountant' THEN (Salary * 0.05)
	WHEN JobTitle = 'HR' THEN (Salary * 0.01)
	ELSE (Salary * 0.03)
END AS Raise,
CASE
	WHEN JobTitle = 'Salesman' THEN Salary + (Salary * 0.10)
	WHEN JobTitle = 'Accountant' THEN Salary + (Salary * 0.05)
	WHEN JobTitle = 'HR' THEN Salary + (Salary * 0.01)
	ELSE Salary + (Salary * 0.03)
END AS RaisedSalary
FROM master.dbo.EmployeeDemographics
JOIN master.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

/* Putting the HAVING clause to see counts of employees */
/* The output will show us the count of employees greater than 1 */
/* We must use HAVING clause after the GROUP BY statement as it relies on that */
SELECT JobTitle, COUNT(JobTitle)
FROM master.dbo.EmployeeDemographics
JOIN master.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING COUNT(JobTitle) > 1

/* Putting the HAVING clause to see average salary of different JobTitles */
/* The output will show us the average salary of JobTitles greater than 45000 */
SELECT JobTitle, AVG(Salary)
FROM master.dbo.EmployeeDemographics
JOIN master.dbo.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING AVG(Salary) > 45000
ORDER BY AVG(Salary)
