--로그인? 회원가입? 회원가입이 먼저이다.

회원가입시 아이디 중복검사 쿼리문을 작성해 보자.

select count(mem_id)
FROM MEMBER
WHERE MEM_ID =:x

select 1 from member
where mem_id = 'apple'

--서브쿼리는 where절 아래 select문을 말한다.

select 1
    FROM DUAL
WHERE EXISTS (SELECT mem_name
                    FROM member
                    WHERE mem_id = 'apple')
                    
select 1
    FROM DUAL
WHERE EXISTS (SELECT mem_name
                    FROM member
                    WHERE mem_id = 'apple5')
                    
--nvl사용하기                   
             
select
    FROM DUAL
WHERE (SELECT NVL2(mem_id,mem_id,'N','Y')     
                    FROM member);
                    
                    
--인라인뷰는 from절 아래 select문을 말한다.

SELECT nvl((
    select 1
    FROM DUAL
    WHERE EXISTS (SELECT mem_name
                    FROM member
                    WHERE mem_id = 'apple6') 
                    ),0 )

    from dual