--2001년 9월1일부터 9월 11일까지의 환율 금액을 가지고 있다.
--환율 금액은 CRATE컬럼으로 한다.
--하루 이전의 날짜로 계산 9.3이면 1350으로 
--김대표는 2001년 9월 3일 결제금액으로 한화를  얼마를 준비해야 할까?
--9월 3일부터 9월 11일까지 한회 금액 구하기.


SELECT CDATE, AMT, CRATE, LAG(CRATE,1) over(order by CDATE)AS 적용환율, AMT*LAG(CRATE,1) over(order by CDATE)AS 한화금액
    FROM test02
    WHERE CDATE>=20010901
    


--인라인뷰와 LAG함수를 사용하여 이전행의 환율을 가지고와서 날짜의 총액과 곱해주는 SQL문을 작성해보자
--LAG(대상 컬럼명) OVER(ORDER BY 대상 컬럼명)


SELECT 일자,총액,환율,한화금액
    FROM( --인라인뷰로 작성하기 
        SELECT CDATE 일자, 
        AMT 총액, --총액은 날짜 그대로
        LAG(CRATE,1) over(order by CDATE) AS 환율, 
        --환율은 그 날짜보다 전의 날짜에 설정된 환율로 곱해야하기 때문에 LAG함수를 통해 앞의 환율을  불러옴
        --일자대로 ORDER BY
         AMT*LAG(CRATE,1) over(order by CDATE) AS 한화금액
         --총 지불해야할 한화 금액은 총액X환율이다. 
            FROM TEST02
                WHERE CDATE >=20010901
     )
    WHERE 한화금액 IS NOT NULL --널값 허용 X
    
 
