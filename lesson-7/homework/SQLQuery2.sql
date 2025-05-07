drop table if exists customers
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

INSERT INTO Customers VALUES 
(1, 'Alice'), (2, 'Bob'), (3, 'Charlie');

select * from customers

drop table if exists orders
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE
);

INSERT INTO Orders VALUES 
(101, 1, '2024-01-01'), (102, 1, '2024-02-15'),
(103, 2, '2024-03-10'), (104, 2, '2024-04-20');

--first task

select * from orders
select * from customers
left join orders
on orders.CustomerID=customers.CustomerID

drop table if exists orderdetails
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10,2)
);

INSERT INTO OrderDetails VALUES 
(1, 101, 1, 2, 10.00), (2, 101, 2, 1, 20.00),
(3, 102, 1, 3, 10.00), (4, 103, 3, 5, 15.00),
(5, 104, 1, 1, 10.00), (6, 104, 2, 2, 20.00);
drop table if exists products
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50)
);
INSERT INTO Products VALUES 
(1, 'Laptop', 'Electronics'), 
(2, 'Mouse', 'Electronics'),
(3, 'Book', 'Stationery');
---2ND TASK

select * from customers
LEFT join orders
on oRDERS.CustomerID=CUSTOMERS.CustomerID 
WHERE ORDERS.CUSTOMERID IS NULL

select * from orders
select * from customers


---3RD TASK

--List All Orders With Their Products
--Show each order with its product names and quantity.
SELECT * FROM CUSTOMERS
select * from orders
SELECT * FROM PRODUCTS
SELECT * FROM ORDERDETAILS

select * from orders
 LEFT JOIN ORDERDETAILS
ON ORDERS.ORDERID=ORDERDETAILS.ORDERID
LEFT JOIN PRODUCTS
ON PRODUCTS.PRODUCTID=ORDERDETAILS.PRODUCTID

--Find Customers With More Than One Order
--List customers who have placed more than one order.
select * from orders
 LEFT JOIN ORDERDETAILS
ON ORDERS.ORDERID=ORDERDETAILS.ORDERID
LEFT JOIN PRODUCTS
ON PRODUCTS.PRODUCTID=ORDERDETAILS.PRODUCTID

--4th task
SELECT C.CUSTOMERID, CustomerName FROM CUSTOMERS C
JOIN ORDERS O ON C.CUSTOMERID=O.CUSTOMERID
GROUP BY C.CUSTOMERID, C.CustomerName
having count(o.orderid)>1

---5th task

--Find the Most Expensive Product in Each Order

SELECT * FROM CUSTOMERS
select * from orders
SELECT * FROM PRODUCTS
SELECT * FROM ORDERDETAILS

select *,  max(price) over(partition by orders.orderid) as highestPrices from  orders
full JOIN ORDERDETAILS
ON ORDERS.ORDERID=ORDERDETAILS.ORDERID
full JOIN PRODUCTS
ON PRODUCTS.PRODUCTID=ORDERDETAILS.PRODUCTID

---6th question
-- Find the Latest Order for Each Customer
select *,  Lead(OrderDate) over(partition by customers.customerid ORDER BY ORDERDATE) as LatestOrders from  customers
full join orders on 
customers.customerid=orders.customerid
full JOIN ORDERdetails
ON ORDERS.ORDERID=ORDERDETAILS.ORDERID
full JOIN PRODUCTS
ON PRODUCTS.PRODUCTID=ORDERDETAILS.PRODUCTID

select Customers.customerid,customers.customername,orders.orderdate,products.productname,
row_number() over(partition by customers.CustomerID ORDER BY orders.ORDERDATE DESC) as rn from CUSTOMERS 
full join orders on 
Customers.customerid=orders.customerid
full JOIN ORDERdetails
ON ORDERS.ORDERID=ORDERDETAILS.ORDERID
full JOIN PRODUCTS
ON PRODUCTS.PRODUCTID=ORDERDETAILS.PRODUCTID



--7th task 
-- Find Customers Who Ordered Only 'Electronics' Products
---List customers who only purchased items from the 'Electronics' category.

SELECT customername FROM CUSTOMERS
full join orders on 
Customers.customerid=orders.customerid
full JOIN ORDERdetails
ON ORDERS.ORDERID=ORDERDETAILS.ORDERID
full JOIN PRODUCTS
ON PRODUCTS.PRODUCTID=ORDERDETAILS.PRODUCTID

SELECT * FROM CUSTOMERS
select * from orders
SELECT * FROM PRODUCTS
SELECT * FROM ORDERDETAILS



SELECT customers.CUSTOMERID, customers.CUSTOMERNAME FROM CUSTOMERS 
WHERE CUSTOMERS.CUSTOMERid IN( 
select customers.customerid from customers
full join orders on 
Customers.customerid=orders.customerid
full JOIN ORDERdetails
ON ORDERS.ORDERID=ORDERDETAILS.ORDERID
full JOIN PRODUCTS
ON PRODUCTS.PRODUCTID=ORDERDETAILS.PRODUCTID
where products.category ='Electronics')

 AND customers.CustomerID not in(
select customers.customerid from customers
full join orders on 
Customers.customerid=orders.customerid
full JOIN ORDERdetails
ON ORDERS.ORDERID=ORDERDETAILS.ORDERID
full JOIN PRODUCTS
ON PRODUCTS.PRODUCTID=ORDERDETAILS.PRODUCTID
where products.category !='Electronics')



---8th task
-- Find Customers Who Ordered at Least One 'Stationery' Product
---List customers who have purchased at least one product from the 'Stationery' category.

SELECT  customers.CUSTOMERID, 
customers.CUSTOMERNAME 
FROM CUSTOMERS  
 join orders on 
Customers.customerid=orders.customerid
JOIN ORDERdetails
ON ORDERS.ORDERID=ORDERDETAILS.ORDERID
JOIN PRODUCTS
ON PRODUCTS.PRODUCTID=ORDERDETAILS.PRODUCTID
where products.category ='stationary'


---9TH TASK 
-- Find Total Amount Spent by Each Customer
--Show CustomerID, CustomerName, and TotalSpent
SELECT  distinct customers.CUSTOMERID, 
customers.CUSTOMERNAME, SUM(PRICE) OVER(PARTITION BY CUSTOMERS.CUSTOMERID) AS TotalSpent
FROM CUSTOMERS  
 join orders on 
Customers.customerid=orders.customerid
JOIN ORDERdetails
ON ORDERS.ORDERID=ORDERDETAILS.ORDERID
JOIN PRODUCTS
ON PRODUCTS.PRODUCTID=ORDERDETAILS.PRODUCTID
order by totalspent desc



