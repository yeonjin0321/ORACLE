create tablespace �����̽���
datafile '<����������>' size <ũ��>
?
extent management�� locally������� �ǰ� segment space management �� auto������� ����
?
?--���̺� �����̽��� ���� �����Ͱ� �����Ǵ� �������� ������̴�.
ũ��:100mb
�������� ��ġ �ּ� Ȯ�� datafile->

create tablespace ts_tomato
datafile 'C:\app\yeonc\oradata\orcl11\tomato.dbf' size 100M;

?
create tablespace sp_ibb
datafile
'C:\app\yeonc\oradata\orcl11\tomato.dbf' size 20M;
?
������������ ũ�⸦ �����Ѵ�.
?
alter database datafile
'C:\oracle\product\10.2.0\oradata\orcl10\kimjoy.dbf' resize 10M;
?
select tablespace_name, file_name, autoextensible, increment_by
      ,maxbytes
  from dba_data_files
 where tablespace_name = 'TS_TOMATO'
?
���̺����̽� �ڵ�Ȯ��
?
���̺����̽� ����
drop tablespace <���̺����̽���>
?--Ÿ�̰Ŵ� ��й�ȣ�̴�.

create user tomato identified by tiger
default tablespace ts_tomato

DCL�� ������ �ο��Ѵ�.

grant create session to tomato  with admin option;


temporary tablespace ts_; 
?
?
create user IBB identified by abc123
default tablespace sp_ibb;
?
GRANT CREATE sequence to ibb
?
GRANT CREATE trigger to ibb
?
grant create session to kimjoy  with admin option;
?
grant create table to kimjoy  with admin option;
?
grant create view to kimjoy;
?
alter user kimjoy  quota unlimited on test_table;
?
alter user ftbc2 default tablespace users quota unlimited on users;