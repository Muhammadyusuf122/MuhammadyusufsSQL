create table category
(category_id int primary key, 
category_name varchar(50));

select * from category
 drop table if exists item 
 create table item
 (item_id int,
 item_name varchar(50),
 category_id int, constraint fk_id foreign key(category_id) references category(category_id)); 
  alter table item
  drop constraint fk_id;

  alter table item
  add constraint new_fk foreign key(category_id) references category(category_id)




  select * from item

  insert into item
  values (1, 'a',1),
  (2,'b',2),
  (2,'c',2)
   select * from item
  