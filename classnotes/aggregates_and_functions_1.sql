--aggregate functions

--count, max, min, sum, avg #stdv

--aggregate functions squish your output

select country from users;

select count(*), country from users; --this will not work

select count(*), count(country) from users;


select
    count(*),
    country,
    gender
from users
group by country, gender
order by gender, count(country) desc;
--this will work


--aggregate functions need something called a group by clause


select
    count(*),
    country
from users
group by country
order by count(country) desc
limit 1;
--this will not work

select min(id) from users;

--this is not required of you just yet

with table1 as(
    select
        count(*) citizen_count,
        country
    from users
    group by country
    order by count(country) desc
)
select max(citizen_count) from table1;

--average age

select gender, stddev(age) average_age, nat from users
group by gender, nat
order by average_age desc, nat ;

--having clause
select gender, stddev(age) average_age, nat from users
group by gender, nat
having stddev(age) > 18
order by average_age desc, nat ;


--string functions: upper, lower, concat

select (concat(upper(fname), ' ', lower(lname))) "Full Name" from users;

select substring(fname, 1, 3), fname from users;


select ascii(substring(fname, 1, 4)), fname from users;

insert into users(fname) values('R');

select ascii(fname), fname from users order by id desc limit 2;

select
    ascii(substring(fname, 1, 1)) + ascii(substring(fname, 2, 2))
    +ascii(substring(fname, 3, 3)),
    fname
from users;
