-- Task 1: Inserting data into Bookings Table
/*populate the Bookings table of their database with some records of data and
 dispalying the data*/

/*inserting data to Bookings table. My table has an extra column a StaffID a foreign key to link it to the Staff table*/
insert into Bookings (BookingID, BookingDate, TableNumber, BookingTime, CustomerID, StaffID)
values
(1, 20221010, 5, '20:00:00' ,1, 3),
(2, 20221112, 3, '19:00:00', 3, 5),
(3, 20221011, 2, '21:00:00', 2, 4),
(4, 20221013, 2, '18:00:00', 1, 6);

-- displaying data from Bookings table
select * from Bookings;


-- Task 2
/*create a stored procedure called CheckBooking to check whether a table in the restaurant is already booked,
the procedure should have two input parameters in the form of booking date and table number. Create a variable in
 the procedure to check the status of each table */
 --  deleting any produre with similar name if it exists
 drop procedure if exists CheckBooking;
 -- syntax to create the procedure
delimiter //
create procedure CheckBooking(in booking_date date, in table_number int ) 
	begin 
    select BookingDate into booking_date from Bookings where BookingDate = booking_date;
    select TableNumber into table_number from Bookings where TableNumber = table_number;
    insert into Bookings (BookingDate, TableNumber, BookingTime, CustomerID, StaffID) values
    (booking_date, table_number, null, 0,0);
    if table_number = null then select concat ("Table ", table_number, " is available") as BookingStatus;
    else select concat ("Table ", table_number, " is already Booked") as BookingStatus;
	end if;	
end//
delimiter ;
-- calling the procedure by its name
call CheckBooking("2022-10-11", 3);


-- Task 3
/*create a procedure called AddValidBooking that must use a transaction statement to perform
 a rollback if a customer reserves a table that’s already booked under another name. */
 --  deleting any produre with similar name if it exists
 drop procedure if exists AddValidBooking;
 -- syntax to create the procedure
 /*I used LIMIT 1 in my select into statements to limit the result set to a single row because 
 I kept getting “Error Code: 1172 results consisted of more than 1 row” */
 delimiter //
 create procedure AddValidBooking (in booking_date date, in table_number int ) 
 begin
 set autocommit = 0;
 start transaction;
 select BookingDate into booking_date from Bookings where BookingDate = booking_date limit 1;
 select TableNumber into table_number from Bookings where TableNumber = table_number limit 1;
 insert into Bookings (BookingID, BookingDate, TableNumber, BookingTime, CustomerID, StaffID) values
    (null,booking_date, table_number, null, 0,0);
    if table_number = null then commit; select concat ("Table ", table_number, " is available - booking confirmed") as
    BookingStatus;
    else rollback;
    select concat ("Table ", table_number, " is already Booked - booking cancelled") as BookingStatus;
    end if;
 end //
 delimiter ;
call AddValidBooking ("2023-1-13", 2);