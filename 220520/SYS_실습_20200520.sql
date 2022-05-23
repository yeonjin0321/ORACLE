create tablespace 스페이스명
datafile '<데이터파일>' size <크기>
?
extent management는 locally방식으로 되고 segment space management 는 auto방식으로 생성
?
?--테이블 스페이스는 실제 데이터가 관리되는 물리적인 저장소이다.
크기:100mb
물리적인 위치 주소 확인 datafile->

create tablespace ts_tomato
datafile 'C:\app\yeonc\oradata\orcl11\tomato.dbf' size 100M;

?
create tablespace sp_ibb
datafile
'C:\app\yeonc\oradata\orcl11\tomato.dbf' size 20M;
?
데이터파일의 크기를 수정한다.
?
alter database datafile
'C:\oracle\product\10.2.0\oradata\orcl10\kimjoy.dbf' resize 10M;
?
select tablespace_name, file_name, autoextensible, increment_by
      ,maxbytes
  from dba_data_files
 where tablespace_name = 'TS_TOMATO'
?
테이블스페이스 자동확장
?
테이블스페이스 삭제
drop tablespace <테이블스페이스명>
?--타이거는 비밀번호이다.

create user tomato identified by tiger
default tablespace ts_tomato

DCL은 권한을 부여한다.

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