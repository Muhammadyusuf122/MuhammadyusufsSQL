----FIRST TASK
drop table if exists employees1
CREATE TABLE Employees1 (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Department VARCHAR(30) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL
);
select * from employees1
-- Insert the sample data
INSERT INTO Employees1 (EmployeeID, Name, Department, Salary) VALUES
(1, 'Alice', 'HR', 5000.00),
(2, 'Bob', 'IT', 7000.00),
(3, 'Charlie', 'Sales', 6000.00),
(4, 'David', 'HR', 5500.00),
(5, 'Emma', 'IT', 7200.00);


select * from employees1

DROP TABLE IF EXISTS #EMPLOYEETRANSFERS
create table #EmployeeTransfers
( EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Department VARCHAR(30) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL);

	insert into #EmployeeTransfers
	values(1, 'Alice', 'HR', 5000.00),
(2, 'Bob', 'IT', 7000.00),
(3, 'Charlie', 'Sales', 6000.00),
(4, 'David', 'HR', 5500.00),
(5, 'Emma', 'IT', 7200.00);

select * from #EmployeeTransfers


update #EmployeeTransfers
set Department =
case 
when department='hr' then 'IT'
When department ='IT' then 'SALES'
WHEN DEPARTMENT = 'SALES' THEN 'HR'
WHEN DEPARTMENT = 'HR' THEN 'IT'
When department ='IT' then 'HR'
END
WHERE DEPARTMENT IN ('HR','IT','SALES')



------SECOND TASK
DROP TABLE IF EXISTS ORDERS_DB1
CREATE TABLE Orders_DB1 (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50) NOT NULL,
    Product VARCHAR(50) NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0)
);

-- Insert the sample data
INSERT INTO Orders_DB1 (OrderID, CustomerName, Product, Quantity) VALUES
(101, 'Alice', 'Laptop', 1),
(102, 'Bob', 'Phone', 2),
(103, 'Charlie', 'Tablet', 1),
(104, 'David', 'Monitor', 1);


DROP TABLE IF EXISTS ORDERS_DB2
CREATE TABLE Orders_DB2 (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50) NOT NULL,
    Product VARCHAR(50) NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0)
);

INSERT INTO Orders_DB2 (OrderID, CustomerName, Product, Quantity) VALUES
(101, 'Alice', 'Laptop', 1),
(103, 'Charlie', 'Tablet', 1);
SELECT * FROM ORDERS_DB1
SELECT * FROM ORDERS_DB2

SELECT * FROM ORDERS_DB1
LEFT JOIN ORDERS_DB2
ON ORDERS_DB1.OrderID=ORDERS_DB2.OrderID

DECLARE @MISSINGORDERS TABLE(
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50) NOT NULL,
    Product VARCHAR(50) NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0));

	INSERT INTO @MISSINGORDERS
SELECT Orders_DB1.OrderID, Orders_DB1.CustomerName, Orders_DB1.Product, Orders_DB1.Quantity
FROM ORDERS_DB1
LEFT JOIN ORDERS_DB2
ON ORDERS_DB1.ORDERID=ORDERS_DB2.ORDERID
WHERE ORDERS_DB2.ORDERID IS NULL


SELECT * FROM @MISSINGORDERS



------THIRD TASK
CREATE TABLE EmployeeWorkHours (
    EmployeeID INT NOT NULL,
    EmployeeName VARCHAR(50) NOT NULL,
    Department VARCHAR(30) NOT NULL,
    WorkDate DATE NOT NULL,
    HoursWorked DECIMAL(4,2) NOT NULL CHECK (HoursWorked > 0 AND HoursWorked <= 24),
    PRIMARY KEY (EmployeeID, WorkDate)  -- Composite key to prevent duplicate entries for same employee on same date
);

-- Insert the sample data
INSERT INTO EmployeeWorkHours (EmployeeID, EmployeeName, Department, WorkDate, HoursWorked) VALUES
(1, 'Alice', 'HR', '2024-03-01', 8),
(2, 'Bob', 'IT', '2024-03-01', 9),
(3, 'Charlie', 'Sales', '2024-03-02', 7),
(1, 'Alice', 'HR', '2024-03-03', 6),
(2, 'Bob', 'IT', '2024-03-03', 8),
(3, 'Charlie', 'Sales', '2024-03-04', 9);

SELECT * FROM EmployeeWorkHours;

CREATE VIEW VW_MonthlyWorkSummary AS
SELECT 
    EmployeeID,
    EmployeeName,
    Department,
    -- Total hours worked by employee
    SUM(HoursWorked) AS EmployeeTotalHours,
    -- Company-wide total hours (all employees)
    SUM(SUM(HoursWorked)) OVER () AS CompanyTotalHours,
    -- Department-wide total hours
    SUM(SUM(HoursWorked)) OVER (PARTITION BY Department) AS DepartmentTotalHours,
    -- Employee's percentage of department hours
    CASE 
        WHEN SUM(SUM(HoursWorked)) OVER (PARTITION BY Department) > 0
        THEN (SUM(HoursWorked) * 100.0) / SUM(SUM(HoursWorked)) OVER (PARTITION BY Department)
        ELSE 0 
    END AS DepartmentPercentage
FROM 
    EmployeeWorkHours
GROUP BY 
    EmployeeID, EmployeeName, Department;

SELECT * FROM VW_MonthlyWorkSummary