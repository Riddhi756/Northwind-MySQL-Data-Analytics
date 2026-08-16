-- Display all columns and all rows from the customers table.
select * from customers;

-- Display only the CompanyName, ContactName, and Country columns from the customers table.
select CompanyName,ContactName,Country from customers;

-- Display all distinct countries from the customers table.
select distinct Country from customers where Country is not null order by Country asc;

-- Display all products whose UnitPrice is greater than 50.
select * from products where UnitPrice > 50;

-- Display all products whose UnitsInStock is less than 20.
select * from products where UnitsInStock < 20;

-- Display all customers whose country is Germany.
select * from customers where country ="Germany";

-- Display all customers whose country is France.
select * from customers where country="France";

-- Display all orders sorted by OrderDate in descending order.
select * from orders order by OrderDate desc;

-- Display the top 10 most expensive products.
select * from products order by UnitPrice desc limit 10;

-- Display all products whose UnitPrice is between 20 and 50.
select * from products where UnitPrice between 20 and 50;

-- Display all products whose UnitPrice is greater than 50 and UnitsInStock is less than 20.
select * 
from products 
where UnitPrice > 50 and UnitsInstock < 20;

-- Display all customers who are from Germany or France.
select * from customers where country in ('Germany','France');

-- Display all products that are not discontinued.
select * from products where Discontinued = 0;

-- Display all products whose UnitPrice is not between 20 and 50.
select * from products where UnitPrice not between 20 and 50;

-- Display all customers whose ContactTitle is Owner.
select * from customers where ContactTitle ='Owner';

-- Display all orders placed in the year 1997.
select * from orders where year(OrderDate)="1997";

-- Display all products whose product name starts with C.
select * from products where ProductName like "C%";

-- Display all customers whose company name ends with Restaurant.
select * from customers where CompanyName like "%Restaurant";

-- Display all products whose product name contains the word Chef.
select * from products where ProductName like "%Chef%";

-- Display all customers whose fax number is missing.
select * from customers where fax is null;
