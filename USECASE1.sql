CREATE DATABASE USECASE1;
USE USECASE1;

#CREATING CUSTOMER TABLE 
create table CUSTOMER(CUST_CODE varchar(20) NOT NULL,CUST_NAME varchar(20) ,CUST_CITY varchar(20),PHONE_NO varchar(20) UNIQUE,AGENT_CODE varchar(20), PRIMARY KEY(CUST_CODE));
#CREATING AGENT TABLE 
create table AGENT(AGENT_CODE varchar(20) NOT NULL,AGENT_NAME varchar(20) ,COUNTRY varchar(20),PHONE_NO varchar(20) UNIQUE,STATUSS INT, PRIMARY KEY(AGENT_CODE));
#CREATING ORDER TABLE 
create table ORDERS(ORDER_NUM varchar(20) NOT NULL,CUST_CODE varchar(20),AGENT_CODE varchar(20),AMOUNT FLOAT,ORDER_DATE varchar(20), PRIMARY KEY(ORDER_NUM));

#ADDING FORIEGN KEYS 
ALTER TABLE CUSTOMER ADD foreign key(AGENT_CODE) references AGENT(AGENT_CODE);
ALTER TABLE ORDERS ADD foreign key(AGENT_CODE) references AGENT(AGENT_CODE);
ALTER TABLE ORDERS ADD foreign key(CUST_CODE) references CUSTOMER(CUST_CODE);

#INSERTING  
INSERT INTO CUSTOMER VALUES ('C001','ALBERT','CHENNAI','9798865876','A001'),('C002','RAVI','BANGALORE','9876123456','A002'),('C003','ARCHANA','CHENNAI','94523098123','A003'),('C004','RIYA','THIRCHY','9612309876','A002'),('C005','PAVITHRA','KANYAKUMARI','9612309856','A005');
INSERT INTO AGENT VALUES ('A001','JOE','CANADA','2345623452',0),('A002','SARA','INDIA','1234567890',1),('A003','WILEY','BAHAMAS','987654321',1),('A004','KATNISS','IRELAND','3456543698',1),('A005','ARJUN','INDIA','984434234',0);
INSERT INTO ORDERS VALUES('O001','C001','A001',50000.5,'44532'),('O002','C002','A002',3000.35,'26/03/2021'),('O003','C005','A004',25000.1,'21/01/2021'),('O004','C003','A003',6000.5,'44350'),('O006','C004','A005',1000000.4,'13/09/2019');

#QUESTION 2 Alter the table agent , Add a new Column called "Commission".
ALTER TABLE AGENT ADD COMMISION FLOAT;
UPDATE AGENT SET COMMISION=0.2 WHERE AGENT_CODE='A001';
UPDATE AGENT SET COMMISION=0.96 WHERE AGENT_CODE='A002';
UPDATE AGENT SET COMMISION=0.23 WHERE AGENT_CODE='A003';
UPDATE AGENT SET COMMISION=0.12 WHERE AGENT_CODE='A004';
UPDATE AGENT SET COMMISION=0.76 WHERE AGENT_CODE='A005';
select * FROM AGENT;

#Question 3 Delete the column Phone_No from the agents table.
ALTER TABLE AGENT DROP COLUMN PHONE_NO;
select * FROM AGENT;

#Question 4	Rename the Column "Commision" as "Commision_Percentage".			
ALTER TABLE AGENT CHANGE Commision Commision_Percentage FLOAT;
select * FROM AGENT;

#Question 5 Make a copy of agent table with a table name as "AGENT_DETAILS" and delete the old agent table with the name "AGENT" 							
create table AGENT_DETAILS AS SELECT * FROM AGENT;
select * FROM AGENT_DETAILS;
SHOW TABLES;
SET foreign_key_checks = 0;
DROP TABLE AGENT;


#Question 6Delete all the order table records in a single command 
select * from ORDERS;
truncate table ORDERS;
select * from ORDERS;


#Question 7	Alter the tables orders and set a default value for the column Amount	
ALTER TABLE ORDERS ALTER AMOUNT SET DEFAULT 100.00;
INSERT INTO ORDERS (ORDER_NUM,CUST_CODE,AGENT_CODE,ORDER_DATE) VALUES('O001','C001','A001','44532');
select * from ORDERS;

#ORDER BY AND LIMIT OPERATION
select * from AGENT ORDER BY COUNTRY DESC;
select * from CUSTOMER LIMIT 3;


#TRANSACTION
BEGIN;
INSERT INTO ORDERS VALUES('O008','C002','A001',50000.5,'44532');
select * from ORDERS;
rollback;



