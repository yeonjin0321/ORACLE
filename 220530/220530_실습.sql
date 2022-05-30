
select empno from emp

select ename from emp
    WHERE NVL(EMPNO,0) = 7566
    
    
SELECT ENAME FROM EMP -- PK가 아니라서.

SELECT EMPNO FROM EMP    
    
CREATE INDEX I_ENAME
ON EMP(ENAME)

SELECT ENAME, deptno
from emp

--그룹 바이 절에 사용한 컬럼만 사용가능하다.

SELECT count(ENAME), deptno
    from emp
    group by deptno
    
--56건 일어날 수 있는 모든 경우의 수이다.(카타시안곱)
select
    emp.ename, DEPT.DEPTNO
    from emp,dept
    where emp.deptno = DEPT.DEPTNO --이퀄조인
    
select
    emp.ename, DEPT.DEPTNO
    from emp,dept
    where emp.deptno(+) = DEPT.DEPTNO 
    
        
select
    count(emp.ename), count(DEPT.DEPTNO)
    from emp,dept
    where emp.deptno(+) = DEPT.DEPTNO 
    group by dept.deptno
    
    
select deptno from emp
union all
select deptno from dept

select deptno from emp
union 
select deptno from dept