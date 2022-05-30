SELECT 
    ENAME
    FROM EMP
    
    
SELECT 
    ENAME
 FROM EMP
 WHERE ENAME LIKE 'S%' --S로 시작하는 이름 찾기
 
 SELECT 
    ENAME
 FROM EMP
 WHERE ENAME LIKE '%S' --S로 끝나는는 이름 찾기
 
  SELECT 
    ENAME
 FROM EMP
 WHERE ENAME LIKE '%S%' 
 
 SELECT *
  FROM emp
 WHERE ename LIKE '%M%I%'
 
 SELECT *
  FROM emp
 WHERE ename LIKE '____' --5글자 조건
 
 
 SELECT ENAME, SAL
    FROM EMP
        WHERE SAL>=1000
         AND SAL<=3000