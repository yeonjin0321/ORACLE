SELECT DEPTNO,DNAME,LOC FROM DEPT

SELECT empno, ename,job,mgr,hiredate,comm,sal,deptno FROM emp


DELETE FROM DEPT 

DELETE FROM EMP

rollback

DEPT DEPTNO 
EMP DEPTNO 

SELECT �÷���1, �÷���2
    FROM �����̸�
        WHERE �÷��� = ��
        
�츮 ȸ�翡 �ٹ��ϴ� ��� �߿��� �̸��� scott�� ����� �ִ�?

SELECT empno �����ȣ
    FROM emp
    WHERE ename = 'SCOTT';
    
    SELECT count(empno)
    FROM emp
    WHERE ename = 'ALLEN';
    
    SELECT �Լ���(Į����)
    FROM emp
    WHERE ename = 'SCOTT';
    
�츮 ȸ�翡 �ٹ��ϴ� ��� �߿��� �̸��� scott�� ����� �� ���̴�?
tomato���̵� �����ϴ�?
tomato���̵� �� �� �ִ�?

SELECT * FROM member

INSERT INTO member(mem_no,mem_id,mem_pw,mem_name)
VALUES(4,'nice','123','������')

rollback

query��

SELECT 
    mem_name
WHERE ���̵� = ��
    AND ��� = ��
    
SELECT 
    mem_name    
 FROM member 
WHERE mem_id =:mid
    AND mem_pw =:mpw