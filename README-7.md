# DataDigger — MySQL Database Project

**A practical MySQL database project demonstrating customer, order, product, and order-detail management using SQL.**

> **Created by Vishwas Solanki**

---

## 📌 Project Overview

**DataDigger** is a MySQL-based relational database project designed to demonstrate core SQL and database-management concepts through a small e-commerce/order-management dataset.

The project creates a `DataDigger` database and works with four related tables:

- `Customers` — stores customer information
- `Orders` — stores customer orders
- `Products` — stores product, price, and stock information
- `OrderDetails` — connects orders with products and stores quantities/subtotals

The SQL file includes database creation, table creation, sample data, CRUD operations, filtering, sorting, aggregate functions, subqueries, grouping, foreign-key relationships, and analytical queries.

---

## 🗂️ Database Structure

```text
DataDigger
│
├── Customers
│   ├── Customer_ID (PK)
│   ├── Name
│   ├── Email
│   └── Address
│
├── Orders
│   ├── OrderID (PK)
│   ├── Customer_ID (FK)
│   ├── OrderDate
│   └── TotalAmount
│
├── Products
│   ├── ProductID (PK)
│   ├── ProductName
│   ├── Price
│   └── Stock
│
└── OrderDetails
    ├── OrderDetailID (PK)
    ├── OrderID (FK)
    ├── ProductID (FK)
    ├── Quantity
    └── SubTotal
```

### 🔗 Relationships

```text
Customers
    │
    │ 1 ──── N
    ▼
 Orders
    │
    │ 1 ──── N
    ▼
OrderDetails
    ▲
    │ N ──── 1
    │
Products
```

- One customer can have multiple orders.
- One order can contain multiple order-detail records.
- One product can appear in multiple order-detail records.
- Foreign keys maintain relationships between the tables.

---

## 🚀 Features & SQL Concepts Covered

### Database & Table Management
- `CREATE DATABASE`
- `USE`
- `CREATE TABLE`
- Primary Keys
- Foreign Keys
- `DESC`

### CRUD Operations
- `INSERT`
- `SELECT`
- `UPDATE`
- `DELETE`

### Filtering & Sorting
- `WHERE`
- `BETWEEN`
- `ORDER BY`
- Date-based filtering
- `LIMIT`

### Aggregate Functions
- `MAX()`
- `MIN()`
- `AVG()`
- `SUM()`
- `COUNT()`

### Advanced SQL
- Subqueries
- `GROUP BY`
- Foreign-key relationships
- Multi-table relational design
- Sales/revenue analysis
- Product quantity analysis

---

## 📊 Example Queries

### Find the highest-priced product

```sql
SELECT *
FROM Products
WHERE Price = (SELECT MAX(Price) FROM Products);
```

### Find the lowest-priced product

```sql
SELECT *
FROM Products
WHERE Price = (SELECT MIN(Price) FROM Products);
```

### Calculate total revenue

```sql
SELECT SUM(SubTotal) AS TotalRevenue
FROM OrderDetails;
```

### Find the top 3 products by quantity sold

```sql
SELECT ProductID, SUM(Quantity) AS TotalQuantity
FROM OrderDetails
GROUP BY ProductID
ORDER BY TotalQuantity DESC
LIMIT 3;
```

### Find orders from the last 30 days

```sql
SELECT *
FROM Orders
WHERE OrderDate >= CURDATE() - INTERVAL 30 DAY;
```

### Find how many times a product was sold

```sql
SELECT ProductID, COUNT(*) AS TimesSold
FROM OrderDetails
WHERE ProductID = 3
GROUP BY ProductID;
```

---

## 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| **MySQL** | Relational database management |
| **SQL** | Database creation, manipulation & analysis |

---

## 💻 Requirements

To run this project, you need:

- MySQL Server
- MySQL Command Line Client **or** MySQL Workbench
- Basic knowledge of SQL

---

## ⚙️ How to Run

### 1. Clone the repository

```bash
git clone <YOUR_REPOSITORY_URL>
cd <YOUR_REPOSITORY_FOLDER>
```

### 2. Open MySQL

```bash
mysql -u root -p
```

### 3. Run the SQL file

From the MySQL client:

```sql
SOURCE pr-Datadigger.sql;
```

Or run the file directly from your terminal:

```bash
mysql -u root -p < pr-Datadigger.sql
```

### 4. Select the database

```sql
USE DataDigger;
```

### 5. Check the tables

```sql
SHOW TABLES;
```

You should see:

```text
Customers
Orders
Products
OrderDetails
```

---

## 📁 Project Files

```text
DataDigger/
│
├── pr-Datadigger.sql
└── README.md
```

### `pr-Datadigger.sql`

Contains the complete SQL script for:

- Creating the database
- Creating all tables
- Inserting sample records
- Updating records
- Deleting records
- Running analytical queries
- Demonstrating SQL concepts

---

## 📈 Sample Dataset

The project contains sample records for:

- Customers from cities such as Surat, Ahmedabad, Mumbai, Pune, Rajkot and Vadodara
- Products including Laptop, Mobile, Headphones and Keyboard
- Orders with dates and total amounts
- Order details containing product quantities and subtotals

The script also demonstrates modifying and deleting records during the SQL workflow.

---

## 🎯 Learning Objectives

This project is useful for practicing:

- Relational database design
- Primary and foreign keys
- Data insertion and manipulation
- SQL filtering and sorting
- Aggregate functions
- Subqueries
- Grouping and analysis
- Order and product management
- Basic sales/revenue analysis

---

## 👨‍💻 Author

**Vishwas Solanki**

MySQL / SQL Database Project

---

## 📄 License

This project is created for **educational and learning purposes**.

You are welcome to study, modify, and extend the project for your own learning.

---

⭐ **If you found this project useful, consider giving the repository a star.**
