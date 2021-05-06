clear screen;

--delete existing table
drop table personal_Info cascade constraints;
drop table birth_Info cascade constraints;
drop table parents_Info cascade constraints;
drop table address cascade constraints;
drop table death_Info cascade constraints;


--Create database

create table personal_Info(
birthid     integer not null, 
firstname   varchar2(30), 
lastname varchar2(30) not null , 
gender varchar2(30),
religion varchar2(30),
disability varchar2(30),
martial_status varchar2(30),
occupation varchar2(30),
age varchar(30),
        PRIMARY KEY (birthid)
);




create table birth_Info(
bid integer not null,
birthid     integer, 
birthdate   date, 
birthtime varchar(30), 
birthplace varchar2(255),
weight varchar2(30),
height varchar2(30),
birthrecorddate date,
refferedby varchar2(30),
refferencecontact varchar(30),
        PRIMARY KEY (bid),
		FOREIGN KEY(birthid) REFERENCES personal_Info(birthid)
);


create table parents_Info(
pid integer not null,
birthid     integer, 
fathersname   varchar2(255), 
mothersname varchar2(255), 
fathersnationality varchar2(30),
mothersnationality varchar2(30),
fathersnid integer,
mothersnid integer,
fatherscontact varchar2(30),
motherscontact varchar(30),
        PRIMARY KEY (pid),
		FOREIGN KEY(birthid) REFERENCES personal_Info(birthid)
);


create table address(
aid integer not null,
birthid     integer, 
vill varchar2(30),
p_s varchar2(30),
p_o varchar2(30),
district   varchar2(30), 
present_add varchar(255),
        PRIMARY KEY (aid),
		FOREIGN KEY(birthid) REFERENCES personal_Info(birthid)
);


create table death_Info(
deathid integer not null,
birthid     integer, 
dyingdate date,
dyingtime varchar(30),
dyingplace varchar2(30),
causeofdeath varchar2(255),
deathrecorddate   date, 
refferedby varchar(255),
refferencecontact varchar2(30),
        PRIMARY KEY (deathid),
		FOREIGN KEY(birthid) REFERENCES personal_Info(birthid)
);



select * from personal_Info;
select * from birth_Info;
select * from parents_Info;
select * from address;
select * from death_Info;

