-- Display ProductName, UnitPrice, and a new column PriceCategory:
-- Cheap (<20), Moderate (20-50), Expensive (>50)

select ProductName, UnitPrice,
case
    when UnitPrice < 20 then "Cheap"
    when UnitPrice between 20 and 50 then "Moderate"
    when UnitPrice > 50 then "Expensive"
end as PriceCategory
from products;


-- Display ProductName, UnitsInStock, and a new column StockStatus:
-- Out of Stock (0), Low Stock (<20), In Stock (otherwise)

select ProductName, UnitsInStock,
case
    when UnitsInStock = 0 then "Out of Stock"
    when UnitsInStock < 20 then "Low Stock"
    else "In Stock"
end as StockStatus
from products;


-- Display EmployeeID, total number of orders handled, and a Performance column:
-- Excellent (>100), Good (50-100), Needs Improvement (<50)

select EmployeeID,
       count(OrderID) as TotalOrder,
       case
           when count(OrderID) > 100 then "Excellent"
           when count(OrderID) between 50 and 100 then "Good"
           else "Needs Improvement"
       end as Performance_column
from orders
group by EmployeeID
order by EmployeeID;


-- Display CategoryName, average UnitPrice, and a CategoryType column:
-- Premium (Average Price > 40), Standard (otherwise)

select c.CategoryName,
       avg(p.UnitPrice) as AvgUnitPrice,
       case
           when avg(p.UnitPrice) > 40 then "Premium"
           else "Standard"
       end as CategoryType
from products p
join categories c 
    on p.CategoryID = c.CategoryID
group by c.CategoryName;


-- Display Customer CompanyName, total Freight paid, and a CustomerType column:
-- VIP (>500), Regular (otherwise)

select c.CompanyName,
       sum(o.Freight) as TotalFreight,
       case
           when sum(o.Freight) > 500 then "VIP"
           else "Regular"
       end as CustomerType
from orders o
join customers c 
    on o.CustomerID = c.CustomerID
group by c.CompanyName;
