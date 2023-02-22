-- Task 1: Create a procedure called AddBooking 
/*It should include the following four input parameters booking id, customer id, booking date,table number*/
 --  deleting any produre with similar name if it exists
drop procedure if exists AddBooking;
-- syntax to create the AddBooking procedure
delimiter //
create procedure AddBooking(in booking_id int, in booking_date date, in table_number int, in customer_id int ) 
	begin 
    select BookingID into booking_id from Bookings where BookingID = booking_id;
    select BookingDate into booking_date from Bookings where BookingDate = booking_date;
    select TableNumber into table_number from Bookings where TableNumber = table_number;
    select CustomerID into customer_id from Bookings where CustomerID = customer_id;
    insert into Bookings (BookingID, BookingDate, TableNumber, BookingTime, CustomerID, StaffID) values
    (booking_id, booking_date, table_number, null, customer_id, 0);
    select ("New Booking Added") as Confirmation;
    end //
delimiter ;
-- calling the procedure by its name
call AddBooking (9,"2022-12-30", 4, 3);


-- Task 2: Create Procedure UpdateBooking
/*The procedure should be used to update existing bookings in the Bookings table and should have two input 
parameters in the form of booking id and booking date. */
 --  deleting any produre with similar name if it exists
drop procedure if exists UpdateBooking;
-- syntax to create the AddBooking procedure
-- I use the booking_id variable as the condition in the update statement while updating the BookingDate column
delimiter //
create procedure UpdateBooking (in booking_id int, in booking_date date) 
	begin
    select BookingID into booking_id from Bookings where BookingID = booking_id;
    select BookingDate into booking_date from Bookings where BookingDate = booking_date;
    update Bookings set  BookingDate = booking_date where BookingID = booking_id;
    select concat ("Booking ", booking_id, " updated") as Confirmation;
end //
delimiter ;
-- calling the procedure by its name
call UpdateBooking (9, "2022-12-20");


-- Task 3: Create Procedure CancelBooking
/*create a procedure that can be used to cancel or remove a booking. It should have one input parameter in the 
form of booking id*/
--  deleting any produre with similar name if it exists
drop procedure if exists CancelBooking;
-- syntax to create the AddBooking procedure
delimiter //
create procedure CancelBooking(in booking_id int) 
	begin 
    select BookingID into booking_id from Bookings where BookingID = booking_id;
    delete from Bookings where BookingID = booking_id;
    select concat("Booking ", booking_id, " cancelled") as Confirmation;
end //
delimiter ;

-- calling the procedure by its name
call CancelBooking (7);