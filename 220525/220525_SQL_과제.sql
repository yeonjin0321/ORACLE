--����1            
��ȭ Ƽ���� ���� �� �ִ� ����� ��ܰ� ���� ������ �ִ� ����Ʈ, ��ȭ Ƽ���� ����Ʈ            
�׸��� �� Ƽ���� ����� �� ���� ���� ����Ʈ�� ����Ͻÿ�.(�̸�,����,����,���� ����)

SELECT
       mem.name_vc as "����"
      ,TO_CHAR(mem.point_nu,'999,999') as "����"
      ,TO_CHAR(movie.point_nu,'999,999')as "����"
      ,TO_CHAR((mem.point_nu-movie.point_nu),'999,999')as "�ܿ�"
  FROM t_giftmem mem,
       (
        SELECT name_vc,point_nu
          FROM t_giftpoint
         WHERE name_vc = '��ȭƼ��' --����Ʈ ����Ʈ���� ��ȭƼ���ΰ��� �̸� ����Ʈ(��ȭƼ��, 15000).       
       )movie --from������ �ζ��κ並 ����Ͽ�    
 WHERE mem.point_nu >= movie.point_nu  --��ȭ Ƽ��15000�� ���� ��������Ʈ�� ���ƾ� �Ѵٴ� ���� 



--����2.�����ž��� �����ϰ� �ִ� ���ϸ�������Ʈ�� ���� �� �ִ� ��ǰ ��
--���� ����Ʈ�� ���� ���� ����Ͻÿ�.

SELECT name_vc ,point_nu
  FROM t_giftpoint
  WHERE point_nu  = (
  
  SELECT 
         max(gift.point_nu)
    FROM t_giftpoint gift, t_giftmem mem
   WHERE gift.point_nu <= mem.point_nu -- ������ ���� ����Ʈ���� �۰ų� ���ƾ� ��.
    AND  mem.name_vc='������'
    
    )

