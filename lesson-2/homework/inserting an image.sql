drop table if exists photos
create table photos(
id int, 
hajm varbinary(max));
 insert into photos
 select 1, Bulkcolumn from openrowset(Bulk 'G:\olma.jfif', single_blob) as img;

 select * from photos
