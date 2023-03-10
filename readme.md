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

**Populating Tables**
I populated my tables with self generated data, using Kenyan names, Kenyan Foods and Cuisines, the full script is in the files saved as "Popoltaing tables in LittleLemonDB"

![pop](https://user-images.githubusercontent.com/106580846/220350533-0c68889c-d441-4270-bb2c-bcc73dff0f9e.png)

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

**I will target my column ItemNames that is similar to MenuNames and is in the MenuItems table to give the same results required by the task**

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

**I will use BookingID instead of customerID since that is the foreign key in my Orders table**

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

**My table has an extra column a StaffID, a foreign key to link it to the Staff table**

![Bookings Table](https://user-images.githubusercontent.com/106580846/220350848-b42e884a-5cbf-4e9e-9688-2c747dac2754.png)


##### Task 2: Create Procedure CheckBooking
Little Lemon need you to create a stored procedure called CheckBooking to check whether a table in the restaurant is already booked.
The procedure should have two input parameters in the form of booking date and table number. Create a variable in the procedure to check the status of each table.

**I decided to alter the table removing the not null constraint on the booking time column, the StaffID and CustomerID being foreign keys, I maintained the not null constraint and use a value of zero for the insert statement.**

**BookingID column is on auto increment so you don’t have to list it in the columns for the insert statement**

![CheckBooking](https://user-images.githubusercontent.com/106580846/220133093-d859f6e3-2ebc-461a-992e-0a74e5eba248.png)

##### Task 3: Create a Procedure called AddValidBooking
Little Lemon need to verify a booking, and decline any reservations for tables that are already booked under another name. To implementing this they require a stored procedure and a transaction.
Create a new procedure called AddValidBooking that must use a transaction statement to perform a rollback if a customer reserves a table that’s already booked under another name.  
*	The procedure should include two input parameters in the form of booking date and table number.
*	It also requires at least one variable and should begin with a START TRANSACTION statement.
*	Your INSERT statement must add a new booking record using the input parameter's values.
*	Use an IF ELSE statement to check if a table is already booked on the given date. 
*	If the table is already booked, then rollback the transaction. If the table is available, then commit the transaction

**I used LIMIT 1 in my select into statements to limit the result set to a single row because I kept getting “Error Code: 1172 results consisted of more than 1 row”**

![Week 2i AddValidBooking Procedure](https://user-images.githubusercontent.com/106580846/220607217-bd7cc7c0-ae8c-4bdb-8758-80b3af39b50f.png)

##### Create SQL queries to add and update bookings
Little Lemon needs help with managing their bookings. They need you to create stored procedures that they can invoke as required to add, update and delete bookings in their database
##### Task 1: Create a procedure called AddBooking
Create a new procedure called AddBooking to add a new table booking record. The procedure should include four input parameters in the form of the following bookings parameters:
*	booking id
*	customer id 
*	booking date
*	table number

**My booking table has a StaffID column I will not include it in the variables but have it in the insert statement with a value of 0, the booking record can be updated later with StaffID of the assigned staff.**

![AddBooking](https://user-images.githubusercontent.com/106580846/220352148-2fac3770-e971-4892-ae18-9fb3d0d2a31c.png)

##### Task 2: Create a Procedure called UpdateBooking
Create a new procedure called UpdateBooking that can be used to update existing bookings in the Bookings table. The procedure should have two input parameters in the form of booking id and booking date. You must also include an UPDATE statement inside the procedure. 

**I use the booking id variable as the condition in the update statement and updating the BookingDate column**
![UpdateBooking](https://user-images.githubusercontent.com/106580846/220352340-e42b787c-5b8c-4869-9015-331c534b8d69.png)

##### Task 3: Create Procedure called CancelBooking
Little Lemon need you to create a procedure called CancelBooking that they can use to cancel or remove a booking. The procedure should have one input parameter in the form of booking id. Write a DELETE statement inside the procedure. 
![CancelBooking](https://user-images.githubusercontent.com/106580846/220352632-22cab2dd-e08a-4515-87f0-9f0067f8977d.png)

## Week 3: Clients & Visualistaion
#### Data Visualisation
##### Set up the Tableau Workspace for data analysis

Little Lemon have an Excel sheet file with thousands of records of data on orders made between 2019 and 2023. They want to analyze the sales data to examine how they can increase their profits. prepare the existing data before analyzing it.   
##### Task 1: Filtering
Connect to Little Lemon data stored in the Excel Sheet called LittleLemonDB. Then filter data in the data source page and select the United States as the country.
###### Steps:
* In the Connection Pane select Excel, then navigate to the data source which I saved as LittleLemonData
* On the data source page, I selected Add Filter, selected field as “country”, in the general tab of the filter pop up, I selected from list the checked “United states” then Okayed everything

This is how the Country Field looked like before applying the filter

![Week 3a Before Filter](https://user-images.githubusercontent.com/106580846/220893605-75a05b39-28a2-4409-a4cb-c6ef9be5a475.png)

This is how the Country Field looked like after applying the filter

![Week 3a After Filter](https://user-images.githubusercontent.com/106580846/220893503-b139a5c4-38b6-4f4e-9f61-92d8288c2fc7.png)

##### Task 2: Split Column
Create two new data fields called First Name and Last Name. Related values should be extracted from the Full Name field.

###### Steps
* Locate the spit feature found in the downward arrow at the top of the customer Names column
* Select Split
* Rename the two new columns “Customer First name” and “Customer Last Name”
* Hide the column with the full names

![Week 3b Before Split](https://user-images.githubusercontent.com/106580846/220894139-fd99875d-5006-4c21-a34a-35bf3ae5d502.png)


![Week 3b After Split](https://user-images.githubusercontent.com/106580846/220894144-6cfc17a9-1acf-4e29-a78a-55affa31e888.png)

##### Task 3: Calculated Field
Create a new data field that stores the profits for each sale, or order as shown in the screenshot below.
###### Steps:
* I select calculated field from down arrow in the Sales column
* Name the calculated field “Profit”
* Write a formula that deducts Cost from Sales. 

The Calculated field
![Week 3c Calculated Field](https://user-images.githubusercontent.com/106580846/220894451-1addc92e-7b77-4840-8c4e-887b3ebabe00.png)

The new field "Profit"
![Week 3c Profit Field](https://user-images.githubusercontent.com/106580846/220894496-62dac426-c820-4e22-adf2-7dfa8a1e99d0.png)

##### Create interactive dashboard for sales and profits
Little Lemon need you to create visual charts to help them understand their business performance, so they can increase their sales and profits.
##### Task 1: Bar Chart
Create a bar chart that shows customers sales and filter data based on sales with at least $70.
###### My steps:
* Drag “Customer Name” field to the Columns shelf
* Drag “Sales” field to the Rows shelf
* Drag  “Customer Name” to the Colour marker to make the bar differently coloured
* From the down arrow on the “Sales” Filed in the Rows Shelf Filter “Sales” to “At Least 70”
* On the chart, sort sales in descending order 
* Drag Customer name and Sales field to the Detail marker
* Name the chart Customers sales

If you roll over a bar, the customer names and sale figures will be displayed 

Here is a link to the Sales Bar chart on Tableau Public https://public.tableau.com/views/CustomerSalesLittleLemon/Customerssales?:language=en-US&publish=yes&:display_count=n&:origin=viz_share_link

![Week 3d Customer Sales Bar Chart](https://user-images.githubusercontent.com/106580846/220898677-781ccd22-8254-44a8-8a65-010b447f8f75.png)

##### Task 2: Line Chart
Create a line chart to show the sales trend from 2019 to 2022. 
###### My Steps:
*	Drag the “Order Date” field to the Columns shelf
*	Drag the “Profit” field to the Rows shelf
*	Drag the “Order Date” field to the colour marker to give the line in the chart colour variations for each year
*	From the down arrow on the “Order Date” field in the columns shelf, on the general tab, filter the years to exclude 2023, by unchecking 2023 in the list provided
*	Name the chart Profit chart.

Here is a link to the Profit Line chart on Tableau Public https://public.tableau.com/views/ProfitChartLittleLemon/ProfitChart?:language=en-US&publish=yes&:display_count=n&:origin=viz_share_link

![Week 3e Profit Line Chart](https://user-images.githubusercontent.com/106580846/220901420-645e97f0-614c-4b65-8c02-7778eb5be1bd.png)

##### Task 3: Bubble Chart
Create a Bubble chart of sales for all customers. The chart should show the names of all customers. Once you roll over a bubble, the chart should show the name, profit and sale.
###### My steps:
*	Drag the “Customer Name” field to the Column shelf
*	Drag “Sales” to the rows shelf
*	Select Packed bubbles from the “Show me” drop down
*	Drag “Customer Name” to the colour marker to colour the bubbles differently
*	Drag “Customer Name” to the label marker so that each bubble bears the name of the customer it represents
*	Drag “Profit” field to the detail marker to display profit (along with customer name and Sales) when you hover on a bubble
*	Name the chart Sales Bubble Chart.

Here is a link to the Sales Bubble chart on Tableau Public https://public.tableau.com/views/SalesBubbleChartLittleLemon/SalesBubbleChart?:language=en-US&publish=yes&:display_count=n&:origin=viz_share_link

![bubble](https://user-images.githubusercontent.com/106580846/220904712-e460c9d8-bbf0-47f0-9aac-f7aac4ffe437.png)

**FYI only reason I can think of why the Customer Names did not appear in all the bubbles is; I am using an old version of Tableau, the 2019 one**

##### Task 4: Task 4: Side-by-side Bars
Compare the sales of the three different cuisines sold at Little Lemon. Create a Bar chart that shows the sales of the Turkish, Italian and Greek cuisines.
Display sales data for 2020, 2021, and 2022 only. Each bar should display the profit of each cuisine. Sort data in descending order by the sum of the sale.
###### My steps:
*	Drag “Cuisine Name” field to the Columns shelf
*	Drag “Sales” field to the rows shelf
*	Drag “Order Date” field on the column shelf next to “Cuisine Name”
* Select side by side bars from Show me drop down menu
*	From the down arrow on the “Order Date” field in the columns shelf, on the general tab, filter the years to exclude 2023 and 2019, by unchecking them both in the list provided
*	Drag “Profit” field to the label marker so that it appears on top of each bar
*	Drag “Order Date” field to the colour marker so that bars are coloured differently according to years
*	Sort the Sales axis descending by sum of sales within order date
*	Name the worksheet Cuisine Sales and Profits.

Here is a link to the Cuisine Sales and Profits Side-by-side Bar chart on Tableau Public https://public.tableau.com/views/CuisineSalesandProfitsChartLittleLemon/CuisineSalesandProfits?:language=en-US&publish=yes&:display_count=n&:origin=viz_share_link

![bar](https://user-images.githubusercontent.com/106580846/220909190-eadd9b4a-373d-4511-8314-b9e3389f6d8c.png)

##### Task 5: Interactive Dashboard
Create an interactive dashboard that combines the Bar chart called Customers sales and the Sales Bubble Chart. Once you click a bar, and roll over the related bubble, the name, sales and profit figures should be displayed in the Bubble chart.

###### My Steps:
*	Start a new dashboard by clicking the dashboard icon with the plus sign
*	From the sheets pane drag the “Customer sales” sheet to the dashboard
*	I used a tiled dashboard because there only two sheets so easy to arrange
*	Then drag the “Sales bubble chart’ sheet into the dashboard below the “Customer sales” sheet
*	Remove the legends of both sheets from the dash board by clicking the X in the legends
*	Check the show dashboard title check box and name the dashboard “Sales DashBoard”
*	Use the filter on the “Customer sales bar chart” 

Here is a link to the interactive Dashboard on Tableau Public https://public.tableau.com/views/CustomerSalesDashboardLittleLemon/CustomerSalesSalesBubbleDashboard?:language=en-US&publish=yes&:display_count=n&:origin=viz_share_link

![Week 3h Interactive DashBoard](https://user-images.githubusercontent.com/106580846/220918957-a8d3ba94-ffa8-4cf5-a4bd-83b21a3aaa19.png)

#### Database Client
##### Set up the client project
##### Task 1
Navigate to your terminal and ensure that Python is installed and available on the command path. 
![python instaled](https://user-images.githubusercontent.com/106580846/221126785-4f64f2d3-fd51-447d-8804-f901abc7468d.png)
##### Task 2

Install Jupyter 

![install jupter](https://user-images.githubusercontent.com/106580846/221126995-2125038d-0853-48a4-b3c4-4efb218e789d.png)

Open a notebook 

![open notebook](https://user-images.githubusercontent.com/106580846/221127126-3e996a63-fe7c-4ec0-a6a8-3db009e75fc7.png)

Create a new notebook for writing your code 

![new notebook](https://user-images.githubusercontent.com/106580846/221127225-25494d90-0cf7-4816-96f0-3623db31eb7b.png)

##### Task 3
Establish a connection between Python and your database 
###### Steps
* Ensure that mysql-connector is installed by running the command:
* Import the connector under the alias connector
* Verify that a connection can be made with your database by calling the connection method from the connector class:  connection = connector.connect (user = "user_name", password = "password")

![making connection](https://user-images.githubusercontent.com/106580846/221128339-30deef1e-3abe-4eaf-8868-b5abdc8e0140.png)

#### Add query functions
An integral part of a well-functioning system is the ability to query data. Little Lemon need you to help them add the search functionality required to query their data. 

##### Task 1: Make connection & create Cursor object
Connect with your database and interact with the data it holds. 

Import the connector module, enter your user details and connect with the database such as

**connection = connector.connect(user = "your_username", password = "your_password", db = "database_name")
Instantiate an instance of cursor to pass queries and return results**

![cursor object](https://user-images.githubusercontent.com/106580846/221130611-b7826ea2-ade4-4f8e-9b6e-142b10498576.png)

##### Task 2: show tables
Query the database to show all tables within the database. 
**Ordersview is a virtual table, I originally have 9 tables in my database**

![tables show](https://user-images.githubusercontent.com/106580846/221131073-6d644d09-2dce-4956-96bb-49140127f4ab.png)

##### Task 3: Query with table JOIN
Little Lemon need you to return specific details from your database. They require the full name and contact details for every customer that has placed an order greater than $60 for a promotional campaign. 

**I will add BookingID to the query because my Customers table connects to the Orders table through the Bookings table**

**I use the cast() function in my query to convert the output of TotalCost column which is decimal to char datatype**

![join q](https://user-images.githubusercontent.com/106580846/221132231-607fbc55-f723-491e-9307-14c373481d90.png)


