/* Displaying all data from the EmployeeDemographics Table */
SELECT *
FROM master.dbo.EmployeeDemographics

/* Updating the EmployeeDemographics Table */
/* Setting the EmployeeID of an employee Holly Flax */
UPDATE master.dbo.EmployeeDemographics
SET EmployeeID = 1012
WHERE FirstName = 'Holly' and LastName = 'Flax'

/* Updating the EmployeeDemographics Table */
/* Setting the Age, Gender of an employee Holly Flax */
UPDATE master.dbo.EmployeeDemographics
SET Age = 31, Gender = 'Female'
WHERE FirstName = 'Holly' and LastName = 'Flax'

/* Deleting an entire row from the EmployeeDemographics table */
/* Finds the employee with ID and deletes their entire record from the table */
DELETE FROM master.dbo.EmployeeDemographics
WHERE EmployeeID = 1005

/* Better and Efficient method to delete a record is by displaying it first */
SELECT *
FROM master.dbo.EmployeeDemographics
WHERE EmployeeID = 1005

/* Then using the DELETE statement to delete the record */
DELETE FROM master.dbo.EmployeeDemographics
WHERE EmployeeID = 1005

/* This allows us to shorten the column names and show them in a congested space */
/* Here, we take the average of employee ages, and put it in a column called AvgAge */
SELECT AVG(Age) AS AvgAge
FROM master.dbo.EmployeeDemographics

/* This allows us to shorten the column names and show them in a congested space */
/* Here, we have given aliases to the columns as well as the tables */
/* First, we gave alias DEMO to the table EmployeeDemographics */
/* Second, the two columns are combined and their new name is FullName */
SELECT DEMO.FirstName + ' ' + Demo.LastName AS FullName
FROM master.dbo.EmployeeDemographics AS DEMO

/* This allows us to shorten the column names and show them in a congested space */
/* Here, we gave alias DEMO to the table EmployeeDemographics */
SELECT DEMO.EmployeeID
FROM master.dbo.EmployeeDemographics AS DEMO

/* Here we gave aliases to two tables */
/* Then we joined them on EmployeeID column */
/* Then we chose to display two columns i.e. EmployeeID from DEMO and Salary from Sal */
SELECT DEMO.EmployeeID, Sal.Salary
FROM master.dbo.EmployeeDemographics AS DEMO
JOIN master.dbo.EmployeeSalary AS Sal
	ON DEMO.EmployeeID = Sal.EmployeeID

/* This query is not a good way to use aliases as it lacks context and clarity */
/* It will create confusion about which table is a, or b, or c */
SELECT a.EmployeeID, a.FirstName, a.LastName, a.Age, a.Gender
FROM master.dbo.EmployeeDemographics AS a
LEFT JOIN master.dbo.EmployeeSalary AS b
	ON a.EmployeeID = b.EmployeeID
LEFT JOIN master.dbo.WareHouseEmployeeDemographics AS c
	ON a.EmployeeID = c.EmployeeID

/* This query provides context and clarity about all three tables */
/* DEMO is the alias for EmployeeDemographics */
/* Sal is the alias for EmployeeSalary */
/* Ware is the alias for WareHouseEmployeeDemographics */
SELECT DEMO.EmployeeID, DEMO.FirstName, DEMO.LastName, DEMO.Age, DEMO.Gender
FROM master.dbo.EmployeeDemographics AS DEMO
LEFT JOIN master.dbo.EmployeeSalary AS Sal
	ON DEMO.EmployeeID = Sal.EmployeeID
LEFT JOIN master.dbo.WareHouseEmployeeDemographics AS Ware
	ON DEMO.EmployeeID = Ware.EmployeeID

/* We are using the PARTITION BY to find the TotalGender present in the table */
/* It shows the record of an employee and the number of same gender employees working with them */
/* Unlike GROUP BY statement, PARTITION BY statement doesn't reduces the entire table into one or two rows */
SELECT DEMO.FirstName, DEMO.LastName, DEMO.Gender, Sal.Salary
, COUNT(DEMO.Gender) OVER (PARTITION BY DEMO.Gender) AS TotalGender
FROM master.dbo.EmployeeDemographics AS DEMO
LEFT JOIN master.dbo.EmployeeSalary AS Sal
	ON DEMO.EmployeeID = Sal.EmployeeID

/* This GROUP BY query will not add up the total number of same-gender employees */
/* Instead it will show the number of employees that has a specific firstname, lastname, gender, and salary */
SELECT DEMO.FirstName, DEMO.LastName, DEMO.Gender, Sal.Salary, COUNT(DEMO.Gender) AS TotalGender
FROM master.dbo.EmployeeDemographics AS DEMO
LEFT JOIN master.dbo.EmployeeSalary AS Sal
	ON DEMO.EmployeeID = Sal.EmployeeID
GROUP BY DEMO.FirstName, DEMO.LastName, DEMO.Gender, Sal.Salary

/* In this GROUP BY statement we will find out the total number of employees of each gender */
/* It will show the total number of females and total number of males in separate rows */
SELECT DEMO.Gender, COUNT(DEMO.Gender) AS TotalGender
FROM master.dbo.EmployeeDemographics AS DEMO
LEFT JOIN master.dbo.EmployeeSalary AS Sal
	ON DEMO.EmployeeID = Sal.EmployeeID
GROUP BY DEMO.Gender
