SELECT 
    sql_text, sharable_mem, executions
   FROM v$sqlarea
   WHERE sql_text LIKE 'SELECT ename, sal%'
   
--���������̴�. range scan�� �ϴ� ������̴�. 
--�����˻�.
--�������̴�.

-- ������ �������� ������ ����. SELECT ENAME FROM EMP 