-- Week Two

-- Retrieve the main dataset
SELECT * FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset` ;

-- Retrieve employees that are NOT white and are Asian
SELECT * FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
WHERE NOT RaceDesc = 'White' AND RaceDesc = 'Asian' ;

-- Alternatively, using comparison operator
SELECT * FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
WHERE RaceDesc != 'White' AND RaceDesc = 'Asian' ;

-- Retrieve employees that have a salary of 100,000 and are not divorced
SELECT * FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
WHERE Salary > 100000 AND NOT MaritalDesc = 'Divorced' ;

-- Alternatively, using comparison operators
SELECT * FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
WHERE Salary > 100000 AND MaritalDesc != 'Divorced' ;

-- Retrieve employees between A and M
SELECT Employee_Name FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
WHERE Employee_Name BETWEEN 'Ane' and 'M' ;

-- Retrieve employees with a salary between 70000 and 100000
SELECT * FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
WHERE Salary BETWEEN 70000 AND 100000 ;


-- Retrieve employees with salary between 70000 and 100000 and NOT white
SELECT * FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
WHERE (Salary BETWEEN 70000 AND 100000) AND (NOT RaceDesc = 'White') ;

SELECT * FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
WHERE (MaritalDesc = 'Married' or Sex = 'F') AND Salary > 60000 ;

-- Find unique termination reasons
SELECT DISTINCT TermReason FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset` ;

-- Retrieve employees who terminated due to happiness
SELECT * FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
WHERE TermReason LIKE '%happy%' ;

-- Retrieve any employees who consider themselves as engineers
SELECT * FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
WHERE Position LIKE '%Engineer' ;

-- Retrieve employees whose name contains John
SELECT Employee_Name FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
WHERE Employee_Name LIKE '%John%' ;
-- this brings everyone with John IN their name
SELECT Employee_Name FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
WHERE Employee_Name LIKE 'John%' ;
-- this brings everyone with John in their SURNAME
SELECT Employee_Name FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
WHERE Employee_Name LIKE '%John' ;
-- this brings everyone with John in their FIRST NAME

-- Retrieve employees who are senior (Senior or Sr.)
SELECT * FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
WHERE Position LIKE '%Sr.%' OR Position LIKE '%Senior%';

-- Retrieve employees who are senior and earn over 100k
SELECT * FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
WHERE Salary > 100000 AND (Position LIKE '%Sr.%' OR Position LIKE '%Senior%') ;


-- The IN Operator allows you to specify multiple values in a WHERE clause...

-- Retrieve employees in TX, CT, FL, NC
SELECT DISTINCT State FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset` ;

SELECT Employee_Name, State FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
WHERE State IN ('TX', 'CT', 'FL', 'NC') ;

-- Retrieve employees in department Admin Offices, Executive Office and Sales
SELECT Employee_Name, Department FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
WHERE Department IN ('Admin Offices', 'Executive Office', 'Sales') ;

-- Retrieve employees in department Admin Offices, Executive Office and Sales AND Earning over 50,000
SELECT Employee_Name, Department, Salary FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
WHERE Department IN ('Admin Offices', 'Executive Office', 'Sales') AND Salary > 50000 ;

-- Retrieve employees in department software engineering and IT and Diversity Hire
SELECT Employee_Name, Department, FromDiversityJobFairID FROM `niyo-bootcamp-394518-394518.Niyo.hr_dataset`
WHERE Department IN ('Software Engineering', 'IT') AND FromDiversityJobFairID = 1 ;
-- 1 means True, 0 means False...
