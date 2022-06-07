
문제
temp에서 사번,성명,부서코드를 읽어내는데 부서명칭을 함께 보고 싶은 경우에 어떻게 하면 될까?

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


--inner join  은 join 조건을 만족하는 행만 질의의 결과로 가져온다.
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


NON-EQUAL 조인 : 조인 조건이 = 이 아닌 다른 연산기호로 주어지는 경우

TEMP와 EMP_LEVEL을 이용해  EMP_LEVEL의 과장 직급의
연봉 상한/하한 범위 내에 드는 
직원의 사번과 성명 ,직급, SLALARY를 읽어오는 SQL문을 작성하시오.

SELECT a.emp_id,A.EMP_NAME,A.LEV,A.SALARY
FROM TEMP a, EMP_LEVEL b
WHERE A.SALARY BETWEEN FROM_SAL AND TO_SAL
and B.LEV='과장' 


outer join
두 개 이상의 테이블 조인시 한쪽 테이블의 행에 대해 다른쪽 테이블에 일치하는
행이 없더라도 다른쪽 테이블의 행을 null로 하여 행을 return 하는 것이 outer join이다.

select 
    컬럼1,컬럼2...
    from 테이블1,테이블2
 where 테이블1.컬럼 = 테이블2. 컬럼(+)

이경우 기준이 되는 테이블은 테이블1이다.
결합된 컬럼 값이 테이블2에 없더라도 테이블1에 있으면
테이블2의 값들 중 테이블1과 일치되는 값이 없는 행은 모두 null로 리턴된다.


각 사번의 성명,SAL,연봉하한금액,연봉상한금액을 보고자 한다.
TEMP와 EMP_LEVEL을 조인하여 결과를 보여주되,
연봉의 상하한이 등록되어 있지 않은 수습 사원은 성명 , SAL 까지만 이라도 나올 수 있도록 쿼리문을 작성해보시오.

select B.EMP_NAME 성명 ,B.EMP_ID 사번,B.SALARY 연봉 ,A.FROM_SAL 하한금액,A.TO_SAL 상한금액
from emp_level a, temp b
where B.LEV = A.LEV(+)


SELECT 
a.EMP_NAME 성명 ,a.EMP_ID 사번,a.SALARY 연봉 ,b.FROM_SAL 하한금액,b.TO_SAL 상한금액
FROM TEMP a, emp_level b
WHERE a.lev = b.lev(+)

--emplevel에는 수습이 없다. 없는쪽에 +를 붙여야한다.


SELECT 
a.emp_id 사번,a.emp_name 성명,a.salary 연봉 ,b.from_sal 하한금액,b.to_sal 상한금액
FROM TEMP a LEFT OUTER JOIN emp_level b 
    ON a.lev = b.lev
    

SELECT 
a.emp_id 사번,a.emp_name 성명,a.salary 연봉 ,b.from_sal 하한금액,b.to_sal 상한금액
FROM TEMP a RIGHT OUTER JOIN emp_level b 
    ON a.lev = b.lev
    
    
TDEPT 테이블에 자신의 상위 부서정보를 관리하고 있다.
이 테이블을 이용하며 부서코드, 부서명, 상위부서코드, 상위부서명을 읽어오는 쿼리를 작성하시오.

SELECT
    A.DEPT_CODE as "부서코드"
        , A.DEPT_NAME  as "부서명"
        ,B.DEPT_CODE as "상위부서코드"
        ,B.DEPT_NAME as "상위부서명"
FROM TDEPT a, TDEPT b
where b.dept_code = a.parent_dept


SELECT A.DEPT_CODE 부서코드, a.dept_name 부서명, b.dept_code 상위부서코드, B.DEPT_NAME 상위부서명
FROM TDEPT a,TDEPT b
WHERE B.DEPT_CODE = A.PARENT_DEPT

도전문제
temp와 tdept를 이용하여 다음 컬럼을 보여주는 SQL을 만들어 보자.
상위부서가 'CA0001'인 부서에 소속된 직원을 1.사번, 2.성명, 3.부서코드
4.부서명, 5.상위부서코드, 6.상위부서명, 7.상위부서장코드, 8.상위부서장성명
순서로 보여주면 된다.

SELECT A.EMP_ID 사번, A.EMP_NAME 성명, 
B.DEPT_CODE 부서코드,B.DEPT_NAME 부서명, 
C.DEPT_CODE 상위부서코드,C.DEPT_NAME 상위부서명, 
D.EMP_ID 상위부서장코드, D.EMP_NAME 상위부서장성명

FROM temp a, tdept b, tdept c, temp d
WHERE B.DEPT_CODE = A.DEPT_CODE
AND C.DEPT_CODE = B.PARENT_DEPT
AND C.DEPT_CODE = 'CA0001'
AND D.EMP_ID = C.BOSS_ID

