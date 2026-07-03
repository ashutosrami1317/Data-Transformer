========== Data Transfromer ==========

CREATE DATABASE DataTransfromer;

USE DataTransfromer;

CREATE TABLE Customers (
    CustomersID INT PRIMARY KEY,
    FristName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    RegistrationData DATE

);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomersID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomersID) REFERENCES Customers(CustomersID)

);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FristName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(10, 2)
);

INSERT INTO Customers VALUES
(1, "John", "Doe","john.doe@email.com","2022-03-15"),
(2, "Jane", "Smith", "jane.smith@email", "2022-11-02");

INSERT INTO Orders VALUES
(101,1,"2023-07-01",150.50),
(102,2,"2023-07-03",200.75);


INSERT INTO Employees VALUES
(1,"Mark","Johnson","Sales","2020-01-15",50000.00),
(2,"Susan","Lee","HR","2021-03-20",55000.00);

====== INNER JOIN =======

SELECT
o.OrderID,
c.CustomersID,
c.FristName,
c.LastName,
o.OrderDate,
o.TotalAmount
FROM Customers c
INNER JOIN Orders O
ON c.CustomersID=o.CustomersID;

====== LEFT JOIN ========

SELECT
c.CustomersID,
c.FristName,
c.LastName,
o.OrderID,
o.OrderDate,
o.TotalAmount
FROM Customers c
LEFT JOIN Orders o
ON c.CustomersID=o.CustomersID;


===== RIGHT JOIN ========

SELECT
c.CustomersID,
c.FristName,
c.LastName,
o.OrderID,
o.OrderID,
o.TotalAmount
FROM Customers c
RIGHT JOIN Orders o
ON c.CustomersID=o.CustomersID;

====== FULL OUTER JOIN ==========

SELECT
c.CustomersID,
c.FristName,
c.LastName,
o.OrderID,
o.OrderDate,
o.TotalAmount,
FROM Customers c
FULL OUTER JOIN Orders o 
ON c.CustomersID=o.CustomersID;

SELECT
c.CustomersID,
c.FristName,
c.LastName,
o.OrderID,
o.OrderDate,
o.TotalAmount
FROM Customers c
LEFT JOIN Orders o
ON c.CustomersID=o.CustomersID;

SELECT
c.CustomersID,
c.FristName,
c.LastName,
o.OrderID,
o.OrderID,
o.TotalAmount
FROM Customers c
RIGHT JOIN Orders o
ON c.CustomersID=o.CustomersID;

====== Orders Above Average Amount ========

SELECT *
FROM Orders
WHERE TotalAmount > (SELECT AVG(TotalAmount)FROM Orders);


======= Employees Above Average Salary =========


SELECT *
FROM Employees
WHERE Salary >
(SELECT AVG(Salary)FROM Employees);


====== Extract Year and Month =========


SELECT
OrderID,
OrderDate,
YEAR(OrderDate) AS OrderYear,
MONTH(OrderDate) AS OrderMonth
FROM Orders;

====== Difference Between Order Data and Current Date ========


SELECT
OrderID,
OrderDate,
DATEDIFF(CURDATE(),OrderDate) AS DaysDifference
FROM Orders;


====== Format Order Date =======


SELECT
OrderID,
DATE_FORMAT(OrderDate,'%d-%b-%Y') AS FormattedDate
FROM Orders;

===== Full Name =====


SELECT
CustomersID,
CONCAT(FristName,' ',LastName) AS FullName
FROM Customers;


====== Replace "John" with "Jonathan" ======


SELECT
CustomersID,
REPLACE(FristName,'John','Jonathan') AS UpdatedName
FROM Customers;


===== Uppercase and Lowercase =======


SELECT
UPPER(FristName) AS FristName,
LOWER(LastName) AS LastName
FROM Customers;


===== Trim Email ======


SELECT
CustomersID,
TRIM(Email) AS Email
FROM Customers;


====== Running Total =======


SELECT
OrderID,
OrderDate,
TotalAmount,
SUM(TotalAmount) OVER(ORDER BY OrderDate) AS RunningTotal
FROM Orders;


====== Rank Orders =======


SELECT
OrderID,
TotalAmount,
RANK() OVER(ORDER BY TotalAmount DESC) AS OrderRank
FROM Orders;

======= Assign Discount ======


SELECT
OrderID,
TotalAmount,
case
WHEN TotalAmount>1000 THEN '10% Discount'
WHEN TotalAmount>500 THEN '5% Discount'
ELSE 'No Discount'
END AS Discount
FROM Orders;


======= Categorize Employee Salaries =========


SELECT
EmployeeID,
FristName,
LastName,
Salary,
case
WHEN Salary>60000 THEN 'High'
WHEN Salary>50000 THEN 'Medium'
ELSE 'LOW'
END AS SalaryCategory
FROM Employees;