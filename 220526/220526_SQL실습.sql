SELECT 
    ENAME
    FROM EMP
    
    
SELECT 
    ENAME
 FROM EMP
 WHERE ENAME LIKE 'S%' --S�� �����ϴ� �̸� ã��
 
 SELECT 
    ENAME
 FROM EMP
 WHERE ENAME LIKE '%S' --S�� �����´� �̸� ã��
 
  SELECT 
    ENAME
 FROM EMP
 WHERE ENAME LIKE '%S%' 
 
 SELECT *
  FROM emp
 WHERE ename LIKE '%M%I%'
 
 SELECT *
  FROM emp
 WHERE ename LIKE '____' --5���� ����
 
 
 SELECT ENAME, SAL
    FROM EMP
        WHERE SAL>=1000
         AND SAL<=3000