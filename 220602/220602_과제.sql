SELECT DECODE(NO,1,INDATE_VC,2,'합계') as 판매날짜
      ,SUM(RR1) as 판매개수
      ,SUM(RR2) as 판매가격
FROM
(
SELECT INDATE_VC
      ,SUM(QTY_NU) RR1
      ,SUM(DECODE(INDATE_VC,20040601,PRICE_NU,20040602,PRICE_NU,20040603,PRICE_NU)) RR2
  FROM T_ORDERBASKET
GROUP BY INDATE_VC
)

,(      
SELECT 1 NO FROM DUAL
 UNION ALL
SELECT 2 FROM DUAL
) b
GROUP BY DECODE(b.no,1,INDATE_VC,2,'합계')
ORDER BY 판매날짜 ASC

· SELECT문에 1사용하면 해당 테이블의 갯수만큼 1로된 행을 출력합니다. 
· 테이블의 행의 수가 N개이면 1이 N행 반환됩니다. · 여기에서 1은 TRUE를 의미합니다. 
· WHERE 조건문과 함께 쓰면 해당 조건을 만족하면 1을 반환하게 됩니다.




select *
from t_orderbasket

--가상의 테이블, 카타시안의 곱. 54x2 = 108
select 1 from dual
union all 
select 2 from dual

데이터를 2배수로 복제하기. -카타시안의 곱

select * 
    from t_orderbasket,
        (select 1 rno from dual
        union all 
        select 2 from dual
            )
            
select *
    from t_orderbasket, 
    (
    select rownum rno from dept
    where rownum < 3
    )


select indate_vc from t_orderbasket
group by indate_vc


select indate_vc from t_orderbasket
group by indate_vc
union all
select '총계' from dual


decode(rownum,1,indate_vc,2,'총계')
            

select decode(b.rno,1,indate_vc,2,'총계')
    from t_orderbasket, 
    (
    select rownum rno from dept
    where rownum < 3
    )b
GROUP BY decode(b.rno,1,indate_vc,2,'총계')


--총계 붙이기
select decode(b.rno,1,indate_vc,2,'총계')
    from t_orderbasket, 
    (
    select rownum rno from dept
    where rownum < 3
    )b
GROUP BY decode(b.rno,1,indate_vc,2,'총계')
ORDER BY decode(b.rno,1,indate_vc,2,'총계') ASC


SUM(QTY_NU*PRICE_NU) AS "상품매출액"



select decode(b.rno,1,indate_vc,2,'총계')AS "판매날짜"
    ,SUM(QTY_NU)||' 개' AS "판매개수"
    ,SUM(QTY_NU*PRICE_NU)||' 원' AS "상품매출액"
    from t_orderbasket, 
    (
    select rownum rno from DEPT
    where rownum < 3
    )b
GROUP BY decode(b.rno,1,indate_vc,2,'총계')
ORDER BY decode(b.rno,1,indate_vc,2,'총계') ASC