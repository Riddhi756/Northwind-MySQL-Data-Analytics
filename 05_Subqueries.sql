-- Display the product(s) whose UnitPrice is equal to the highest UnitPrice in the products table.
select ProductName from products where UnitPrice = (select max(UnitPrice) from products );

-- Display all products whose UnitPrice is greater than the average UnitPrice of all products.
select ProductName from products where UnitPrice > (select avg(UnitPrice) from products);

-- Display all products that belong to the category "Beverages" using a subquery
select ProductName from products where CategoryID = (select CategoryID from categories where CategoryName='Beverages');

-- Display all products supplied by the supplier "Exotic Liquids" using a subquery
select ProductName from products where SupplierID = (select SupplierID from suppliers where CompanyName='Exotic Liquids');

-- Display all orders placed by customers from Germany using a subquery
select OrderID from orders where CustomerID in (select CustomerID from customers where Country='Germany');

-- Display the customer(s) who placed the maximum number of orders. 
select CustomerID,count(OrderID) from orders group by CustomerID having Count(OrderID) = (select max(TotalOrder) from (select count(OrderID) as TotalOrder from orders group by CUstomerID) as t ) ;

-- Display the employee(s) who handled the maximum number of orders.
select EmployeeID,count(OrderID) from orders group by EmployeeID having count(OrderID) = (select max(TotalCount) from (select count(OrderID) as TotalCount from orders group by EmployeeID ) as t);

-- Display the supplier(s) who supply the maximum number of products
select SupplierID,count(ProductID) as TotalProduct from products group by SupplierID having count(ProductId) = (select max(TotalProduct) from (select SupplierID,count(ProductID) as TotalProduct from products group by SupplierID) as t );

-- Display all products whose UnitPrice is greater than the average UnitPrice of their own category.
select ProductName,UnitPrice from products p1 where UnitPrice > (select avg(UnitPrice) from products p2 where p1.CategoryID = p2.CategoryID ) ;

-- Display the customers who have never placed an order using a subquery
select CustomerID from customers where CustomerID not in (select CustomerID from orders WHERE CustomerID is not null);

-- Display the category that has the highest average UnitPrice.
select CategoryID,avg(UnitPrice) as AvgPrice from products group by CategoryID having avg(UnitPrice)=(select max(AvgPrice) from (select CategoryID,avg(UnitPrice) as AvgPrice from products group by CategoryID) as t);

-- Display the supplier(s) whose products have the highest average UnitPrice.
select SupplierID,avg(UnitPrice) as AvgPrice from products group by SupplierID having avg(UnitPrice)=(select max(AvgPrice) from (select SupplierID,avg(UnitPrice) as AvgPrice from products group by SupplierID) as t);

-- Display the employee(s) who handled the highest total freight.
select EmployeeID,sum(Freight) as TotalFreight from orders group by EmployeeID having sum(Freight) = (select max(TotalFreight) from (select EmployeeID,sum(Freight) as TotalFreight from orders group by EmployeeID) as t );

-- Display the customer(s) who paid the highest total freight.
select CustomerID,sum(Freight) as TotalFreight from orders group by CustomerID having sum(Freight) = (select max(TotalFreight) from (select CustomerID,sum(Freight) as TotalFreight from orders group by CustomerID) as t );

-- Display all products whose UnitsInStock is greater than the average UnitsInStock of their category.
select ProductID from products p1 where UnitsInStock >  (select avg(UnitsInStock) from products p2 where p1.CategoryID = p2.CategoryID);

-- Display all products whose UnitPrice is the second highest in the products table. 
select ProductID,ProductName,UnitPrice 
from products where UnitPrice = 
(select max(UnitPrice) from products where UnitPrice < 
(select max(UnitPrice) from products where UnitPrice ));

-- Display the category that has the highest total inventory value
select CategoryId,sum(UnitPrice * UnitsInStock) as TotalInventory from products group by CategoryID having TotalInventory =(select max(TotalInventory) from (select CategoryID , sum(UnitPrice * UnitsInStock) as TotalInventory from products  group by CategoryID) as t);

-- Display all suppliers who supply more products than the average supplier.
select SupplierID,count(ProductId) as TotalProduct from products group by SupplierID having TotalProduct > (select avg(TotalProduct) from (select SupplierID,count(ProductId) as TotalProduct from products group by SupplierID) as t);

-- Display all customers who placed more orders than the average customer.
select CustomerID,count(OrderID) as TotalOrder from orders group by CustomerID having TotalOrder > (select avg(TotalOrder) from (select CustomerID,count(OrderID) as TotalOrder from orders group by CustomerID) as t);

-- Display all products supplied by the supplier who has the highest total inventory value.
select SupplierID,ProductID,ProductName from products where SupplierID = (select SupplierID from products group by SupplierID having sum(UnitPrice * UnitsInStock) =( select max(TotalInventory) from (select SupplierID,sum(UnitPrice * UnitsInStock) as TotalInventory from products group by SupplierID) as t));
