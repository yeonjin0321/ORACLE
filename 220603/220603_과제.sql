


select coll, dept , 
decode  (rno , 1 ,   '1�г�', 2 , '2�г�', 3 , '3�г�' , 4 ,'4�г�') KEY3,
decode (  rno , 1 , FRE, 2, SUP,3,JUN,4,SEN) key4
from  TEST11 , 
( select  rownum rno   
from  dept
 where rownum < 5 );