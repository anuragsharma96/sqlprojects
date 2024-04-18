Use AbleJobs;
Select * from Sales1;
CREATE FUNCTION GetDetails(@City1 Varchar (100), @City2 Varchar(100)) Returns TAble as Return (Select * from Sales1 Where City in (@City1, @City2));
Select * from GetDetails('Paris','Rome');
CREATE FUNCTION GetDetailsNotRomeParis(@City1 Varchar (100), @City2 Varchar(100)) Returns Table
as Return (Select * from Sales1 Where City NOT in (@City1, @City2));
DROP Function GetDetailsNotRomeParis;
CREATE FUNCTION GetDetailsNot(@City1 Varchar (100), @City2 Varchar(100)) Returns Table
as Return (Select * from Sales1 Where City NOT in (@City1, @City2));
Select * from GetDetailsNot('Paris','Rome');
--Using Wildcards
Select * from Sales1 where Name like '[B-K]%';
Select * from Sales2 where Name like 'B%';
Select * from Sales1 where Name like '%n';
Select * from Sales1 where Name like 'N__l%';
--Creating new table Noble within the same database
Create Table Noble (Year SmallInt, Subject Varchar(30), Winner Varchar(200), Country Varchar(150), Categry Varchar(100));
Insert Into Noble Values (1970,'Physics','Hans Alfven', 'Sweden', 'Scientist'),
(1970,'Physics','Louis Neel', 'France','Scientist'),
(1970,'Chemistry','Luis Frederico leloir', 'France','Scientist'),
(1970,'Physiology','Ulf von Euler', 'Sweden', 'Scientist'),
(1970,'Physiology','Bernard Katz','Germany','Scientist'),
(1970,'Literature','Aleksander Solzhenitsyn','Russia','Linguist'),
(1970,'Econimics','Paul Samuelson','USA','Economist'),
(1970,'Physiolgy','Julius Axelrod','USA','Scientist'),
(1971,'Phyics','Dennis Gabor','Hungary','Scientist'),
(1971,'Chemistry','Gerhard herzberg','Germany','Scientist'),
(1971,'Peace','Willy Brandt','Germany','Chancellor'),
(1971,'Literature','PAblo Neruda','Chile','Linguist'),
(1971,'Economics','Simon Kuznets','Russia','Econmist'),
(1978,'Peace','Anwar al-Sadat','Egypt','President'),
(1978,'Peace','Menachem Begin','Israel','Prime Minister'),
(1987,'Chemistry','Donald J. Cam','USA','Scientist'),
(1987,'Chemistry','Jean Marie-Lehn','France','Scientist'),
(1987,'Physiology','Susumo Tonawa','Japan','Scientist'),
(1994,'Economics','Reinhard Selten','Germany','Economist'),
(1994,'Peace','Yitzhak Rabin','Israel','Prime Minister'),
(1987,'Physics','Jaohannes Georg Bednorz','Germany','Scintist'),
(1987,'Literature','Joseph brodsky','Russia','Linguist'),
(1987,'Economics','Robert Solow','USA','Economist'),
(1994,'Literature','Kenzaburo Oe','Japan','Limguist');
CREATE FUNCTION FETCHWINNERSOFYEAR(@Year1 SmallInt,@Year2 SmallInt) Returns Table as Return (SELECT Year, Subject, Winner from Noble
Where Year=@Year1 Or Year=@Year2);
Select * from FETCHWINNERSOFYEAR(1970,1987);
CREATE FUNCTION FetchWinnersOfSubjectandYear(@Subject VARCHAR(30), @Year SMALLINT) Returns Table AS Return (SELECT Winner from Noble WHERE
Subject=@Subject and Year=@Year);
Select * from FetchWinnersOfSubjectandYear('Literature',1971);
Update Noble Set Winner='Pablo Neruda' where Winner='PAblo Neruda';
Select * from FetchWinnersOfSubjectandYear('Literature',1971);
CREATE FUNCTION FetchWinnersSubjectYear(@Winner Varchar(200)) Returns Table As Return (Select Year, Subject from Noble Where Winner=@Winner);
Select * from FetchWinnersSubjectYear('Dennis Gabor');
--Using Procedure
CREATE PROCEDURE FetchWinnerInSince (@Subject Varchar(30), @Year SMALLINT) AS BEGIN SELECT Winner FROM Noble WHERE Subject=@Subject and Year>=@Year
END;
EXECUTE FetchWinnerInSince 'Physics', 1950;
Create Procedure FetchWinnerBetween (@Subject Varchar(30), @Year1 SmallInt, @Year2 SmallInt) As Begin Select Winner from Noble Where
Subject=@Subject and Year Between @Year1 And @Year2 End;
Exec FetchWinnerBetween 'Chemistry', 1965, 1975;
Create procedure FetchWinnerdetailsAfter (@Winner Varchar(200), @Year SmallInt, @Category Varchar(100)) As Begin Select * from Noble Where
Winner=@Winner and Year>@Year and Category=@Category end;
Exec sp_rename 'Noble.Categry', 'Category', 'Column';
DROP PROCEDURE FetchWinnerdetailsAfter;
Create procedure FetchWinnerdetailsAfter (@Year SmallInt, @Category Varchar(100)) As Begin Select * from Noble Where
Year>@Year and Category=@Category end;
EXEC FetchWinnerdetailsAfter 1972, 'Prime Minister';
Select * from Noble where Winner like 'Louis%';
Create Procedure FetchWinnerDetails (@Winner Varchar(200)) As Begin Select * from Noble where Winner=@Winner end;
Exec FetchWinnerDetails 'Johannes Georg Bednorz';
Update Noble Set Winner='Johannes Georg Bednorz' where Winner = 'Jaohannes Georg Bednorz';
--Creating New Table Orders
Create Table Orders (Ord_No Int Primary Key, Purch_Amt Decimal(10,2), Ord_Date Date,Customer_Id Int Foreign Key References Sales2(Customer_ID),
Salesman_Id Int Foreign Key References Sales1(Salesman_Id));
Insert Into Orders Values (7001,150.5,'2012-10-05',3005,5002),
(70009,270.65,'2012-09-10',3001,5005),
(70002,65.26,'2012-10-05',3002,5005),
(70004,110.5,'2012-08-17',3009,5003),
(70007,948.5,'2012-09-10',3005,5002),
(70005,2400.6,'2012-07-27',3007,5001),
(70008,5760,'2012-09-10',3002,5001),
(70010,1983.43,'2012-10-10',3004,5006),
(70003,2480.4,'2012-10-10',3009,5003),
(70012,250.45,'2012-06-27',3008,5002),
(70011,75.29,'2012-08-17',3003,5007),
(70013,3045.6,'2012-04-25',3002,5001);
Select SUM(Purch_Amt) As 'Total Purchase' from Orders;
Select AVG(Purch_Amt) As 'Average Purchase Amount' from Orders;
Select Count(Distinct Salesman_Id) as 'Distinct Sales People' from Orders ;
Select Count(Customer_Id) as 'Total Customers Repeted' from Orders;