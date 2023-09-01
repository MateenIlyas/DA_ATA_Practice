/* CTE only exists within the scope of a single query */
/* Here we can put a complex query inside a CTE and display all columns */
/* CTE does not gets stored anywhere so we have to rewrite it everytime we need it */
WITH CTE_Employee AS (
	SELECT DEMO.FirstName, DEMO.LastName, DEMO.Gender, Sal.Salary
	, COUNT(DEMO.Gender) OVER (PARTITION BY DEMO.Gender) AS TotalGender
	, AVG(Sal.Salary) OVER (PARTITION BY DEMO.Gender) AS AllAverageSalary
	FROM master.dbo.EmployeeDemographics AS DEMO
	JOIN master.dbo.EmployeeSalary AS Sal
		ON DEMO.EmployeeID = Sal.EmployeeID
	WHERE Salary > '45000'
)
SELECT *
FROM CTE_Employee

