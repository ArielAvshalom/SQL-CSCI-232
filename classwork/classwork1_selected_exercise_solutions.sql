select
    eid,
    fname,
    lname
from employee
where fname like 'A%';
or fname like 'a%'
;
select
    eid,

    fname,
    lname
from employee
where upper(fname) like 'A%';
or fname like 'a%'
;

/*

*/
select
    eid,
    fname,
    lname
from employee
where upper(fname) like 'A%'
and lower(lname) like 'a%';

select
    round(avg(eid))--,
    --fname,
    --lname
from employee
where upper(fname) like 'A%'
and lower(lname) like 'a%';


insert into employee(eid, fname) values(1001, 'ariel');


delete from employee where eid = 1001;

select eid, did from position
union
select eid, concat(fname, ' ', lname) from employee;

select eid from table1
union
select eid from table2;

select p.eid, concat(fname, ' ', lname), did
from position p
natural inner join
employee e;

select
    concat(fname, ' ', lname),
    e.eid,
    p.did,
    c.cid,
    c.name
    from employee e
    inner join position p on e.eid = p.eid
    inner join department d on p.did = d.did
    inner join company c on d.cid = c.cid;


select
e.eid, d.cid
    from employee e
    inner join position p on e.eid = p.eid
    inner join department d on p.did = d.did
where d.cid = 5;


select eid
from employee
where
    eid < 501
    and
    eid > 399
;

select eid
from employee
where
    eid between 400 and 500
;

select
e.eid, d.cid
    from employee e
    inner join position p on e.eid = p.eid
    inner join department d on p.did = d.did
where d.cid = 5
and e.eid between 400 and 500;


select * from position limit 1;
select cid from department limit 1;

select
    d.cid, p.title, avg(p.salary)
from position p
inner join department d on d.did = p.did
where p.title = 'developer'
group by d.cid, p.title
order by d.cid;

select count(p.eid), p.title, d.did
from position p
inner join department d on p.did = d.did
where p.title = 'contractor' and d.did = 8
group by p.title, d.did;


select count(p.eid)
from position p
inner join department d on p.did = d.did
where p.title = 'contractor' and d.did = 8;
--group by p.title, d.did;

select
    round(avg(p.salary)),
    d.did
from
    position p
inner join
    department d on p.did = d.did
group by d.did
order by d.did;


select did, max(avg(salary)) from position
group by did;

--this doesn't work ... sad face

select did, avg(salary) from position
group by did
having max(avg(salary));
--this doesn't work either...

select did, avg(salary) from position
group by did
order by avg(salary) desc
limit 1
;

--inner select join or the psql friendly version called a cte

with table1 as(
    select did, avg(salary) salary from position
    group by did
),

select max(salary) from table1

select max(salary) from (
    select did, avg(salary) salary from position
    group by did) as table1
    ;

select count(p.*), d.cid from position p
    inner join department d
    on p.did = d.did
    group by d.cid;

select count(p.*), d.cid, d.did from position p
    inner join department d
    on p.did = d.did
    group by d.cid, d.did
    order by d.cid, d.did;

select sum(p.salary), d.cid from position p
    inner join department d
    on p.did = d.did
    group by d.cid
    order by sum(p.salary);

--Q5:

--A:  What are the full names of employees who don't have a favorite food?

select eid, favfood from foodies
where favfood is Null;

select
    concat(e.fname, ' ', e.lname),
    f.favfood
from employee e
inner join foodies f
on e.eid = f.eid;

select
    concat(e.fname, ' ', e.lname),
    f.favfood
from employee e
inner join foodies f
on e.eid = f.eid
where f.favfood is Null;


--b
select count(*), favfood from foodies
group by favfood;


--C -1

select
    d.cid,
    count(f.*),
    f.favfood
from foodies f
    inner join employee e
    on f.eid = e.eid

    inner join position p
    on e.eid = p.eid

    inner join department d
    on p.did = d.did
--where clause is going to limit companies we look at
where
    d.cid = 3

group by
    d.cid, f.favfood

order by d.cid, count(f.*) desc
limit 3;
