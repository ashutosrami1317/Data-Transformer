# Data Transformer SQL Database

## Overview

The **Data Transformer** project is a simple SQL database designed to demonstrate the creation and management of relational database tables for customers, orders, and employees. It includes table creation scripts, primary and foreign key relationships, and sample data insertion.

## Database Name

```sql
DataTransfromer
```

> **Note:** The database name in the SQL file is spelled **DataTransfromer**. If this is unintentional, you may want to rename it to **DataTransformer**.

## Features

* Creates a relational database.
* Stores customer information.
* Tracks customer orders.
* Maintains employee records.
* Demonstrates the use of:

  * Primary Keys
  * Foreign Keys
  * Data Types
  * Sample Data Inserts

## Database Structure

### Customers Table

Stores customer information.

| Column           | Data Type         |
| ---------------- | ----------------- |
| CustomersID      | INT (Primary Key) |
| FristName        | VARCHAR(50)       |
| LastName         | VARCHAR(50)       |
| Email            | VARCHAR(100)      |
| RegistrationData | DATE              |

### Orders Table

Stores customer orders.

| Column      | Data Type         |
| ----------- | ----------------- |
| OrderID     | INT (Primary Key) |
| CustomersID | INT (Foreign Key) |
| OrderDate   | DATE              |
| TotalAmount | DECIMAL(10,2)     |

Relationship:

```
Customers
     |
     | CustomersID
     |
Orders
```

### Employees Table

Stores employee records.

| Column     | Data Type         |
| ---------- | ----------------- |
| EmployeeID | INT (Primary Key) |
| FristName  | VARCHAR(50)       |
| LastName   | VARCHAR(50)       |
| Department | VARCHAR(50)       |
| HireDate   | DATE              |
| Salary     | DECIMAL(10,2)     |

## Sample Data

The project contains sample records for:

* 2 Customers
* 2 Orders
* 2 Employees

## How to Run

1. Open your SQL client (MySQL Workbench, phpMyAdmin, or another MySQL-compatible tool).
2. Open the `INDEX.SQL` file.
3. Execute the script.
4. The database, tables, and sample data will be created automatically.

## Example Queries

Display all customers:

```sql
SELECT * FROM Customers;
```

Display all orders:

```sql
SELECT * FROM Orders;
```

Display all employees:

```sql
SELECT * FROM Employees;
```

Join customers with their orders:

```sql
SELECT
    Customers.FristName,
    Customers.LastName,
    Orders.OrderID,
    Orders.TotalAmount
FROM Customers
JOIN Orders
ON Customers.CustomersID = Orders.CustomersID;
```

## Technologies Used

* SQL
* MySQL

## Project Purpose

This project is intended for learning and practicing SQL concepts such as:

* Database creation
* Table creation
* Relationships
* Data insertion
* Basic SQL queries

##
