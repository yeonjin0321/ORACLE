DDL(��ü����) - DBA

DCL(����) - DB���� ��ڰ� �ؾ��� ����.

DML(SELECT, INSERT, DELETE, UPDATE): ������ ���۾�

��ȸ(�����ȸ, �ֹ���ȸ ���...)
�Է�,����,����(�Ƿ����� ���� ����.)

SELECT �÷���1, �÷���2, .....
FROM �����̸�(SELECT��- �ζ��κ�)

SELECT ename, job, hiredate
    FROM emp
    
SELECT ename as "�̸�", job, hiredate
    FROM emp
    
50����
��Ƽ������ -�ϲ� -jvm
�츮 ȸ�翡 �ٹ��ϴ� ��� �߿��� ALLEN����� �޿��� ���ΰ���?

SELECT SAL
    FROM emp
        WHERE ENAME = 'ALLEN'

�츮 ȸ�翡 �ٹ��ϴ� ��� �߿��� �޿��� 1000�޷� �̻��� ����� �̸�, �޿��� ����غ�����

SELECT  ENAME as "�̸�", SAL as "�޿�"
    FROM emp
        WHERE SAL>1000 
        
FORD�� �Ի���, �μ���ȣ�� ����غ���

SELECT HIREDATE,DEPTNO
    FROM emp
            WHERE ENAME = 'FORD'

ALLEN������� �޿��� ���� ����� �̸� ���(��������)

SELECT ENAME as "�̸�"
    FROM emp
        WHERE SAL>(SELECT SAL
        FROM emp
        WHERE ENAME = 'SCOTT');
        
SELECT
     empno �����ȣ
        ,empno as "�����ȣ2" 
        ,empno �����ȣ    
  FROM emp
  
or�� �������̴�. �ϳ��� �����ϸ� �ȴ�.

SELECT ename , sal
    FROM emp
        WHERE SAL >=2000    
            OR deptno =20
            
SELECT SAL 
    FROM emp
        WHERE ENAME = 'ALLEN'
        
SELECT SAL 
    FROM emp
        WHERE ENAME = 'allen'
