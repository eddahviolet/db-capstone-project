-- Task 1: Create a virtual table to summarize data.
-- deleting a similarly named virtual table if it exists
drop view if exists OrdersView;
-- creating the virtual table with the required columns and filter of Quantity greater than 2
create view OrdersView as select OrderID, Quantity, TotalCost from Orders where Quantity > 2;

-- to display the content of the virtual table
select * from OrdersView;


-- Task 2: Use a JOIN statement to query data from multiple tables.
-- extract data from 4 tables on all customers with orders that cost more than 150,
-- sort the results to start with the lowest cost  
/* I included BookingID because my Customers table connects to the Orders table through the 
Bookings table */ 

select Customers.CustomerID, concat(Customers.CustomerFirstName,' ',
Customers.CustomerLastName) as CustomerName, Bookings.BookingID, Orders.OrderID, 
Orders.Totalcost, Menus.Cuisine, MenuItems.ItemName, MenuItems.ItemType from 
Customers inner join Bookings on Customers.CustomerID = Bookings.CustomerID inner join 
Orders on Bookings.BookingID = Orders.BookingID inner join 
Menus on Orders.MenuID = Menus.MenuID inner join
MenuItems on Menus.MenuItemID = MenuItems.MenuItemID
where Orders.TotalCost > 150 order by Orders.TotalCost asc;


-- Task 3: Create a SQL statement with a subquery.
/*find all menu items for which more than 2 orders have been placed by creating a subquery 
that lists the menu names from the menus table for any order quantity with more than 2.*/

/*I will target my column ItemNames that is similar to MenuNames and is in the MenuItems table to give 
the same results required by the task*/

select ItemName from MenuItems where MenuItemID = any ( select Quantity from Orders 
where Quantity > 2);
