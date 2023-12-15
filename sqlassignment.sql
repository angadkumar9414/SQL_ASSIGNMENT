                          -- Assignment-1 

--- Create two tables: EmployeeDetails and EmployeeSalary.

-- Columns for EmployeeDetails: EmpId FullName ManagerId DateOfJoining City && Columns for EmployeeSalary: : EmpId Project Salary Variable.
-- SQL Query to fetch records that are present in one table but not in another table.

-- SQL query to fetch all the employees who are not working on any project.

-- SQL query to fetch all the Employees from EmployeeDetails who joined in the Year 2020.

-- Fetch all employees from EmployeeDetails who have a salary record in EmployeeSalary.

-- Write an SQL query to fetch a project-wise count of employees.

-- Fetch employee names and salaries even if the salary value is not present for the employee.

-- Write an SQL query to fetch all the Employees who are also managers.

-- Write an SQL query to fetch duplicate records from EmployeeDetails.

-- Write an SQL query to fetch only odd rows from the table.

-- Write a query to find the 3rd highest salary from a table without top or limit keyword.



                              -- ANSWERS



-- query to create database 
CREATE DATABASE  IF NOT EXISTS Employees;

-- query to use database 
USE Employees;

-- query to create tables 
CREATE TABLE EmployeesDetails (
EmpId INT PRIMARY KEY ,
FullName VARCHAR(255),
ManagerID INT,
DateOfJoining DATE,
City VARCHAR(255)
);

CREATE TABLE EmployeeSalary (
EmpID INT PRIMARY KEY,
Project VARCHAR(255),
Salary DECIMAL(10,2),
Variable VARCHAR(255)
);

-- Query to Insert data into EmployeeDetails
INSERT INTO EmployeesDetails (EmpId, FullName, ManagerId, DateOfJoining, City)
VALUES 
    (1, 'John Doe', NULL, '2020-01-15', 'New York'),
    (2, 'Jane Smith', 1, '2020-02-20', 'Los Angeles'),
    (3, 'Bob Johnson', 1, '2021-03-10', 'Chicago'),
    (4, 'Alice Brown', 2, '2019-12-05', 'San Francisco');
    
    -- Query to Insert  data into EmployeeSalary
INSERT INTO EmployeeSalary (EmpId, Project, Salary, Variable)
VALUES 
    (1, 'ProjectA', 75000, 'BonusA'),
    (2, 'ProjectB', 80000, 'BonusB'),
    (3, NULL, 70000, 'BonusC'),
    (4, 'ProjectC', 90000, 'BonusD');

--  SQL Query to fetch all records from the tables

SELECT * FROM Employeesdetails;
SELECT * FROM EmployeeSalary;

-- SQL Query to fetch records that are present in one table but not in another table.
SELECT * FROM EmployeesDetails WHERE EmpId NOT IN (SELECT EmpId FROM EmployeeSalary);

-- SQL query to fetch all employees who are not working on any project
SELECT * FROM EmployeesDetails WHERE EmpId NOT IN (SELECT EmpId FROM EmployeeSalary WHERE Project IS NOT NULL);

-- SQL query to fetch all Employees from EmployeeDetails who joined in the Year 2020
SELECT * FROM EmployeesDetails WHERE YEAR(DateOfJoining) = 2020;

-- Fetch all employees from EmployeeDetails who have a salary record in EmployeeSalary
SELECT * FROM EmployeesDetails WHERE EmpId IN (SELECT EmpId FROM EmployeeSalary);

-- SQL query to fetch a project-wise count of employees
SELECT Project, COUNT(EmpId) AS EmployeeCount FROM EmployeeSalary GROUP BY Project;

-- Fetch employee names and salaries even if the salary value is not present for the employee
SELECT ED.FullName, ES.Salary FROM EmployeesDetails ED LEFT JOIN EmployeeSalary ES ON ED.EmpId = ES.EmpId;

-- SQL query to fetch all the Employees who are also managers
SELECT * FROM EmployeesDetails WHERE EmpId IN (SELECT DISTINCT ManagerId FROM EmployeesDetails WHERE ManagerId IS NOT NULL);

-- SQL query to fetch duplicate records from EmployeeDetails
SELECT EmpId, COUNT(*) FROM EmployeesDetails GROUP BY EmpId HAVING COUNT(*) > 1;

-- SQL query to fetch only odd rows from the table
SELECT * FROM EmployeesDetails WHERE MOD(EmpId, 2) = 1;

-- Query to find the 3rd highest salary from a table without using top or limit
SELECT DISTINCT Salary FROM EmployeeSalary e1 WHERE 3 = (SELECT COUNT(DISTINCT Salary) FROM EmployeeSalary e2 WHERE e1.Salary <= e2.Salary);

