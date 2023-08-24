-- WEEK THREE

-- Retrieve main dataset
SELECT * FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset` ;

-- Find employees that have NOT terminated
SELECT * FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
WHERE DateofTermination IS NULL ;
-- no values determined to the date of termination ^

-- Find employess that are terminated AND work in production
SELECT * FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
WHERE DateofTermination IS NOT NULL AND Department = 'Production' ;

-- Find employess that are terminated AND are female
SELECT * FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
WHERE DateofTermination IS NOT NULL AND Sex = 'F' ;

-- Find employees who terminated AND wanted more money
SELECT * FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
WHERE DateofTermination IS NOT NULL AND TermReason = 'more money' ;
-- to check if we didnt know what the EXACT reason of money was we can use...
SELECT * FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
WHERE DateofTermination IS NOT NULL AND TermReason LIKE '%money%' ;


-- Add a column to calculate the employees pension contribution assuming its 4%
SELECT Employee_Name, Salary, Salary * 0.04 AS EmployeePensionContribution
FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset` ;

-- If the company is also contributing 6% pension, how much is the company paying per employee per year (salary + pension contribution)
SELECT Employee_Name, Salary, Salary * 0.06 AS CompanyPensionContribution, (Salary * 0.06) + Salary AS TotalPackage FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset` ;

-- If the company is successful, add on a 10% increase per employee to their salary
SELECT Employee_Name, Salary, Salary * 0.1 AS CompanySalaryIncrease, (Salary * 0.1) + Salary AS NewSalary
FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset` ;

-- If the company is successful, add on a 10% increase per employee to their salary and decrease their salary by 5% per employee
SELECT Employee_Name, Salary, Salary * 0.1 AS CompanySalaryIncrease, (Salary * 0.1) + Salary AS BestCaseScenario, Salary * 0.05 AS CompanySalaryDecrease, Salary - (Salary * 0.05) AS WorstCaseScenario
FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset` ;

-- Order salary by largest to smallest
-- DESC = BIGGEST TO SMALLEST, ASC = SMALLEST TO BIGGEST
SELECT Employee_Name, Salary, Position
FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
ORDER BY Salary DESC ;

-- Ascending (by default it would be ascending without the things (ASC/DESC) there)
SELECT Employee_Name, Salary, Position
FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
ORDER BY Salary ;

-- Sort by Employee Name
SELECT Employee_Name FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
ORDER BY Employee_Name DESC ;

-- Order Date of Hire by Earliest to Latest
SELECT Employee_Name, DateofHire
FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
ORDER BY DateofHire ASC ;


-- How many employees do we have?
SELECT Count(EmpID) AS NumberofEmployees FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset` ;
-- Alternative method
SELECT Count(*) AS NumberofEmployees FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset` ;

-- How many departments do we have?
SELECT Count(DISTINCT Department) AS NumberOfDepartments FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset` ;

-- What's the average salary
SELECT AVG(Salary) AS AvgSalary FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset` ;
-- We can round this figure/data to make it easier to read
SELECT ROUND(AVG(Salary),2) AS AvgSalary FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset` ;

-- What's the minimum salary?
SELECT MIN(Salary) AS MinSalary FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset` ;

-- Whats the maximum salary?
SELECT MAX(Salary) AS MaxSalary FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset` ;

-- What's the total salary?
SELECT SUM(Salary) AS TotalSalary FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset` ;

-- LIMIT (brings back however many rows are specified)
SELECT * FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
LIMIT 3 ;

-- Find the average salary per department
SELECT Department , Avg(Salary) AS AvgSalaryPerDepartment
FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
GROUP BY Department
ORDER BY AvgSalaryPerDepartment ;

-- How many employees do we have per race
SELECT RaceDesc, COUNT(EmpID) AS NumberOfEmployeesPerRace
FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
GROUP BY RaceDesc ;

-- Find the average, min, max, count and total salry per Sex
SELECT Sex, ROUND(AVG(Salary),2) AS AvgSalary, MIN(Salary) AS MinSalary, MAX(Salary) AS MaxSalary, SUM(Salary) AS TotalSalary, COUNT(EmpID) AS TotalNumberOfEmployees
FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
GROUP BY Sex ;

-- Find the average, min, max, count and total salary per sex per race
SELECT Sex, RaceDesc, ROUND(AVG(Salary),2) AS AvgSalary, MIN(Salary) AS MinSalary, MAX(Salary) AS MaxSalary, SUM(Salary) AS TotalSalary, COUNT(EmpID) AS TotalNumberOfEmployees
FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
GROUP BY Sex, RaceDesc
ORDER BY Sex ;

-- Find the average salary per sex per race for divorced employees
SELECT Sex, RaceDesc, AVG(Salary) AS AvgSalary, Count(EmpID) AS NumberOfEmployees
FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
WHERE MaritalDesc = 'Divorced'
GROUP BY Sex, RaceDesc ;

-- Find the avergae salary per sex for divorced & separted employees
SELECT Sex, AVG(Salary) AS AvgSalary, COUNT(EmpID) AS NumberOfEmployees
FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
WHERE MaritalDesc IN ('Divorced', 'Separated')
GROUP BY Sex ;
