select zipcode as "우편번호", address as "주소"
    from zipcode_t
where address like '%종암동 현대아이파크2차%'



SELECT EMPNO,ENAME
FROM EMP
WHERE ENAME LIKE '%'||'S'||'%'

SELECT EMPNO,ENAME
FROM EMP
WHERE ENAME LIKE 'S'||'%'

SELECT EMPNO,ENAME
FROM EMP
WHERE ENAME LIKE '%'||'S'


select 
zipcode , address
    from zipcode_t
WHERE dong like '%'||'당산'||'%'


대분류 - 시 / 도 정보만 조회해보기, 중복제거 하세요
SELECT '전체' ZDO FROM DUAL
UNION ALL
SELECT '경기' FROM DUAL
UNION ALL
SELECT '서울' FROM DUAL
  


SELECT 
    DISTINCT(ZDO) zdo
    FROM ZIPCODE_T
    
ORDER BY ZDO ASC 


SELECT '전체' ZDO FROM DUAL
UNION ALL
SELECT 
    DISTINCT(ZDO) zdo
    FROM ZIPCODE_T    
ORDER BY ZDO ASC 



SELECT '전체' ZDO FROM DUAL
UNION ALL
SELECT zdo
    FROM (SELECT 
    DISTINCT(ZDO) zdo
    FROM ZIPCODE_T    
ORDER BY zdo ASC 
    
    )

SELECT '전체' ZDO FROM DUAL
UNION ALL
SELECT DONG
    FROM (SELECT 
    DISTINCT(DONG)dong
    FROM ZIPCODE_T    
ORDER BY DONG ASC 
    
    )

--시구 정보

SELECT '전체' sigu FROM DUAL
UNION ALL
SELECT sigu
    FROM (SELECT 
    DISTINCT(sigu)sigu
    FROM ZIPCODE_T
    WHERE zdo =: userDo    
ORDER BY sigu ASC 
    
    )

--동정보
SELECT '전체' dong FROM DUAL
UNION ALL
SELECT dong
    FROM (SELECT 
    DISTINCT(dong)dong
    FROM ZIPCODE_T
    WHERE sigu =: userGu    
ORDER BY dong ASC 
    )


from zipcode_t
GROUP BY ZDO

update zipcode_t
set zdo ='경남'
where zdo = '경??의령군'