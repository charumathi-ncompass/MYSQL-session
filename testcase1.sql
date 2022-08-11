show databases;
use training;
#CREATING CUSTOMER TABLE 
create table CUSTOMER(CUST_CODE varchar(20) NOT NULL,CUST_NAME varchar(20) ,CUST_CITY varchar(20),PHONE_NO varchar(20) UNIQUE,AGENT_CODE varchar(20), PRIMARY KEY(CUST_CODE));
#CREATING AGENT TABLE 
create table AGENT(AGENT_CODE varchar(20) NOT NULL,AGENT_NAME varchar(20) ,COUNTRY varchar(20),PHONE_NO varchar(20) UNIQUE,STATUS INT, PRIMARY KEY(AGENT_CODE));
#CREATING ORDER TABLE 
create table ORDERS(ORDER_NUM varchar(20) NOT NULL,CUST_CODE varchar(20),AGENT_CODE varchar(20),AMOUNT FLOAT,ORDER_DATE varchar(20), PRIMARY KEY(ORDER_NUM));
#ADDING FORIEGN KEYS 
ALTER TABLE CUSTOMER ADD foreign key(AGENT_CODE) references AGENT(AGENT_CODE);
ALTER TABLE ORDERS ADD foreign key(AGENT_CODE) references AGENT(AGENT_CODE);
ALTER TABLE ORDERS ADD foreign key(CUST_CODE) references CUSTOMER(CUST_CODE);
#INSERTING  
#INSERT INTO CUSTOMER('C001','ALBERT','CHENNAI','9798865876','A001');


#QUESTION 2 Alter the table agent , Add a new Column called "Commission".
ALTER TABLE AGENT ADD COMMISION FLOAT(3,2);
select * FROM AGENT;



#Question 3 Delete the column Phone_No from the agents table.
ALTER TABLE AGENT DROP COLUMN PHONE_NO;
select * FROM AGENT;

#Question 4	Rename the Column "Commision" as "Commision_Percentage".			
ALTER TABLE AGENT CHANGE Commision Commision_Percentage FLOAT(3,2);
select * FROM AGENT;

#Question 5 Make a copy of agent table with a table name as "AGENT_DETAILS" and delete the old agent table with the name "AGENT" 							
create table AGENT_DETAILS AS SELECT * FROM AGENT;
select * FROM AGENT_DETAILS;
SHOW TABLES;
ALTER TABLE CUSTOMER ADD foreign key(AGENT_CODE) references AGENT_DETAILS(AGENT_CODE);
ALTER TABLE ORDERS ADD foreign key(AGENT_CODE) references AGENT_DETAILS(AGENT_CODE);
DROP TABLE AGENT;


#Question 6Delete all the order table records in a single command 
ALTER TABLE AGENT_DETAILS RENAME STATUS STATUSS;
INSERT INTO AGENT_DETAILS ("A001","JOE","CANADA","2345623452",0);
insert into ORDERS values('O001','C001','A001',50000.5,'44532');




