--2001�� 9��1�Ϻ��� 9�� 11�ϱ����� ȯ�� �ݾ��� ������ �ִ�.
--ȯ�� �ݾ��� CRATE�÷����� �Ѵ�.
--�Ϸ� ������ ��¥�� ��� 9.3�̸� 1350���� 
--���ǥ�� 2001�� 9�� 3�� �����ݾ����� ��ȭ��  �󸶸� �غ��ؾ� �ұ�?
--9�� 3�Ϻ��� 9�� 11�ϱ��� ��ȸ �ݾ� ���ϱ�.


SELECT CDATE, AMT, CRATE, LAG(CRATE,1) over(order by CDATE)AS ����ȯ��, AMT*LAG(CRATE,1) over(order by CDATE)AS ��ȭ�ݾ�
    FROM test02
    WHERE CDATE>=20010901
    


--�ζ��κ�� LAG�Լ��� ����Ͽ� �������� ȯ���� ������ͼ� ��¥�� �Ѿװ� �����ִ� SQL���� �ۼ��غ���
--LAG(��� �÷���) OVER(ORDER BY ��� �÷���)


SELECT ����,�Ѿ�,ȯ��,��ȭ�ݾ�
    FROM( --�ζ��κ�� �ۼ��ϱ� 
        SELECT CDATE ����, 
        AMT �Ѿ�, --�Ѿ��� ��¥ �״��
        LAG(CRATE,1) over(order by CDATE) AS ȯ��, 
        --ȯ���� �� ��¥���� ���� ��¥�� ������ ȯ���� ���ؾ��ϱ� ������ LAG�Լ��� ���� ���� ȯ����  �ҷ���
        --���ڴ�� ORDER BY
         AMT*LAG(CRATE,1) over(order by CDATE) AS ��ȭ�ݾ�
         --�� �����ؾ��� ��ȭ �ݾ��� �Ѿ�Xȯ���̴�. 
            FROM TEST02
                WHERE CDATE >=20010901
     )
    WHERE ��ȭ�ݾ� IS NOT NULL --�ΰ� ��� X
    
 
