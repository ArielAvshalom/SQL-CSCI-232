https://gist.github.com/aveek22/f0d7cf29af149bbc11fb3ba0e2d5e4fc

CREATE TABLE Laptops(
	LaptopID serial PRIMARY KEY,
	LaptopName VARCHAR(100),
	LaptopBrand VARCHAR(100),
	ReleasedYear INT,
	DeviceType VARCHAR(100),
	Price DECIMAL(9,2)
);

INSERT INTO Laptops (LaptopName,LaptopBrand,ReleasedYear,DeviceType,Price) VALUES
('Microsoft Surface Laptop 4 15-inch','Microsoft',2017,'Office',130),
('Microsoft Surface Pro 7+','Microsoft',2019,'Office',140),
('Apple MacBook Air (M1, 2020)','Apple',2020,'Business',90),
('Apple MacBook Air MREA2HN/A','Apple',2021,'Business',100),
('Dell XPS 13 9310','Dell',2021,'Office',150),
('Dell XPS 15 9500','Dell',2021,'Gaming',200),
('Dell G5 15 SE 5505','Dell',2020,'Business',75),
('HP Chromebook 11a','HP',2020,'Business',20)
;

window_function ([ALL] expression)
over (partition by partition_value) order by ...



select
	LaptopName,
	Price,
	Rank() OVER(order by Price) as RowRank,
	cast(Rank() OVER(order by Price) as float)/8 as PriceDistribution,
	cume_dist() OVER(order by Price) as CumePrice_Dist
from Laptops;

select
	LaptopName,
	Price,
	DeviceType,
	cume_dist() OVER(partition by DeviceType order by Price) as CumePrice_Dist
from Laptops;


select *, first_value(LaptopName) over(partition by LaptopBrand order by price) as first_value
from laptops;


--lead and lag

select *,
--lead(LaptopName, 1) over(order by price) as first
lead(LaptopName, 2) over(order by price) as second
from laptops;


select *,
--lead(LaptopName, 1) over(order by price) as first
lag(LaptopName, 2) over(order by price) as second
from laptops;



select
	LaptopName,
	Price,
	cast(ntile(4) OVER(order by Price) as float) as RowRank
from Laptops;
