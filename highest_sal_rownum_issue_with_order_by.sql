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
select * from employees_t;

--First select clause is executed then order by salary gets 
--applied NOTE:Output
select salary,rownum from employees_t order by salary desc ;








select * from 
(select salary ,dense_rank() over(order by salary desc) as ranking from emp_t ) t;
--where t.ranking =3 ;

select salary ,dense_rank() over(order by salary desc)  from emp_t;
desc emp_t;