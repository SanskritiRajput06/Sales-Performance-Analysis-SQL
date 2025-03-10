create database sales;
use sales;

create table Product_Table(
Product_id integer primary key,
Product_Name varchar(50) not null,
Category varchar(50),
Price decimal (10,2)
);

insert into Product_Table
value
(1,"Laptop","Electronics",1000.00),
(2, "Smartphone","Electronics",500.00),
(3,"Chair","Furniture",150.00),
(4,"Desk","Furniture",200.00);

create table Customers(
Customer_id integer primary key,
Customer_name varchar(50),
Customer_Email varchar(50)
);

insert into Customers
value
(1,"John Doe","john.doe@example.com"),
(2,"Jane Smith","jane.smith@example.com"),
(3,"Alice Brown","alice.brown@example.com");


Create Table SalesPerson(
SalespersonID integer primary key,
SalesPerson_Name varchar(50)
);

insert into SalesPerson
Values
(1,"Robert Green"),
(3,"Emily White");


Create table Sales(
Sale_Id integer	primary key,
ProductID integer,
CustomerID int,
 SalesPersonID INT,
SalesDate  date,
Quantity int,
Amount decimal (10,2),
foreign key (ProductID) references Product_Table (Product_id),
foreign key (CustomerID) references Customers (Customer_id),
foreign key (SalesPersonID) references SalesPerson (SalespersonID)
);

Insert into Sales 
Values
(1, 1, 1, 1, '2025-01-15', 2, 2000.00),
(2, 2, 2, 3, '2025-02-20', 1, 500.00),
(3, 3, 3, 1, '2025-03-10', 4, 600.00),
(4, 4, 1, 3, '2025-03-01', 1, 200.00),
(5, 1, 2, 1, '2025-01-05', 3, 3000.00);

-- Highest Sales by Product Category
select Product_Table.Product_id,Product_Table.Category, Product_Name ,sum(Amount)
From Product_Table
Join sales on Product_Table.Product_id = Sales.ProductID
group by Product_Table.Product_id,Product_Table.Category, Product_Name
order by sum(Amount) desc
Limit 1 ;


-- Sales Performance by Salesperson
select Sales.SalesPersonID, SalesPerson.SalesPerson_Name, Sum(Sales.Amount)
From Sales
Join SalesPerson on  Sales.SalesPersonID = SalesPerson.SalespersonID
Group by  Sales.SalesPersonID,SalesPerson. SalesPerson_Name;


--  Sales by Product
select Product_Table.Product_id,Product_Table.Product_Name , Sum(Sales.Amount)
from  Product_Table
Join Sales on Product_Table.Product_id = Sales .ProductID
Group by Product_Table.Product_id,Product_Table.Product_Name
Order by Sum(Sales.Amount) desc
Limit 1 ;





