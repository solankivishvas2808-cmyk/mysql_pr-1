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
(1, 'Aarav', 'aarav@gmail.com', 'Rajkot'),
(2, 'Meera', 'meera@gmail.com', 'Surat'),
(3, 'Kabir', 'kabir@gmail.com', 'Ahmedabad'),
(4, 'Riya', 'riya@gmail.com', 'Vadodara'),
(5, 'Neel', 'neel@gmail.com', 'Gandhinagar');

#======================================

SELECT * FROM Customers;
outcome
+------------+---------+-------------------+-----------+
| Customer_ID | Name    | Email             | Address  |
+------------+---------+-------------------+-----------+
|          1 | Aarav   | aarav@gmail.com   | Rajkot    |
|          2 | Meera   | meera@gmail.com   | Surat     |
|          3 | Kabir   | kabir@gmail.com   | Ahmedabad |
|          4 | Riya    | riya@gmail.com    | Vadodara  |
|          5 | Neel    | neel@gmail.com    |Gandhinagar|
+------------+---------+-------------------+-----------+
5 rows in set (0.182 sec)

UPDATE Customers 
SET Address = 'Jamnagar'
WHERE Customer_ID = 1;

#======================================

SELECT * FROM Customers
WHERE Customer_ID = 1;
oucome
+------------+-------+-----------------+---------+
| Customer_ID | Name  | Email           | Address|
+------------+-------+-----------------+---------+
|          1 | Aarav | aarav@gmail.com | Jamnagar |
+------------+-------+-----------------+---------+
1 row in set (0.143 sec)

#======================================

DELETE FROM Customers
WHERE Customer_ID = 5;

oucome
+------------+---------+-------------------+-----------+
| Customer_ID | Name    | Email             | Address  |
+------------+---------+-------------------+-----------+
|          1 | Aarav   | aarav@gmail.com   | Jamnagar  |
|          2 | Meera   | meera@gmail.com   | Surat     |
|          3 | Kabir   | kabir@gmail.com   | Ahmedabad |
|          4 | Riya    | riya@gmail.com    | Vadodara  |
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
(1, 1, '2026-09-02', 2750.00),
(2, 2, '2026-09-08', 1850.00),
(3, 3, '2026-09-14', 4200.00),
(4, 4, '2026-08-22', 950.00),
(5, 1, '2026-09-26', 5300.00);

SELECT * FROM Orders;
+---------+------------+------------+-------------+
| OrderID | Customer_ID | OrderDate  | TotalAmount|
+---------+------------+------------+-------------+
|       1 |          1 | 2026-09-02 |     2750.00 |
|       2 |          2 | 2026-09-08 |     1850.00 |
|       3 |          3 | 2026-09-14 |     4200.00 |
|       4 |          4 | 2026-08-22 |      950.00 |
|       5 |          1 | 2026-09-26 |     5300.00 |
+---------+------------+------------+-------------+
5 rows in set (0.098 sec)

#======================================

SELECT *
FROM Orders
WHERE Customer_ID = 1;
+---------+------------+------------+-------------+
| OrderID | Customer_ID | OrderDate  | TotalAmount|
+---------+------------+------------+-------------+
|       1 |          1 | 2026-09-02 |     2750.00 |
|       5 |          1 | 2026-09-26 |     5300.00 |
+---------+------------+------------+-------------+
2 rows in set (0.033 sec)

#======================================

UPDATE Orders
SET TotalAmount = 5750.00
WHERE OrderID = 1;

SELECT * FROM Orders
WHERE OrderDate >= CURDATE() - INTERVAL 30 DAY;
+---------+------------+------------+-------------+
| OrderID | Customer_ID | OrderDate  | TotalAmount|
+---------+------------+------------+-------------+
|       1 |          1 | 2026-09-02 |     5750.00 |
|       2 |          2 | 2026-09-08 |     1850.00 |
|       3 |          3 | 2026-09-14 |     4200.00 |
|       5 |          1 | 2026-09-26 |     5300.00 |
+---------+------------+------------+-------------+
4 rows in set (0.059 sec)

#======================================

SELECT MAX(TotalAmount) AS Highest_Order
FROM Orders;
+---------------+
| Highest_Order |
+---------------+
|       5750.00 |
+---------------+
1 row in set (0.032 sec)

#======================================

SELECT MIN(TotalAmount) AS Lowest_Order
FROM Orders;
+--------------+
| Lowest_Order |
+--------------+
|       950.00 |
+--------------+
1 row in set (0.011 sec)

#======================================

SELECT AVG(TotalAmount) AS Average_Order
FROM Orders;
---------------+
| Average_Order|
+--------------+
|   3193.750000|
+--------------+
1 row in set (0.014 sec)

#======================================

DELETE FROM Orders
WHERE OrderID = 5;

#======================================

SELECT * FROM Orders;
+---------+------------+------------+-------------+
| OrderID | Customer_ID | OrderDate  | TotalAmount|
+---------+------------+------------+-------------+
|       1 |          1 | 2026-09-02 |     5750.00 |
|       2 |          2 | 2026-09-08 |     1850.00 |
|       3 |          3 | 2026-09-14 |     4200.00 |
|       4 |          4 | 2026-08-22 |      950.00 |
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
(1, 'Tablet', 42000, 14),
(2, 'Smartwatch', 9000, 18),
(3, 'Wireless Mouse', 1800, 30),
(4, 'Keyboard', 1400, 20),
(5, 'Webcam', 3200, 0);

SELECT * FROM Products
ORDER BY Price DESC;

+-----------+-----------------+----------+-------+
| ProductID | ProductName     | Price    | Stock |
+-----------+-----------------+----------+-------+
|         1 | Tablet          | 42000.00 |    14 |
|         2 | Smartwatch      |  9000.00 |    18 |
|         5 | Webcam          |  3200.00 |     0 |
|         3 | Wireless Mouse  |  1800.00 |    30 |
|         4 | Keyboard        |  1400.00 |    20 |
+-----------+-----------------+----------+-------+
5 rows in set (0.042 sec)

#======================================

UPDATE Products
SET Price = 2100
WHERE ProductID = 3;

DELETE FROM Products
WHERE ProductID = 5
AND Stock = 0;

SELECT * FROM Products
WHERE Price BETWEEN 500 AND 2000;
+-----------+-----------------+---------+-------+
| ProductID | ProductName     | Price   | Stock |
+-----------+-----------------+---------+-------+
|         4 | Keyboard        | 1400.00 |    20 |
+-----------+-----------------+---------+-------+
1 row in set (0.031 sec)

#======================================

SELECT * FROM Products
WHERE Price = (SELECT MAX(Price) FROM Products);
+-----------+-----------------+----------+-------+
| ProductID | ProductName     | Price    | Stock |
+-----------+-----------------+----------+-------+
|         1 | Tablet          | 42000.00 |    14 |
+-----------+-----------------+----------+-------+
1 row in set (0.039 sec)

#======================================

SELECT * FROM Products
WHERE Price = (SELECT MIN(Price) FROM Products);
+-----------+-----------------+--------+-------+
| ProductID | ProductName     | Price  | Stock |
+-----------+-----------------+--------+-------+
|         4 | Keyboard        |1400.00 |    20 |
+-----------+-----------------+--------+-------+
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
(1, 1, 1, 1, 42000),
(2, 1, 3, 2, 3600),
(3, 2, 2, 1, 9000),
(4, 3, 3, 3, 6300),
(5, 4, 4, 2, 2800);

SELECT * FROM OrderDetails;
+---------------+---------+-----------+----------+----------+
| OrderDetailID | OrderID | ProductID | Quantity | SubTotal |
+---------------+---------+-----------+----------+----------+
|             1 |       1 |         1 |        1 | 42000.00 |
|             2 |       1 |         3 |        2 |  3600.00 |
|             3 |       2 |         2 |        1 |  9000.00 |
|             4 |       3 |         3 |        3 |  6300.00 |
|             5 |       4 |         4 |        2 |  2800.00 |
+---------------+---------+-----------+----------+----------+
5 rows in set (0.009 sec)

#======================================

SELECT * FROM OrderDetails
WHERE OrderID = 1;
+---------------+---------+-----------+----------+----------+
| OrderDetailID | OrderID | ProductID | Quantity | SubTotal |
+---------------+---------+-----------+----------+----------+
|             1 |       1 |         1 |        1 | 42000.00 |
|             2 |       1 |         3 |        2 |  3600.00 |
+---------------+---------+-----------+----------+----------+
2 rows in set (0.017 sec)

#======================================

SELECT SUM(SubTotal) AS TotalRevenue
FROM OrderDetails;
+--------------+
| TotalRevenue |
+--------------+
|     63700.00 |
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
|          1 | Aarav   | aarav@gmail.com   | Jamnagar  |
|          2 | Meera   | meera@gmail.com   | Surat     |
|          3 | Kabir   | kabir@gmail.com   | Ahmedabad |
|          4 | Riya    | riya@gmail.com    | Vadodara  |
+------------+---------+-------------------+-----------+
4 rows in set (0.032 sec)

#======================================

SELECT * FROM Orders;
+---------+------------+------------+-------------+
| OrderID | CustomerID | OrderDate  | TotalAmount |
+---------+------------+------------+-------------+
|       1 |          1 | 2026-09-02 |     5750.00 |
|       2 |          2 | 2026-09-08 |     1850.00 |
|       3 |          3 | 2026-09-14 |     4200.00 |
|       4 |          4 | 2026-08-22 |      950.00 |
+---------+------------+------------+-------------+
4 rows in set (0.012 sec)

#======================================

SELECT * FROM Products;
+-----------+-------------+----------+-------+
| ProductID | ProductName | Price    | Stock |
+-----------+-------------+----------+-------+
|         1 | Tablet      | 42000.00 |    14 |
|         2 | Smartwatch  |  9000.00 |    18 |
|         3 |WirelessMouse|  2100.00 |    30 |
|         4 | Keyboard    |  1400.00 |    20 |
+-----------+-------------+----------+-------+
4 rows in set (0.007 sec)

#======================================

SELECT * FROM OrderDetails;
+---------------+---------+-----------+----------+----------+
| OrderDetailID | OrderID | ProductID | Quantity | SubTotal |
+---------------+---------+-----------+----------+----------+
|             1 |       1 |         1 |        1 | 42000.00 |
|             2 |       1 |         3 |        2 |  3600.00 |
|             3 |       2 |         2 |        1 |  9000.00 |
|             4 |       3 |         3 |        3 |  6300.00 |
|             5 |       4 |         4 |        2 |  2800.00 |
+---------------+---------+-----------+----------+----------+
5 rows in set (0.008 sec)