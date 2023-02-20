setting up repository for project

**Welcome!! This readme is a complete step by step summary of my project from beginning to end along with my thought process. To organise my files and make it easier for you to understand me, I have labelled them in weeks. Since the project was presented in weeks, I have used that to organise the files which are the .sql with the queries and the images with the results. I have labelled the images with the results from the queries chronologically as they were presented in the exercises. For instance, Week 2a Ordersview is the result of the first task in week 2, 2b is the second task in week 2 and so on and so forth till Week 3. Enjoy!!**

## Week 1: Project Info
#### Setting up the repository
The very first task was setting up a repository (which is this one) name it db-capstone-project and initialise it in a similarly named folder in your computer

Create a readme.md file and write the message "setting up repository for project"

Commit the changes with a meaningful message

![git 1](https://user-images.githubusercontent.com/106580846/220122343-1c11e91c-4a64-4fcb-99a9-214e14d308d1.png)
![git 2](https://user-images.githubusercontent.com/106580846/220122209-82803814-0d63-428c-a781-601b7a3843ad.png)

###### My steps:
* used touch command to create the readme.md file
* nano command to open the file and edit
* cat command to show content of file

 #### Set up the MySQL instance server in MySQL Workbench Scenario 
 Create a new user in your MySQL database. 

* Log in to the MySQL Server using the root user.
*	Select Administration tab from the Navigator section.
*	Select Add account. 
*	Provide a meaningful username and a strong password.
*	Grant the new user the right to perform all tasks.

My new user is **“eddah”**

Create a new MySQL connection. 
*	In the MySQL Workbench home screen, select MySQL connection tab. 
*	Select the plus icon to open the Setup New Connection form. 
*	Fill in the form to create a new server instance. 
*	Click the Test Connection button to check that the settings work as required. 

My new connection is called **"ColourDB"**
![instance](https://user-images.githubusercontent.com/106580846/220122300-173fac31-56e5-4d1b-9efc-f39a163095a0.png)

#### Create an ER diagram data model and implement it in MySQL
Little Lemon needs to build a robust relational database system in MySQL in which they can store large amounts of data. They then need to easily manage and find this data as required. This database system should maintain information about the following aspects of the business:  
*	Bookings
*	Orders
*	Order delivery status
*	Menu
*	Customer details
*	Staff information

Create a normalized ER diagram (that adheres to 1NF, 2NF and 3NF) with relevant relationships to meet the data requirements of Little Lemon

I first created a conceptual model using draw.io to understand how the tables will relate to each other. Some customers and staff could have multiple addresses, to apply data atomicity I created Addresses tables for both and relate them to the respective tables.

![LittleLemon Conceptual Model drawio](https://user-images.githubusercontent.com/106580846/220125229-c49fee58-fc28-404d-819a-7bb7d04995b1.png)

Then created the ER diagram

![LittleLemonDM](https://user-images.githubusercontent.com/106580846/220124784-862769a0-eb7a-48d9-95cf-ae08f84391a7.png)

**Implementing the Little Lemon data model inside your MySQL server using the forward engineer method**

I used the Database tab to start the forward engineering process, followed the subseqent steps and this is the script that was generated to create the LittleLemon database

*its too long to paste it all here, its in the files labelled as "LitleLemonDB Script to forward engineer.sql"*

![fw](https://user-images.githubusercontent.com/106580846/220127139-02204671-7411-4adf-b654-fb2d5ebef381.png)

## Week 2 Database Queries, Procedures and Prepared Statements
#### Adding Sales Report
##### Create a virtual table to summarize data
Little Lemon needs to retrieve data from their database, to create some reports on the orders placed in the restaurant.
##### Task 1:	Create a virtual table to summarize data.
Create a virtual table called OrdersView that focuses on OrderID, Quantity and Cost columns within the Orders table for all orders with a quantity greater than 2. 
Steps:
*	Use a CREATE VIEW statement.
*	Extract the order id, quantity and cost data from the Orders table.
*	Filter data from the orders table based on orders with a quantity greater than 2. 
*	Query the OrdersView table to display the output

![Week 2a Ordersview](https://user-images.githubusercontent.com/106580846/220128905-b8edb8b8-0289-49c1-9da6-c9ce9a98d54b.png)

##### Task 2:	Use a JOIN statement to query data from multiple tables.
Little Lemon needs information from four tables on all customers with orders that cost more than $150. Extract the required information from each of the following tables by using the relevant JOIN and the result set should be sorted by the lowest cost amount.
•	Customers table: The customer id and full name.
•	Orders table: The order id and cost.
•	Menus table: The menus name.
•	MenusItems table: course name and starter name.

**I included BookingID because my Customers table connects to the Orders table through the Bookings table**

![Week 2b Multiple Joins](https://user-images.githubusercontent.com/106580846/220129180-31a47550-2073-4a21-a4a7-37940534bdd2.png)

##### Task 3: Create a SQL statement with a subquery.
Little Lemon needs you to find all menu items for which more than 2 orders have been placed. Carry out this task by creating a subquery that lists the menu names from the menus table for any order quantity with more than 2.
*	Use the ANY operator in a subquery
*	The outer query should be used to select the menu name from the menus table.
*	The inner query should check if any item quantity in the order table is more than 2. 

![Week 2c Subquery](https://user-images.githubusercontent.com/106580846/220129404-2ffef2a5-ff14-4e68-b8a8-92f4abc9304e.png)

##### Create Optimized Queries to Manage and Analyze Data

##### Task 1: Create Procedure GetMaxQuantity
Little Lemon need you to create a procedure that displays the maximum ordered quantity in the Orders table.  This will allow Little Lemon to reuse the logic implemented in the procedure easily without retyping the same code over again and again to check the maximum quantity. 

Call the procedure GetMaxQuantity 

![Week 2d GetMaxQuantity Procedure](https://user-images.githubusercontent.com/106580846/220130262-0f846de8-385c-4465-8cba-519dce762e4d.png)

##### Task 2: Create Prepared Statement GetOrderDetail
Little Lemon need you to help them to create a prepared statement called GetOrderDetail. This prepared statement will help to reduce the parsing time of queries. It will also help to secure the database from SQL injections.
*	The prepared statement should accept one input argument, the CustomerID value, from a variable. 
*	The statement should return the order id, the quantity and the order cost from the Orders table. 
*	Create a variable called id and assign it value of 1. 
*	Execute the GetOrderDetail prepared statement 

![Week 2e GetOrderDetail Prepared Statement](https://user-images.githubusercontent.com/106580846/220130605-74226511-6af9-46df-862e-aa3450c4f138.png)

##### Task 3: Create Procedure CancelOrder
Create a stored procedure called CancelOrder. Little Lemon want to use this stored procedure to delete an order record based on the user input of the order id.

Creating this procedure will allow Little Lemon to cancel any order by specifying the order id value in the procedure parameter without typing the entire SQL delete statement.   

![Week 2f CancelOrder Procedure](https://user-images.githubusercontent.com/106580846/220130956-92a6d5f2-d5c6-46ce-adfc-a4b5c8f0ca59.png)

#### Table Booking System
##### Create SQL queries to check available bookings based on user input
##### Task 1: Populating Bookings table
Little Lemon wants to populate the Bookings table of their database with some records of data. Your first task is to replicate the list of records in the following table by adding them to the Little Lemon booking table. 
*	Use simple INSERT statements to complete this task.
*	Your output must resemble the following screenshot:

![image](https://user-images.githubusercontent.com/106580846/220131459-71da2bc3-11c2-4ddf-adc1-2bd368cc21be.png)

![Bookings Table](https://user-images.githubusercontent.com/106580846/220131542-67de8486-2020-4c65-b9fb-fca867871f82.png)

##### Task 2: Create Procedure CheckBooking
Little Lemon need you to create a stored procedure called CheckBooking to check whether a table in the restaurant is already booked.
The procedure should have two input parameters in the form of booking date and table number. Create a variable in the procedure to check the status of each table.

![CheckBooking](https://user-images.githubusercontent.com/106580846/220133093-d859f6e3-2ebc-461a-992e-0a74e5eba248.png)



