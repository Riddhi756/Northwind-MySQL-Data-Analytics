-- Display each product's:
-- ProductName
-- UnitPrice
-- Rank of the product based on UnitPrice (highest price gets Rank 1).

select 
    ProductName,
    UnitPrice,
    rank() over(order by UnitPrice desc) as Rank_Product
from products;


-- Display each product's:
-- ProductName
-- UnitPrice
-- Dense Rank based on UnitPrice (highest first).

select 
    ProductName,
    UnitPrice,
    dense_rank() over(order by UnitPrice desc) as Dense_Rank_Product
from products;


-- Display each product's:
-- ProductName
-- UnitPrice
-- Row Number based on UnitPrice (highest first).

select 
    ProductName,
    UnitPrice,
    row_number() over(order by UnitPrice desc) as RowNumber
from products;


-- Display each employee's:
-- OrderID
-- EmployeeID
-- Freight
-- Rank of each order by Freight within each employee.
-- Use PARTITION BY EmployeeID.

select 
    OrderID,
    EmployeeID,
    Freight,
    rank() over(
        partition by EmployeeID 
        order by Freight desc
    ) as FreightRank
from orders;


-- Display each customer's:
-- OrderID
-- CustomerID
-- OrderDate
-- Row number of each order within that customer ordered by OrderDate.

select 
    OrderID,
    CustomerID,
    OrderDate,
    row_number() over(
        partition by CustomerID 
        order by OrderDate desc
    ) as OrderRowNumber
from orders;


-- Display each product's:
-- ProductName
-- CategoryID
-- UnitPrice
-- Rank of products within each category based on UnitPrice.

select 
    ProductName,
    CategoryID,
    UnitPrice,
    rank() over(
        partition by CategoryID 
        order by UnitPrice desc
    ) as CategoryRank
from products;


-- Display each supplier's:
-- ProductName
-- SupplierID
-- UnitPrice
-- Dense Rank of products within each supplier.

select 
    ProductName,
    SupplierID,
    UnitPrice,
    dense_rank() over(
        partition by SupplierID 
        order by UnitPrice desc
    ) as SupplierRank
from products;


-- Display each customer's:
-- OrderID
-- CustomerID
-- Freight
-- Rank orders by Freight within each customer.

select 
    OrderID,
    CustomerID,
    Freight,
    rank() over(
        partition by CustomerID 
        order by Freight desc
    ) as FreightRank
from orders;


-- Display:
-- ProductName
-- UnitPrice
-- Previous product's UnitPrice.
-- Use LAG().

select 
    ProductName,
    UnitPrice,
    lag(UnitPrice) over(order by UnitPrice) as PreviousPrice
from products;


-- Display:
-- ProductName
-- UnitPrice
-- Next product's UnitPrice.
-- Use LEAD().

select 
    ProductName,
    UnitPrice,
    lead(UnitPrice) over(order by UnitPrice) as NextPrice
from products;


-- Display:
-- OrderID
-- CustomerID
-- Freight
-- Running total of Freight for each customer ordered by OrderDate.
-- Use SUM() OVER(...).

select 
    OrderID,
    CustomerID,
    Freight,
    sum(Freight) over(
        partition by CustomerID 
        order by OrderDate
    ) as RunningTotalFreight
from orders;


-- Display:
-- ProductName
-- CategoryID
-- UnitPrice
-- Average UnitPrice of that category beside every product.
-- Use AVG() OVER(PARTITION BY...).

select 
    ProductName,
    CategoryID,
    UnitPrice,
    avg(UnitPrice) over(
        partition by CategoryID
    ) as CategoryAveragePrice
from products;
