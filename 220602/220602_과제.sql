SELECT DECODE(NO,1,INDATE_VC,2,'�հ�') as �Ǹų�¥
      ,SUM(RR1) as �ǸŰ���
      ,SUM(RR2) as �ǸŰ���
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
GROUP BY DECODE(b.no,1,INDATE_VC,2,'�հ�')
ORDER BY �Ǹų�¥ ASC

�� SELECT���� 1����ϸ� �ش� ���̺��� ������ŭ 1�ε� ���� ����մϴ�. 
�� ���̺��� ���� ���� N���̸� 1�� N�� ��ȯ�˴ϴ�. �� ���⿡�� 1�� TRUE�� �ǹ��մϴ�. 
�� WHERE ���ǹ��� �Բ� ���� �ش� ������ �����ϸ� 1�� ��ȯ�ϰ� �˴ϴ�.




select *
from t_orderbasket

--������ ���̺�, īŸ�þ��� ��. 54x2 = 108
select 1 from dual
union all 
select 2 from dual

�����͸� 2����� �����ϱ�. -īŸ�þ��� ��

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
select '�Ѱ�' from dual


decode(rownum,1,indate_vc,2,'�Ѱ�')
            

select decode(b.rno,1,indate_vc,2,'�Ѱ�')
    from t_orderbasket, 
    (
    select rownum rno from dept
    where rownum < 3
    )b
GROUP BY decode(b.rno,1,indate_vc,2,'�Ѱ�')


--�Ѱ� ���̱�
select decode(b.rno,1,indate_vc,2,'�Ѱ�')
    from t_orderbasket, 
    (
    select rownum rno from dept
    where rownum < 3
    )b
GROUP BY decode(b.rno,1,indate_vc,2,'�Ѱ�')
ORDER BY decode(b.rno,1,indate_vc,2,'�Ѱ�') ASC


SUM(QTY_NU*PRICE_NU) AS "��ǰ�����"



select decode(b.rno,1,indate_vc,2,'�Ѱ�')AS "�Ǹų�¥"
    ,SUM(QTY_NU)||' ��' AS "�ǸŰ���"
    ,SUM(QTY_NU*PRICE_NU)||' ��' AS "��ǰ�����"
    from t_orderbasket, 
    (
    select rownum rno from DEPT
    where rownum < 3
    )b
GROUP BY decode(b.rno,1,indate_vc,2,'�Ѱ�')
ORDER BY decode(b.rno,1,indate_vc,2,'�Ѱ�') ASC