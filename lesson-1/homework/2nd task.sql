create table product
(product_id int unique,
product_name varchar(50) null, 
price dec null);


 alter table product
 alter column product_id int  null;

 alter table product
 add unique(product_id, product_name);
 select * from product
 insert into product
 values (15,'gorogli', 24),
 (11,'jamila',35)
 select * from product








