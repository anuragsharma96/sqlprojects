USE AbleJobs;
Select * from Sales1;
Update Sales1 Set Commission = 0.22 where Salesman_Id=5005;
Update Sales1 Set City ='Paris' where Salesman_Id= 5003;
Select * from Sales1;
--Updating Sales2
Select * from Sales2;
Update Sales2 set Grade=300 where Name='Graham Zusi';
Update Sales2 set City='London' where Customer_Id=3009;
Select * from Sales2;