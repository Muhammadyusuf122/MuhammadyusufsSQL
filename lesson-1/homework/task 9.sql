drop table if exists Book
create table Book
(book_id int primary key,
title varchar(50),
author varchar(50),
published_year int);

insert into Book
values (1,'Otkan kunlar','Abdulla Qodiriy',1875),
(2,'Yulduzli tunlar', 'Pirimqul Qodirov', 1876),
(3, 'Ikki eshik orasi', 'Otkir Hoshimov', 1978)

select * from Book
drop table if exists Member
create table Member
(member_id int primary key,
name varchar(50),
email varchar(50),
phone_number varchar(50));

insert into Member
values (11,'Yulduz','aa@gmail.com', 978683),
(12,'Tohir','t@gmail.com',8392723),
(13,'Zuhra', 'zuhra@gmail.com',3949273);
select * from Member
drop table if exists loan
create table loan
(loan_id int primary key,
book_id int foreign key references Book(book_id),
member_id int foreign key references Member(member_id),
loan_date date ,
return_date date );

insert into loan
values(25,1,11,'2020-12-12', '2021-10-12'),
(21,2,12,'2021-11-11','2022-09-08'),
(22,3,13,'2022-01-29','2023-12-01')
select * from loan



