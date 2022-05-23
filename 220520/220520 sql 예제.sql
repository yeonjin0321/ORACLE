SELECT DEPTNO,DNAME,LOC FROM DEPT

SELECT empno, ename,job,mgr,hiredate,comm,sal,deptno FROM emp


DELETE FROM DEPT 

DELETE FROM EMP

rollback

DEPT DEPTNO 
EMP DEPTNO 

SELECT 컬럼명1, 컬럼명2
    FROM 집합이름
        WHERE 컬럼명 = 값
        
우리 회사에 근무하는 사원 중에서 이름이 scott인 사람이 있니?

SELECT empno 사원번호
    FROM emp
    WHERE ename = 'SCOTT';
    
    SELECT count(empno)
    FROM emp
    WHERE ename = 'ALLEN';
    
    SELECT 함수명(칼럼명)
    FROM emp
    WHERE ename = 'SCOTT';
    
우리 회사에 근무하는 사원 중에서 이름이 scott인 사람이 몇 명이니?
tomato아이디가 존재하니?
tomato아이디가 몇 개 있니?

SELECT * FROM member

INSERT INTO member(mem_no,mem_id,mem_pw,mem_name)
VALUES(4,'nice','123','나신입')

rollback

query문

SELECT 
    mem_name
WHERE 아이디 = 값
    AND 비번 = 값
    
SELECT 
    mem_name    
 FROM member 
WHERE mem_id =:mid
    AND mem_pw =:mpw