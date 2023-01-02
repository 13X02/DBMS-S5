Create Table Faculty (F_Code int Primary Key, F_Name Varchar(15));
INSERT INTO Faculty (F_CODE, F_NAME) 
VALUES (105, 'Jayakumar'), (104, 'Sangeetha'), (102, 'Bindu'), (101, 'Silgy'), (103, 'Vidhya');SELECT * FROM Faculty;



create table Subject (subjectcode varchar(5) primary key not null,subjectname
char(15),maxmark int,faculty_code int,foreign key(faculty_code) references
Faculty(F_code));

INSERT INTO Subject (subjectCode, subjectName, maxMark, faculty_code)
VALUES ('503', 'DBMS', '100', '105'),
       ('501', 'Maths', '150', '101'),
       ('502', 'FSA', '100', '102'),
       ('504', 'OS', '75', '103'),
       ('505', 'DC', '200', '104'),
       ('508', 'DBMS lab', '1001', '103');


create table Student(studentcode varchar(5) primary key not null,studentname
char(15),dob date,studentbranch char(3),adate date,check(studentbranch
in('cs','ec','ee','me')));

INSERT INTO student VALUES('1', 'Amitha', '1987-01-12', 'cs', '2000-06-01');
INSERT INTO student VALUES(2, 'Vaidehi', '1988-12-25', 'me', '2000-06-01');
INSERT INTO student VALUES(3, 'Varun', '1988-10-02', 'me', '2000-06-02');
INSERT INTO student VALUES(4, 'Turner', '1988-09-05', 'ec', '2000-06-01');
INSERT INTO student VALUES(5, 'Vani', '1988-07-20', 'ee', '2000-06-05');
INSERT INTO student VALUES(6, 'Binu', '1988-08-13', 'me', '2000-06-10');
INSERT INTO student VALUES(7, 'Chitra', '1986-11-14', 'me', '1999-06-09');
INSERT INTO student VALUES(8, 'Dona', '1991-12-02', 'cs', '2000-06-02');
INSERT INTO student VALUES(9, 'Elana', '1990-02-05', 'cs', '2000-06-01');
INSERT INTO student VALUES(10, 'Fahan', '1988-03-20', 'ec', '2000-06-05');
INSERT INTO student VALUES(11, 'Ginu', '1988-04-13', 'ec', '2000-06-10');
INSERT INTO student VALUES(12, 'Hamna', '1985-05-14', 'ee', '1999-06-09');


create table M_mark(studentcode varchar(5) references
Student(studentcode),subjectcode varchar(5) references Subject(subjectcode),mark
int,primary key(studentcode,subjectcode));


INSERT INTO M_mark VALUES('1','501',40);
INSERT INTO M_mark VALUES('1','502',70);
INSERT INTO M_mark VALUES('1','503',50);
INSERT INTO M_mark VALUES('1','504',80);
INSERT INTO M_mark VALUES('1','505',40);
INSERT INTO M_mark VALUES('1','508',70);
INSERT INTO M_mark VALUES('2','501',90);
INSERT INTO M_mark VALUES('2','502',89);
INSERT INTO M_mark VALUES('2','503',77);
INSERT INTO M_mark VALUES('2','504',95);
INSERT INTO M_mark VALUES('2','505',74);
INSERT INTO M_mark VALUES('2','508',98);
INSERT INTO M_mark VALUES('3','501',40);
INSERT INTO M_mark VALUES('3','502',43);
INSERT INTO M_mark VALUES('3','503',40);
INSERT INTO M_mark VALUES('3','504',40);
INSERT INTO M_mark VALUES('3','505',40);
INSERT INTO M_mark VALUES('3','508',35);
INSERT INTO M_mark VALUES('4','501',50);
INSERT INTO M_mark VALUES('5','501',60);
INSERT INTO M_mark VALUES('6','501',67);
INSERT INTO M_mark VALUES('7','501',23);
INSERT INTO M_mark VALUES('8','501',43);
INSERT INTO M_mark VALUES('9','501',42);
INSERT INTO M_mark VALUES('10','505',74);
INSERT INTO M_mark VALUES('11','508',98);
INSERT INTO M_mark VALUES('12','501',40);
INSERT INTO M_mark VALUES('5','502',43);
INSERT INTO M_mark VALUES('6','503',40);
INSERT INTO M_mark VALUES('7','504',40);
INSERT INTO M_mark VALUES('8','505',40);
INSERT INTO M_mark VALUES('9','508',35);
INSERT INTO M_mark VALUES('10','501',50);
INSERT INTO M_mark VALUES('11','501',60);
INSERT INTO M_mark VALUES('12','503',67);
INSERT INTO M_mark VALUES('5','504',23);
INSERT INTO M_mark VALUES('6','504',23);
INSERT INTO M_mark VALUES('9','504',1);
INSERT INTO M_mark VALUES('10','504',1);
INSERT INTO M_mark VALUES('6','502',43);
INSERT INTO M_mark VALUES('7','505',42);






 select count(*) "No: of Faculties" from faculty;

 select studentname,sum(mark) "Total Mark" from M_mark,Student where
 Student.studentcode= M_mark.studentcode group by studentname;

select subjectname,round(avg(mark),2) "Average mark" from Subject,M_mark where
Subject.subjectcode= M_mark.subjectcode group by subjectname;


select subject.subjectname,count(student.studentname)"NO: OF STUDENTS" from
subject,m_mark,student where student.studentcode= m_mark.studentcode and
m_mark.mark<(40* maxmark)/100 and subject.SubjectCode=m_mark.Subjectcode
group by subject.Subjectname having count(distinct(m_mark.subjectcode))>=1;




select studentname,
subjectname,mark,maxmark,round((m_mark.mark/maxmark)*100,2)"Percentage"
from subject, student, m_mark where mark<(40*maxmark/100) and subject.
SubjectCode = m_mark. subjectcode and student.studentcode
=m_mark.studentcode;

select Faculty.f_name,Subject.subjectname from Faculty,Subject where
Faculty.F_code=Subject.faculty_code;

Select f_name name from Faculty where (select count(subjectcode) from Subject
where Subject.faculty_code=Faculty.f_code)>1 group by Faculty.f_name;

select studentname,subjectname,mark,round((m_mark.mark/maxmark)*100,2)"Percentage" from Student,Subject,M_mark where
Student.studentcode=M_mark.studentcode and Subject.subjectcode=
M_mark.subjectcode order by mark;



