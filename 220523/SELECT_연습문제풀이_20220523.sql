SELECT 1+5, 6-2 FROM dual --from뒤에는 집합이 온다.

패턴

SELECT count(empno) FROM EMP --집계함수

SELECT COUNT(EMPNO) -- 6명이나옴
FROM (SELECT EMPNO FROM EMP WHERE SAL>=2000) --인라인뷰

SELECT EMPNO FROM EMP WHERE SAL>=2000--FROM뒤에 집합이 나와야하는 이유.

SELECT 1 FROM dual
UNION ALL
SELECT 2 FROM dual
UNION ALL
SELECT 3 FROM dual

SELECT DEPTNO FROM EMP
MINUS
SELECT DEPNO FROM DEPT

SELECT DEPTNO FROM DEPT
MINUS 
SELECT DEPTNO FROM EMP

SELECT DEPTNO FROM DEPT
INTERSECT 
SELECT DEPTNO FROM EMP

DELETE FROM DEPT
