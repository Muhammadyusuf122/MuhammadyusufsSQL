-- Create the Employees table
drop table if exists Employees
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    DepartmentID INT,
    Salary DECIMAL(10,2) NOT NULL
);

-- Insert the sample data
INSERT INTO Employees (EmployeeID, Name, DepartmentID, Salary) VALUES
(1, 'Alice', 101, 60000),
(2, 'Bob', 102, 70000),
(3, 'Charlie', 101, 65000),
(4, 'David', 103, 72000),
(5, 'Eva', NULL, 68000);

select * from employees

-- Create the Departments table
drop table if exists Departments
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL
);

-- Insert the sample data
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(101, 'IT'),
(102, 'HR'),
(103, 'Finance'),
(104, 'Marketing');

select * from employees
select * from departments

drop table if exists Projects
-- Create the Projects table
CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(50) NOT NULL,
    EmployeeID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Insert the sample data
INSERT INTO Projects (ProjectID, ProjectName, EmployeeID) VALUES
(1, 'Alpha', 1),
(2, 'Beta', 2),
(3, 'Gamma', 1),
(4, 'Delta', 4),
(5, 'Omega', NULL);

select * from employees
select * from departments
select * from projects

select EmployeeID, Name,DepartmentName,Salary
from employees
INNER join departments
on departments.DepartmentID=employees.DepartmentID

--SECOND QUESTION
select EmployeeID, Name,DepartmentName,Salary
from employees
LEFT join departments
on departments.DepartmentID=employees.DepartmentID

-- THIRD QUESTION

select EmployeeID, Name,DepartmentName,Salary
from employees
RIGHT join departments
on departments.DepartmentID=employees.DepartmentID


--FORUTH QUESTION
select EmployeeID, Name,DepartmentName,Salary
from employees
FULL OUTER join departments
on departments.DepartmentID=employees.DepartmentID

--6TH QUESTION

select EmployeeID, Name,DepartmentName,Salary
from employees
CROSS join departments


--5TH QUESTION
select * from employees
select * from departments
select * from projects

SELECT *, SUM(SALARY) OVER(PARTITION BY DEPARTMENTname order by salary desc) as total_salary FROM EMPLOYEES
JOIN DEPARTMENTS
ON EMPLOYEES.DepartmentID=DEPARTMENTS.DepartmentID

--7th question
SELECT NAME,DEPARTMENTNAME,PROJECTNAME FROM EMPLOYEES
JOIN DEPARTMENTS
ON EMPLOYEES.departmentid=departments.departmentid
LEFT JOIN PROJECTS
ON EMPLOYEES.EMPLOYEEID=PROJECTS.EMPLOYEEID






