create table invoice
(invoice_id int identity(1,1) primary key,
amount dec)

insert into invoice
values (10.2)

INSERT INTO invoice (amount) VALUES 
(100.50),
(250.75),
(75.20),
(300.00),
(42.99);
set identity_insert invoice on;
insert into invoice (invoice_id,amount)
values (100,200)

set identity_insert invoice off
select *from invoice