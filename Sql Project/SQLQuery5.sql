use AbleJobs;
Select * from Noble;
--From the above table, write a SQL query to combine the winners in Physics, 1970 and in Economics, 1971.
--Return year, subject, winner, country, and category.
Select Distinct a.Year, a.Subject, a.Winner, a. Country,a.Category from Noble as a
Left Join Noble as b on a.Year=b.Year where (a.Year=1970 and a.Subject='Physics') OR (a.Year=1971 and a.Subject='Economics');
Use AbleJobs;
Select * from Sales1, Sales2;
/*
From the above tables write a SQL query to find the salesperson and customer who belongs to same city. Return Salesman, cust_name and city.*/
Select a.Name as 'Salesperson Name',b.Name as'Customer Name' from Sales1 as a
Inner Join SALES2 as b on a.City=b.City;
/*From the above tables write a SQL query to find the salesperson(s) and the customer(s) he handle.
Return Customer Name, city, Salesman, commission.*/
Select a.Name as 'Salesperson Name',b.Name as 'Customer Name' from Sales1 as a
Inner Join Sales2 as b on a.Salesman_Id=b.Salesman_ID order by a.Salesman_Id;
/*From the above tables write a SQL query to find those salespersons who received a commission from the company more than 12%.*/
Select Salesman_Id,Name from Sales1 where (Commission*100)>12;
/*From the following tables write a SQL query to find those salespersons do not live in the same city where their customers live
and received a commission from the company more than 12%. Return Customer Name, customer city, Salesman, salesman city, commission.*/
Select a.Name as 'Salesperson Name',a.City as 'Salesperson City',a.Commission,b.Name as'Customer Name',b.City as 'Customer City' from Sales1 as a
Left Join SALES2 as b on a.Salesman_Id=b.Salesman_Id where a.City!=b.City and (a.Commission*100)>12;
