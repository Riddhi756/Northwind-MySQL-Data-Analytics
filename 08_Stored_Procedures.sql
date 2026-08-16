-- Stored Procedure 1
-- Create a stored procedure named GetProductsByCategory
-- that accepts a CategoryID and displays all products
-- belonging to that category.

delimiter &&

create procedure GetProductsByCategory(in Category_ID int)
begin
    select ProductID, ProductName
    from products
    where CategoryID = Category_ID;
end &&

delimiter ;

call GetProductsByCategory(1);


-- Stored Procedure 2
-- Create a stored procedure named TotalProductsInCategory
-- that accepts:
-- IN CategoryID
-- OUT TotalProducts
-- It should return the number of products in the given category.

delimiter &&

create procedure TotalProductsInCategory(
    in Category_ID int,
    out Total_Products int
)
begin
    select count(ProductID)
    into Total_Products
    from products
    where CategoryID = Category_ID;
end &&

delimiter ;

call TotalProductsInCategory(1, @Total);
select @Total;


-- Stored Procedure 3
-- Create a stored procedure named IncreaseFreight.
-- Accept an INOUT parameter named Amount.
-- Increase its value by 50.
-- Return the updated value.

delimiter &&

create procedure IncreaseFreight(inout Amount float)
begin
    set Amount = Amount + 50;
end &&

delimiter ;

set @Price = 10;
call IncreaseFreight(@Price);
select @Price;
