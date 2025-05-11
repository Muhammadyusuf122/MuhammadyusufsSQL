drop table if exists employee
CREATE TABLE Employee
(
	EmployeeID  INTEGER PRIMARY KEY,
	ManagerID   INTEGER NULL,
	JobTitle    VARCHAR(100) NOT NULL
);
INSERT INTO Employee (EmployeeID, ManagerID, JobTitle) 
VALUES
	(1001, NULL, 'President'),
	(2002, 1001, 'Director'),
	(3003, 1001, 'Office Manager'),
	(4004, 2002, 'Engineer'),
	(5005, 2002, 'Engineer'),
	(6006, 2002, 'Engineer');

	select * from employee

	;with EmployeeCTE 
	(employeeID,managerID,jobTitle,depth)
	as (
	(SELECT employeeID,managerID,jobTitle,1 FROM EMPLOYEE
	WHERE managerId is null
	union all 
	SELECT employee.employeeID,employee.managerID, employee.jobtitle, employeeCte.depth+1
	from employee
	join employeeCTE 
	ON EMPLOYEE.managerID=EmployeeCTE.employeeid)
	)
	select e.employeeid, e.managerid, E.jobtitle,e.depth FROM EMPLOYEECTE e 
	left join employeecte m
	on e.managerid=m.employeeID


	---2nd task
	---Find Factorials up to N Expected output for N =10
--	Num	Factorial
--1	1
--2	2
--3	6
--4	24
--5	120
--6	720
--7	5040
--8	40320
--9	362880
--10	3628800


  

	WITH  FactorialCTE AS (
    SELECT 1 AS n,  1 AS factorial
    UNION ALL
    SELECT 
        n + 1, 
        (n + 1) * factorial
    FROM 
        FactorialCTE
    WHERE 
        n < 10
)
SELECT n as number,Factorial
FROM 
    FactorialCTE;
	--i dont have logic
