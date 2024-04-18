USE AbleJobs;
CREATE TABLE SALES2 (Customer_id INT PRIMARY KEY, Name VARCHAR(100), City VARCHAR(100), Salesman_Id Int Foreign Key REFERENCES Sales1(Salesman_ID));
ALTER TABLE SALES2 ADD Grade Int;
Truncate Table Sales2;
INSERT INTO SALES2 (Customer_id, Name, City,Grade, Salesman_Id) VALUES (3001,'John doe','London',200,5005),(3002,'Nick Romando','New York',100,5001),
(3007,'Brad Davis','New York',200,5001),
(3005,'Graham Zusi','California',200,5002),
(3008,'Julian Green','London',300,5002),
(3004,'Fabian Johnson','Paris',300,5006),
(3009,'Geoff Cameron','Berlin',100,5003),
(3003,'Jeozy Altidor','Moscow',200,5007);
Select * from SALES2;
