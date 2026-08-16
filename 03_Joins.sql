-- Display each product along with its category name.
select ProductName,CategoryName from products p inner join Categories c on p.CategoryID = c.CategoryID ;

-- Display each product along with its supplier company name.
select ProductName,CompanyName from products p inner join suppliers s on p.SupplierID=s.SupplierID;

-- Display each order along with the customer company name.
select orderID,CompanyName from orders o inner join customers c on o.CustomerID = c.CUstomerID ;

-- Display each order along with the employee's first name and last name.
select OrderID,FirstName,LastName from orders o inner join employees e on o.EmployeeID = e.EmployeeID;

-- Display each order along with the shipping company name.
select OrderID,CompanyName from orders o inner join shippers s on o.ShipVia = s.ShipperID;

-- Display the product name, category name, and supplier company name.
select ProductName,CategoryName,CompanyName from products p inner join Categories c  on p.CategoryID = c.CategoryID inner join suppliers s on p.SupplierID = s.SupplierID;

-- Display all customers and the total number of orders placed by each customer.  
select c.CustomerID,count(OrderID) as TotalOrders from customers c left join orders o on c.CustomerID = o.CustomerID group by c.CustomerID;

-- Display the names of customers who have never placed an order.  
select c.CustomerID ,count(o.OrderID) as TotalOrder from customers c left join orders o on c.CustomerID = o.CustomerID group by c.CustomerID having TotalOrder = 0;

-- Display all employees along with the number of orders they handled. 
select e.EmployeeID,count(o.OrderID) as TotalOrder from employees e left join orders o on e.EmployeeID=o.EmployeeID group by e.EmployeeID;

-- Display each order along with the customer name, employee name, and shipping company name.
select c.CompanyName as CustomerCompany,e.FirstName,s.CompanyName as ShipperCompany from orders o inner join customers c on o.CustomerID=c.CustomerID inner join employees e on o.EmployeeID=e.EmployeeID inner join shippers s on o.ShipVia = s.ShipperID;

-- Display each category name along with the total number of products in that category.
select c.CategoryName,count(p.ProductID) as TotalProduct from categories c left join products p on c.CategoryID = p.CategoryID group by c.CategoryName;

-- Display each category name along with the average unit price of products in that category.
select c.CategoryName,avg(p.UnitPrice) as AvgPrice from categories c left join products p on c.CategoryID = p.CategoryID group by c.CategoryName;

-- Display each supplier company name along with the total number of products supplied.
select s.CompanyName,count(p.ProductID) as TotalProduct from suppliers s left join products p on s.SupplierID = p.SupplierID group by s.CompanyName;

-- Display each supplier company name along with the average unit price of its products.
select s.CompanyName,avg(p.UnitPrice) as AvgUnitPrice from suppliers s left join products p on s.SupplierID = p.SupplierID group by s.CompanyName;

-- Display each employee's first name, last name, and the total number of orders handled by that employee.
select e.FirstName,e.LastName,count(o.OrderID) as TotalOrder from employees e left join orders o on e.EmployeeID = o.EmployeeID group by e.FirstName,e.LastName;

-- Display each shipping company's name along with the total number of orders shipped through it.
select s.CompanyName,count(o.OrderID) as TotalOrders from shippers s left join orders o on s.ShipperID = o.ShipVia group by s.CompanyName;

-- Display each shipping company's name along with the total freight collected.
select s.CompanyName,sum(o.Freight) as TotalFreight from shippers s left join orders o on s.ShipperID = o.ShipVia group by s.CompanyName;

-- Display each customer's company name along with the total number of orders they placed. Include customers who have never placed an order.
select c.CompanyName,count(o.OrderID) from customers c left join orders o on c.CustomerID = o.CustomerID group by c.CompanyName;

-- Display each customer's company name along with the total freight they have paid. Include customers who have never placed an order.
select c.CompanyName,sum(o.Freight) as TotalFreight from customers c left join orders o on c.CustomerID = o.CustomerID group by c.CompanyName;

-- Display each category name along with the total inventory value of that category.
select c.CategoryName,sum(p.UnitPrice * p.UnitsInStock) as TotalInventory from categories c left join products p on c.CategoryID = p.CategoryID group by c.CategoryName;

-- Display the categories that have more than 10 products.
select c.CategoryID , c.CategoryName,count(p.ProductID) as TotalProducts from categories c left join products p on c.CategoryID = p.CategoryID  group by c.CategoryID,c.CategoryName having count(p.ProductID) > 10; 

-- Display the suppliers who supply more than 3 products.
select s.SupplierID,s.CompanyName,count(p.ProductID) as TotalProduct from suppliers s left join products p on s.SupplierID = p.supplierID group by s.SupplierID,s.CompanyName having count(p.productID) > 3;

-- Display the customers who have placed more than 10 orders.
select c.CustomerID , c.CompanyName ,count(o.OrderID) as TotalOrder from customers c left join orders o on c.CustomerID = o.CustomerID group by c.CustomerID , c.CompanyName having count(o.OrderID) > 10;

-- Display the employees who have handled more than 100 orders.
select e.EmployeeID,e.FirstName,e.LastName,count(o.OrderID) as TotalOrder from employees e left join orders o on e.EmployeeId = o.EmployeeID  group by e.EmployeeID,e.FirstName,e.LastName having count(o.OrderID) > 100;

-- Display the shipping companies that have shipped more than 200 orders.
select s.ShipperID,s.CompanyName ,count(o.OrderID) as TotalOrder from shippers s left join orders o on s.ShipperID = o.ShipVia group by s.ShipperID,s.CompanyName having count(o.OrderID) > 200;

-- Display the categories whose average product price is greater than 30.
select c.CategoryID,c.CategoryName ,avg(p.UnitPrice) as AvgUnitPrice from categories c left join products p on c.CategoryID=p.CategoryId group by c.CategoryID,c.CategoryName having avg(UnitPrice) > 30;

-- Display the suppliers whose average product price is greater than 40.
select s.SupplierId,s.companyName ,avg(p.UnitPrice) as AvgUnitPrice from suppliers s left join products p on s.SupplierID = p.SupplierID group by s.SupplierId,s.companyName  having avg(UnitPrice) > 40;

-- Display the customers whose total freight paid is greater than 500.
select c.CustomerID,c.CompanyName,sum(o.Freight) as TotalFreight from customers c left join orders o on c.CustomerID = o.CustomerID group by c.CustomerID,c.CompanyName having sum(o.Freight) >500;

-- Display the employees whose total freight handled is greater than 5000.
select e.EmployeeId,e.FirstName,e.LastName,sum(o.Freight) as TotalFreight from employees e left join orders o on e.EmployeeID = o.EmployeeID group by e.EmployeeId,e.FirstName,e.LastName having sum(o.Freight) > 5000;

-- Display the categories whose total inventory value is greater than 5000.
select c.CategoryID,c.CategoryName ,sum(p.UnitPrice * p.UnitsInStock) as TotalInventory from categories c left join products p on c.CategoryID = p.CategoryID group by c.CategoryID,c.CategoryName having sum(p.UnitPrice * p.UnitsInStock) > 5000;
