-- convert rows to columns

create table rows_table(
col1 number ,
col2 number );
insert into rows_table values (1,4);
insert into rows_table values (2,5);
insert into rows_table values (3,6);
commit;
select col1,col2 from rows_table;

select col1,col2,DECODE(col2,4,4,
                             2,2,
                             3,3
                         ) as col3 from rows_table;


