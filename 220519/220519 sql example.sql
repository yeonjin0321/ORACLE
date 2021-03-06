1.emp와 dept를 조인하여 부서번호 부서명 이름 급여를 출력하여라

SELECT D.DEPTNO, D.DNAME, E.ENAME, E.SAL
    FROM EMP E, DEPT D
        WHERE E.DEPTNO = D.DEPTNO
        
2.이름이 ALLEN인 사원의 부서명을 출력하라

SELECT E.ENAME, D.DNAME
    FROM EMP E, DEPT D
        WHERE E.DEPTNO = D.DEPTNO
        AND E.ENAME = 'ALLEN';
        
3.DEPT Table에 있는 모든 부서를 출력하고, 
EMP Table에 있는 DATA와 JOIN하여 모든 사원의 이름, 부서번호, 부서명, 급여를 출력하라.

SELECT E.ENAME, D.DEPTNO, D.DNAME, E.SAL
    FROM EMP E, DEPT D
        WHERE E.DEPTNO(+) = D.DEPTNO
        
4)EMP Table에 있는 EMPNO와 MGR을 이용하여 서로의 관계를 다음과 같이 출력하라.
SMITH의 매니저는 FORD이다.

SELECT E.ENAME || '의 매니저는' || M.ENAME||'이다.'
    FROM EMP E, EMP M
        WHERE E.MGR = M.EMPNO
        AND E.ENAME = 'SMITH'
        
5)'ALLEN'의 직무와 같은 사람의 이름, 부서명, 급여, 직무를 출력하라.

SELECT ENAME, DNAME, SAL, JOB
  FROM EMP E, DEPT D
 WHERE E.DEPTNO = D.DEPTNO
   AND JOB = (SELECT JOB
                FROM EMP
      WHERE ENAME = 'ALLEN')
      
6)'JONES'가 속해있는 부서의 모든사람의 사원번호, 이름, 입사일, 급여를 출력하라.

SELECT EMPNO, ENAME, HIREDATE, SAL
  FROM EMP
 WHERE DEPTNO = (SELECT DEPTNO
                   FROM EMP
      WHERE ENAME = 'JONES')
      
       
7)전체 사원의 평균임금보다 많은 사원의 사원번호, 이름, 부서명, 입사일, 지역, 급여를출력하라.

SELECT E.EMPNO, E.ENAME, D.DNAME, E.HIREDATE, D.LOC, E.SAL
  FROM EMP E, DEPT D
 WHERE E.DEPTNO = D.DEPTNO
   AND SAL > (SELECT AVG(SAL)
                FROM EMP)
 