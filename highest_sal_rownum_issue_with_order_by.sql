select dept_no ,count(*) from emp_t group by dept_no;




--without using dense_rank() or rank()
create table employees_t(
emp_id number ,
salary number ,
dept_no number
);
create sequence SEQ ;
--insert into employees_t values (SEQ.nextval,1000,10);
insert into employees_t values (SEQ.nextval,2000,20);
insert into employees_t values (SEQ.nextval,3000,10);
insert into employees_t values (SEQ.nextval,4000,10);
insert into employees_t values (SEQ.nextval,5000,20);
insert into employees_t values (SEQ.nextval,6000,30);
commit;
explain plan for select * from employees_t;

--First select clause is executed then order by salary gets 
--applied NOTE:Output
--6000	6
--5000	5
--4000	4
--3000	3
--2000	2
--1000	1
select salary,rownum from employees_t order by salary desc ;
-- to get the output in which rownum is ordered correctly 
-- use this 
select salary ,rownum as ranking from 
(select salary from employees_t order by salary desc)
;

explain plan for select salary,rownum from employees_t order by salary desc ;
select * from table(DBMS_XPLAN.DISPLAY);

--2nd highest salary
select max(t1.salary) from employees_t t1  where salary NOT IN 
(select max(salary) from employees_t ) ;

--3rd hightest salary 

select salary from 
(select salary ,rownum as ranking from 
(select salary from employees_t order by salary desc)) k
where k.ranking = 3;















select * from 
(select salary ,dense_rank() over(order by salary desc) as ranking from emp_t ) t;
--where t.ranking =3 ;

select salary ,dense_rank() over(order by salary desc)  from emp_t;
desc emp_t;