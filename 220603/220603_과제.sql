


select coll, dept , 
decode  (rno , 1 ,   '1학년', 2 , '2학년', 3 , '3학년' , 4 ,'4학년') KEY3,
decode (  rno , 1 , FRE, 2, SUP,3,JUN,4,SEN) key4
from  TEST11 , 
( select  rownum rno   
from  dept
 where rownum < 5 );