use LittleLemonDB;

/* populating my tables in the new db starting with the ones without foreign keys then the relating table 
with the connecting foreign key*/
-- adding self generated data into MenuItems table
insert into MenuItems (MenuItemID, ItemName, ItemType, Price) values
(1,'Mahamri','Starters',50),
(2,'Mandazi','Starters', 50),
(3, 'Pilipili soup', 'Starters', 100),
(4, 'Samosa','Starters', 150),
(5, 'Plantain', 'Starters', 200),
(6, 'Mutura', 'Starters', 75),
(7, 'Nyama Choma', 'Main Courses', 400),
(8, 'Madondo', 'Main Courses', 100),
(9, 'Githeri', 'Main Courses', 90),
(10, 'Mala','Desserts', 30),
(11, 'Ice cream', 'Desserts', 100),
(12, 'kitumbua', 'Desserts', 45),
(13, 'Busaa', 'Drinks', 250),
(14, 'Muratina', 'Drinks', 250),
(15, 'Kenyan Coffee', 'Beverage', 80),
(16, 'Masala Tea', 'Beverage', 70),
(17, 'Ugali', 'Main Courses', 60);

-- adding self generated data into Menus table
insert into Menus (MenuID, Cuisine, MenuItemID) values
(1,'Swahili', 1), 
(1, 'Swahili',2), 
(1, 'Swahili',12), 
(1, 'Swahili', 3), 
(2, 'Central Kenyan', 14), 
(2, 'Central Kenyan', 9), 
(2, 'Central Kenyan', 8), 
(2, 'Central Kenyan', 6), 
(3, 'Western Kenyan' ,5), 
(3, 'Western Kenyan',13), 
(3, 'Western Kenyan',17), 
(3, 'Western Kenyan',10 );

-- adding self generated data into Customers table
insert into Customers (CustomerID, CustomerFirstName, CustomerLastName, PhoneNumber, CustomerEmail) values
(1, 'John', 'Maina', 0725738177, 'johnmaina@gmail.com'),
(2, 'Kane', 'Shikwekwe', 0725568178, 'kaneshikwekwe@gmail.com'),
(3, 'Alice', 'Kwamboka', 0733738177, 'alicekwamboka@gmail.com'),
(4, 'Naserian', 'Mkuba', 0712738177, 'naserianmkuba@yahoo.com'),
(5, 'Mwangi', 'Kinyajui', 072599122, 'mwangikinyanjuia@gmail.com'),
(6, 'Munene', 'Wairimu', 0729088170, 'munenewairimu@gmail.com'),
(7, 'Nkirote', 'Kiunga', 0711908177, 'nkirotekiunga@gmail.com'),
(8, 'Salome', 'Mwiti', 0727898177, 'sallymwiti@hotmail.com'),
(9, 'Lucy', 'Anyango', 0724738177, 'lucyanyango@gmail.com'),
(10, 'Dida', 'Abduba', 0733898177, 'didaabduba@gmail.com');

-- adding self generated data into StaffAddress table
insert into StaffAddress (StaffAddressID, PhoneNumber, Email, Street, Zipcode, 
County, Province) values
(1, 0733242424, 'railaodinga@gmail.com', 'karen road', 00623, 'Nairobi', 'Nairobi'),
(2, 0748323444, 'willianruto@gmail.com', 'state house road', 00200, 'Nairobi', 'Nairobi'),
(3, 0798234487, 'uhurukenyatta@aol.com', 'gatundu road', 00900 ,'Kiambu', 'Central'),
(4, 0768839987, 'rigathigachagua@hotmail.com', 'michezo road', 10100, 'Nyeri', 'Central'),
(5, 0734559768, 'marthakarua@gmail.com', 'kutus road', 10314, 'Kirinyaga', 'Central'),
(6, 0739297392, 'moseswetangula@hotmail.com', 'kimilili road', 50200,'Bungoma', 'Western'),
(7, 0769935367, 'mikembuvi@yahoo.com', 'muthetheni road', 90100, 'Machakos', 'Eastern');

-- adding self generated data into Staff table
insert into Staff (StaffID, StaffFullName, StaffRole, AnnualSalary, StaffAddressID) values
(1, 'William Ruto', 'Chef', 250000, 2),
(2, 'Uhuru Kenyatta', 'Waiter', 120000, 3),
(3, 'Rigathi Gachagua','Waiter', 120000, 4),
(4, 'Martha Karua', 'Waiter', 120000, 5),
(5, 'Moses Wetangula', 'Waiter', 120000.00, 6),
(6, 'Raila Odinga', 'Manager', 180000.00,1),
(7, 'Mike Mbuvi', 'Cleaner', 70000, 7);

-- adding self generated data into DeliveryAddress table
insert into DeliveryAddress (DeliveryAddressID, Street, Zipcode, County, Province)
values
(1, 'Moi Avenue', 00100, 'Nairobi', 'Nairobi'),
(2, 'Muindi Mbingu', 00100, 'Nairobi', 'Nairobi'),
(3, 'Tom Mboya Streeet',  00100, 'Nairobi', 'Nairobi'),
(4, 'Mokta Dada Street', 00100, 'Nairobi', 'Nairobi'),
(5, 'Haileselasie Avenue', 00505, 'Nairobi', 'Nairobi'),
(6, 'Luthuli Avenue', 00200, 'Nairobi', 'Nairobi'),
(7, 'Koinange Street', 00100, 'Nairobi', 'Nairobi');

-- adding self generated data into OrdeDeliveryStatus table
insert into OrderDeliveryStatus (DeliveryStatusID, DeliveryStatus, DeliveryDate, DeliveryComment, 
DeliveryAddressID) values
(1, 'Delivered', 20230201, 'okay', 1),
(2, 'Rejected', 20230124, 'boda guy ate my order',2),
(3, 'In Transit', 20230115, ' ',3),
(4, 'Delivered' ,20230212, 'yummy', 4),
(5, 'In Transit', 20230216, ' ',5);

-- adding data from the table booking exercise to the Bookings table
insert into Bookings (BookingID, BookingDate, TableNumber, BookingTime, CustomerID, StaffID) values
(1, 20221010, 5, '20:00:00' ,1, 3),
(2, 20221112, 3, '19:00:00', 3, 5),
(3, 20221011, 2, '21:00:00', 2, 4),
(4, 20221013, 2, '18:00:00', 1, 6);

-- adding self generated data into Orders table
insert into Orders (OrderID, OrderDate, Quantity, TotalCost, DeliveryStatusID, MenuID, BookingID) values
(1, 20230202, 2, 200, 2, 2, 1),
(2, 20230201, 3, 400, 1, 3, 3),
(3, 20230130, 1, 80, 4, 1, 4),
(4, 20230117, 5, 1000, 3, 2, 1),
(5, 20230203, 4, 800, 5, 1, 2);

