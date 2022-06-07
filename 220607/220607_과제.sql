SELECT
    decode(GROUPING(indate_vc),1,'All Days', indate_vc) as "�Ǹ�����"
   ,gubun_vc
   ,name_vc
   ,cnt
   ,price
  FROM
       (
  SELECT
         decode(GROUPING(indate_vc),1,'All Days',indate_vc) as indate_vc
        ,decode(GROUPING(gubun_vc),1
        ,decode(lag(GROUPING(gubun_vc),1)
         OVER(ORDER BY INDATE_VC),1,'Total','�Ұ�'),gubun_vc) as gubun_vc
        ,name_vc
       ,sum(a.qty_nu) as "cnt"
       ,sum(a.qty_nu*price_nu)||'��' as "price"        
    FROM t_orderbasket
  GROUB BY ROLLUP(indate_vc,gunbun_vc,name_vc))