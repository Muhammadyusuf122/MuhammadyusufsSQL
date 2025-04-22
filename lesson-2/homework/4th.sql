drop table if exists student;
create table student
(name nvarchar(255) primary key not null,
classes int not null,
tuition_per_class int not null,
total_tuition as (classes * tuition_per_class));

insert into student
values('Alisher', 12, 10000),
('Botirs', 15,9000),
('Zuhras', 10, 8000)

select * from student