CREATE TABLE test1(
   t_no number(3) constraints test1_pk primary key
 , t_name varchar2(30) not null
 , t_sal number(7,2) default 0
)


SELECT SEQ_TEST1_NO1.nextval FROM dual