이름- t_giftmem
보유포인트 - t_giftmem, point_nu
영화티켓 t_gifitpoint,point_nu

-- 인라인뷰로 작성해보기.
-- 스키마 브라우저를 통해 view확인 가능함.
create view v_emp1(e_no,e_name)
    as select empno,ename
    from emp
    where deptno=10
    
--인라인뷰에서 추출해보기
select e_no,e_name from v_emp1

select point_nu from t_giftpoint
    where name_vc ='영화티켓'

select
POINT_NU
    from(
    select point_nu from t_giftpoint
    where name_vc ='영화티켓'
    )
    
select 
    MEM.NAME_VC,MEM.POINT_NU, point.point_nu
    FROM T_GIFTMEM mem, 
    (
       select point_nu FROM t_giftpoint
    where name_vc ='영화티켓'
    )point --알리아스명 설정
    WHERE mem.point_nu >= point.point_nu


--우리 회사에 근무하는 사원 중에서 알렌보다 급여를 더 많이 받는 사원을 조회해보시오    
select ename,sal 
     from emp
             WHERE sal >= 
    (
        SELECT sal FROM emp WHERE ename='ALLEN'
    );


1.temp에서 연봉이 가장 많은 직원의 row를 찾아서 이 금액과 동일한 금액을
받는 직원의 사번과 성명을 출력하시오.

SELECT EMP_ID,EMP_NAME, to_char(SALARY,'999,999,999') AS "연봉"
  FROM TEMP
 WHERE TEMP.SALARY =( SELECT MAX(SALARY)
              FROM TEMP); 
      

      
2.temp의 자료를 이용하여 salary의 평균을 구하고 이보다 큰 금액을 salary로
받는 직원의 사번과 성명, 연봉을 보여주시오.

SELECT EMP_ID AS 사번, EMP_NAME AS 성명,SALARY AS 연봉
FROM TEMP
WHERE Salary >(
            SELECT AVG(Salary)
         FROM TEMP
            );


3.temp의 직원 중 인천에 근무하는 직원의 사번과 성명을 읽어오는 SQL을 서브
쿼리를 이용해 만들어보시오.

SELECT EMP_ID, EMP_NAME
         FROM TEMP
    WHERE DEPT_CODE IN (
                            SELECT DEPT_CODE
                             FROM TDEPT
                               WHERE AREA = '인천');

4.tcom에 연봉 외에 커미션을 받는 직원의 사번이 보관되어 있다.
이 정보를 서브쿼리로 select하여 부서 명칭별로 커미션을 받는
인원수를 세는 문장을 만들어 보시오.

SELECT B.DEPT_NAME, COUNT(*) 인원수
         FROM TEMP A, TDEPT B
         WHERE B.DEPT_CODE = A.DEPT_CODE
          AND A.EMP_ID IN 
          (SELECT EMP_ID 
            FROM TCOM)
         GROUP BY DEPT_NAME;
    
--temp의 자료를 salary로 분류하여 , 3천만원 이하는 D, 3천만원 초과 5천만원 이하는 C
--5천만원 초과 7천만원 이하는 B, 7천만원 초과는 A라고 등급을 분류하여, 
--등급별 인원수를 출력하는 SQL문을 작성하시오.

  select count(case when salary>70000000 then 'A' end) a,
          count(case when salary<=70000000 and salary>50000000 then 'B' end) b,
          count(case when salary<=50000000 and salary>30000000 then 'C' end) c,
          count(case when salary<=30000000 then 'D' end) d
  from temp ;



SELECT 
    CASE WHEN SALARY <=30000000 THEN 'D'
           WHEN salary<=50000000 and salary>30000000 then 'C'
            WHEN salary<=70000000 and salary>50000000 then 'B'
            when salary>70000000 then 'A' 
    END c
    FROM TEMP




SELECT 
    CASE WHEN SALARY <=30000000 THEN 'D'
           WHEN salary<=50000000 and salary>30000000 then 'C'
            WHEN salary<=70000000 and salary>50000000 then 'B'
            when salary>70000000 then 'A' 
    END c
    , count(*)
   FROM TEMP
GROUP BY (
         CASE WHEN SALARY <=30000000 THEN 'D'
           WHEN salary<=50000000 and salary>30000000 then 'C'
            WHEN salary<=70000000 and salary>50000000 then 'B'
            when salary>70000000 then 'A' 
    END 
    
    )





아이디와 비밀번호가 일치하면 1을 반환하고,
비번이 틀리면 0을 반환하고
아이디가 존재하지 않으면 -1을 반환하는 SELECT문을 작성하시오.(CASE구문을 사용할것)

