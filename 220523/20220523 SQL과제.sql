
SELECT WORKCD_VC, TIME_NU, RANK() OVER(ORDER BY TIME_NU ASC) RNK  
--rank���� �Լ��� ����Ͽ� ������������ ����
--rank �Լ��� �ߺ������� �����Ѵ�.
FROM t_worktime


--DENSE_RANK �Լ��� ������ ���̸� �ߺ� ������ �ο��ϰ�, ���� ������ �ߺ� ������ ������� ���������� ��ȯ�Ѵ�.
SELECT WORKCD_VC, TIME_NU, DENSE_RANK() OVER(ORDER BY TIME_NU ASC)RNK    
FROM t_worktime

--row_number �ܼ��� �� ��ȣ ǥ��, ���� �����ϰ� ������ ������ �ο���.
SELECT WORKCD_VC, TIME_NU, ROW_NUMBER() OVER(ORDER BY TIME_NU ASC)RNK    
FROM t_worktime

--

SELECT * FROM t_worktime

SELECT WORKCD_VC, TIME_NU FROM t_worktime

SELECT WORKCD_VC, TIME_NU FROM t_worktime
ORDER BY time_nu asc

--rownum���
SELECT rownum rnk, WORKCD_VC, TIME_NU FROM t_worktime

--�ζ��� ���� �ʿ伺
SELECT rownum rnk, time_nu
    FROM( SELECT WORKCD_VC, TIME_NU FROM t_worktime
ORDER BY time_nu asc
    )
    
SELECT DNAME FROM DEPT   

SELECT a.time_nu, b.time_nu FROM t_worktime a, t_worktime_b

SELECT rownum rno, ename FROM emp
WHERE ROWNUM < 4

--
SELECT time_nu FROM t_worktime

WHERE ROWNUM < 4


--3�����
SELECT
    a.time_nu
    FROM(
    SELECT time_nu FROM t_worktime
    WHERE ROWNUM < 4
    )a,
    (
    SELECT time_nu FROM t_worktime
    WHERE ROWNUM < 4
    )b
WHERE a.time_nu < b.time_nu

--6�����

SELECT
    a.time_nu, count(b.time_nu)
    FROM(
    SELECT time_nu FROM t_worktime
    WHERE ROWNUM < 4
    )a,
    (
    SELECT time_nu FROM t_worktime
    WHERE ROWNUM < 4
    )b
    WHERE a.time_nu <= b.time_nu
    GROUP BY a.time_nu
    ORDER BY count(b.time_nu) asc

    
select ename AS "�̸�", dname AS "�μ���"
from emp, dept
where emp.deptno = dept.deptno;

�μ����տ��� deptno�� pk�̴�.
�μ����տ��� deptno�� �޾Ƽ� �¾ �ڼ��� ��������̰�,
���� �θ��� deptno�� �ڼ����� ���� �ܷ�Ű�� �Ǿ���.

SELECT DEPTNO FROM EMP,DEPT
SELECT a.deptno FROM emp a,dept b
SELECT b.deptno FROM emp a,dept b

