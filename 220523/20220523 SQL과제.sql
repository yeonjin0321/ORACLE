
SELECT WORKCD_VC, TIME_NU, RANK() OVER(ORDER BY TIME_NU ASC) RNK  
--rank순위 함수를 사용하여 오름차순으로 정렬
--rank 함수는 중복순위를 포함한다.
FROM t_worktime


--DENSE_RANK 함수는 동일한 값이면 중복 순위를 부여하고, 다음 순위는 중복 순위와 상관없이 순차적으로 반환한다.
SELECT WORKCD_VC, TIME_NU, DENSE_RANK() OVER(ORDER BY TIME_NU ASC)RNK    
FROM t_worktime

--row_number 단순히 행 번호 표시, 값에 무관하게 고유한 순위를 부여함.
SELECT WORKCD_VC, TIME_NU, ROW_NUMBER() OVER(ORDER BY TIME_NU ASC)RNK    
FROM t_worktime

--

SELECT * FROM t_worktime

SELECT WORKCD_VC, TIME_NU FROM t_worktime

SELECT WORKCD_VC, TIME_NU FROM t_worktime
ORDER BY time_nu asc

--rownum사용
SELECT rownum rnk, WORKCD_VC, TIME_NU FROM t_worktime

--인라인 뷰의 필요성
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


--3개출력
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

--6개출력

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

    
select ename AS "이름", dname AS "부서명"
from emp, dept
where emp.deptno = dept.deptno;

부서집합에서 deptno는 pk이다.
부서집합에서 deptno를 받아서 태어난 자손이 사원집합이고,
따라서 부모의 deptno가 자손으로 가서 외래키가 되었다.

SELECT DEPTNO FROM EMP,DEPT
SELECT a.deptno FROM emp a,dept b
SELECT b.deptno FROM emp a,dept b

