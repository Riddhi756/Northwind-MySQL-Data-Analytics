-- Display all CompanyName values from the customers table and all CompanyName values from the suppliers table in a single result using UNION.
select c.CompanyName from customers c
union
select s.CompanyName from suppliers s;

-- Display all Country values from the customers table and all Country values from the suppliers table using UNION ALL.
select c.Country from customers c
union all
select s.Country from suppliers s;

-- Display all city names from the customers table and suppliers table without duplicate cities.
select c.City from customers c
union
select s.City from suppliers s;

-- Display all contact names from both customers and suppliers in one result.
select c.ContactName from customers c
union
select s.ContactName from suppliers s;

-- Display all countries from customers and suppliers sorted alphabetically.
select c.Country from customers c  where Country is not null
union
select s.Country from suppliers s where Country is not null order by Country asc;

-- Display all countries that exist in both the customers and suppliers tables
select c.Country from customers c
intersect
select s.Country from suppliers s;

select distinct c.Country from customers c where c.Country in ( select s.Country from suppliers s);

-- Display all cities that exist in both the customers and suppliers tables
select c.City from customers c where City is not null
intersect
select s.City from suppliers s where City is not null;

select distinct c.City from customers c where c.City in (select s.City from suppliers s);

-- Display all countries that are present in customers but not in suppliers
select c.Country from customers c where Country is not null
except 
select s.Country from suppliers s where Country is not null;

select distinct c.Country from customers c where c.Country not in (select s.Country from suppliers s);

-- Display all cities that are present in suppliers but not in customers
select s.City from suppliers s where s.City is not null
except 
select c.City from customers c where c.City is not null;

select distinct s.City from suppliers s where s.City not in (select c.City from customers c where c.City is not null);

-- Display all contact names that are common to both customers and suppliers
select c.ContactName from customers c
intersect
select s.ContactName from suppliers s;

select distinct c.ContactName from customers c where c.ContactName in (select s.ContactName from suppliers s );
