--����1 ��ȭ Ƽ���� ���� �� �ִ� ����� ��ܰ� ���� ������ �ִ� ����Ʈ, ��ȭ Ƽ���� ����Ʈ            
--�׸��� �� Ƽ���� ����� �� ���� ���� ����Ʈ�� ����Ͻÿ�.

SELECT
       gm.name_vc as "�̸�"
      ,TO_CHAR(gm.point_nu,'999,999') as "����" --###,### ���·� �ٲ��ش�.
      ,TO_CHAR(movie.point_nu,'999,999')as "����"
      ,TO_CHAR((gm.point_nu-movie.point_nu),'999,999')as "�ܿ�" -- ���� ����Ʈ-��ȭƼ�ϻ������Ʈ(15000��)
  FROM t_giftmem gm, --�˸��ƽ� ��������
       (
        SELECT gp.name_vc,gp.point_nu --��ȭƼ��, 15000��
          FROM t_giftpoint gp
         WHERE gp.name_vc = '��ȭƼ��' --����Ʈ ����Ʈ���� ��ȭƼ���ΰ��� �̸� ����Ʈ(��ȭƼ��, 15000).       
       )movie --movie �˸��ƽ� ���� ��  from������ �ζ��κ並 ����Ͽ� ���� ����!   
 WHERE gm.point_nu >= movie.point_nu  --��ȭ Ƽ��15000�� ���� ��������Ʈ�� ���ƾ� �Ѵٴ� ���� 


--����2.�����ž��� �����ϰ� �ִ� ���ϸ�������Ʈ�� ���� �� �ִ� ��ǰ ��
--���� ����Ʈ�� ���� ���� ����Ͻÿ�.

SELECT name_vc ,point_nu --��ǰ�̸�, ��ǰ����Ʈ���� 
  FROM t_giftpoint gp --����Ʈ����Ʈ����
  WHERE gp.point_nu  = ( -- ��������? ���� ����
    SELECT max(gp.point_nu)-- max���� �Ѱ���Ʈ, min ���� ��ȭ��ǰ���� �����°� Ȯ��
        FROM t_giftpoint gp, t_giftmem gm
    WHERE gp.point_nu <= gm.point_nu -- ��ǰ����Ʈ�� ������ ���� ����Ʈ(50012)���� �۰ų� ���ƾ� ��.
        AND  gm.name_vc='������' -- �׸��� ������ �������� �����Ϳ��� �Ѵ�. �̸��� �ٲٸ� �� ����� ����Ʈ�� �´� ��ǰ�� ����.
        )

--1�� Ǯ��

SELECT *
    FROM T_GIFTMEM,T_GIFTPOINT --��Ʈ��+E �󼼻���

    
SELECT        mem.name_vc as "�̸�"
    ,mem.POINT_NU AS "��������Ʈ"
    ,point.POINT_NU AS "��������Ʈ"
    ,(mem.POINT_NU  - point.POINT_NU ) AS "�ܿ�����Ʈ"
    FROM T_GIFTMEM mem ,(-- ����Ʈ�̸�
            SELECT point_nu --��ȭƼ��, 15000��
          FROM t_giftpoint 
         WHERE name_vc = '��ȭƼ��' )point
WHERE mem.point_nu >= POINT.point_nu -- ���̳ʽ��� ��� �����ϴ� where��    

--
SELECT        mem.name_vc as "�̸�"
    ,mem.POINT_NU AS "��������Ʈ"
    ,point.POINT_NU AS "��������Ʈ"
    ,(mem.POINT_NU  - point.POINT_NU ) AS "�ܿ�����Ʈ"
    FROM T_GIFTMEM mem , t_giftpoint point
WHERE mem.point_nu >= POINT.point_nu -- ���̳ʽ��� ��� �����ϴ� where��  
AND point.name_vc ='��ȭƼ��' 

--����

SELECT        mem.name_vc as "�̸�"
    ,mem.POINT_NU AS "��������Ʈ"
    ,point.POINT_NU AS "��������Ʈ"
    ,(mem.POINT_NU  - point.POINT_NU ) AS "�ܿ�����Ʈ"
    FROM T_GIFTMEM mem , t_giftpoint point
WHERE mem.point_nu >= POINT.point_nu -- ���̳ʽ��� ��� �����ϴ� where��  
AND point.name_vc =:x -- ������ ��ǰ ��Ƽ� ��

--2�� ����Ǯ��
select name_vc ,point_nu -- gp ������ �ȿ���.
    from t_giftpoint gp
    where gp.POINT_NU = ( --�������� ���ǹ� ����
    select max(gp.point_nu)
     FROM t_giftpoint gp, t_giftmem gm
    where gp.POINT_NU <= gm.POINT_NU
    AND gm.NAME_VC ='������'
)

select point_nu -- gp ������ �ȿ���.
    from t_giftmem
    WHERE NAME_VC =:NAME
    

SELECT POINT_NU
FROM T_GIFTPOINT
WHERE POINT_NU<=50012

--�� ���� ���� Ǯ��
SELECT max(POINT_NU) , max(name_vc)
FROM T_GIFTPOINT 
WHERE POINT_NU <= (
     select 
            point_nu
        from t_giftmem 
        WHERE NAME_VC = '������'

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
            WHERE NAME_VC ='������'
        )
)

