SELECT * FROM HD_VIDEO_MEMBER_T

누가 언제 어떤 비디오를 대여 했는지 알고 싶다.
만일, 미반납 상태이면 전화를 걸어서 반납 요청을 해야 한다고 한다면
어떤 집합들이 필요할지 적어보세요.

SELECT 
*
    FROM hd_video_loan_mast_t, hd_video_loan_detail_t
    


select 
 vm.loan_no as "대여번호"
 ,1 as "대여일자"
 ,'test' as "회원코드"
 FROM hd_video_loan_mast_t vm
    , hd_video_loan_detail_t vd
    
 where vm.loan_no = vd.loan_no
 
 
 
 SELECT  
 vm.loan_no as "대여번호"
 ,vm.loan_date as "대여일자"
 ,mem.mem_name as "회원코드"
    FROM hd_video_loan_mast_t vm
    , hd_video_loan_detail_t vd
    , hd_video_member_t mem
  where vm.loan_no = vd.loan_no
  AND vm.mem_cd =mem.mem_cd   



 SELECT  
 vm.loan_no as "대여번호"
 ,vm.loan_date as "대여일자"
 ,mem.mem_name as "회원코드"
 ,MEM.MEM_TEL as "전화번호"
 ,m.MOVIE_NAME as "제목"
 ,M.MANAGER as  "영화감독"
    FROM hd_video_loan_mast_t vm
    , hd_video_loan_detail_t vd
    , hd_video_member_t mem
    , hd_movie_t m
    , hd_video_t v
  where vm.loan_no = vd.loan_no
  AND vm.mem_cd =mem.mem_cd   
  AND VD.VIDEO_CD = V.VIDEO_CD
  