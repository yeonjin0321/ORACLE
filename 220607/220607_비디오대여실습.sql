SELECT m.loan_no as "�뿩��ȣ"
      ,M.LOAN_DATE as "�뿩����"
      ,M.MEM_CD as "ȸ���ڵ�"
  FROM hd_video_loan_mast_t m, hd_video_loan_detail_t d
 WHERE m.loan_no = d.loan_no
 
?
SELECT vm.loan_no as "�뿩��ȣ"
      ,vm.LOAN_DATE as "�뿩����"
      ,vm.MEM_CD as "ȸ���ڵ�"
      ,m.mem_name as "ȸ����"
  FROM hd_video_loan_mast_t vm, hd_video_loan_detail_t vd
      ,hd_video_member_t m 
 WHERE vm.loan_no = vd.loan_no
   AND m.mem_cd = vm.mem_cd 
   
?
SELECT vm.loan_no as "�뿩��ȣ"
      ,vm.LOAN_DATE as "�뿩����"
      ,vm.MEM_CD as "ȸ���ڵ�"
      ,m.mem_name as "ȸ����"
      ,vd.video_cd as "�����ڵ�"
  FROM hd_video_loan_mast_t vm, hd_video_loan_detail_t vd
      ,hd_video_member_t m 
 WHERE vm.loan_no = vd.loan_no
   AND m.mem_cd = vm.mem_cd    
   
?
SELECT vm.loan_no as "�뿩��ȣ"
      ,vm.LOAN_DATE as "�뿩����"
      ,vm.MEM_CD as "ȸ���ڵ�"
      ,m.mem_name as "ȸ����"
      ,vd.video_cd as "�����ڵ�"
      ,V.MOVIE_CD as "��ȭ�ڵ�"
  FROM hd_video_loan_mast_t vm, hd_video_loan_detail_t vd
      ,hd_video_member_t m, hd_video_t v 
 WHERE vm.loan_no = vd.loan_no
   AND m.mem_cd = vm.mem_cd
   AND v.video_cd = vd.video_cd   
   
?
SELECT vm.loan_no as "�뿩��ȣ"
      ,vm.LOAN_DATE as "�뿩����"
      ,vm.MEM_CD as "ȸ���ڵ�"
      ,m.mem_name as "ȸ����"
      ,vd.video_cd as "�����ڵ�"
      ,V.MOVIE_CD as "��ȭ�ڵ�"
      ,mv.movie_name as "��ȭ����"
  FROM hd_video_loan_mast_t vm, hd_video_loan_detail_t vd
      ,hd_video_member_t m, hd_video_t v, hd_movie_t mv 
 WHERE vm.loan_no = vd.loan_no
   AND m.mem_cd = vm.mem_cd
   AND v.video_cd = vd.video_cd  
   AND V.MOVIE_CD = mv.movie_cd   
   
?
SELECT vm.loan_no as "�뿩��ȣ"
      ,vm.LOAN_DATE as "�뿩����"
      ,vm.MEM_CD as "ȸ���ڵ�"
      ,m.mem_name as "ȸ����"
      ,vd.video_cd as "�����ڵ�"
      ,V.MOVIE_CD as "��ȭ�ڵ�"
      ,mv.movie_name as "��ȭ����"
      ,mv.manager as "����"
      ,mv.leading_actor as "�ֿ����"
  FROM hd_video_loan_mast_t vm, hd_video_loan_detail_t vd
      ,hd_video_member_t m, hd_video_t v, hd_movie_t mv 
 WHERE vm.loan_no = vd.loan_no
   AND m.mem_cd = vm.mem_cd
   AND v.video_cd = vd.video_cd  
   AND V.MOVIE_CD = mv.movie_cd 
      
   
SELECT vm.loan_no as "�뿩��ȣ"
      ,vm.LOAN_DATE as "�뿩����"
      ,vm.MEM_CD as "ȸ���ڵ�"
      ,m.mem_name as "ȸ����"
      ,vd.video_cd as "�����ڵ�"
      ,V.MOVIE_CD as "��ȭ�ڵ�"
      ,mv.movie_name as "��ȭ����"
      ,mv.manager as "����"
      ,mv.leading_actor as "�ֿ����"
      ,gm.genre_name as "�帣��"
  FROM hd_video_loan_mast_t vm, hd_video_loan_detail_t vd
      ,hd_video_member_t m, hd_video_t v, hd_movie_t mv 
      ,hd_genre_t gm
 WHERE vm.loan_no = vd.loan_no
   AND m.mem_cd = vm.mem_cd
   AND v.video_cd = vd.video_cd  
   AND V.MOVIE_CD = mv.movie_cd 
   AND mv.genre_cd = gm.genre_cd