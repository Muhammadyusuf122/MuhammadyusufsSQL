drop table if exists customer;
create table customer
(customer_id int, 
name varchar(50),
city varchar(50) Default 'Unknown');

select * from customer

insert into customer
values (1,'big', DEFAULT)

SELECT name 
FROM sys.default_constraints
WHERE parent_object_id = OBJECT_ID('customer');
ALTER TABLE CUSTOMER
DROP CONSTRAINT DF__customer__city__6C390A4C
ALTER TABLE CUSTOMER
ADD CONSTRAINT DF_CUSTOMER
DEFAULT 'unknown' for city

select * from customer

insert into customer
values (12,'small', default)