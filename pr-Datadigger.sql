 CREATE DATABASE DataDigger;
USE DataDigger;

#======================================

CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Address VARCHAR(200)
);

#======================================


INSERT INTO Customers (Customer_ID, Name, Email, Address)
VALUES
(1, 'Alice', 'alice@gmail.com', 'Surat'),
(2, 'Bob', 'bob@gmail.com', 'Ahmedabad'),
(3, 'Charlie', 'charlie@gmail.com', 'Mumbai'),
(4, 'David', 'david@gmail.com', 'Pune'),
(5, 'Alice', 'alice2@gmail.com', 'Vadodara');

#======================================

SELECT * FROM Customers;
outcome
+------------+---------+-------------------+-----------+
| Customer_ID | Name    | Email             | Address  |
+------------+---------+-------------------+-----------+
|          1 | Alice   | alice@gmail.com   | Surat     |
|          2 | Bob     | bob@gmail.com     | Ahmedabad |
|          3 | Charlie | charlie@gmail.com | Mumbai    |
|          4 | David   | david@gmail.com   | Pune      |
|          5 | Alice   | alice2@gmail.com  | Vadodara  |
+------------+---------+-------------------+-----------+
5 rows in set (0.182 sec)

UPDATE Customers 
SET Address = 'Rajkot'
WHERE Customer_ID = 1;

#======================================

SELECT * FROM Customers
WHERE Customer_ID = 1;
oucome
+------------+-------+-----------------+---------+
| Customer_ID | Name  | Email           | Address|
+------------+-------+-----------------+---------+
|          1 | Alice | alice@gmail.com | Rajkot  |
+------------+-------+-----------------+---------+
1 row in set (0.143 sec)

#======================================

DELETE FROM Customers
WHERE Customer_ID = 5;

oucome
+------------+---------+-------------------+-----------+
| Customer_ID | Name    | Email             | Address  |
+------------+---------+-------------------+-----------+
|          1 | Alice   | alice@gmail.com   | Rajkot    |
|          2 | Bob     | bob@gmail.com     | Ahmedabad |
|          3 | Charlie | charlie@gmail.com | Mumbai    |
|          4 | David   | david@gmail.com   | Pune      |
+------------+---------+-------------------+-----------+
4 rows in set (0.006 sec)

#======================================

2. orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    Customer_ID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (Customer_ID)
        REFERENCES Customers(Customer_ID)
);

DESC Orders;
+-------------+---------------+------+-----+---------+-------+
| Field       | Type          | Null | Key | Default | Extra |
+-------------+---------------+------+-----+---------+-------+
| OrderID     | int           | NO   | PRI | NULL    |       |
| CustomerID  | int           | YES  | MUL | NULL    |       |
| OrderDate   | date          | YES  |     | NULL    |       |
| TotalAmount | decimal(10,2) | YES  |     | NULL    |       |
+-------------+---------------+------+-----+---------+-------+
4 rows in set (0.377 sec)

#======================================

INSERT INTO Orders
(OrderID, Customer_ID, OrderDate, TotalAmount)
VALUES
(1, 1, '2026-09-01', 2500.00),
(2, 2, '2026-09-05', 1500.00),
(3, 3, '2026-09-10', 3200.00),
(4, 4, '2026-08-15', 800.00),
(5, 1, '2026-09-20', 4500.00);

SELECT * FROM Orders;
+---------+------------+------------+-------------+
| OrderID | Customer_ID | OrderDate  | TotalAmount|
+---------+------------+------------+-------------+
|       1 |          1 | 2026-09-01 |     2500.00 |
|       2 |          2 | 2026-09-05 |     1500.00 |
|       3 |          3 | 2026-09-10 |     3200.00 |
|       4 |          4 | 2026-08-15 |      800.00 |
|       5 |          1 | 2026-09-20 |     4500.00 |
+---------+------------+------------+-------------+
5 rows in set (0.098 sec)

#======================================

SELECT *
FROM Orders
WHERE Customer_ID = 1;
+---------+------------+------------+-------------+
| OrderID | Customer_ID | OrderDate  | TotalAmount |
+---------+------------+------------+-------------+
|       1 |          1 | 2026-09-01 |     2500.00 |
|       5 |          1 | 2026-09-20 |     4500.00 |
+---------+------------+------------+-------------+
2 rows in set (0.033 sec)

#======================================

UPDATE Orders
SET TotalAmount = 5000.00
WHERE OrderID = 1;

SELECT * FROM Orders
WHERE OrderDate >= CURDATE() - INTERVAL 30 DAY;
+---------+------------+------------+-------------+
| OrderID | Customer_ID | OrderDate  | TotalAmount |
+---------+------------+------------+-------------+
|       1 |          1 | 2026-09-01 |     5000.00 |
|       2 |          2 | 2026-09-05 |     1500.00 |
|       3 |          3 | 2026-09-10 |     3200.00 |
|       5 |          1 | 2026-09-20 |     4500.00 |
+---------+------------+------------+-------------+
4 rows in set (0.059 sec)

#======================================

SELECT MAX(TotalAmount) AS Highest_Order
FROM Orders;
+---------------+
| Highest_Order |
+---------------+
|       5000.00 |
+---------------+
1 row in set (0.032 sec)

#======================================

SELECT MIN(TotalAmount) AS Lowest_Order
FROM Orders;
+--------------+
| Lowest_Order |
+--------------+
|       800.00 |
+--------------+
1 row in set (0.011 sec)

#======================================

SELECT AVG(TotalAmount) AS Average_Order
FROM Orders;
---------------+
| Average_Order |
+---------------+
|   3000.000000 |
+---------------+
1 row in set (0.014 sec)

#======================================

DELETE FROM Orders
WHERE OrderID = 5;

#======================================

SELECT * FROM Orders;
+---------+------------+------------+-------------+
| OrderID | Customer_ID | OrderDate  | TotalAmount|
+---------+------------+------------+-------------+
|       1 |          1 | 2026-09-01 |     5000.00 |
|       2 |          2 | 2026-09-05 |     1500.00 |
|       3 |          3 | 2026-09-10 |     3200.00 |
|       4 |          4 | 2026-08-15 |      800.00 |
+---------+------------+------------+-------------+
4 rows in set (0.005 sec)

#======================================

PRODUCTS TABLE

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2),
    Stock INT
);

INSERT INTO Products VALUES
(1, 'Laptop', 55000, 10),
(2, 'Mobile', 25000, 15),
(3, 'Headphones', 1500, 20),
(4, 'Keyboard', 800, 25),
(5, 'Mouse', 500, 0);

SELECT * FROM Products
ORDER BY Price DESC;

+-----------+-------------+----------+-------+
| ProductID | ProductName | Price    | Stock |
+-----------+-------------+----------+-------+
|         1 | Laptop      | 55000.00 |    10 |
|         2 | Mobile      | 25000.00 |    15 |
|         3 | Headphones  |  1500.00 |    20 |
|         4 | Keyboard    |   800.00 |    25 |
|         5 | Mouse       |   500.00 |     0 |
+-----------+-------------+----------+-------+
5 rows in set (0.042 sec)

#======================================

UPDATE Products
SET Price = 1800
WHERE ProductID = 3;

DELETE FROM Products
WHERE ProductID = 5
AND Stock = 0;

SELECT * FROM Products
WHERE Price BETWEEN 500 AND 2000;
+-----------+-------------+---------+-------+
| ProductID | ProductName | Price   | Stock |
+-----------+-------------+---------+-------+
|         3 | Headphones  | 1800.00 |    20 |
|         4 | Keyboard    |  800.00 |    25 |
+-----------+-------------+---------+-------+
2 rows in set (0.031 sec)

#======================================

SELECT * FROM Products
WHERE Price = (SELECT MAX(Price) FROM Products);
+-----------+-------------+----------+-------+
| ProductID | ProductName | Price    | Stock |
+-----------+-------------+----------+-------+
|         1 | Laptop      | 55000.00 |    10 |
+-----------+-------------+----------+-------+
1 row in set (0.039 sec)

#======================================

SELECT * FROM Products
WHERE Price = (SELECT MIN(Price) FROM Products);
+-----------+-------------+--------+-------+
| ProductID | ProductName | Price  | Stock |
+-----------+-------------+--------+-------+
|         4 | Keyboard    | 800.00 |    25 |
+-----------+-------------+--------+-------+
1 row in set (0.009 sec)

#======================================

ORDERDETAILS TABLE

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    SubTotal DECIMAL(10,2),

    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO OrderDetails VALUES
(1, 1, 1, 1, 55000),
(2, 1, 3, 2, 3600),
(3, 2, 2, 1, 25000),
(4, 3, 3, 3, 5400),
(5, 4, 4, 2, 1600);

SELECT * FROM OrderDetails;
+---------------+---------+-----------+----------+----------+
| OrderDetailID | OrderID | ProductID | Quantity | SubTotal |
+---------------+---------+-----------+----------+----------+
|             1 |       1 |         1 |        1 | 55000.00 |
|             2 |       1 |         3 |        2 |  3600.00 |
|             3 |       2 |         2 |        1 | 25000.00 |
|             4 |       3 |         3 |        3 |  5400.00 |
|             5 |       4 |         4 |        2 |  1600.00 |
+---------------+---------+-----------+----------+----------+
5 rows in set (0.009 sec)

#======================================

SELECT * FROM OrderDetails
WHERE OrderID = 1;
+---------------+---------+-----------+----------+----------+
| OrderDetailID | OrderID | ProductID | Quantity | SubTotal |
+---------------+---------+-----------+----------+----------+
|             1 |       1 |         1 |        1 | 55000.00 |
|             2 |       1 |         3 |        2 |  3600.00 |
+---------------+---------+-----------+----------+----------+
2 rows in set (0.017 sec)

#======================================

SELECT SUM(SubTotal) AS TotalRevenue
FROM OrderDetails;
+--------------+
| TotalRevenue |
+--------------+
|     90600.00 |
+--------------+
1 row in set (0.023 sec)

SELECT ProductID, SUM(Quantity) AS TotalQuantity
FROM OrderDetails
GROUP BY ProductID
ORDER BY TotalQuantity DESC
LIMIT 3;
+-----------+---------------+
| ProductID | TotalQuantity |
+-----------+---------------+
|         3 |             5 |
|         4 |             2 |
|         1 |             1 |
+-----------+---------------+
3 rows in set (0.055 sec)

#======================================

SELECT ProductID, COUNT(*) AS TimesSold
FROM OrderDetails
WHERE ProductID = 3
GROUP BY ProductID;
+-----------+-----------+
| ProductID | TimesSold |
+-----------+-----------+
|         3 |         2 |
+-----------+-----------+
1 row in set (0.018 sec)

#======================================

DELETE FROM Customers
WHERE CustomerID = 5;

Last all table records
SELECT * FROM Customers;
+------------+---------+-------------------+-----------+
| CustomerID | Name    | Email             | Address   |
+------------+---------+-------------------+-----------+
|          1 | Alice   | alice@gmail.com   | Rajkot    |
|          2 | Bob     | bob@gmail.com     | Ahmedabad |
|          3 | Charlie | charlie@gmail.com | Mumbai    |
|          4 | David   | david@gmail.com   | Pune      |
+------------+---------+-------------------+-----------+
4 rows in set (0.032 sec)

#======================================

SELECT * FROM Orders;
+---------+------------+------------+-------------+
| OrderID | CustomerID | OrderDate  | TotalAmount |
+---------+------------+------------+-------------+
|       1 |          1 | 2026-09-01 |     5000.00 |
|       2 |          2 | 2026-09-05 |     1500.00 |
|       3 |          3 | 2026-09-10 |     3200.00 |
|       4 |          4 | 2026-08-15 |      800.00 |
+---------+------------+------------+-------------+
4 rows in set (0.012 sec)

#======================================

SELECT * FROM Products;
+-----------+-------------+----------+-------+
| ProductID | ProductName | Price    | Stock |
+-----------+-------------+----------+-------+
|         1 | Laptop      | 55000.00 |    10 |
|         2 | Mobile      | 25000.00 |    15 |
|         3 | Headphones  |  1800.00 |    20 |
|         4 | Keyboard    |   800.00 |    25 |
+-----------+-------------+----------+-------+
4 rows in set (0.007 sec)

#======================================

SELECT * FROM OrderDetails;
+---------------+---------+-----------+----------+----------+
| OrderDetailID | OrderID | ProductID | Quantity | SubTotal |
+---------------+---------+-----------+----------+----------+
|             1 |       1 |         1 |        1 | 55000.00 |
|             2 |       1 |         3 |        2 |  3600.00 |
|             3 |       2 |         2 |        1 | 25000.00 |
|             4 |       3 |         3 |        3 |  5400.00 |
|             5 |       4 |         4 |        2 |  1600.00 |
+---------------+---------+-----------+----------+----------+
5 rows in set (0.008 sec)






