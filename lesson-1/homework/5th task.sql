drop table if exists account
create table account
(account_id int primary key, 
balance dec, constraint chk_balance check(balance>=0),
account_type varchar(50), constraint chk_act check(account_type in ('Saving',  'Checking')));

alter table account
drop constraint chk_balance

alter table account
drop constraint chk_act

 select * from account
 alter table account
 add constraint chk_balance check(balance>=0)

 alter table account
 add constraint chk_act check(account_type in ('Saving',  'Checking'));

  
  insert into account
  values (1, 2,'saving')

  select * from account

