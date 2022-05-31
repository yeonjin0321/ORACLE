CREATE TABLE LECTURE (LEC_ID VARCHAR2(05),LEC_TIME NUMBER,LEC_POINT NUMBER);
INSERT INTO LECTURE VALUES('L0001',3,3);
INSERT INTO LECTURE VALUES('L0002',3,2);
INSERT INTO LECTURE VALUES('L0003',2,3);
INSERT INTO LECTURE VALUES('L0004',2,2);
INSERT INTO LECTURE VALUES('L0005',3,1);
COMMIT;

SELECT * FROM LECTURE

SELECT LEC_ID,LEC_POINT, DECODE(LEC_TIME,LEC_POINT,'�Ϲݰ���','��Ÿ����')
 FROM LECTURE;




����:�ִ� ���� �ð��� ������ ������ '�Ϲ�'�� ���� ������ �Ѵ�
��� �ؾ� �ϴ°�?

SELECT LEC_ID, DECODE(LEC_TIME,LEC_POINT,'�Ϲ�','')
 FROM LECTURE;

  
����:�ִ簭�ǽð��� ������ ���� ������ ���ڸ� �˰� �ʹ�.
��� �ؾ� �ϴ°�?
 
 SELECT COUNT(*) AS "����"
    FROM LECTURE
    WHERE LEC_TIME=LEC_POINT 
  
--
SELECT COUNT(LEC_ID)
    FROM LECTURE
    WHERE LEC_TIME=LEC_POINT
    
SELECT COUNT(DECODE(LEC_TIME,LEC_POINT,'A'))
, COUNT(DECODE(LEC_TIME,LEC_POINT,LEC_ID))
, MAX(DECODE(LEC_TIME,LEC_POINT,LEC_ID))
    FROM LECTURE
    
--
SELECT DECODE (JOB,'CLERK',SAL)
    FROM EMP

SELECT SUM(DECODE (JOB,'CLERK',SAL))
    FROM EMP
 
 
 
����: ���� �ð��� ������ ������ '�Ϲ�'�� ���Ϲ��� �� ���ĵ�
�ϰ� ���� ��쿡�� ��� �ؾ� �ϴ°�?
 
 SELECT LEC_ID, DECODE(LEC_TIME,LEC_POINT,'�Ϲ�','')
 FROM LECTURE
 ORDER BY  DECODE(LEC_TIME,LEC_POINT,'�Ϲ�','')
 
�ִ� ���� �ð��� ������ ������ '�Ϲ�' �� '����'�� ���Ϲ��� �� 
���ĵ� �ϰ� ���� ��쿡�� ��� �ؾ��ϴ°�?

 SELECT LEC_ID, DECODE(LEC_TIME,LEC_POINT,'�Ϲ�','����')
 FROM LECTURE
 ORDER BY  DECODE(LEC_TIME,LEC_POINT,'�Ϲ�','����') DESC

����:���� �ð��� ������ �ٸ��� NULL�� ���ϵǴ� ��� 'Ư��'�̶��
���ϵǵ��� �Ϸ��� ��� �ؾ��ϴ°�?

 SELECT LEC_ID, DECODE(LEC_TIME,LEC_POINT,'�Ϲ�','Ư��')
 FROM LECTURE
 

LEC_TIME�� ũ�� �������, LEC_POINT�� ũ�� ��Ÿ����, ���� ������ '�Ϲݰ���'���� ���� �ް��� �Ѵ�.
 
SELECT SIGN(5), SIGN(-600), SIGN(10-50), SIGN(10-10) FROM DUAL

 SELECT LEC_ID, DECODE(SIGN(LEC_TIME-LEC_POINT),1,'����',-1,'��Ÿ',0,'�Ϲ�') AS "��������"
 FROM LECTURE
 

 
 
 
 --��������
����: �����Ͽ� �ش����ڿ� 01�� �ٿ��� 4�ڸ� ��ȣ�� �����, 
ȭ���Ͽ� 11, �����Ͽ� 21, ����Ͽ�, 31, �ݿ��Ͽ� 41, ����Ͽ� 51,
�Ͽ��Ͽ� 61�� �ٿ��� 4�ڸ� ��ȣ�� ����ٰ� �� �� 
��ȣ�� SELECT�ϴ� SQL�� ����� ���ÿ�.

SELECT TO_CHAR(SYSDATE,'DD')||DECODE(TO_CHAR(SYSDATE, 'DAY')
,'������',01,
'ȭ����',11,
'������',21,
'�����',31,
'�ݿ���',41,
'�����',51,
'�Ͽ���',61 ) KEY
from dual

--��������
��� ���̺��� JOB�� 'CLERK'�� ����� �޿� ��,
 'SLAESMAN'�� ����� �޿��� ���� ���ϰ�, 
 ������ JOB�� ���ؼ��� ��Ÿ�� ������ ���Ͻÿ�.
 
--
SELECT SUM(DECODE(job,'CLERK',sal,null)) AS "CLERK",
    SUM(DECODE(job,'SALESMAN',sal,null)) AS "SALESMAN",
    SUM(DECODE(job,'CLERK',null,'SALESMAN',null,sal)) AS "ETC"
    FROM EMP