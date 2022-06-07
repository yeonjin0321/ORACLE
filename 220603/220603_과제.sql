


select coll, dept , 
decode  (rno , 1 ,   '1학년', 2 , '2학년', 3 , '3학년' , 4 ,'4학년') KEY3,
decode (  rno , 1 , FRE, 2, SUP,3,JUN,4,SEN) key4
from  
TEST11 , 
( select  rownum rno   
from  dept
 where rownum < 5 );


--문제풀이
SELECT coll
      ,dept
      ,DECODE(RNO,1,'1학년',2,'2학년',3,'3학년',4,'4학년') AS KEY3
      ,DECODE(RNO,1,FRE,2,SUP,3,JUN,4,SEN)||'명' AS KEY4
  FROM test11,
        (
     SELECT ROWNUM RNO FROM EMP
      WHERE ROWNUM <5
                )
ORDER BY DEPT , KEY3 
