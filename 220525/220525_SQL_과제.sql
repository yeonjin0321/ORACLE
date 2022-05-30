--문제1 영화 티켓을 받을 수 있는 사람의 명단과 현재 가지고 있는 포인트, 영화 티켓의 포인트            
--그리고 그 티켓을 사용한 후 남은 예상 포인트를 출력하시오.

SELECT
       gm.name_vc as "이름"
      ,TO_CHAR(gm.point_nu,'999,999') as "보유" --###,### 형태로 바꿔준다.
      ,TO_CHAR(movie.point_nu,'999,999')as "적용"
      ,TO_CHAR((gm.point_nu-movie.point_nu),'999,999')as "잔여" -- 보유 포인트-영화티켓사용포인트(15000원)
  FROM t_giftmem gm, --알리아스 설정해줌
       (
        SELECT gp.name_vc,gp.point_nu --영화티켓, 15000원
          FROM t_giftpoint gp
         WHERE gp.name_vc = '영화티켓' --기프트 포인트에서 영화티켓인것의 이름 포인트(영화티켓, 15000).       
       )movie --movie 알리아스 설정 및  from절에서 인라인뷰를 사용하여 조건 설정!   
 WHERE gm.point_nu >= movie.point_nu  --영화 티켓15000원 보다 보유포인트가 많아야 한다는 조건 


--문제2.김유신씨가 보유하고 있는 마일리지포인트로 얻을 수 있는 상품 중
--가장 포인트가 높은 것을 출력하시오.

SELECT name_vc ,point_nu --상품이름, 상품포인트가격 
  FROM t_giftpoint gp --기프트포인트에서
  WHERE gp.point_nu  = ( -- 서브쿼리? 조건 설정
    SELECT max(gp.point_nu)-- max사용시 한과세트, min 사용시 문화상품권이 나오는것 확인
        FROM t_giftpoint gp, t_giftmem gm
    WHERE gp.point_nu <= gm.point_nu -- 상품포인트가 본인의 소유 포인트(50012)보다 작거나 같아야 함.
        AND  gm.name_vc='김유신' -- 그리고 성명이 김유신인 데이터여야 한다. 이름을 바꾸면 그 사람의 포인트에 맞는 상품이 나옴.
        )

--1번 풀이

SELECT *
    FROM T_GIFTMEM,T_GIFTPOINT --컨트롤+E 상세사항

    
SELECT        mem.name_vc as "이름"
    ,mem.POINT_NU AS "보유포인트"
    ,point.POINT_NU AS "적용포인트"
    ,(mem.POINT_NU  - point.POINT_NU ) AS "잔여포인트"
    FROM T_GIFTMEM mem ,(-- 셀렉트이름
            SELECT point_nu --영화티켓, 15000원
          FROM t_giftpoint 
         WHERE name_vc = '영화티켓' )point
WHERE mem.point_nu >= POINT.point_nu -- 마이너스인 경우 제외하는 where절    

--
SELECT        mem.name_vc as "이름"
    ,mem.POINT_NU AS "보유포인트"
    ,point.POINT_NU AS "적용포인트"
    ,(mem.POINT_NU  - point.POINT_NU ) AS "잔여포인트"
    FROM T_GIFTMEM mem , t_giftpoint point
WHERE mem.point_nu >= POINT.point_nu -- 마이너스인 경우 제외하는 where절  
AND point.name_vc ='영화티켓' 

--변수

SELECT        mem.name_vc as "이름"
    ,mem.POINT_NU AS "보유포인트"
    ,point.POINT_NU AS "적용포인트"
    ,(mem.POINT_NU  - point.POINT_NU ) AS "잔여포인트"
    FROM T_GIFTMEM mem , t_giftpoint point
WHERE mem.point_nu >= POINT.point_nu -- 마이너스인 경우 제외하는 where절  
AND point.name_vc =:x -- 변수에 상품 담아서 비교

--2번 문제풀이
select name_vc ,point_nu -- gp 프롬절 안에서.
    from t_giftpoint gp
    where gp.POINT_NU = ( --서브쿼리 조건문 생성
    select max(gp.point_nu)
     FROM t_giftpoint gp, t_giftmem gm
    where gp.POINT_NU <= gm.POINT_NU
    AND gm.NAME_VC ='김유신'
)

select point_nu -- gp 프롬절 안에서.
    from t_giftmem
    WHERE NAME_VC =:NAME
    

SELECT POINT_NU
FROM T_GIFTPOINT
WHERE POINT_NU<=50012

--운 좋게 나온 풀이
SELECT max(POINT_NU) , max(name_vc)
FROM T_GIFTPOINT 
WHERE POINT_NU <= (
     select 
            point_nu
        from t_giftmem 
        WHERE NAME_VC = '김유신'

)





select name_vc , point_nu
FROM T_GIFTPOINT
WHERE POINT_NU =50000


select name_vc , point_nu
    FROM T_GIFTPOINT
WHERE POINT_NU =(
         select MAX(point_nu)
        from t_giftmem 
        WHERE POINT_NU <=(
        SELECT
            POINT_NU
            FROM T_GIFTMEM
            WHERE NAME_VC ='김유신'
        )
)

