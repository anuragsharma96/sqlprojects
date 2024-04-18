Use AbleJobs;
Create Table CustomersTable (CustomerId Int Primary Key, CustomerName Varchar (100), City Varchar(150));
Insert INto CustomersTable Values (1,'John Smith','New York'),
(2,'Jane Doe','Los Angeles'),
(3,'Bob Johnson','Chicago');
Create Table OrdersTable (OrderId Int Primary Key, CustomerId Int Foreign Key References CustomersTable(CustomerId), Product Varchar (100), Quantity
Int, Price Decimal(8,2));
Insert Into OrdersTable Values (1,1,'Laptop',2,340),
(2,1,'Printer',1,240),
(3,2,'Smartphone',3,70),
(4,3,'Tablet',2,80);
/*Retrieve the names of all customers who have placed an order for a product with a price greater than $100.*/
Select Distinct a.CustomerName as 'Customer Name' from CustomersTable as a
Inner Join (Select * from OrdersTable where Price>100) as b on a.Customerid=b.CustomerId;
/*List the products that have been ordered by customers from the same city as customer 'John Smith'.*/
With CustomerNames As (Select * from CustomersTable where CustomerName='John Smith')
Select a.CustomerName as 'Customer Name', a.City, b.Product from CustomerNames as a Inner Join OrdersTable as b on a.CustomerId=b.CustomerId;
/*Find the order IDs and total order amounts for orders that contain at least one product with a quantity greater than 2.*/
With OrderIds As (Select *,SUM(Quantity*Price) as Total_order_Amount from OrdersTable where Quantity>=2 Group By OrderId, CustomerId, Product,
Quantity,Price)
Select a.OrderId, a.Total_Order_Amount,a.Product, b.CustomerName from OrderIds as a Inner Join CustomersTable as b on a.CustomerId=b.CustomerId;