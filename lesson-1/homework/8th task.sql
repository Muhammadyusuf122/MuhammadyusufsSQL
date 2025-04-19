drop table if exists books
create table books
(book_id int identity(1,1) primary key,
title varchar(50) not null,
price dec, check(price>0),
genre varchar(50) default 'unknown')

insert into books
values ('Kichkina Shaxzoda',10.2, default)

select * from books
