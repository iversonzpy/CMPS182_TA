# CMPS182_TA
Some preparation for TAing CMPS182

Pengyang Zhou
- Lab Section: Wednesdays, 4:00 - 5:35 PM, BE-105
- Office hour: Wednesdays, 6 - 7 PM, BE-119

[Lab1](#lab-1)

[Lab2](#lab-2)

[Lab3](#lab-3)

[Lab4](#lab-4)

## Lab 1
### Goals
- Read Lab1 instructions (Lab1_S19.pdf) carefully. 
- Learn Command line, PostgreSQL, File operations, Gradiance.
### Command Line
- Windows/MacOS/Linux - CMD and Terminal
- Linux on Windows - Virtual Machines, like VMWare, Virtual Box, Linux on Window10.

- Common Unix/Linux Commands
http://genomewiki.ucsc.edu/genecats/index.php/UNIX_Commands

### Introduction to PostgreSQL

#### Connect to PostgreSQL
##### SSH to Unix Timeshare (Recommend)

```
ssh 'yourCruzID'@unix.ucsc.edu
```
After connected to unix.ucsc.edu, you can use psql to connect to PostgreSQL. Replace with your CurzId and password recieved in your email.
```
psql -h cmps182-db.lt.ucsc.edu -U 'yourCurzId'
```
Then, you will see:
```
-bash-4.2$ psql -h cmps182-db.lt.ucsc.edu -U yourCruzId
Password for user yourCruzId:
psql (10.7)
Type "help" for help.

yourCruzId=#
```

Useful PostgreSQL commands:
https://gist.github.com/Kartones/dd3ff5ec5ea238d4c546


##### Connect to PostgreSQL from local computers
Recommend operation systems: Linun/MacOS
Install PostgreSQL, tutorial can be found at https://www.postgresql.org/download/

Run command line from terminal
```
psql -h cmps182-db.lt.ucsc.edu -U 'yourCurzId'
```
##### change password
ALTER USER 'yourCurzId' WITH PASSWORD 'yourNewPassword';

##### Create your assignment file
On Unix timeshare, you can create a folder 'CMPS182', then step into CMPS182.
```
mkdir CMPS182
cd CMPS182
vim create.sql
```
Write your database commands in create.sql, for example
```
CREATE TABLE products (
 productID INT PRIMARY KEY,
 name VARCHAR(80),
 price DECIMAL(10,2),
 retailPrice DECIMAL(10,2) 
 ); 
```
What should we do for a primary key with multiple fields? See here: https://www.postgresql.org/docs/9.4/ddl-constraints.html

It is highly recommend adding those lines in the top of your script. Since every time you test your script, it creates a new schema and tables. If those are already existed, PostgreSQL will not execute your commands.
```
DROP SCHEMA Lab1 CASCADE;
CREATE SCHEMA Lab1;
```

Follow instruction on Piazza -> Resources -> General Resources -> CMPS182_S19_GeneralInformation.pdf

All commands for Lab1 can be found in the above file.

### Gradiance
Follow the gradiance instruction on CMPS182_S19_GeneralInformation.pdf


## Lab 2

See load_data_lab2_v1.sql

Common questions:

- Change SEARCH_PATH to Lab2. Logout then login. 
```ALTER ROLE username SET SEARCH_PATH to Lab2;```
- UNIQUE with composite attributes.
- Run SELECT queries inside psql.


-   Q1: \i load_data_lab2.sql drop tables.
-   Q2: DATE '2018-01-16'
-   Q3: self join for a table
-   Q4: GROUP BY not recommend for this lab
-   Q5: SELECT a, b, c FROM table t ORDER BY b desc, c asc.
-   Q6: c for Customers, st for Stores, s for Sales, pr for Products, p for Payments, and d for dayDates. 
-   Q7:  Day->Days


## Lab 3

7 script files need to be submitted.

### combine.sql

- (which should have multiple sql statements in it that are in a single Serializable transaction)

- Lecture 6 6_CMPS182_S19_SQL4.pdf

    START TRANSACTION or BEGIN TRANSACTION (can be implicit)

– Marks the beginning of a transaction, followed by one or more SQL statements.

- following your INSERT or UPDATE scripts.

- Serializable: 
```
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
```

- Example with table Movie: 
```
CREATE TABLE Studio (
    name CHAR(30), 
    address VARCHAR(255), 
    presCNo INT,
    PRIMARY KEY(name)
);
```
```
INSERT INTO Studio VALUES('Dreamworks', 'Mountain View, CA 94043', 100);

INSERT INTO Studio VALUES('Fox', '10201 West Pico Blvd. Los Angeles, CA 90064', 101);

INSERT INTO Studio VALUES('Universal', '100 Universal City Plaza, Universal City, CA 91608', 102);
```

```
SELECT * FROM Studio;
              name              |                      address                       | prescno
--------------------------------+----------------------------------------------------+---------
 Dreamworks                     | Mountain View, CA 94043                            |     100
 Fox                            | 10201 West Pico Blvd. Los Angeles, CA 90064        |     101
 Universal                      | 100 Universal City Plaza, Universal City, CA 91608 |     102
(3 rows)
```

```
DELETE FROM Studio WHERE name IS NOT NULL;
```
```
START TRANSACTION or BEGIN TRANSACTION;
```
Then, followed by one or more SQL
statements.

```
COMMIT or ROLLBACK;
```

### foriegn.sql
```
ALTER TABLE
```
### general.sql
- In Customers, if lastPaidDate is NULL then status must be ‘L’.

- Question is how to represent 'if p then q' as OR

- NOT p OR q by Truth Table


### unittest.sql
- INSERT or UPDATE

### createview.sql
```
CREATE VIEW
```

## Lab 4
#### Java Environment
- CLASSPATH
```
export CLASSPATH=path_to_folder/postgesql-42.2.5.sql
echo $CLASSPATH
```

For UNIX Timeshare, to make CLASSPATH effective parmamently. Create or append export statement to your .bash_profile or .bashrc. Run these commands:

```cd ~
vi .bash_profile
```
Change to INSERT mode, press i. Write the export export statement to your .bash_profile  file.

```
export CLASSPATH=your_own_path_to_folder/postgesql-42.2.5.jar:.
```
Save the file ESC then ```:wq```

```source .bash_profile```

Check your CLASSPATH: ```echo $CLASSPATH```

Exit and Login again to check your CLASSPATH has been changed.

**If .bash_profile doesn't work, replace it with .bashrc**


#### Lab4 Initialization
- Change search_path
- Import lab4_create.sql
- Import lab4_data_loading.sql

#### SQL Queries
- Read the assignment
- Write queries for each problem
- Combine your queries to your java class

#### Use JDBC
[PostgreSQL JDBC Guideline](https://jdbc.postgresql.org/documentation/head/intro.html)

- For getStoresThatSoldFewProducts(). [Chapter 5. Issuing a Query and Processing the Result](https://jdbc.postgresql.org/documentation/head/query.html)
- For updateManufacturer. [Performing Updates](https://jdbc.postgresql.org/documentation/head/update.html)
- For fixCustomerStatus(). [Chapter 6. Calling Stored Functions](https://jdbc.postgresql.org/documentation/head/callproc.html)


#### Stored Functions
As Section 4 mentioned, you should write a stored function called fixStatusFunction that has an integer parameters, lowCustomerID. 

- Declaring Function
```
CREATE FUNCTION sales_tax(real) RETURNS real AS $$
DECLARE
    subtotal ALIAS FOR $1;
BEGIN
    RETURN subtotal * 0.06;
END;
$$ LANGUAGE plpgsql;
```

- LOOP, IF-ELSE, CURSOR (See slides)

- Debug and Print
```
DECLARE
        someVarible INTEGER := 0;

raise notice 'someVarible Value: %', someVarible;
```