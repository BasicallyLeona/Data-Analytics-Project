-- WEEK THREE / RECAP
-- SPECIFIC ORDER : SELECT, FROM, WHERE, GROUP BY, ORDER BY
SELECT * FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset` ;
-- Average Salary
SELECT State, avg(salary) as AvgSalary
FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
GROUP BY State
ORDER BY AvgSalary desc ; -- biggest to smallest uses desc.

-- WEEK THREE / STARTING ADVANCED SQL.
-- HAVING is used as a "replacement" of WHERE as WHERE cannot be used with aggregate functions (such as; COUNT, SUM, MIN, MAX, AVG)

-- Find the count of employees per race where there are 20 or more employess
SELECT RaceDesc, COUNT(EmpID) AS NumberOfEmployees
FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
GROUP BY RaceDesc
HAVING COUNT(EmpID) >= 20 ;

-- Find the departments where the total salary is greater than 250,000
SELECT Department, SUM(Salary) AS TotalSalary
FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
GROUP BY Department
HAVING SUM(Salary) > 250000
ORDER BY TotalSalary desc ;

-- Find the positions that have more than 10 employees where employment status is active
SELECT Position, COUNT(EmpID) As NumberOfEmployees
FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
WHERE EmploymentStatus = 'Active'
GROUP BY Position
HAVING COUNT(EmpID) > 10 ;

-- Find the positions where the avergae salary is greater than 80,000
SELECT Position, Avg(Salary) AS AvgSalary, COUNT(EmpID) AS NumberOfEmployees
FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
GROUP BY Position
HAVING Avg(Salary) > 80000
ORDER BY AvgSalary desc ;

-- SQL's version of IF statement from Excel, start with CASE, end with END
-- Create 3 categories for the salary - 70k, 70k and 150k, 150k+
-- the comma at the end is very important after 'Salary'
SELECT EmpID, Salary,
CASE 
  WHEN Salary < 70000 THEN 'Salary is less than 70k'
  WHEN Salary BETWEEN 70000 AND 150000 THEN 'Salary is between 70k and 150k'
  WHEN Salary > 150000 THEN 'Salary is more than 150k'
ELSE 'Salary does not exist'
END AS SalaryCategory
FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
ORDER BY 2 desc ;

-- Create a new column for diversity hire and citizen desc i.e if diversity hire AND US citizen 'citizen diversity hire' etc.
SELECT Employee_Name, FromDiversityJobFairID, CitizenDesc,
CASE
  WHEN FromDiversityJobFairID = 1 AND CitizenDesc = 'US Citizen' THEN 'Citizen is US & from Job Diversity Hire'
  WHEN FromDiversityJobFairID = 1 AND CitizenDesc = 'Eligible Non Citizen' THEN 'Citizen is Eligible & from Job Diversity Hire'
  WHEN FromDiversityJobFairID = 1 AND CitizenDesc = 'Non Citizen' THEN 'NOT a Citizen & from Job Diversity Hire'
  ELSE 'Citizen is not from Job Diversity Hire'
END AS DiversityCitizenship
FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
WHERE FromDiversityJobFairID = 1
ORDER BY 3 desc ;

-- Find the average salary based on RaceDesc - BAME & White
SELECT DISTINCT RaceDesc FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset` ;

SELECT
CASE
  WHEN RaceDesc = 'White' THEN 'White'
  WHEN RaceDesc IN ('Black or African American', 'Asian', 'Two or more races', 'American Indian or Alaska Native', 'Hispanic') THEN 'BAME'
END AS EthnicGroups, AVG(Salary) AS AvgSalary
FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
GROUP BY EthnicGroups ;
-- Alternative...
SELECT
CASE
  WHEN RaceDesc = 'White' THEN 'White Employees'
  WHEN RaceDesc != 'White' THEN 'BAME Employees'
END AS RaceCategory, AVG(Salary) AS AvgSalary
FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
GROUP BY RaceCategory ;


-- Find the total salary for Departments IT & Software Engineerings vs Sales,Admin, Executive Office
SELECT DISTINCT Department FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset` ;

SELECT
CASE
  WHEN Department IN ('IT', 'Software Engineering') THEN 'IT & Software Engineering'
  WHEN Department IN ('Sales', 'Admin', 'Executive Office') THEN 'Sales, Admin & Executive Office'
  ELSE 'Other Department'
END AS DepartmentAreas, SUM(Salary) AS TotalSalary
FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
GROUP BY DepartmentAreas ;

-- Find the average salary based on the groupings created for DiversityHire & US Citizen


-- We are organising a day out, split employees into 4 teams based on their names
SELECT DISTINCT Employee_Name FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`

SELECT Employee_Name,
CASE
  WHEN Employee_Name BETWEEN 'A' AND 'Ez' THEN 'Team 1'
  WHEN Employee_Name BETWEEN 'F' AND 'Nz' THEN 'Team 2'
  WHEN Employee_Name BETWEEN 'O' AND 'Tz' THEN 'Team 3'
  ELSE 'Team 4'
END AS Teams
FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
ORDER BY Employee_Name asc ;

-- Create a new column based on sex & marital desc
SELECT Employee_Name, Sex, MaritalDesc,
CASE
  WHEN MaritalDesc = 'Single' AND Sex = 'M' THEN 'Single Male'
  WHEN MaritalDesc = 'Married' AND Sex = 'M' THEN 'Married Male'
  WHEN MaritalDesc = 'Divorced' AND Sex = 'M' THEN 'Divorced Male'
  WHEN MaritalDesc = 'Single' AND Sex = 'F' THEN 'Single Female'
  WHEN MaritalDesc = 'Married' AND Sex = 'F' THEN 'Married Female'
  WHEN MaritalDesc = 'Divorced' AND Sex = 'F' THEN 'Divorced Female'
  ELSE 'Other'
END AS SexMaritalStatus
FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
ORDER BY 1 asc ;
-- Alternative...

SELECT Employee_Name, Sex, MaritalDesc,
CASE
  WHEN MaritalDesc = 'Single' AND (Sex = 'M' OR Sex= 'F') THEN 'Single F/M'
  WHEN MaritalDesc = 'Married' AND (Sex = 'M' OR Sex ='F') THEN 'Married F/M'
  WHEN MaritalDesc = 'Divorced' AND (Sex = 'M' OR Sex ='F') THEN 'Divorced F/M'
  ELSE 'Other/Not Interested'
END AS SexMaritalStatus
FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
ORDER BY 1 asc ;
