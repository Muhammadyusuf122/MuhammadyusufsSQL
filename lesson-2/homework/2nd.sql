drop table if exists test_identity;
create table test_identity(
id int identity(1,1),
name varchar(50));
 insert into test_identity
 values('Ali'),
 ('Botir'),
 ('Zokir'),
 ('Tohir'),
 ('Bahodir');
 select * from test_identity

 delete from test_identity;
 select * from test_identity;
 --1. all of them got deleted, but identity is going on from the place it stopped--

 truncate table test_identity;

  select * from test_identity
  insert into test_identity
 values('Ali'),
 ('Botir'),
 ('Zokir'),
 ('Tohir'),
 ('Bahodir');
 -- in truncate everything order starts from the beginning--

 drop table test_identity;
 insert into test_identity
 values('Ali'),
 ('Botir'),
 ('Zokir'),
 ('Tohir'),
 ('Bahodir');

 --after drop is used, there was not test-identity table anymore--