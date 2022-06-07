CREATE TABLE SAM_TAB02 (GUBUN VARCHAR2(5) );

PL/SQL -프로시저 생성 SYNTAX -익명 프로시저

DECLARE
SU NUMBER;
BEGIN
SU:=106;
LOOP
SU:=SU+1;
EXIT WHEN SU>125;

INSERT INTO SAM_TAB02
VALUES('F'||TO_CHAR(SU));
END LOOP;
COMMIT;
END;

SELECT ROWNUM no, gubun FROM sam_tab02;

SELECT ceil(no/4) rno,no,gubun                
  FROM (                
        SELECT rownum no,gubun FROM sam_tab02                
       );                


SELECT rownum no
      ,gubun
  FROM sam_tab02;
  
번호를 이용해서 앞에서부터 4개씩 다시 동일한 번호를 순차적으로 부여한다.  
  
SELECT CEIL(NO/4) RNO, NO
      ,GUBUN
  FROM (
        SELECT rownum no
              ,gubun
          FROM sam_tab02
       );
   
4개씩 묶인 것들에 다시 순서를 줘야 그것이 몇 번째 COLUMN으로 쓰일 것인지를
구분할 수 있다.  
        
SELECT CEIL(NO/4) RNO
      ,MOD(NO,4) CNO
      ,NO
      ,GUBUN
  FROM (
        SELECT ROWNUM NO
              ,GUBUN
          FROM sam_tab02
       )
       
현재 같은 열에 나오고 있는 GUBUN을 CNO의 수에 의해 각기 다른 행으로 
분산 시킨다.
?
SELECT CEIL(NO/4) RNO
      ,MAX(DECODE(MOD(NO,4),1,GUBUN)) C1
      ,MAX(DECODE(MOD(NO,4),2,GUBUN)) C2
      ,MAX(DECODE(MOD(NO,4),3,GUBUN))C3
      ,MAX(DECODE(MOD(NO,4),0,GUBUN))C4
 
  FROM (
        SELECT ROWNUM NO,GUBUN FROM sam_tab02
       )
 group by ceil(no/4)
 order by ceil(no/4)
  
 
 
 SELECT CEIL(NO/5) RNO
      ,MAX(DECODE(MOD(NO,5),1,emp_id)) C1
      ,MAX(DECODE(MOD(NO,5),2,emp_id)) C2
      ,MAX(DECODE(MOD(NO,5),3,emp_id))C3
      ,MAX(DECODE(MOD(NO,5),4,emp_id))C4
       ,MAX(DECODE(MOD(NO,5),0,emp_id))C5
  FROM (
        SELECT ROWNUM NO,emp_id FROM TEMP
       )
 group by ceil(no/5)
 order by ceil(no/5)
 
 
  
--4번 문제 풀이       
       
SELECT ceil(no/4) rno
    FROM (
        SELECT ROWNUM NO, GUBUN
        FROM sam_tab02
    )       
GROUP BY  ceil(no/4)
order by  ceil(no/4)




SELECT ceil(no/4) rno
    FROM (
        SELECT ROWNUM NO, GUBUN
        FROM sam_tab02
    )       
--인라인뷰를 이용하면, 테이블의 포함된 컬럼이 아니더라도 접근이 가능하다.


SELECT rno
    FROM (
        ceil(no/4) rno
        FROM (
        select rownum no, gubun from sam_tab02
    )  