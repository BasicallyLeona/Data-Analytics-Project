-- Lesson One

-- Retrieve all data from table
SELECT * FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset` ;

-- Retrieve employee ID, employee name, position, department and salary
SELECT EmpID, Employee_Name, Position, Department, Salary
FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset` ;

-- Retrieve Employee ID, Employee Name, DOB, and Sex
SELECT EmpID, Employee_Name, DOB, Sex
FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset` ;

-- Retrieve Employee ID, Position, and Rename Maritaldesc
-- ALIAS IS  NOT A PERMANENT CHANGE
SELECT EmpID, Position, MaritalDesc AS MaritalStatus
FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset` ;

-- Retrieve distinct states
-- THIS RETURNS ALL THE STATES - SO WE DON'T ACTUALLY KNOW HOW MANY STATES WE HAVE IN TOTAL
SELECT State FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset` ;

-- But we can use distinct to find out how MANY states there are
SELECT DISTINCT State FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset` ; -- we have 28 states

-- Retrieve employees who have a salary over 100,000
SELECT EmpID, Employee_Name, Salary FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
WHERE Salary >100000 ;

-- Retrieve employess who work as a Software Engineer
SELECT * FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
WHERE Position = 'Software Engineer' ;

-- Retrieve all female employees
SELECT * FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
WHERE Sex = 'F';

-- Retrieve all Black or African employees
SELECT * FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
WHERE RaceDesc = 'Black or African American' ;

-- Retrieve all that are NOT US Citizens
SELECT * FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
WHERE CitizenDesc != 'US Citizen' ;

-- Retrieve employees from diversity hire and are black or african employees
SELECT * FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
WHERE RaceDesc = 'Black or African American' AND FromDiversityJobFairID = 1 ;

-- Retrieve employees that earn 100,000 and are NOT white
SELECT * FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
WHERE RaceDesc!= 'White' AND Salary > 100000 ;

-- Retrieve employees that are married and earning above 60,000 and female
SELECT * FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
WHERE Salary > 60000 AND MaritalDesc = 'Married' AND Sex = 'F' ;

-- Retrieve employees that are currently active and work in production
SELECT * FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
WHERE EmploymentStatus = 'Active' AND Department = 'Production' ;

-- Retrieve employees who work as a data analyst and are female
SELECT * FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
WHERE Position = 'Data Analyst' AND Sex = 'F' ;

-- Retrieve employees from diversity hire and are black or african employees -- OR STATEMENT
SELECT * FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
WHERE RaceDesc = 'Black or African American' OR FromDiversityJobFairID = 1 ;
