
����
temp���� ���,����,�μ��ڵ带 �о�µ� �μ���Ī�� �Բ� ���� ���� ��쿡 ��� �ϸ� �ɱ�?

select a.emp_id,a.emp_name,a.dept_code,b.dept_name
from temp a,tdept b
where a.DEPT_CODE = b.DEPT_CODE

select a.deptno
from emp a, dept b

select NVL(a.deptno,0)
from emp a, dept b

select a.deptno
from emp a, dept b
WHERE a.deptno =10

select a.deptno,a.ename
from emp a, dept b
where nvl(a.deptno,0) =10


select a.ename
from emp a, dept b
where comm is not null


--inner join  �� join ������ �����ϴ� �ุ ������ ����� �����´�.
select
a.emp_id, a.emp_name,
b.dept_code, b.dept_name
from temp a INNER JOIN tdept b 
ON a.dept_code = b.dept_code


SELECT 
A.EMP_ID,A.EMP_NAME,A.SALARY+B.COMM
FROM TEMP a,TCOM b
where a.emp_id = b.emp_id
 and b.work_year = '2001'


NON-EQUAL ���� : ���� ������ = �� �ƴ� �ٸ� �����ȣ�� �־����� ���

TEMP�� EMP_LEVEL�� �̿���  EMP_LEVEL�� ���� ������
���� ����/���� ���� ���� ��� 
������ ����� ���� ,����, SLALARY�� �о���� SQL���� �ۼ��Ͻÿ�.

SELECT a.emp_id,A.EMP_NAME,A.LEV,A.SALARY
FROM TEMP a, EMP_LEVEL b
WHERE A.SALARY BETWEEN FROM_SAL AND TO_SAL
and B.LEV='����' 


outer join
�� �� �̻��� ���̺� ���ν� ���� ���̺��� �࿡ ���� �ٸ��� ���̺� ��ġ�ϴ�
���� ������ �ٸ��� ���̺��� ���� null�� �Ͽ� ���� return �ϴ� ���� outer join�̴�.

select 
    �÷�1,�÷�2...
    from ���̺�1,���̺�2
 where ���̺�1.�÷� = ���̺�2. �÷�(+)

�̰�� ������ �Ǵ� ���̺��� ���̺�1�̴�.
���յ� �÷� ���� ���̺�2�� ������ ���̺�1�� ������
���̺�2�� ���� �� ���̺�1�� ��ġ�Ǵ� ���� ���� ���� ��� null�� ���ϵȴ�.


�� ����� ����,SAL,�������ѱݾ�,�������ѱݾ��� ������ �Ѵ�.
TEMP�� EMP_LEVEL�� �����Ͽ� ����� �����ֵ�,
������ �������� ��ϵǾ� ���� ���� ���� ����� ���� , SAL ������ �̶� ���� �� �ֵ��� �������� �ۼ��غ��ÿ�.

select B.EMP_NAME ���� ,B.EMP_ID ���,B.SALARY ���� ,A.FROM_SAL ���ѱݾ�,A.TO_SAL ���ѱݾ�
from emp_level a, temp b
where B.LEV = A.LEV(+)


SELECT 
a.EMP_NAME ���� ,a.EMP_ID ���,a.SALARY ���� ,b.FROM_SAL ���ѱݾ�,b.TO_SAL ���ѱݾ�
FROM TEMP a, emp_level b
WHERE a.lev = b.lev(+)

--emplevel���� ������ ����. �����ʿ� +�� �ٿ����Ѵ�.


SELECT 
a.emp_id ���,a.emp_name ����,a.salary ���� ,b.from_sal ���ѱݾ�,b.to_sal ���ѱݾ�
FROM TEMP a LEFT OUTER JOIN emp_level b 
    ON a.lev = b.lev
    

SELECT 
a.emp_id ���,a.emp_name ����,a.salary ���� ,b.from_sal ���ѱݾ�,b.to_sal ���ѱݾ�
FROM TEMP a RIGHT OUTER JOIN emp_level b 
    ON a.lev = b.lev
    
    
TDEPT ���̺� �ڽ��� ���� �μ������� �����ϰ� �ִ�.
�� ���̺��� �̿��ϸ� �μ��ڵ�, �μ���, �����μ��ڵ�, �����μ����� �о���� ������ �ۼ��Ͻÿ�.

SELECT
    A.DEPT_CODE as "�μ��ڵ�"
        , A.DEPT_NAME  as "�μ���"
        ,B.DEPT_CODE as "�����μ��ڵ�"
        ,B.DEPT_NAME as "�����μ���"
FROM TDEPT a, TDEPT b
where b.dept_code = a.parent_dept


SELECT A.DEPT_CODE �μ��ڵ�, a.dept_name �μ���, b.dept_code �����μ��ڵ�, B.DEPT_NAME �����μ���
FROM TDEPT a,TDEPT b
WHERE B.DEPT_CODE = A.PARENT_DEPT

��������
temp�� tdept�� �̿��Ͽ� ���� �÷��� �����ִ� SQL�� ����� ����.
�����μ��� 'CA0001'�� �μ��� �Ҽӵ� ������ 1.���, 2.����, 3.�μ��ڵ�
4.�μ���, 5.�����μ��ڵ�, 6.�����μ���, 7.�����μ����ڵ�, 8.�����μ��强��
������ �����ָ� �ȴ�.

SELECT A.EMP_ID ���, A.EMP_NAME ����, 
B.DEPT_CODE �μ��ڵ�,B.DEPT_NAME �μ���, 
C.DEPT_CODE �����μ��ڵ�,C.DEPT_NAME �����μ���, 
D.EMP_ID �����μ����ڵ�, D.EMP_NAME �����μ��强��

FROM temp a, tdept b, tdept c, temp d
WHERE B.DEPT_CODE = A.DEPT_CODE
AND C.DEPT_CODE = B.PARENT_DEPT
AND C.DEPT_CODE = 'CA0001'
AND D.EMP_ID = C.BOSS_ID

