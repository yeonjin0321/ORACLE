1.월 급여는 연봉을 18로 나누어 홀수 달에는 연봉의 1/18이 지급되고, 짝수달에는 연봉의 2/18가 지급된다고 가정했을 때 홀수 달과 짝수 달에 받을 금액을 나타내시오.

SELECT EMP_NAME as 사원이름, salary||'원' as 급여,
    TO_CHAR(round(SALARY/18,-1),'999,999,999')||'원' "홀수달 급여", 
     TO_CHAR(ROUND(SALARY*2/18,-1),'999,999,999')||'원' "짝수달 급여" 
FROM TEMP;


 
SELECT TO_CHAR(123467, 'FM999,999')        --123,467
     , TO_CHAR(123467890, 'FM999,999,999') --123,467,890
     , TO_CHAR(123467, 'FML999,999')       --￦123,467
    FROM dual


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


3.TEMP 테이블에서 취미가 NULL 이 아닌 사람의 성명을 읽어오시오.

SELECT EMP_NAME
FROM TEMP
WHERE HOBBY IS NOT NULL;
 
4.TEMP 테이블에서 취미가 NULL인 사람은 모두 HOBBY를 “없음”이라고 값을 치환하여 가져오고 나머지는 그대로 값을 읽어오시오.

SELECT  EMP_NAME, NVL(HOBBY, '없음') --HOBBY의 널값을 없음으로 치환해주는 함수 NVL
FROM TEMP;    


  
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
