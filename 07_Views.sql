-- Create a view named ProductDetails that displays:
-- ProductName
-- CategoryName
-- UnitPrice

create view ProductDetails as
select 
    p.ProductName,
    c.CategoryName,
    p.UnitPrice
from products p
join categories c 
    on p.CategoryID = c.CategoryID;


-- Create a view named CustomerOrders that displays:
-- OrderID
-- CompanyName
-- OrderDate
-- Freight

create view CustomerOrders as
select 
    o.OrderID,
    c.CompanyName,
    o.OrderDate,
    o.Freight
from orders o
join customers c 
    on o.CustomerID = c.CustomerID;


-- Create a view named EmployeeOrders that displays:
-- EmployeeID
-- FirstName
-- LastName
-- TotalOrders

create view EmployeeOrders as
select 
    o.EmployeeID,
    e.FirstName,
    e.LastName,
    count(o.OrderID) as TotalOrders
from orders o
join employees e 
    on o.EmployeeID = e.EmployeeID
group by 
    o.EmployeeID,
    e.FirstName,
    e.LastName;


-- Display all views in the current database.

show full tables
where Table_Type = 'VIEW';
