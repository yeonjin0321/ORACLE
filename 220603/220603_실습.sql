CREATE TABLE SAM_TAB02 (GUBUN VARCHAR2(5) );

PL/SQL -���ν��� ���� SYNTAX -�͸� ���ν���

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
  
��ȣ�� �̿��ؼ� �տ������� 4���� �ٽ� ������ ��ȣ�� ���������� �ο��Ѵ�.  
  
SELECT CEIL(NO/4) RNO, NO
      ,GUBUN
  FROM (
        SELECT rownum no
              ,gubun
          FROM sam_tab02
       );
   
4���� ���� �͵鿡 �ٽ� ������ ��� �װ��� �� ��° COLUMN���� ���� ��������
������ �� �ִ�.  
        
SELECT CEIL(NO/4) RNO
      ,MOD(NO,4) CNO
      ,NO
      ,GUBUN
  FROM (
        SELECT ROWNUM NO
              ,GUBUN
          FROM sam_tab02
       )
       
���� ���� ���� ������ �ִ� GUBUN�� CNO�� ���� ���� ���� �ٸ� ������ 
�л� ��Ų��.
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
 
 
  
--4�� ���� Ǯ��       
       
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
--�ζ��κ並 �̿��ϸ�, ���̺��� ���Ե� �÷��� �ƴϴ��� ������ �����ϴ�.


SELECT rno
    FROM (
        ceil(no/4) rno
        FROM (
        select rownum no, gubun from sam_tab02
    )  