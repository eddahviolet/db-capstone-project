-- Task 1: Create procedure 
/*Create a procedure GetMaxQuantity that displays the maximum ordered quantity in the Orders table. */
-- getting rid of produre with similar name if it exists
drop procedure if exists GetMaxQuantity;
-- syntax to create procedure
create procedure GetMaxQuantity() select Quantity from Orders order by Quantity desc limit 1;
-- call procedure by its name
call GetMaxQuantity();

-- Task 2: Prepared statement
/*create a prepared statement called GetOrderDetail that accepts one input argument, 
CustomerID value, and returns OrderID, Quantity and Cost from Orders table. */
-- I will use BookingID instead of customerID since that is the foreign key in my Orders table
 prepare GetOrderDetail from 'select OrderID, Quantity, TotalCost from Orders where 
 BookingID = ?';
 -- declaring a variable
 set @BookingID = 1;
 -- executing the statemenet
 execute GetOrderDetail using @BookingID;
 
 -- Task 3:  Create Procedure
 /*Create a stored procedure called CancelOrder that deletes an order record based on the user input of the order id.
 */
 -- getting rid of produre with similar name if it exists
drop procedure if exists CancelOrder;
 -- syntax to create procedure 
delimiter //
create procedure CancelOrder (in order_id int)  
begin
delete from orders where OrderID = order_id;
-- to output the results as confirmation in the result grid
select concat ("Order ", order_id, " is cancelled") as Confirmation;
end //
delimiter ;
 
-- call procedure by its name with the required parameter
call CancelOrder(5); 
 
 -- re-inserting the deleted record for subsequent exercises
 insert into Orders (OrderID, OrderDate, Quantity, TotalCost, DeliveryStatusID, MenuID, BookingID) values
(5, 20230203, 4, 800, 5, 1, 2);