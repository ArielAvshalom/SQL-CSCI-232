--differences between Tables Views and CTES

--we have a table called alcohol which is a survey of students and how much they drink and what that might mean about home life etc.

create table female_alcohol_survey as
    select * from alcohol where sex = 'F'
;

--instead of spending a whole lot of memory, create a view

drop table female_alcohol_survey;

create view female_alcohol_survey as
    select * from alcohol where sex = 'F' --views only store the code while tables store all of that data as a copy.
;

select distinct famsize from alcohol;

create view gt3famsize as
    select * from alcohol 
    where famsize = 'GT3';

create view le3famsize as
    select * from alcohol 
    where famsize = 'LE3';

select avg(dailyalc) from gt3famsize;
select avg(dailyalc) from le3famsize;

select avg(weekendalc) from gt3famsize
union
select avg(weekendalc) from le3famsize;

select dailyalc, count(dailyalc) from gt3famsize group by dailyalc
union
select dailyalc, count(dailyalc) from le3famsize group by dailyalc;



with cte1 as (
    SELECT ...
)

cte2 as(

)

select stuff from cte1 cte2