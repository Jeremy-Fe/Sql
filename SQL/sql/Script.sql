SELECT * FROM DEPARTMENT;

SELECT * FROM STUDENT;

SELECT dept_name, name
FROM DEPARTMENT, STUDENT
WHERE department.DEPT_ID = student.DEPT_ID;

SELECT DISTINCT  address
FROM STUDENT;

SELECT *
FROM STUDENT;

SELECT * FROM PROFESSOR;

SELECT name, year_emp, 2023-year_emp
FROM PROFESSOR;

SELECT student.NAME , student.STU_ID , department.DEPT_NAME
FROM STUDENT, DEPARTMENT
WHERE student.DEPT_ID  = department.DEPT_ID;

UPDATE STUDENT
SET YEAR = YEAR-1;

SELECT * FROM STUDENT

SELECT student.stu_id, name
FROM student, DEPARTMENT
WHERE student.DEPT_ID = department.DEPT_ID AND 
	student.year = 3 AND 
	department.DEPT_NAME = '컴퓨터공학과';

SELECT name, stu_id
FROM STUDENT
WHERE YEAR = 3 OR YEAR = 4
ORDER BY name, stu_id; 

SELECT name, stu_id
FROM STUDENT
WHERE YEAR = 3 OR YEAR = 4
ORDER BY name DESC, stu_id; 

SELECT s.name, d.dept_name
FROM STUDENT s , DEPARTMENT d 
WHERE s.DEPT_ID = d.DEPT_ID ;

SELECT address
FROM STUDENT
WHERE name='김광식';

SELECT name, address
FROM STUDENT
WHERE address='서울';

SELECT name 이름, POSITION 직위, 2023-year_emp 재직연수
FROM PROFESSOR;

SELECT *
FROM STUDENT
WHERE name LIKE '김%';

SELECT name, student.YEAR 
FROM STUDENT
WHERE student.RESIDENT_ID LIKE '%*2%'
OR resident_id LIKE '%*4%';

SELECT name FROM STUDENT
UNION
SELECT name FROM PROFESSOR;

SELECT dept_id FROM student
UNION ALL
SELECT dept_ID FROM PROFESSOR; 

SELECT s.stu_id, s.NAME 
FROM STUDENT s ,DEPARTMENT d, takes t
WHERE s.dept_id = d.dept_id
	AND t.stu_id = s.stu_id 
	AND dept_name='컴퓨터공학과' 
	AND GRADE = 'A+';

SELECT stu_id  
FROM student s, department d
WHERE s.dept_id = d.dept_id 
AND dept_name = '산업공학과'
MINUS 
SELECT stu_id 
FROM TAKES
WHERE grade = 'A+';

SELECT title, credit, YEAR, semester
FROM COURSE, CLASS
WHERE course.course_id = class.COURSE_ID;

SELECT title, credit, YEAR, semester
FROM course LEFT OUTER JOIN CLASS
USING (course_id);

select 	title, credit, year, semester
from 	course, class
where 	course.course_id = class.course_id (+);

SELECT * FROM emp;

SELECT *
FROM EMP
ORDER BY SAL desc

SELECT COUNT(*)
FROM STUDENT
WHERE YEAR=3;

SELECT COUNT(*)
FROM EMP;

SELECT COUNT(ENAME)
FROM EMP;

SELECT COUNT(COMM)
FROM EMP;

SELECT COUNT(DEPT_ID)
FROM STUDENT;

SELECT count(DISTINCT dept_id)
FROM STUDENT;

SELECT count(*)
FROM STUDENT s , DEPARTMENT d 
WHERE s.DEPT_ID = d.DEPT_ID AND d.DEPT_NAME = '컴퓨터공학과'

SELECT COUNT(job)
FROM EMP
WHERE job = 'SALESMAN';

SELECT count(*)
FROM EMP
WHERE job = 'SALESMAN' AND SAL >= 1500;

SELECT * FROM PROFESSOR;

SELECT sum(2023-year_emp)
FROM PROFESSOR;

SELECT name, year_emp, 2023-YEAR_emp
FROM PROFESSOR;

SELECT sum(SAL)
FROM EMP
WHERE job = 'SALESMAN';

SELECT sum(sal)
FROM DEPT d, EMP e
WHERE d.DEPTNO = e.DEPTNO
AND d.dname = 'RESEARCH';

select 		dept_id, count(*)
from 		student
group by 	dept_id;

SELECT dept_name, count(*)
FROM STUDENT s , DEPARTMENT d 
WHERE s.DEPT_ID = d.DEPT_ID 
GROUP BY dept_name;

SELECT dname, count(*), avg(sal), max(sal), min(sal)
FROM emp e, DEPT d 
WHERE e.DEPTNO = d.DEPTNO 
GROUP BY dname
ORDER BY dname;

SELECT dept_name, count(*), avg(2023-year_emp), max(2023-year_emp)
FROM PROFESSOR p , DEPARTMENT d 
WHERE p.DEPT_ID = d.DEPT_ID 
GROUP BY dept_name;

SELECT dept_name, count(*), avg(2012-year_emp), max(2012-year_emp)
FROM PROFESSOR p , DEPARTMENT d 
WHERE p.dept_id = d.dept_id
GROUP BY dept_name
HAVING avg(2012-Year_emp) >= 10;

select 	dname, count(*), avg(sal), max(sal), min(sal)
from 	emp e, dept d
where 	e.deptno = d.deptno
group by 	dname
having 	count(*) >= 5;

SELECT *
FROM EMP
WHERE comm IS NULL;

SELECT *
FROM TAKES
WHERE GRADE != 'A+';
-- NULL 은 질의 코드에 포함되지않음

SELECT *
FROM EMP
WHERE comm != 1400;

select 	title
from 	course
where 	course_id in 
			(select 	distinct course_id 
		 	 from 	class 
			 where 	classroom = '301호')

select 	distinct 	title
	from 	course c1, class c2
	where 	c1.course_id = c2.course_id and 
		classroom = '301호'

select 	title
from 	course
where 	course_id  	not in 
				(select distinct course_id 
				from class 
				where year = 2012 and semester = 2)

grant create view to c##himedia;

create or replace view 	cs_student as
select 	s.stu_id, s.resident_id, s.name, s.year, s.address, s.dept_id
from 	student s, department d
where 	s.dept_id = d.dept_id and d.dept_name = '컴퓨터공학과';
		
SELECT * FROM cs_student;

INSERT INTO V_TAKES VALUES ('1292502','C101-01');

SELECT * FROM V_TAKES

DROP VIEW V_TAKES ;

CREATE OR REPLACE VIEW v_takes AS
SELECT stu_id, class_id
FROM TAKES
WITH READ ONLY;

--INSERT INTO v_takes VALUES ('1292502', 'C101-01');

SELECT * FROM dual;

SELECT sysdate FROM dual;

SELECT ename, hiredate, to_number(to_char(hiredate, 'YYYY')) 입사년도,
TO_NUMBER(to_char(hiredate, 'MM')) 입사월, 
TO_NUMBER(to_char(hiredate, 'DD')) 입사일 
FROM emp;

SELECT TO_char(sysdate, 'YYYY/MM/DD') 날짜,
to_char(sysdate, 'YYYY.MON.DAY') 문자형
FROM dual;


SELECT ename, sal
FROM emp;

SELECT ename,
CASE WHEN sal > 2000
THEN sal
ELSE 2000
END revised_salary
FROM emp;

SELECT loc,
CASE loc
WHEN 'NEW YORK' THEN  'EAST'
WHEN 'BOSTON' THEN 'EAST'
WHEN 'CHICAGO' THEN 'CENTER'
WHEN 'DALLAS' THEN 'CENTER'
ELSE 'ETC'
END AS AREA
FROM dept;

SELECT loc,
decode(loc,
'NEW YORK', 'EAST',
'BOSTON', 'EAST',
'DALLAS', 'CENTER',
'CHICAGO', 'CENTER') area
FROM dept;

SELECT ename,
CASE WHEN sal >= 3000 THEN 'high'
WHEN sal >= 1000 THEN 'mid'
else 'low'
END AS salary_grade
FROM emp;

SELECT *
FROM emp;

SELECT empno, ename, sal, comm, sal+COMM
FROM emp;


SELECT empno, ename, sal, nvl(comm, 0) FROM emp;

SELECT empno, ename, sal,
CASE WHEN comm IS NULL
THEN 0
ELSE comm
END AS commission
FROM emp;

SELECT empno, ename, sal, COMM , sal+nvl(comm, 0) 합계
FROM emp;


SELECT * FROM EMP
WHERE rownum <= 5;

SELECT *
FROM (
SELECT ename 사원, sal 급여, comm 보너스, sal+nvl(comm, 0) 합계
FROM EMP
ORDER BY 4 DESC , ename
)
WHERE rownum <= 5;

SELECT * FROM emp
WHERE sal BETWEEN 1500 AND 2500;

SELECT dname, job, count(*) "Total Empl", sum(sal) "Total sal"
FROM emp, DEPT
WHERE dept.deptno = emp.DEPTNO 
GROUP BY dname, job;

SELECT nvl(dname, '[Total]') 부서 , nvl(JOB , '[Total]') 직책,
count(*) "Total Empl",
sum(sal) "Total Sal"
FROM emp, DEPT
WHERE dept.deptno = emp.DEPTNO 
GROUP BY ROLLUP (dname, job)
ORDER BY dname, job;


SELECT *
FROM emp;
