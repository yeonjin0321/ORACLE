 SELECT CEIL(NO/5) RNO
      ,min(DECODE(MOD(NO,5),1,emp_id)) ID1
      ,min(DECODE(MOD(NO,5),1,emp_name)) NAME1
      ,min(DECODE(MOD(NO,5),2,emp_id)) ID2
      ,min(DECODE(MOD(NO,5),2,emp_name)) NAME2
      ,min(DECODE(MOD(NO,5),3,emp_id)) ID3
      ,min(DECODE(MOD(NO,5),3,emp_name)) NAME3
      ,min(DECODE(MOD(NO,5),4,emp_id)) ID4
      ,min(DECODE(MOD(NO,5),4,emp_name)) NAME4
       ,min(DECODE(MOD(NO,5),0,emp_id)) ID5
       ,min(DECODE(MOD(NO,5),0,emp_name)) NAME5
  FROM (
        SELECT ROWNUM NO,emp_id,emp_name FROM TEMP
       )
 group by ceil(no/5)
 order by ceil(no/5)
 