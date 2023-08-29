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


