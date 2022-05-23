DDL(객체생성) - DBA

DCL(권한) - DB서버 운영자가 해야할 역할.

DML(SELECT, INSERT, DELETE, UPDATE): 데이터 조작어

조회(배송조회, 주문조회 경우...)
입력,수정,삭제(실력차이 거의 없다.)

SELECT 컬럼명1, 컬럼명2, .....
FROM 집합이름(SELECT문- 인라인뷰)

SELECT ename, job, hiredate
    FROM emp
    
SELECT ename as "이름", job, hiredate
    FROM emp
    
50만명
옵티마이저 -일꾼 -jvm
우리 회사에 근무하는 사원 중에서 ALLEN사원의 급여는 얼마인가요?

SELECT SAL
    FROM emp
        WHERE ENAME = 'ALLEN'

우리 회사에 근무하는 사원 중에서 급여가 1000달러 이상인 사원의 이름, 급여를 출력해보세요

SELECT  ENAME as "이름", SAL as "급여"
    FROM emp
        WHERE SAL>1000 
        
FORD의 입사일, 부서번호를 출력해보자

SELECT HIREDATE,DEPTNO
    FROM emp
            WHERE ENAME = 'FORD'

ALLEN사원보다 급여가 높은 사원의 이름 출력(서브쿼리)

SELECT ENAME as "이름"
    FROM emp
        WHERE SAL>(SELECT SAL
        FROM emp
        WHERE ENAME = 'SCOTT');
        
SELECT
     empno 사원번호
        ,empno as "사원번호2" 
        ,empno 사원번호    
  FROM emp
  
or은 합집합이다. 하나만 만족하면 된다.

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
