SELECT * FROM HD_VIDEO_MEMBER_T

���� ���� � ������ �뿩 �ߴ��� �˰� �ʹ�.
����, �̹ݳ� �����̸� ��ȭ�� �ɾ �ݳ� ��û�� �ؾ� �Ѵٰ� �Ѵٸ�
� ���յ��� �ʿ����� �������.

SELECT 
*
    FROM hd_video_loan_mast_t, hd_video_loan_detail_t
    


select 
 vm.loan_no as "�뿩��ȣ"
 ,1 as "�뿩����"
 ,'test' as "ȸ���ڵ�"
 FROM hd_video_loan_mast_t vm
    , hd_video_loan_detail_t vd
    
 where vm.loan_no = vd.loan_no
 
 
 
 SELECT  
 vm.loan_no as "�뿩��ȣ"
 ,vm.loan_date as "�뿩����"
 ,mem.mem_name as "ȸ���ڵ�"
    FROM hd_video_loan_mast_t vm
    , hd_video_loan_detail_t vd
    , hd_video_member_t mem
  where vm.loan_no = vd.loan_no
  AND vm.mem_cd =mem.mem_cd   



 SELECT  
 vm.loan_no as "�뿩��ȣ"
 ,vm.loan_date as "�뿩����"
 ,mem.mem_name as "ȸ���ڵ�"
 ,MEM.MEM_TEL as "��ȭ��ȣ"
 ,m.MOVIE_NAME as "����"
 ,M.MANAGER as  "��ȭ����"
    FROM hd_video_loan_mast_t vm
    , hd_video_loan_detail_t vd
    , hd_video_member_t mem
    , hd_movie_t m
    , hd_video_t v
  where vm.loan_no = vd.loan_no
  AND vm.mem_cd =mem.mem_cd   
  AND VD.VIDEO_CD = V.VIDEO_CD
  