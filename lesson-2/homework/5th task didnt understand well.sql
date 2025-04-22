drop table if exists worker
create table worker(
id int primary key not null, 
name nvarchar(255) not null)

insert into worker
values(1,'Josh'), 
(2,'John'),
(3, 'Husayn'),
(4, 'Botir'),
(5,'Sheryurak')

select * from worker