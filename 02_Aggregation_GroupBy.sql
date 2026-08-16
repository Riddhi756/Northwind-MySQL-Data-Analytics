-- Display the total number of customers.
select count(*) from customers;

-- Display the total number of products.
select count(*) from products;

-- Display the total number of orders.
select count(*) from orders;

-- Display the most expensive product price.
select max(UnitPrice) from products;

-- Display the cheapest product price.
select min(UnitPrice) from products;

-- Display the average product price.
select avg(UnitPrice) from products;

-- Display the total units currently in stock across all products.
select sum(UnitsInStock) from products;

-- Display the total freight cost of all orders.
select sum(freight) from orders;

-- Display the number of customers from Germany.
select count(*) from customers where country='Germany';

-- Display the number of discontinued products.
select count(*) from products where discontinued =1;

-- Display the average freight cost of all orders.
select avg(Freight) from orders;

-- Display the highest freight cost.
select max(Freight) from orders;

-- Display the lowest freight cost.
select min(freight) from orders;

-- Display the total number of products that are not discontinued.
select count(*) from products where discontinued = 0;

-- Display the total stock available for products that cost more than 50.
select sum(UnitsInStock) from products where UnitPrice > 50;

-- Display the average unit price of discontinued products.
select avg(UnitPrice) from products where discontinued = 1;

-- Display the total number of customers who are from either Germany or France.
select count(*) from customers where country in ('Germany','France');

-- Display the total number of orders placed by customer ALFKI.
select count(*) from orders where CustomerID = 'ALFKI';

-- Display the total number of products that have zero units in stock.
select count(*) from products where UnitsInStock = 0;

-- Display the total value of all units currently in stock.
select sum(UnitsInStock * UnitPrice) as Stock_Value from products;

-- Display the total number of products in each category.
select CategoryID,count(*) as TotalProduct from products group by CategoryID order by CategoryID asc;

-- Display the average unit price for each category.
select CategoryID, avg(UnitPrice) as Average_UnitPrice from products group by CategoryID order by CategoryID asc;

-- Display the maximum unit price in each category.
select CategoryID , max(UnitPrice) as MaxUnitPrice from products group by CategoryID order by CategoryID ;

-- Display the minimum unit price in each category.
select CategoryID , min(UnitPrice) as MinUnitPrice from products group by CategoryID order by CategoryID ;

-- Display the total units in stock for each category.
select CategoryID,sum(UnitsInStock) as Total_Units from products group by CategoryID order by CategoryID asc;

-- Display the total number of products supplied by each supplier.
select SupplierID,count(*) as Total_Product from products group by SupplierID order by SupplierID;

-- Display the average unit price of products supplied by each supplier.
select SupplierID,avg(UnitPrice) as Average_Price from products group by SupplierID;

-- Display the total freight cost for each employee.
select EmployeeID,sum(Freight) as Total_Freight from orders group by EmployeeID order by EmployeeID ;

-- Display the total number of orders handled by each employee.
select EmployeeID,count(OrderID) as Total_Order from orders group by EmployeeID order by EmployeeID ;

-- Display the total number of customers in each country.
select Country,count(*) as Total_Customer
	from customers
	where Country is not null 
	group by Country 
	order by Country ;
    
-- Display the total number of orders placed in each year.
select year(OrderDate) as OrderYear ,count(*) from orders group by OrderYear;

-- Display the total freight cost for each shipping company. 
select ShipVia,sum(freight) as TotalFreight from orders group by ShipVia order by ShipVia asc;

-- Display the average freight cost for each shipping company. 
select ShipVia,avg(freight) as AverageFreight from orders group by ShipVia order by ShipVia asc;

-- Display the total number of products in each price range based on Discontinued status.  
select UnitPrice , Discontinued,count(*) from products group by UnitPrice , Discontinued;

-- Display the total inventory value for each category.
select CategoryID,sum(UnitPrice * UnitsInStock) as Inventory from products group by CategoryID order by CategoryID;

-- Display the total inventory value for each supplier.
select SupplierID,sum(UnitPrice * UnitsInStock) as Inventory from products group by SupplierID order by SupplierID;

-- Display the average number of units in stock for each supplier.
select SupplierID,avg(UnitsInStock) as Average from products group by SupplierID order by SupplierID asc;

-- Display the total number of orders placed by each customer
select CustomerID,count(*) as TotalOrder from orders group by CustomerID;

-- Display the total freight paid by each customer.
select CustomerID,sum(Freight) from orders group by CustomerID;

-- Display the total number of products in each category that are not discontinued.
select CategoryID,count(*) from products where Discontinued = 0 group by CategoryID order by CategoryID;
