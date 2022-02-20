copy
\copy

--you need to create a table that has all of those columns from your sheet
create table users(
    id int,
    gender varchar,
    fname varchar,
    lname varchar,
    streetnum int,
    street varchar,
    city varchar,
    state varchar,
    country varchar,
    zip varchar,
    x numeric,
    y numeric,
    timezone varchar,
    timezonedesc varchar,
    email varchar,
    dob timestamp,
    age int,
    phone varchar,
    cell varchar,
    nat varchar(2)
);

drop table user;

/Users/arielavshalom/Downloads/download.csv

\copy users from '/Users/arielavshalom/Downloads/download.csv' DELIMITER ',' CSV HEADER

select gender, count(gender) from users group by gender;

select count(fname) from users;

select count(distinct fname) from users;

select fname, count(*) as fname_count
from users
group by fname order by fname_count desc;
