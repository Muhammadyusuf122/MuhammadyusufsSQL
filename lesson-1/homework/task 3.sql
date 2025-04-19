create table orders
(order_id int primary key, 
customer_name varchar(50) null,
order_date int null)
select * from orders

alter table orders
drop constraint PK__orders__4659622932CDE198;

alter table orders
add primary key(order_id)
select * from orders
insert into orders
values (1,'name',2),
(2,'name',2)

select * from orders





