--�α���? ȸ������? ȸ�������� �����̴�.

ȸ�����Խ� ���̵� �ߺ��˻� �������� �ۼ��� ����.

select count(mem_id)
FROM MEMBER
WHERE MEM_ID =:x

select 1 from member
where mem_id = 'apple'

--���������� where�� �Ʒ� select���� ���Ѵ�.

select 1
    FROM DUAL
WHERE EXISTS (SELECT mem_name
                    FROM member
                    WHERE mem_id = 'apple')
                    
select 1
    FROM DUAL
WHERE EXISTS (SELECT mem_name
                    FROM member
                    WHERE mem_id = 'apple5')
                    
--nvl����ϱ�                   
             
select
    FROM DUAL
WHERE (SELECT NVL2(mem_id,mem_id,'N','Y')     
                    FROM member);
                    
                    
--�ζ��κ�� from�� �Ʒ� select���� ���Ѵ�.

SELECT nvl((
    select 1
    FROM DUAL
    WHERE EXISTS (SELECT mem_name
                    FROM member
                    WHERE mem_id = 'apple6') 
                    ),0 )

    from dual