SELECT m.loan_no as "대여번호"
      ,M.LOAN_DATE as "대여일자"
      ,M.MEM_CD as "회원코드"
  FROM hd_video_loan_mast_t m, hd_video_loan_detail_t d
 WHERE m.loan_no = d.loan_no
 
?
SELECT vm.loan_no as "대여번호"
      ,vm.LOAN_DATE as "대여일자"
      ,vm.MEM_CD as "회원코드"
      ,m.mem_name as "회원명"
  FROM hd_video_loan_mast_t vm, hd_video_loan_detail_t vd
      ,hd_video_member_t m 
 WHERE vm.loan_no = vd.loan_no
   AND m.mem_cd = vm.mem_cd 
   
?
SELECT vm.loan_no as "대여번호"
      ,vm.LOAN_DATE as "대여일자"
      ,vm.MEM_CD as "회원코드"
      ,m.mem_name as "회원명"
      ,vd.video_cd as "비디오코드"
  FROM hd_video_loan_mast_t vm, hd_video_loan_detail_t vd
      ,hd_video_member_t m 
 WHERE vm.loan_no = vd.loan_no
   AND m.mem_cd = vm.mem_cd    
   
?
SELECT vm.loan_no as "대여번호"
      ,vm.LOAN_DATE as "대여일자"
      ,vm.MEM_CD as "회원코드"
      ,m.mem_name as "회원명"
      ,vd.video_cd as "비디오코드"
      ,V.MOVIE_CD as "영화코드"
  FROM hd_video_loan_mast_t vm, hd_video_loan_detail_t vd
      ,hd_video_member_t m, hd_video_t v 
 WHERE vm.loan_no = vd.loan_no
   AND m.mem_cd = vm.mem_cd
   AND v.video_cd = vd.video_cd   
   
?
SELECT vm.loan_no as "대여번호"
      ,vm.LOAN_DATE as "대여일자"
      ,vm.MEM_CD as "회원코드"
      ,m.mem_name as "회원명"
      ,vd.video_cd as "비디오코드"
      ,V.MOVIE_CD as "영화코드"
      ,mv.movie_name as "영화제목"
  FROM hd_video_loan_mast_t vm, hd_video_loan_detail_t vd
      ,hd_video_member_t m, hd_video_t v, hd_movie_t mv 
 WHERE vm.loan_no = vd.loan_no
   AND m.mem_cd = vm.mem_cd
   AND v.video_cd = vd.video_cd  
   AND V.MOVIE_CD = mv.movie_cd   
   
?
SELECT vm.loan_no as "대여번호"
      ,vm.LOAN_DATE as "대여일자"
      ,vm.MEM_CD as "회원코드"
      ,m.mem_name as "회원명"
      ,vd.video_cd as "비디오코드"
      ,V.MOVIE_CD as "영화코드"
      ,mv.movie_name as "영화제목"
      ,mv.manager as "감독"
      ,mv.leading_actor as "주연배우"
  FROM hd_video_loan_mast_t vm, hd_video_loan_detail_t vd
      ,hd_video_member_t m, hd_video_t v, hd_movie_t mv 
 WHERE vm.loan_no = vd.loan_no
   AND m.mem_cd = vm.mem_cd
   AND v.video_cd = vd.video_cd  
   AND V.MOVIE_CD = mv.movie_cd 
      
   
SELECT vm.loan_no as "대여번호"
      ,vm.LOAN_DATE as "대여일자"
      ,vm.MEM_CD as "회원코드"
      ,m.mem_name as "회원명"
      ,vd.video_cd as "비디오코드"
      ,V.MOVIE_CD as "영화코드"
      ,mv.movie_name as "영화제목"
      ,mv.manager as "감독"
      ,mv.leading_actor as "주연배우"
      ,gm.genre_name as "장르명"
  FROM hd_video_loan_mast_t vm, hd_video_loan_detail_t vd
      ,hd_video_member_t m, hd_video_t v, hd_movie_t mv 
      ,hd_genre_t gm
 WHERE vm.loan_no = vd.loan_no
   AND m.mem_cd = vm.mem_cd
   AND v.video_cd = vd.video_cd  
   AND V.MOVIE_CD = mv.movie_cd 
   AND mv.genre_cd = gm.genre_cd