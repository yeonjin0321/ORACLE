1.�� �޿��� ������ 18�� ������ Ȧ�� �޿��� ������ 1/18�� ���޵ǰ�, ¦���޿��� ������ 2/18�� ���޵ȴٰ� �������� �� Ȧ�� �ް� ¦�� �޿� ���� �ݾ��� ��Ÿ���ÿ�.

SELECT EMP_NAME as ����̸�, salary||'��' as �޿�,
    TO_CHAR(round(SALARY/18,-1),'999,999,999')||'��' "Ȧ���� �޿�", 
     TO_CHAR(ROUND(SALARY*2/18,-1),'999,999,999')||'��' "¦���� �޿�" 
FROM TEMP;


 
SELECT TO_CHAR(123467, 'FM999,999')        --123,467
     , TO_CHAR(123467890, 'FM999,999,999') --123,467,890
     , TO_CHAR(123467, 'FML999,999')       --��123,467
    FROM dual


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


3.TEMP ���̺��� ��̰� NULL �� �ƴ� ����� ������ �о���ÿ�.

SELECT EMP_NAME
FROM TEMP
WHERE HOBBY IS NOT NULL;
 
4.TEMP ���̺��� ��̰� NULL�� ����� ��� HOBBY�� ���������̶�� ���� ġȯ�Ͽ� �������� �������� �״�� ���� �о���ÿ�.

SELECT  EMP_NAME, NVL(HOBBY, '����') --HOBBY�� �ΰ��� �������� ġȯ���ִ� �Լ� NVL
FROM TEMP;    


  
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
