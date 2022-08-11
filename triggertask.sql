use triggertask;

create table  student(id varchar(4),name varchar(20),dept varchar(5));
create table  student_copy(id varchar(4),name varchar(20),dept varchar(5));
show tables;


delimiter //
create trigger t1 after insert on student for each row 
begin
insert into student_copy(id,name,dept) values (new.id, new.name,new.dept);
end//
delimiter ;


show triggers;

insert into student values('s01','Anu','CSE'),('s02','ram','ECE'),('s03','sri','CSE');
select * from student;
select * from student_copy;
insert into student values('s04','Bavya','EEE');





