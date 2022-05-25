--문제1            
영화 티켓을 받을 수 있는 사람의 명단과 현재 가지고 있는 포인트, 영화 티켓의 포인트            
그리고 그 티켓을 사용한 후 남은 예상 포인트를 출력하시오.(이름,보유,적용,남은 예상)

SELECT
       mem.name_vc as "성명"
      ,TO_CHAR(mem.point_nu,'999,999') as "보유"
      ,TO_CHAR(movie.point_nu,'999,999')as "적용"
      ,TO_CHAR((mem.point_nu-movie.point_nu),'999,999')as "잔여"
  FROM t_giftmem mem,
       (
        SELECT name_vc,point_nu
          FROM t_giftpoint
         WHERE name_vc = '영화티켓' --기프트 포인트에서 영화티켓인것의 이름 포인트(영화티켓, 15000).       
       )movie --from절에서 인라인뷰를 사용하여    
 WHERE mem.point_nu >= movie.point_nu  --영화 티켓15000원 보다 보유포인트가 많아야 한다는 조건 



--문제2.김유신씨가 보유하고 있는 마일리지포인트로 얻을 수 있는 상품 중
--가장 포인트가 높은 것을 출력하시오.

SELECT name_vc ,point_nu
  FROM t_giftpoint
  WHERE point_nu  = (
  
  SELECT 
         max(gift.point_nu)
    FROM t_giftpoint gift, t_giftmem mem
   WHERE gift.point_nu <= mem.point_nu -- 본인의 소유 포인트보다 작거나 같아야 함.
    AND  mem.name_vc='김유신'
    
    )

