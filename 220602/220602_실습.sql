�̸�- t_giftmem
��������Ʈ - t_giftmem, point_nu
��ȭƼ�� t_gifitpoint,point_nu

-- �ζ��κ�� �ۼ��غ���.
-- ��Ű�� �������� ���� viewȮ�� ������.
create view v_emp1(e_no,e_name)
    as select empno,ename
    from emp
    where deptno=10
    
--�ζ��κ信�� �����غ���
select e_no,e_name from v_emp1

select point_nu from t_giftpoint
    where name_vc ='��ȭƼ��'

select
POINT_NU
    from(
    select point_nu from t_giftpoint
    where name_vc ='��ȭƼ��'
    )
    
select 
    MEM.NAME_VC,MEM.POINT_NU, point.point_nu
    FROM T_GIFTMEM mem, 
    (
       select point_nu FROM t_giftpoint
    where name_vc ='��ȭƼ��'
    )point --�˸��ƽ��� ����
    WHERE mem.point_nu >= point.point_nu


--�츮 ȸ�翡 �ٹ��ϴ� ��� �߿��� �˷����� �޿��� �� ���� �޴� ����� ��ȸ�غ��ÿ�    
select ename,sal 
     from emp
             WHERE sal >= 
    (
        SELECT sal FROM emp WHERE ename='ALLEN'
    );


1.temp���� ������ ���� ���� ������ row�� ã�Ƽ� �� �ݾװ� ������ �ݾ���
�޴� ������ ����� ������ ����Ͻÿ�.

SELECT EMP_ID,EMP_NAME, to_char(SALARY,'999,999,999') AS "����"
  FROM TEMP
 WHERE TEMP.SALARY =( SELECT MAX(SALARY)
              FROM TEMP); 
      

      
2.temp�� �ڷḦ �̿��Ͽ� salary�� ����� ���ϰ� �̺��� ū �ݾ��� salary��
�޴� ������ ����� ����, ������ �����ֽÿ�.

SELECT EMP_ID AS ���, EMP_NAME AS ����,SALARY AS ����
FROM TEMP
WHERE Salary >(
            SELECT AVG(Salary)
         FROM TEMP
            );


3.temp�� ���� �� ��õ�� �ٹ��ϴ� ������ ����� ������ �о���� SQL�� ����
������ �̿��� �����ÿ�.

SELECT EMP_ID, EMP_NAME
         FROM TEMP
    WHERE DEPT_CODE IN (
                            SELECT DEPT_CODE
                             FROM TDEPT
                               WHERE AREA = '��õ');

4.tcom�� ���� �ܿ� Ŀ�̼��� �޴� ������ ����� �����Ǿ� �ִ�.
�� ������ ���������� select�Ͽ� �μ� ��Ī���� Ŀ�̼��� �޴�
�ο����� ���� ������ ����� ���ÿ�.

SELECT B.DEPT_NAME, COUNT(*) �ο���
         FROM TEMP A, TDEPT B
         WHERE B.DEPT_CODE = A.DEPT_CODE
          AND A.EMP_ID IN 
          (SELECT EMP_ID 
            FROM TCOM)
         GROUP BY DEPT_NAME;
    
--temp�� �ڷḦ salary�� �з��Ͽ� , 3õ���� ���ϴ� D, 3õ���� �ʰ� 5õ���� ���ϴ� C
--5õ���� �ʰ� 7õ���� ���ϴ� B, 7õ���� �ʰ��� A��� ����� �з��Ͽ�, 
--��޺� �ο����� ����ϴ� SQL���� �ۼ��Ͻÿ�.

  select count(case when salary>70000000 then 'A' end) a,
          count(case when salary<=70000000 and salary>50000000 then 'B' end) b,
          count(case when salary<=50000000 and salary>30000000 then 'C' end) c,
          count(case when salary<=30000000 then 'D' end) d
  from temp ;



SELECT 
    CASE WHEN SALARY <=30000000 THEN 'D'
           WHEN salary<=50000000 and salary>30000000 then 'C'
            WHEN salary<=70000000 and salary>50000000 then 'B'
            when salary>70000000 then 'A' 
    END c
    FROM TEMP




SELECT 
    CASE WHEN SALARY <=30000000 THEN 'D'
           WHEN salary<=50000000 and salary>30000000 then 'C'
            WHEN salary<=70000000 and salary>50000000 then 'B'
            when salary>70000000 then 'A' 
    END c
    , count(*)
   FROM TEMP
GROUP BY (
         CASE WHEN SALARY <=30000000 THEN 'D'
           WHEN salary<=50000000 and salary>30000000 then 'C'
            WHEN salary<=70000000 and salary>50000000 then 'B'
            when salary>70000000 then 'A' 
    END 
    
    )





���̵�� ��й�ȣ�� ��ġ�ϸ� 1�� ��ȯ�ϰ�,
����� Ʋ���� 0�� ��ȯ�ϰ�
���̵� �������� ������ -1�� ��ȯ�ϴ� SELECT���� �ۼ��Ͻÿ�.(CASE������ ����Ұ�)

