select zipcode as "�����ȣ", address as "�ּ�"
    from zipcode_t
where address like '%���ϵ� ���������ũ2��%'



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
WHERE dong like '%'||'���'||'%'


��з� - �� / �� ������ ��ȸ�غ���, �ߺ����� �ϼ���
SELECT '��ü' ZDO FROM DUAL
UNION ALL
SELECT '���' FROM DUAL
UNION ALL
SELECT '����' FROM DUAL
  


SELECT 
    DISTINCT(ZDO) zdo
    FROM ZIPCODE_T
    
ORDER BY ZDO ASC 


SELECT '��ü' ZDO FROM DUAL
UNION ALL
SELECT 
    DISTINCT(ZDO) zdo
    FROM ZIPCODE_T    
ORDER BY ZDO ASC 



SELECT '��ü' ZDO FROM DUAL
UNION ALL
SELECT zdo
    FROM (SELECT 
    DISTINCT(ZDO) zdo
    FROM ZIPCODE_T    
ORDER BY zdo ASC 
    
    )

SELECT '��ü' ZDO FROM DUAL
UNION ALL
SELECT DONG
    FROM (SELECT 
    DISTINCT(DONG)dong
    FROM ZIPCODE_T    
ORDER BY DONG ASC 
    
    )

--�ñ� ����

SELECT '��ü' sigu FROM DUAL
UNION ALL
SELECT sigu
    FROM (SELECT 
    DISTINCT(sigu)sigu
    FROM ZIPCODE_T
    WHERE zdo =: userDo    
ORDER BY sigu ASC 
    
    )

--������
SELECT '��ü' dong FROM DUAL
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
set zdo ='�泲'
where zdo = '��??�Ƿɱ�'