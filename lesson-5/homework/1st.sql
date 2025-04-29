drop table if exists Employees
CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL,
    HireDate DATE NOT NULL
);

INSERT INTO Employees (Name, Department, Salary, HireDate) VALUES
    ('Alice', 'HR', 50000, '2020-06-15'),
    ('Bob', 'HR', 60000, '2018-09-10'),
    ('Charlie', 'IT', 70000, '2019-03-05'),
    ('David', 'IT', 80000, '2021-07-22'),
    ('Eve', 'Finance', 90000, '2017-11-30'),
    ('Frank', 'Finance', 75000, '2019-12-25'),
    ('Grace', 'Marketing', 65000, '2016-05-14'),
    ('Hank', 'Marketing', 72000, '2019-10-08'),
    ('Ivy', 'IT', 67000, '2022-01-12'),
    ('Jack', 'HR', 52000, '2021-03-29');

--1st task
	select * from Employees

	select *, rank() over(order by SALARY) as new_rank from employees
	--2nd task
	select *, dense_rank() over(order by salary) as thesame,rank() over(order by SALARY) as new_rank from employees

	----3rd task
	select *, dense_rank() over(partition by department order by salary desc)
	as rnk
	 from employees
	select * from(select *, dense_rank() over(partition by department order by salary desc)
	as rnk
	 from employees) as mytable
	 where rnk=2
	 order by department,rnk

	 --4th task
	SELECT* FROM(SELECT *, DENSE_RANK() OVER(PARTITION BY DEPARTMENT ORDER BY SALARY) AS NEW FROM EMPLOYEES)AS N
	WHERE NEW=1


	
	