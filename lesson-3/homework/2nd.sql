drop table if exists orders
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    Status VARCHAR(20) CHECK (Status IN ('Pending', 'Shipped', 'Delivered', 'Cancelled'))
);

INSERT INTO Orders (OrderID, CustomerName, OrderDate, TotalAmount, Status)
VALUES 
    (101, 'John Doe', '2023-01-15', 2500, 'Shipped'),
    (102, 'Mary Smith', '2023-02-10', 4500, 'Pending'),
    (103, 'James Brown', '2023-03-25', 6200, 'Delivered'),
    (104, 'Patricia Davis', '2023-05-05', 1800, 'Cancelled'),
    (105, 'Michael Wilson', '2023-06-14', 7500, 'Shipped'),
    (106, 'Elizabeth Garcia', '2023-07-20', 9000, 'Delivered'),
    (107, 'David Martinez', '2023-08-02', 1300, 'Pending'),
    (108, 'Susan Clark', '2023-09-12', 5600, 'Shipped'),
    (109, 'Robert Lewis', '2023-10-30', 4100, 'Cancelled'),
    (110, 'Emily Walker', '2023-12-05', 9800, 'Delivered');
	select * from orders
	 select [Status], TotalAmount, case
	 when OrderDate between '2023-01-01' and  '2023-12-31' then '2023'
	 end as Order_year
	 from orders
	 group by Status, TotalAmount, OrderDate
	 order by TotalAmount desc;
	
	select status, sum(TotalAmount) as total_salary, count(OrderID) AS NUMBERS
	from orders
	group by Status
	order by status desc

	select status, sum(TotalAmount) as total_salary, count(OrderID) AS NUMBERS
	from orders
	WHERE TotalAmount>5000
	group by Status
	order by status desc








	 group by CustomerName, TotalAmount
	 order by TotalAmount desc

	 SELECT STATUS, SUM(TotalAmount) AS jami, COUNT(OrderID) AS NECHTALIGI from orders 
	 group by STATUS
	 SELECT OrderID,status from orders
	 where TotalAmount>5000
	 group by OrderID,status
	 