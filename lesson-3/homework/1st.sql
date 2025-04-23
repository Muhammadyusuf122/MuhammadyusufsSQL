drop table if exists Employees;
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    HireDate DATE
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary, HireDate)
VALUES 
    (1, 'Alice', 'Johnson', 'HR', 60000, '2019-03-15'),
    (2, 'Bob', 'Smith', 'IT', 85000, '2018-07-20'),
    (3, 'Charlie', 'Brown', 'Finance', 95000, '2017-01-10'),
    (4, 'David', 'Williams', 'HR', 50000, '2021-05-22'),
    (5, 'Emma', 'Jones', 'IT', 110000, '2016-12-02'),
    (6, 'Frank', 'Miller', 'Finance', 40000, '2022-06-30'),
    (7, 'Grace', 'Davis', 'Marketing', 75000, '2020-09-14'),
    (8, 'Henry', 'White', 'Marketing', 72000, '2020-10-10'),
    (9, 'Ivy', 'Taylor', 'IT', 95000, '2017-04-05'),
    (10, 'Jack', 'Anderson', 'Finance', 105000, '2015-11-12');

	SELECT * FROM EMPLOYEES
	 select department, avg(salary) as average_salary from employees
	 group by department
	 order by average_salary desc

	 select EmployeeID,FirstName,LastName, max(salary) as highest_salaries
	 from employees
	 group by EmployeeID,FirstName,LastName
	 order by highest_salaries desc
	 select top 10 percent *
	 from employees
	 order by salary desc
	

	 select EmployeeID,FirstName,LastName,salary,
	 case when salary>80000 then 'high'
	 when salary between 50000 and 80000 then 'medium'
	 else 'low' end as salary_category from employees
	 order by salary desc
	 offset 2 rows fetch next 5 rows only;

	 	 select department, avg(salary) as average_salary from employees
	 group by department
	 order by average_salary desc
	 offset 2 rows fetch next 5 rows only;

	 


	
