--differences between Tables Views and CTES

--we have a table called alcohol which is a survey of students and how much they drink and what that might mean about home life etc.

create table female_alcohol_survey as
    select * from alcohol where sex = 'F'
;

--instead of spending a whole lot of memory, create a view

drop table female_alcohol_survey;

create view female_alcohol_survey as
    select * from alcohol where sex = 'F'
;