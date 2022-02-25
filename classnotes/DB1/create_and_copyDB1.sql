
create table employee(
  eid bigint not NULL unique,
  fname varchar(25),
  lname varchar(25),
  email varchar(50)
);
-- /Users/arielavshalom/OneDrive/Teaching/Hunter College/CSCI 232/employees.csv
\copy employee(eid, fname, lname, email) FROM '/Users/arielavshalom/Desktop/employees.csv' DELIMITER ',' CSV HEADER

create table positions(
  eid bigint not NULL unique,
  title varchar(30), --job title
  did bigint,
  salary int --randomly assigned CEOs can earn a dollar
);

\copy positions(eid, title, did, salary) FROM '/Users/arielavshalom/Desktop/positions.csv' DELIMITER ',' CSV HEADER


create table department(
  cid bigint,
  did bigint,
  dept varchar(25)
);

\copy department(cid, did, dept) FROM '/Users/arielavshalom/Desktop/departments.csv' DELIMITER ',' CSV HEADER

create table companies(
  cid bigint,
  name varchar(30),
  cdesc varchar(100) --What the company does
);
\copy companies(cid, name, cdesc) FROM '/Users/arielavshalom/Desktop/company.csv' DELIMITER ',' CSV HEADER

create table foodies(
  eid bigint not NULL Unique,
  favfood varchar(25)
);

\copy foodies(eid, favfood) FROM '/Users/arielavshalom/Desktop/favfood.csv' DELIMITER ',' CSV HEADER
