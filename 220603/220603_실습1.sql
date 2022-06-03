SELECT 
        decode(b.rno,'1',a.dname, 'ÃÑ°è') dname
        ,sum(cleark)clark
        ,sum(manager)manager
        ,sum(etc)etc
        ,sum(dept_sal) dept_sal
FROM (
        SELECT dept.dname
       ,sum(decode(job,'CLERK',sal)) cleark
       ,sum(decode(job,'MANAGER',sal)) manager
       ,sum(decode(job,'CLERK',null,'MANAGER',sal)) etc
       ,sum(sal) dept_sal
        FROM emp,dept
        WHERE EMP.deptno = dept.deptno
        GROUP BY dept.dname
       )a,
       (
                SELECT ROWNUM rno FROM dept
                WHERE ROWNUM <3
       )b
  GROUP BY  decode(b.rno,'1',a.dname, 'ÃÑ°è')
  ORDER BY  decode(b.rno,'1',a.dname, 'ÃÑ°è')