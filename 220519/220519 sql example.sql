1.emp�� dept�� �����Ͽ� �μ���ȣ �μ��� �̸� �޿��� ����Ͽ���

SELECT D.DEPTNO, D.DNAME, E.ENAME, E.SAL
    FROM EMP E, DEPT D
        WHERE E.DEPTNO = D.DEPTNO
        
2.�̸��� ALLEN�� ����� �μ����� ����϶�

SELECT E.ENAME, D.DNAME
    FROM EMP E, DEPT D
        WHERE E.DEPTNO = D.DEPTNO
        AND E.ENAME = 'ALLEN';
        
3.DEPT Table�� �ִ� ��� �μ��� ����ϰ�, 
EMP Table�� �ִ� DATA�� JOIN�Ͽ� ��� ����� �̸�, �μ���ȣ, �μ���, �޿��� ����϶�.

SELECT E.ENAME, D.DEPTNO, D.DNAME, E.SAL
    FROM EMP E, DEPT D
        WHERE E.DEPTNO(+) = D.DEPTNO
        
4)EMP Table�� �ִ� EMPNO�� MGR�� �̿��Ͽ� ������ ���踦 ������ ���� ����϶�.
SMITH�� �Ŵ����� FORD�̴�.

SELECT E.ENAME || '�� �Ŵ�����' || M.ENAME||'�̴�.'
    FROM EMP E, EMP M
        WHERE E.MGR = M.EMPNO
        AND E.ENAME = 'SMITH'
        
5)'ALLEN'�� ������ ���� ����� �̸�, �μ���, �޿�, ������ ����϶�.

SELECT ENAME, DNAME, SAL, JOB
  FROM EMP E, DEPT D
 WHERE E.DEPTNO = D.DEPTNO
   AND JOB = (SELECT JOB
                FROM EMP
      WHERE ENAME = 'ALLEN')
      
6)'JONES'�� �����ִ� �μ��� ������� �����ȣ, �̸�, �Ի���, �޿��� ����϶�.

SELECT EMPNO, ENAME, HIREDATE, SAL
  FROM EMP
 WHERE DEPTNO = (SELECT DEPTNO
                   FROM EMP
      WHERE ENAME = 'JONES')
      
       
7)��ü ����� ����ӱݺ��� ���� ����� �����ȣ, �̸�, �μ���, �Ի���, ����, �޿�������϶�.

SELECT E.EMPNO, E.ENAME, D.DNAME, E.HIREDATE, D.LOC, E.SAL
  FROM EMP E, DEPT D
 WHERE E.DEPTNO = D.DEPTNO
   AND SAL > (SELECT AVG(SAL)
                FROM EMP)
 