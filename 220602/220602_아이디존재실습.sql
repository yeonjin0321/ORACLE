
���̵�� ��й�ȣ�� ��ġ�ϸ� 1�� ��ȯ�ϰ�,
����� Ʋ���� 0�� ��ȯ�ϰ�
���̵� �������� ������ -1�� ��ȯ�ϴ� SELECT���� �ۼ��Ͻÿ�.(CASE������ ����Ұ�)

SELECT
    CASE WHEN MEMBER.MEM_ID =: MEMBER.MEM_PW THEN 1
         WHEN MEMBER.MEM_ID !=: MEMBER.MEM_PW THEN 0
         ELSE -1
     END S
    FROM MEMBER
    

select * from emp

select max(empno)+1 from emp

select empno
from emp
order by empno desc


-- ROWNUM�� 1�ΰ����� �����Ͽ� ����������
select 
     EMPNO+1
FROM(
select empno
from emp
order by empno desc

)
WHERE ROWNUM =1


SELECT 
    CASE WHEN MEM_ID =:ID THEN 
    CASE WHEN MEM_PW =: PW THEN 1
        ELSE 0
    END
    ELSE =-1
    END AS RESULT
    
    FROM MEMBER
    


SELECT
    result
      FROM ( 
            SELECT 
            CASE WHEN mem_id=: id THEN
            CASE WHEN mem_pw=: pw THEN mem_name
                        ELSE '0'
             END
            ELSE '-1'
            END as result
          FROM member
          ORDER BY result desc
           )
   WHERE rownum =1