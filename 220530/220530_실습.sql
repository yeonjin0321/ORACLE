
select empno from emp

select ename from emp
    WHERE NVL(EMPNO,0) = 7566
    
    
SELECT ENAME FROM EMP -- PK�� �ƴ϶�.

SELECT EMPNO FROM EMP    
    
CREATE INDEX I_ENAME
ON EMP(ENAME)

SELECT ENAME, deptno
from emp

--�׷� ���� ���� ����� �÷��� ��밡���ϴ�.

SELECT count(ENAME), deptno
    from emp
    group by deptno
    
--56�� �Ͼ �� �ִ� ��� ����� ���̴�.(īŸ�þȰ�)
select
    emp.ename, DEPT.DEPTNO
    from emp,dept
    where emp.deptno = DEPT.DEPTNO --��������
    
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