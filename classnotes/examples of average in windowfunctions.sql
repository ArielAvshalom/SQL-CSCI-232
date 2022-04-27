select count(emplid), age, college from yadayada
group by age, college

select count(emplid) (imagine standard deviation), age, college from yadayada
group by age, college
having college = 'hunter'

select count(emplid) (imagine standard deviation), age, college from yadayada
group by age, college
having college = 'brooklyn'

--17  :  1000
18  :  250  : brooklyn
18  :  250  : hunter
21  :  20000: hunter
21  :  1000 : brooklyn



bikesharing

100 bikes let's say'
How long has a bike been take today


select duration_seconds, sum(duration_seconds) over (order by bike_id) as bike_id_duration_seconds
from table


positions table?

eid, salary

select
    did,
    eid,
    salary,
    avg(salary) over(partition by did) avg,
    salary - avg(salary) over(partition by did) diff
from position;

--write code that does this by company instead of by department


select
c.name,
p.eid,
p.salary,
avg(salary) over(partition by c.cid) avgpercompany,
p.salary - avg(salary) over(partition by c.cid) diff
from position p
inner join department d
on p.did = d.did
inner join company c
on d.cid = c.cid;
