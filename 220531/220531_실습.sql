CREATE TABLE LECTURE (LEC_ID VARCHAR2(05),LEC_TIME NUMBER,LEC_POINT NUMBER);
INSERT INTO LECTURE VALUES('L0001',3,3);
INSERT INTO LECTURE VALUES('L0002',3,2);
INSERT INTO LECTURE VALUES('L0003',2,3);
INSERT INTO LECTURE VALUES('L0004',2,2);
INSERT INTO LECTURE VALUES('L0005',3,1);
COMMIT;

SELECT * FROM LECTURE

SELECT LEC_ID,LEC_POINT, DECODE(LEC_TIME,LEC_POINT,'일반과목','기타과목')
 FROM LECTURE;




문제:주당 강의 시간과 학점이 같으면 '일반'을 돌려 받으려 한다
어떻게 해야 하는가?

SELECT LEC_ID, DECODE(LEC_TIME,LEC_POINT,'일반','')
 FROM LECTURE;

  
문제:주당강의시간과 학점이 같은 강의의 숫자를 알고 싶다.
어떻게 해야 하는가?
 
 SELECT COUNT(*) AS "동일"
    FROM LECTURE
    WHERE LEC_TIME=LEC_POINT 
  
--
SELECT COUNT(LEC_ID)
    FROM LECTURE
    WHERE LEC_TIME=LEC_POINT
    
SELECT COUNT(DECODE(LEC_TIME,LEC_POINT,'A'))
, COUNT(DECODE(LEC_TIME,LEC_POINT,LEC_ID))
, MAX(DECODE(LEC_TIME,LEC_POINT,LEC_ID))
    FROM LECTURE
    
--
SELECT DECODE (JOB,'CLERK',SAL)
    FROM EMP

SELECT SUM(DECODE (JOB,'CLERK',SAL))
    FROM EMP
 
 
 
문제: 강의 시간과 학점이 같으면 '일반'을 리턴받은 후 정렬도
하고 싶은 경우에는 어떻게 해야 하는가?
 
 SELECT LEC_ID, DECODE(LEC_TIME,LEC_POINT,'일반','')
 FROM LECTURE
 ORDER BY  DECODE(LEC_TIME,LEC_POINT,'일반','')
 
주당 강의 시간과 학점이 같으면 '일반' 과 '교양'을 리턴받은 후 
정렬도 하고 싶은 경우에는 어떻게 해야하는가?

 SELECT LEC_ID, DECODE(LEC_TIME,LEC_POINT,'일반','교양')
 FROM LECTURE
 ORDER BY  DECODE(LEC_TIME,LEC_POINT,'일반','교양') DESC

문제:강의 시간과 학점이 다르면 NULL이 리턴되는 대신 '특별'이라고
리턴되도록 하려면 어떻게 해야하는가?

 SELECT LEC_ID, DECODE(LEC_TIME,LEC_POINT,'일반','특별')
 FROM LECTURE
 

LEC_TIME이 크면 실험과목, LEC_POINT가 크면 기타과목, 둘이 같으면 '일반과목'으로 돌려 받고자 한다.
 
SELECT SIGN(5), SIGN(-600), SIGN(10-50), SIGN(10-10) FROM DUAL

 SELECT LEC_ID, DECODE(SIGN(LEC_TIME-LEC_POINT),1,'실험',-1,'기타',0,'일반') AS "과목유형"
 FROM LECTURE
 

 
 
 
 --도전문제
문제: 월요일엔 해당일자에 01을 붙여서 4자리 암호를 만들고, 
화요일엔 11, 수요일엔 21, 목요일엔, 31, 금요일엔 41, 토요일엔 51,
일요일엔 61을 붙여서 4자리 암호를 만든다고 할 때 
암호를 SELECT하는 SQL을 만들어 보시오.

SELECT TO_CHAR(SYSDATE,'DD')||DECODE(TO_CHAR(SYSDATE, 'DAY')
,'월요일',01,
'화요일',11,
'수요일',21,
'목요일',31,
'금요일',41,
'토요일',51,
'일요일',61 ) KEY
from dual

--실전문제
사원 테이블에서 JOB이 'CLERK'인 사원의 급여 합,
 'SLAESMAN'인 사람의 급여의 합을 구하고, 
 나머지 JOB에 대해서는 기타의 합으로 구하시오.
 
--
SELECT SUM(DECODE(job,'CLERK',sal,null)) AS "CLERK",
    SUM(DECODE(job,'SALESMAN',sal,null)) AS "SALESMAN",
    SUM(DECODE(job,'CLERK',null,'SALESMAN',null,sal)) AS "ETC"
    FROM EMP