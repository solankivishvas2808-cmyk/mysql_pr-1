# DataDigger — MySQL Database Project

> A practical SQL database project for managing customers, orders, products, and order details.

**Created by Vishwas Solanki**

---

## 📌 About the Project

**DataDigger** is a MySQL-based relational database project created to demonstrate practical SQL concepts using an e-commerce/order-management style database.

The project creates a database named `DataDigger` and works with four related tables:

- **Customers** — customer information
- **Orders** — order information and total amounts
- **Products** — products, prices, and stock
- **OrderDetails** — products included in orders, quantities, and subtotals

The SQL script demonstrates database creation, table creation, inserting records, updating records, deleting records, filtering, sorting, aggregate functions, subqueries, grouping, and foreign-key relationships.

---

## 🗃️ Database Structure

```text
DataDigger
│
├── Customers
│   ├── Customer_ID (Primary Key)
│   ├── Name
│   ├── Email
│   └── Address
│
├── Orders
│   ├── OrderID (Primary Key)
│   ├── Customer_ID (Foreign Key)
│   ├── OrderDate
│   └── TotalAmount
│
├── Products
│   ├── ProductID (Primary Key)
│   ├── ProductName
│   ├── Price
│   └── Stock
│
└── OrderDetails
    ├── OrderDetailID (Primary Key)
    ├── OrderID (Foreign Key)
    ├── ProductID (Foreign Key)
    ├── Quantity
    └── SubTotal
```

### 🔗 Table Relationships

```text
Customers
    │
    │ 1 ─────── N
    ▼
  Orders
    │
    │ 1 ─────── N
    ▼
OrderDetails
    ▲
    │ N ─────── 1
    │
Products
```

- A customer can have multiple orders.
- An order can contain multiple order-detail records.
- A product can appear in multiple order-detail records.
- Foreign keys connect the related tables.

---

## 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| **MySQL** | Relational database management |
| **SQL** | Creating, modifying and querying data |

---

## ✨ SQL Concepts Covered

### Database & Table Operations
- `CREATE DATABASE`
- `USE`
- `CREATE TABLE`
- `DESC`
- Primary Keys
- Foreign Keys

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
- Sales/revenue calculations
- Product quantity analysis

---

## 📊 Main Database Tables

### Customers
Stores customer ID, name, email, and address.

### Orders
Stores order ID, customer ID, order date, and total amount.

### Products
Stores product ID, product name, price, and stock quantity.

Sample products in the project include **Tablet, Smartwatch, Wireless Mouse, Keyboard, and Webcam**.

### OrderDetails
Stores order detail ID, order ID, product ID, quantity, and subtotal. It connects orders and products using foreign keys.

---

## 🔎 Example SQL Queries

### Highest Order Amount

```sql
SELECT MAX(TotalAmount) AS Highest_Order
FROM Orders;
```

### Lowest Order Amount

```sql
SELECT MIN(TotalAmount) AS Lowest_Order
FROM Orders;
```

### Average Order Amount

```sql
SELECT AVG(TotalAmount) AS Average_Order
FROM Orders;
```

### Highest-Priced Product

```sql
SELECT *
FROM Products
WHERE Price = (SELECT MAX(Price) FROM Products);
```

### Lowest-Priced Product

```sql
SELECT *
FROM Products
WHERE Price = (SELECT MIN(Price) FROM Products);
```

### Total Revenue

```sql
SELECT SUM(SubTotal) AS TotalRevenue
FROM OrderDetails;
```

### Top 3 Products by Quantity Sold

```sql
SELECT ProductID, SUM(Quantity) AS TotalQuantity
FROM OrderDetails
GROUP BY ProductID
ORDER BY TotalQuantity DESC
LIMIT 3;
```

### Product Sales Frequency

```sql
SELECT ProductID, COUNT(*) AS TimesSold
FROM OrderDetails
WHERE ProductID = 3
GROUP BY ProductID;
```

### Orders from the Last 30 Days

```sql
SELECT *
FROM Orders
WHERE OrderDate >= CURDATE() - INTERVAL 30 DAY;
```

---

## 🚀 How to Run

### Prerequisites

- MySQL Server
- MySQL Command Line Client or MySQL Workbench

### 1. Open MySQL

```bash
mysql -u root -p
```

### 2. Run the SQL File

Inside MySQL:

```sql
SOURCE datadigger.sql;
```

Or from the terminal:

```bash
mysql -u root -p < datadigger.sql
```

### 3. Select the Database

```sql
USE DataDigger;
```

### 4. Check Tables

```sql
SHOW TABLES;
```

Expected tables:

```text
Customers
Orders
Products
OrderDetails
```

---

## 📁 Project Structure

```text
DataDigger/
│
├── datadigger.sql
└── README.md
```

---

## 🎯 Learning Objectives

This project demonstrates:

- Relational database design
- SQL syntax and queries
- Primary and foreign keys
- CRUD operations
- Filtering and sorting
- Aggregate functions
- Subqueries
- Grouping
- Multi-table relationships
- Basic sales and product analysis

---

## 👨‍💻 Author

**Vishwas Solanki**

**Project:** DataDigger  
**Technology:** MySQL / SQL  
**Purpose:** Educational Database Project

---

## 📄 License

This project is created for **educational and learning purposes**.

You may use and modify the project for learning, practice, and academic purposes.

---

⭐ **DataDigger — Built with MySQL and SQL**
