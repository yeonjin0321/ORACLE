 --�����
 SELECT
           rownum rno, eng_words
    FROM (
            SELECT  
                MOD(seq_vc,2) no
            ,DECODE(MOD(seq_vc,2),1,words_vc) eng_words
    FROM t_letitbe
                )
    WHERE no = 1
    
 --�ѱ� ����   
    SELECT
           rownum rno, kor_words
    FROM (
            SELECT  
                MOD(seq_vc,2) no
            ,DECODE(MOD(seq_vc,2),0,words_vc) kor_words
    FROM t_letitbe
                )
    WHERE no = 0
    
    --��,�ѹ� �����ư��� ����ϱ�.
    
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
 GROUP BY SEQ_VC --������ ����
ORDER BY TO_NUMBER(SEQ_VC)--������ ��ȯ�Ͽ� �̱� (�� Ȧ�� �� ¦��)
