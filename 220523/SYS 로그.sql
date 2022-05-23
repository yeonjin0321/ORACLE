SELECT 
    sql_text, sharable_mem, executions
   FROM v$sqlarea
   WHERE sql_text LIKE 'SELECT ename, sal%'
   
--선분조건이다. range scan을 하는 예약어이다. 
--구간검색.
--점조건이다.

-- 관리자 계정에선 집합이 없음. SELECT ENAME FROM EMP 