


delete from birth_Info;
delete from parents_Info;
delete from address;
delete from death_Info;
delete from personal_Info;

insert into personal_Info (birthid ,firstname,lastname,gender,religion,disability,martial_status,occupation) values (birthid.nextval, 'Sajid', 'Rahmatullah', 'male', 'Muslim','','Married','Teacher'); 
insert into personal_Info (birthid ,firstname,lastname,gender,religion,disability,martial_status,occupation) values (birthid.nextval, 'Abid' ,'Barkatullah', 'male', 'Muslim','Speaking','',''); 
insert into personal_Info (birthid ,firstname,lastname,gender,religion,disability,martial_status,occupation) values (birthid.nextval, 'Kamrun', 'Nahar', 'female', 'Muslim','','','' ); 
insert into personal_Info (birthid ,firstname,lastname,gender,religion,disability,martial_status,occupation) values (birthid.nextval, 'Hafiz', 'Abdullah', 'male', 'Muslim', 'Autistic','',''); 
insert into personal_Info (birthid ,firstname,lastname,gender,religion,disability,martial_status,occupation) values (birthid.nextval, 'Anupom', 'Roy', 'male', 'Hindu','','',''); 



insert into birth_Info (bid,birthid,birthdate,birthtime,birthplace,weight,height,birthrecorddate,refferedby,refferencecontact) values (bid.nextval,1001, '22-Dec-45', '11:00 am', 'Dhaka', '9 lbs','21.1 inches' , '02-Oct-46', 'Shafiq Rahmatullah', '01953006423'); 
insert into birth_Info (bid,birthid,birthdate,birthtime,birthplace,weight,height,birthrecorddate,refferedby,refferencecontact) values (bid.nextval,1002, '03-Jun-64', '1:15 pm', 'Sylhet', '8.5 lbs' ,'19.5 inches', '22-Dec-64', 'Barkatullah', '01715006443'); 
insert into birth_Info (bid,birthid,birthdate,birthtime,birthplace,weight,height,birthrecorddate,refferedby,refferencecontact) values (bid.nextval,1003, '16-Jan-68', '3:00 pm', 'Dhaka', '9.5 lbs' ,'22 inches', '15-Feb-68', 'Mokbul Hossain', '01623098423'); 
insert into birth_Info (bid,birthid,birthdate,birthtime,birthplace,weight,height,birthrecorddate,refferedby,refferencecontact) values (bid.nextval,1004, '13-Mar-97', '4:30 am', 'Dhaka', '10 lbs' ,'22.7 inches', '03-Jun-97', 'Abdullah Khan', '01953034563'); 
insert into birth_Info (bid,birthid,birthdate,birthtime,birthplace,weight,height,birthrecorddate,refferedby,refferencecontact) values (bid.nextval,1005, '11-Nov-08', '8:00 pm', 'Sylhet', '11 lbs' ,'23 inches' , '25-Dec-08', 'Sushmita Roy', '01956576423'); 



insert into parents_Info (pid,birthid,fathersname,mothersname,fathersnationality,mothersnationality,fathersnid,mothersnid,fatherscontact,motherscontact) values (bid.nextval,1001, 'Shafiq Rahmatullah', 'Champa khatun', 'Bangladeshi','Bangladeshi','987654321','123456789','01953006423','01953006423'); 
insert into parents_Info (pid,birthid,fathersname,mothersname,fathersnationality,mothersnationality,fathersnid,mothersnid,fatherscontact,motherscontact) values (bid.nextval,1002, 'Barkatullah', 'Mala Begum','Bangladeshi','Bangladeshi','123459876','123498765','01715006443','01753016423'); 
insert into parents_Info (pid,birthid,fathersname,mothersname,fathersnationality,mothersnationality,fathersnid,mothersnid,fatherscontact,motherscontact) values (bid.nextval,1003, 'Mokbul Hossain', 'Bacchu Hossain','Bangladeshi','Bangladeshi','546372839','7865459234','01715006443','01653056423'); 
insert into parents_Info (pid,birthid,fathersname,mothersname,fathersnationality,mothersnationality,fathersnid,mothersnid,fatherscontact,motherscontact) values (bid.nextval,1004, 'Abdullah Khan', 'Anita Ria','Bangladeshi','Bangladeshi','234987651','123467914','01715006443','01983226423'); 
insert into parents_Info (pid,birthid,fathersname,mothersname,fathersnationality,mothersnationality,fathersnid,mothersnid,fatherscontact,motherscontact) values (bid.nextval,1005, 'Topon Roy','Sushmita Roy','Bangladeshi','Bangladeshi','34562789','1234794587','01715006443','01953002337'); 



insert into address (aid,birthid,vill,p_s,p_o,district,present_add) values(bid.nextval,1001, 'Chandanpur', 'Sharishabari', 'Baushibangali', 'Dhaka', '64/A Baily Road,Dhaka-1217'); 
insert into address (aid,birthid,vill,p_s,p_o,district,present_add) values(bid.nextval,1002, 'Notunpara', 'Notunpara', 'Shunamganj', 'Sylhet', '108-Niloy, Sylhet'); 
insert into address (aid,birthid,vill,p_s,p_o,district,present_add) values(bid.nextval,1003, 'Chandanpur', 'Jamalpur', 'Jamalpur', 'Dhaka', 'Malibagh'); 
insert into address (aid,birthid,vill,p_s,p_o,district,present_add) values(bid.nextval,1004, 'Gopiganj', 'Gopiganj', 'Gopalganj', 'Dhaka', 'Goaplganj'); 
insert into address (aid,birthid,vill,p_s,p_o,district,present_add) values(bid.nextval,1005, 'Tangua', 'Shunamganj', 'Shunamganj', 'Sylhet', 'Tangua');


insert into death_Info (deathid,birthid,dyingdate,dyingtime,dyingplace,causeofdeath,deathrecorddate,refferedby,refferencecontact) values (deathid.nextval, 1001 ,'11-Nov-08','4:30 am', 'Dhaka','Heart attack','12-Nov-08','Champa Khatun', '01953006423');



select * from personal_Info;
select * from birth_Info;
select * from parents_Info;
select * from address;
select * from death_Info;



select * from personal_Info@site_link;
insert into personal_Info@site_link (birthid,lastname) values (1007, 'Tanzim');
select * from personal_Info@site_link;





