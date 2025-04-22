drop table if exists data_types_demo
create table data_types_demo
(raqam int,
sekund tinyint,
gradus smallint,
balandlik bigint,
harorat dec,
nmadir float)

insert into data_types_demo
values(
2,31,12,1200000000000000,12.1,12.211);
select * from data_types_demo
delete from data_types_demo where harorat=18;