2.��� ����� �̸�, �޿�, Ŀ�̼�, �Ѿ�(�޿�+Ŀ�̼�)�� ���Ͽ� �Ѿ��� ���� ������ ����Ͽ���
(��,Ŀ�̼��� null�� ����� 0�����ؼ� �����Ͽ���.)

select ename, sal, NVL(COMM,0) AS "Ŀ�̼�", SAL+NVL(COMM,0) AS "�Ѿ�"
FROM EMP
ORDER BY SAL+NVL(COMM,0) DESC;


3.10���μ��� ��� ������� �޿��� 13%�� ���ʽ��� �����ϱ�� �Ͽ���. 10���μ� ������� �̸�,�޿�,���ʽ� �ݾ�,�μ���ȣ�� ����Ͽ���.

SELECT ename, sal, sal*1.13, deptno
FROM emp 
WHERE deptno =10;

4.�޿��� $1,500����$3,000 ������ ����� ���ؼ��� �޿��� 15%�� ȸ��� �����ϱ�� �Ͽ���. 
���ǿ� �ش�Ǵ� ����� �̸�,�޿�,ȸ��(�Ҽ����� 2�ڸ����� �ݿø�)�� ����Ͽ���.

SELECT ENAME, SAL, ROUND(SAL*0.15,2) AS "ȸ��"
FROM EMP
WHERE SAL BETWEEN 1500 AND 3000

SELECT ename, hiredate, hiredate+90 AS "�Ի���+90��",sal?
FROM emp; 

5.��� ����� �μ���ȣ, �̸�, �Ի���, ������, �Ի��Ϻ��� ��������� �ٹ� �� ��(�Ҽ��� ���� ����),�ٹ� �� ��, �ٹ� �� ��(30�� ����), �ٹ� �ּ��� ����Ͽ���.
select deptno, ename, hiredate, sysdate "������" , trunc(sysdate-hiredate) "�ٹ��ϼ�",
floor(trunc(sysdate-hiredate)/365) "�ٹ����", floor(trunc(sysdate-hiredate)/30) "�ٹ�����",
floor(trunc(sysdate-hiredate)/7) "�ٹ��ּ�"
from emp

6.��� ����� ���� �Ի��Ϸκ��� 90���� ���� ���� ��¥�� ����ؼ� �̸�, �Ի���, 90�� ���� ��¥,�޿��� ����Ͽ���.
select ename, hiredate, hiredate+90 "90�� ��", sal 
from emp

7.��� ����� ���� �Ի��� ���� �� �� �ϼ��� ����Ͽ� �μ� ��ȣ, �̸�, �ٹ� �� ���� ����Ͽ���.

select deptno, ename, last_day(hiredate)-hiredate "�ٹ� �ϼ�" 
from emp;

8.��� ����� ���� �Ի��� ���κ��� 60���� ���� ���� '������'�� �� ��,�� ��,�� �������� ���Ͽ� �̸�, �Ի���, 60�� ���� '������' ��¥�� ����Ͽ���.

select ename, hiredate "�Ի���", to_char(next_day(hiredate+60, 2) , 'yyyy/mm/dd') "60�� ���� ������"
 from emp
 
 next_day(��������, ���Ϲ��ڿ�(Ȥ�� ��ȣ))
- �Ͽ�ȭ�������(����) Ȥ�� 1(��) ~ 7(��)

9.�̸��� ���ڼ��� 6�� �̻��� ����� �̸��� �տ��� 3�ڸ� ���Ͽ� �ҹ��ڷ� �̸��� ����Ͽ���.

select lower(substr(ename,1,3)) "�̸�" 
from emp 
where length(ename)>=6

substr(���ڿ�, ������ġ, ����)
- ������ġ���� ������ŭ ���ڿ��� �ڸ���. ������ �������� ���� ��� ���ڿ� ������ ���

10.��� ����� ���� ����� �̸��� �տ��� �� ���ڸ� �빮�ڷ�, ������ �ҹ��ڷ� �Ͽ� �̸�, ����, �μ� ��ȣ�� ����Ͽ���.

SELECT UPPER(SUBSTR(ENAME,1,3)) "�̸�", LOWER(JOB) "����",DEPTNO
FROM EMP

11.��� ����� ���� ����� �̸��� �μ� ��ȣ�� �ռ����� "���Ό��"��� HEADING���� ����Ͽ���.

SELECT CONCAT(ENAME,DEPTNO) AS "���Ό��"
FROM EMP

12.����� ������ 'SAL'�� �����ϴ� ����� �̸��� ��� �̸��� ���̸� ����Ͽ���.

SELECT ENAME, LENGTH(ENAME) "����"
FROM EMP
WHERE JOB LIKE 'SAL%'

13.�̸��� �� ��° ���ڰ� 'A'�� ������� �̸��� ������ ����Ͽ���(��, ������ �տ������� �� ���ڷ� �ٿ� ǥ���Ͽ���.).

select ename, substr(job,1,3) "����" from emp
where ename like '_A%'

14.������ 7������ 7����, �׸��� 30���� ���� ���� ù ��° �������� ����Ͽ���.

SELECT SYSDATE+7 AS "7����",SYSDATE-7 AS "7����",NEXT_DAY(SYSDATE+30,'������') AS "30��"
FROM DUAL

15.������ 'CLERK'�� ������� ��� ��ȣ, �̸�, �޿��� ǥ���Ͽ���(��, �޿��� 1000�������� �޸�(,)�� ��� �տ��� ������ ȭ������� �ٿ� ǥ���Ͽ���.)

select deptno, ename, to_char(sal, 'L9,999,999') "�޿�" 
from emp 
where job = 'CLERK'

to_char(��ġ, [��ġ����])
- 999,999: �޸� ǥ��
- 999.99: �Ҽ��� ǥ��
- $: �̱��� ȭ�� ǥ��
- L: �ѱ��� ȭ�� ǥ��
- S: ���, ���� �� ǥ�� 

16.������� ��� ��ȣ�� �޿�, Ŀ�̼�,����((comm+sal)*12)�� ������ ���� ������ ����Ͽ���(��,Ŀ�̼��� null�� ����� 0 ���� ����Ͽ���.).

select empno, sal, nvl(comm,0) "Ŀ�̼�", ((nvl(comm,0)+sal)*12) "����"
FROM EMP
order by "����" desc

decode(���ذ�, �񱳰�, �ش簪, ���ش簪)

17.��� ����� ���� �Ի��Ϸκ��� 6������ ���� ���� ��¥�� ����ؼ� �̸�, �Ի���, 6���� ���� ��¥�� ����Ͽ���.
select ename, add_months(hiredate, 6) "6���� ��" from emp

add_months(������, ������)
- ������ ��� �ش簳�� ���� ���Ѵ�

18.��� ����� ���� ������� �̸�, �޿�, Ŀ�̼��� �޿��� ���� �ͺ��� ����Ͽ���
(��, Ŀ�̼��� ���� ����� 'No Commission'�̶�� ���� ��µǰ��Ͽ���.)

select ename, sal, decode(comm, null, 'No Commission', comm) "Ŀ�̼�" from emp
order by comm

19.'CLERK'�� 20%, 'SALESMAN'�� 15%,'ANALYST'�� 10%, 'MANAGER'�� 5%, 
'PRESIDENT' �� 0%�� ���� ������ ���� �޿��λ��� �ٸ��� �� ���, ��� ������� �̸�, ����, �޿�, �λ� ���� �޿��� ����Ͽ���.

select ename, job, sal, (decode(job, 'CLERK', 0.2, 'SALESMAN', 0.15,
'ANALYST', 0.1, 'MANAGER', 0.05, 'PRESIDENT', 0) * sal) + sal "�λ� ��" from emp

20. ��� ������� �Ի��� �⵵�� �Ի��� ���� ����Ͽ���.

select to_char(hiredate, 'yyyy') "�Ի�⵵", to_char(hiredate, 'mm') "�Ի��"
from emp

21.�����ȣ�� ¦���� ������� ��� ������ ����Ͽ���.
select * 
from emp 
where mod(empno, 2) = 0