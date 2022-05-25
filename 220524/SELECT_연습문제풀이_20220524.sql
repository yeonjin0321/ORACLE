1.�� �޿��� ������ 18�� ������ Ȧ�� �޿��� ������ 1/18�� ���޵ǰ�, ¦���޿��� ������ 2/18�� ���޵ȴٰ� �������� �� Ȧ�� �ް� ¦�� �޿� ���� �ݾ��� ��Ÿ���ÿ�.

SELECT EMP_NAME as ����̸�, salary||'��' as �޿�,
    TO_CHAR(round(SALARY/18,-1),'999,999,999')||'��' "Ȧ���� �޿�", 
     TO_CHAR(ROUND(SALARY*2/18,-1),'999,999,999')||'��' "¦���� �޿�" 
FROM TEMP;


 
SELECT TO_CHAR(123467, 'FM999,999')        --123,467
     , TO_CHAR(123467890, 'FM999,999,999') --123,467,890
     , TO_CHAR(123467, 'FML999,999')       --��123,467
    FROM dual

SELECT ROUND(1234567.456, 1) -- �Ҽ� 2��° �ڸ����� �ݿø��ϱ�
,ROUND(1234567.456, -1)-- �Ҽ��� �������� ���� �ö󰡸� ������ ������
,ROUND(1234567.456, -2)
,ROUND(1234567.456, 2)
FROM DUAL


SELECT
    550000, TO_CHAR(SYSDATE,'YYYYMMDD')
        ,TO_CHAR(sysdate,'MMDD')
        ,sysdate,sysdate-1,sysdate+1
FROM dual

�������� ���������� ��ȯ�� �ִ� �Լ��� �ִ�.

SELECT
    550000, TO_CHAR(550000,'999,999')
    ,TO_CHAR(5500000,'999,999,999')
    ,TO_CHAR(5500000.123,'999,999,999.999')
FROM dual

2.������ ���� �� �޿��� ����� 10������ ���޵ȴٸ�(¦������ 20����)���� ������ 
��� �ٲ��� �ۼ��� ���ÿ�.

SELECT EMP_NAME as ����̸�, salary||'��' as �޿�,
    TO_CHAR(round(SALARY/18,-1)+100000,'999,999,999')||'��' "Ȧ���� �޿�", --10�������� 
     TO_CHAR(ROUND(SALARY*2/18,-1)+200000,'999,999,999')||'��' "¦���� �޿�" --20��������
FROM TEMP

null�� �𸥴�, �������� �ʾҴ�, �׷��� �������� �ƴϴ�.

SELECT 
COUNT(EMPNO),COUNT(COMM)
FROM EMP

SELECT ENAME,SAL FROM EMP

--���������̴�. range scan�� �ϴ� ������̴�. 
--�����˻�.
--�������̴�.

SELECT EMPNO FROM EMP 
WHERE ENAME='SCOTT';

�츮 ȸ�翡 �ٹ��ϴ� ��� �߿��� �μ���ȣ�� 10�̰ų� 30�� ����� �̸��� �μ� ��ȣ�� ����ϴ� SQL���� �ۼ��Ͻÿ�

SELECT ENAME �����, DEPTNO �μ���ȣ
    FROM EMP
WHERE DEPTNO = '10' OR DEPTNO ='30'
ORDER BY DEPTNO

--UNION ALL�� ó���ϱ�!
SELECT ENAME, DEPTNO FROM EMP
WHERE DEPTNO='10'
UNION ALL
SELECT ENAME, DEPTNO FROM EMP
WHERE DEPTNO='30'

--WHERE IN �������� �˻��ϱ�.
SELECT ENAME,DEPTNO FROM EMP
WHERE DEPTNO IN(10,30)
ORDER BY DEPTNO


�츮ȸ�翡�� �ٹ��ϴ� ����߿��� �μ�Ƽ�긦 �޴� ����� �̸�, �μ�Ƽ����� ����ϴ� sql���� �ۼ��Ͻÿ�
--EMP���̺��� ������ �ۼ��غ���

SELECT ENAME ����̸� ,COMM �μ�Ƽ��
FROM EMP
WHERE COMM >0
order by comm desc

SELECT ENAME,COMM
FROM EMP
WHERE COMM IS NOT NULL

������ ���

SELECT ENAME,COMM
 FROM EMP
   INTERSECT -- �����ջ���Ͽ� �μ�Ƽ�� �޴� ����� �̾Ƴ���. 
SELECT ENAME,COMM
  FROM EMP
   WHERE COMM !=0 


3.TEMP ���̺��� ��̰� NULL �� �ƴ� ����� ������ �о���ÿ�.

SELECT EMP_NAME FROM TEMP WHERE HOBBY IS NOT NULL;

�� �̱������̼��� ���̸� ���ڿ� - varchar2
SELECT ENAME,COMM
    FROM EMP
WHERE COMM = 'null'

�츮 ȸ�翡 �ٹ��ϴ� ������� �޿� �Ѿ��� ���Դϱ�?

SELECT SUM(SAL) FROM EMP --SUM�Լ� ��ü�ձ���.

SELECT
     SUM(DECODE(job,'CLERK',sal)) AS "CLERKSUM"
    ,SUM(DECODE(job,'SALESMAN',sal)) AS "SALESMANSUM"
    ,SUM(DECODE(job,'CLERK',NULL,'SALESMAN',NULL,SAL)) AS "ETC_SUM"
FROM EMP




4.TEMP ���̺��� ��̰� NULL�� ����� ��� HOBBY�� ���������̶�� ���� ġȯ�Ͽ� �������� �������� �״�� ���� �о���ÿ�.

SELECT  EMP_NAME, NVL(HOBBY, '����') AS "HOBBY" --HOBBY�� �ΰ��� �������� ġȯ���ִ� �Լ� NVL
FROM TEMP;    

SELECT 
FROM
WHERE
ORDER BY
  
index�� �����ϴ� Į���� ���̺� �＼�� ���� ����� �����ϴ�.
order by ���� ������ �� �ִٸ�, �˻� �ӵ��� ���� �� �ִ�.


SELECT 
    /*+ index_desc(emp pk_emp)*/ empno
 
    FROM EMP -- �ε����� �ִ�.
    
    
-- ���̺��� pk�� �ε����� �����ȴ�.
--�ε����� �ִ� �÷��� ���̺� access���� ��°����ϴ�.

SELECT ROWID RNO FROM EMP --18�ڸ� ���

SELECT ENAME,DEPTNO, JOB FROM EMP
WHERE ROWID = 'AAARE8AAEAAAACTAAC'

DBMS�� ������ �ִ� ��� �������� ������ ������ �ĺ����̴�.
index���̺��� index key�� rowid�� ������.
������ �������� ������, index ���̺� ���� �ִ� rowid��
�ش� �����͸� ã�� ���� �ϳ��� ������ �����̴�.
1)6�ڸ� : ������ ������Ʈ ��ȣ
2)3�ڸ� : ������� ���� ��ȣ
3)6�ڸ� : ��Ϲ�ȣ
4)3�ڸ� : ��� ���� �� ��ȣ

rownum

SELECT ROWNUM,EMPNO FROM EMP

SELECT ROWNUM,EMPNO FROM EMP
WHERE DEPTNO = 30

    
SELECT ENAME FROM EMP;

SELECT EMPNO FROM EMP
ORDER BY EMPNO DESC

SELECT ENAME FROM EMP;

NVL


5.TEMP�� �ڷ� �� HOBBY�� ���� NULL�� ����� ����ꡯ���� ġȯ���� �� HOBBY�� ������� ����� ������ �������� ������ �ۼ��Ͻÿ�.

SELECT EMP_NAME, NVL(HOBBY, '����'), NVL(HOBBY, '���')
FROM TEMP

 
6.TEMP�� �ڷ� �� EMP_ID�� EMP_NAME�� ���� �������,���������� ǥ�õǾ� DISPLAY�ǵ��� COLUMN ALLIAS�� �ο��Ͽ� SELECT �Ͻÿ�.

SELECT  EMP_ID      ���,
        EMP_NAME AS ����
FROM TEMP;

  
7.TEMP�� �ڷḦ ���� ��(LEV)�� ASCENDING�ϸ鼭 ��������� �ٽ� ��� ������ 
DESCENDING�ϰ� �ϴ� ORDER BY�ϴ� ������ ����� ���ÿ�.

SELECT EMP_ID ��� , EMP_NAME ||'('||LEV||')' ����
FROM TEMP
ORDER BY EMP_ID

8. �����ȣ�� ORDERBY�ϱ�.

SELECT emp_id, emp_name FROM temp ORDER BY EMP_ID ;


--GROUP BY��

�츮 ȸ�翡 �ٹ��ϴ� ����鿡 ���켭 �μ��� ������� ����ϰ� �ʹ�. �����?

�������-> FK -DEPTNO
FK�� �ߺ��� ����ȴ�.
�ε����� �������� �ʴ´�.
FK�� �����̼��̴�.(1:N ��������)

SELECT EMPNO
 FROM EMP
GROUP BY DNAME

SELECT DEPTNO
 FROM EMP
GROUP BY DEPTNO

SELECT EMPNO
 FROM EMP
GROUP BY EMPNO


SELECT COUNT(EMPNO)
 FROM EMP
GROUP BY DEPTNO


SELECT DEPTNO, COUNT(EMPNO)-- �μ���ȣ, �����ȣ(�հ�)
 FROM EMP
GROUP BY DEPTNO


�׷��Լ�- AVG, COUNT, MAX, MIN, SUM

���̺� ��ü �����Ϳ��� ������� ����� ��� ���ؼ� �� ���տ�
�����Ͽ� �ϳ��� ����� ������.

�Ϲ��ķ��� �׷��Լ��� ���� �� �� �ֳ�?
����.

SELECT SUM(SAL) FROM EMP

SELECT SUM(SAL),ENAME FROM EMP

--�������� ������ �ذ�������, �ǹ̰� ����.
SELECT SUM(SAL), MAX(ENAME) FROM EMP

--�μ����� �հ�
SELECT SUM(SAL) FROM EMP
GROUP BY DEPTNO

--GROUP BY�� ����� �÷����� SELECT ������ ��������� �ǹ̰� �ִ�.
--�μ����� ~�ϴٴ� ��.

SELECT SUM(SAL),DEPTNO FROM EMP
GROUP BY DEPTNO

SELECT MAX(SAL),AVG(SAL),DEPTNO FROM EMP
GROUP BY DEPTNO

