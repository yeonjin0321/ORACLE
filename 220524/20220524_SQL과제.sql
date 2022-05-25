 --영어가사
 SELECT
           rownum rno, eng_words
    FROM (
            SELECT  
                MOD(seq_vc,2) no
            ,DECODE(MOD(seq_vc,2),1,words_vc) eng_words
    FROM t_letitbe
                )
    WHERE no = 1
    
 --한글 가사   
    SELECT
           rownum rno, kor_words
    FROM (
            SELECT  
                MOD(seq_vc,2) no
            ,DECODE(MOD(seq_vc,2),0,words_vc) kor_words
    FROM t_letitbe
                )
    WHERE no = 0
    
    --영,한문 번갈아가며 출력하기.
    
SELECT
 SEQ_VC, min(ENG_WORDS) 
    FROM(
     SELECT  
              seq_vc
            ,DECODE(MOD(seq_vc,2),1,words_vc) eng_words
        FROM t_letitbe
        union all
       SELECT  
                seq_vc
            ,DECODE(MOD(seq_vc,2),0,words_vc) eng_words
    FROM t_letitbe
    
    )
 GROUP BY SEQ_VC --가사대로 묶기
ORDER BY TO_NUMBER(SEQ_VC)--순서로 변환하여 뽑기 (영 홀수 한 짝수)
