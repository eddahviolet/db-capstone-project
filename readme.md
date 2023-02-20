setting up repository for project

**Welcome!! This readme is a complete step by step summary of my project from beginning to end along with my thought process. To organise my files and make it easier for you to understand me, I have labelled them in weeks. Since the project was presented in weeks, I have used that to organise the files which are the .sql with the queries and the images with the results. I have labelled the images with the results from the queries chronologically as they were presented in the exercises. For instance, Week 2a Ordersview is the result of the first task in week 2, 2b is the second task in week 2 and so on and so forth till Week 3. Enjoy!!**

## Week 1: Setting up the Project
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
