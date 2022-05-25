1.월 급여는 연봉을 18로 나누어 홀수 달에는 연봉의 1/18이 지급되고, 짝수달에는 연봉의 2/18가 지급된다고 가정했을 때 홀수 달과 짝수 달에 받을 금액을 나타내시오.

SELECT EMP_NAME as 사원이름, salary||'원' as 급여,
    TO_CHAR(round(SALARY/18,-1),'999,999,999')||'원' "홀수달 급여", 
     TO_CHAR(ROUND(SALARY*2/18,-1),'999,999,999')||'원' "짝수달 급여" 
FROM TEMP;


 
SELECT TO_CHAR(123467, 'FM999,999')        --123,467
     , TO_CHAR(123467890, 'FM999,999,999') --123,467,890
     , TO_CHAR(123467, 'FML999,999')       --￦123,467
    FROM dual

SELECT ROUND(1234567.456, 1) -- 소수 2번째 자리에서 반올림하기
,ROUND(1234567.456, -1)-- 소수점 기준으로 위로 올라가면 음수로 생각함
,ROUND(1234567.456, -2)
,ROUND(1234567.456, 2)
FROM DUAL


SELECT
    550000, TO_CHAR(SYSDATE,'YYYYMMDD')
        ,TO_CHAR(sysdate,'MMDD')
        ,sysdate,sysdate-1,sysdate+1
FROM dual

숫자형을 문자형으로 전환해 주는 함수가 있다.

SELECT
    550000, TO_CHAR(550000,'999,999')
    ,TO_CHAR(5500000,'999,999,999')
    ,TO_CHAR(5500000.123,'999,999,999.999')
FROM dual

2.위에서 구한 월 급여에 교통비가 10만원씩 지급된다면(짝수달은 20만원)위의 문장이 
어떻게 바뀔지 작성해 보시오.

SELECT EMP_NAME as 사원이름, salary||'원' as 급여,
    TO_CHAR(round(SALARY/18,-1)+100000,'999,999,999')||'원' "홀수달 급여", --10만원증가 
     TO_CHAR(ROUND(SALARY*2/18,-1)+200000,'999,999,999')||'원' "짝수달 급여" --20만원증가
FROM TEMP

null은 모른다, 결정되지 않았다, 그래서 연산대상이 아니다.

SELECT 
COUNT(EMPNO),COUNT(COMM)
FROM EMP

SELECT ENAME,SAL FROM EMP

--선분조건이다. range scan을 하는 예약어이다. 
--구간검색.
--점조건이다.

SELECT EMPNO FROM EMP 
WHERE ENAME='SCOTT';

우리 회사에 근무하는 사원 중에서 부서번호가 10이거나 30인 사원의 이름과 부서 번호를 출력하는 SQL문을 작성하시오

SELECT ENAME 사원명, DEPTNO 부서번호
    FROM EMP
WHERE DEPTNO = '10' OR DEPTNO ='30'
ORDER BY DEPTNO

--UNION ALL로 처리하기!
SELECT ENAME, DEPTNO FROM EMP
WHERE DEPTNO='10'
UNION ALL
SELECT ENAME, DEPTNO FROM EMP
WHERE DEPTNO='30'

--WHERE IN 조건으로 검색하기.
SELECT ENAME,DEPTNO FROM EMP
WHERE DEPTNO IN(10,30)
ORDER BY DEPTNO


우리회사에서 근무하는 사원중에서 인센티브를 받는 사원의 이름, 인센티브액을 출력하는 sql문을 작성하시오
--EMP테이블을 가지고 작성해보기

SELECT ENAME 사원이름 ,COMM 인센티브
FROM EMP
WHERE COMM >0
order by comm desc

SELECT ENAME,COMM
FROM EMP
WHERE COMM IS NOT NULL

집합적 사고

SELECT ENAME,COMM
 FROM EMP
   INTERSECT -- 교집합사용하여 인센티브 받는 사람만 뽑아내기. 
SELECT ENAME,COMM
  FROM EMP
   WHERE COMM !=0 


3.TEMP 테이블에서 취미가 NULL 이 아닌 사람의 성명을 읽어오시오.

SELECT EMP_NAME FROM TEMP WHERE HOBBY IS NOT NULL;

값 싱글쿼테이션을 붙이면 문자열 - varchar2
SELECT ENAME,COMM
    FROM EMP
WHERE COMM = 'null'

우리 회사에 근무하는 사원들의 급여 총액은 얼마입니까?

SELECT SUM(SAL) FROM EMP --SUM함수 전체합구함.

SELECT
     SUM(DECODE(job,'CLERK',sal)) AS "CLERKSUM"
    ,SUM(DECODE(job,'SALESMAN',sal)) AS "SALESMANSUM"
    ,SUM(DECODE(job,'CLERK',NULL,'SALESMAN',NULL,SAL)) AS "ETC_SUM"
FROM EMP




4.TEMP 테이블에서 취미가 NULL인 사람은 모두 HOBBY를 “없음”이라고 값을 치환하여 가져오고 나머지는 그대로 값을 읽어오시오.

SELECT  EMP_NAME, NVL(HOBBY, '없음') AS "HOBBY" --HOBBY의 널값을 없음으로 치환해주는 함수 NVL
FROM TEMP;    

SELECT 
FROM
WHERE
ORDER BY
  
index가 존재하는 칼럼은 테이블 억세스 없이 출력이 가능하다.
order by 없이 정렬할 수 있다면, 검색 속도를 높일 수 있다.


SELECT 
    /*+ index_desc(emp pk_emp)*/ empno
 
    FROM EMP -- 인덱스에 있다.
    
    
-- 테이블에서 pk는 인덱스가 제공된다.
--인덱스가 있는 컬럼은 테이블 access없이 출력가능하다.

SELECT ROWID RNO FROM EMP --18자리 출력

SELECT ENAME,DEPTNO, JOB FROM EMP
WHERE ROWID = 'AAARE8AAEAAAACTAAC'

DBMS가 가지고 있는 모든 데이터의 각각의 고유한 식별자이다.
index테이블은 index key와 rowid로 구성됨.
실제로 존재하지 않으며, index 테이블 내에 있는 rowid는
해당 데이터를 찾기 위한 하나의 논리적인 정보이다.
1)6자리 : 데이터 오브젝트 번호
2)3자리 : 상대적인 파일 번호
3)6자리 : 블록번호
4)3자리 : 블록 내의 행 번호

rownum

SELECT ROWNUM,EMPNO FROM EMP

SELECT ROWNUM,EMPNO FROM EMP
WHERE DEPTNO = 30

    
SELECT ENAME FROM EMP;

SELECT EMPNO FROM EMP
ORDER BY EMPNO DESC

SELECT ENAME FROM EMP;

NVL


5.TEMP의 자료 중 HOBBY의 값이 NULL인 사원을 ‘등산’으로 치환했을 때 HOBBY가 ‘등산인 사람의 성명을 가져오는 문장을 작성하시오.

SELECT EMP_NAME, NVL(HOBBY, '없음'), NVL(HOBBY, '등산')
FROM TEMP

 
6.TEMP의 자료 중 EMP_ID와 EMP_NAME을 각각 ‘사번’,’성명’으로 표시되어 DISPLAY되도록 COLUMN ALLIAS를 부여하여 SELECT 하시오.

SELECT  EMP_ID      사번,
        EMP_NAME AS 성명
FROM TEMP;

  
7.TEMP의 자료를 직급 명(LEV)에 ASCENDING하면서 결과내에서 다시 사번 순으로 
DESCENDING하게 하는 ORDER BY하는 문장을 만들어 보시오.

SELECT EMP_ID 사번 , EMP_NAME ||'('||LEV||')' 성명
FROM TEMP
ORDER BY EMP_ID

8. 사원번호로 ORDERBY하기.

SELECT emp_id, emp_name FROM temp ORDER BY EMP_ID ;


--GROUP BY절

우리 회사에 근무하는 사원들에 대헤서 부서별 사원수를 출력하고 싶다. 어떡하지?

사원집합-> FK -DEPTNO
FK는 중복이 허락된다.
인덱스를 제공하지 않는다.
FK는 릴레이션이다.(1:N 관계형태)

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


SELECT DEPTNO, COUNT(EMPNO)-- 부서번호, 사원번호(합계)
 FROM EMP
GROUP BY DEPTNO


그룹함수- AVG, COUNT, MAX, MIN, SUM

테이블 전체 데이터에서 통계적인 결과를 얻기 위해서 행 집합에
적용하여 하나의 결과를 생산함.

일반컴럼과 그룹함수가 같이 올 수 있나?
없다.

SELECT SUM(SAL) FROM EMP

SELECT SUM(SAL),ENAME FROM EMP

--문법적인 문제는 해결했지만, 의미가 없다.
SELECT SUM(SAL), MAX(ENAME) FROM EMP

--부서별로 합계
SELECT SUM(SAL) FROM EMP
GROUP BY DEPTNO

--GROUP BY에 사용한 컬럼명은 SELECT 다음에 사용했을떄 의미가 있다.
--부서별로 ~하다는 뜻.

SELECT SUM(SAL),DEPTNO FROM EMP
GROUP BY DEPTNO

SELECT MAX(SAL),AVG(SAL),DEPTNO FROM EMP
GROUP BY DEPTNO

