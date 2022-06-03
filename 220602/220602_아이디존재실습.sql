
아이디와 비밀번호가 일치하면 1을 반환하고,
비번이 틀리면 0을 반환하고
아이디가 존재하지 않으면 -1을 반환하는 SELECT문을 작성하시오.(CASE구문을 사용할것)

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


-- ROWNUM이 1인것으로 선택하여 빠져나오기
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