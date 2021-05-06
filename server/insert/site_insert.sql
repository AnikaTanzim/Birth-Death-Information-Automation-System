set verify off;
set serveroutput on;


declare 
	
	n_birthdate birth_Info.birthdate%type;
	cnt number :=0;
	cntage number:=0;
begin
		--according to birth info
	/*for r in (select bid,birthid,birthdate,birthtime,birthplace,weight,height
			,birthrecorddate,refferedby,refferencecontact from birth_Info where 
			birthplace= 'Sylhet' and birthid>=1008) loop
			
			--personal-info insert
		for i in (select birthid ,firstname,lastname,gender,religion,disability,martial_status,occupation from personal_Info where birthid= r.birthid) loop
					
			insert into personal_Info@site_link (birthid ,firstname,lastname,gender,religion,disability,martial_status,occupation) values 
			(i.birthid ,i.firstname,i.lastname,i.gender,i.religion,i.disability,i.martial_status,i.occupation);
			commit;
		end loop;
		
			--birth-info insert
		insert into birth_Info@site_link 
		(bid,birthid,birthdate,birthtime,birthplace,weight,height,birthrecorddate,refferedby,refferencecontact)
		values
		(r.bid,r.birthid,r.birthdate,r.birthtime,r.birthplace,r.weight,r.height
			,r.birthrecorddate,r.refferedby,r.refferencecontact);		
		
		commit;
		
			-- parent-info insert
		for i in (select pid,birthid,fathersname,mothersname,fathersnationality,mothersnationality,fathersnid,
				mothersnid,fatherscontact,motherscontact
				from parents_Info where birthid= r.birthid) loop
			
			insert into parents_Info@site_link 
			(pid,birthid,fathersname,mothersname,fathersnationality,mothersnationality,fathersnid,
				mothersnid,fatherscontact,motherscontact) 
			values(i.pid,i.birthid,i.fathersname,i.mothersname,i.fathersnationality,i.mothersnationality,i.fathersnid,
				i.mothersnid,i.fatherscontact,i.motherscontact);
			commit;
				
		end loop;
		
		
			--address insert
		for i in (select aid,birthid,vill,p_s,p_o,district,present_add from address where birthid =r.birthid) loop 
			insert into address@site_link (aid,birthid,vill,p_s,p_o,district,present_add)
			values (i.aid, i.birthid, i.vill, i.p_s, i.p_o, i.district, i.present_add);
			commit;
		end loop;
			
			--death-info insert
		for i in (select deathid,birthid,dyingdate,dyingtime,dyingplace,causeofdeath,deathrecorddate,refferedby,
				refferencecontact from death_info where birthid=r.birthid)loop
				
			insert into death_info@site_link (deathid,birthid,dyingdate,dyingtime,dyingplace,causeofdeath,deathrecorddate,refferedby,
			refferencecontact) 
			values (i.deathid,i.birthid,i.dyingdate,i.dyingtime,i.dyingplace,i.causeofdeath,i.deathrecorddate,i.refferedby,
			i.refferencecontact);
		
		end loop;
		
		
	end loop;*/
	
	
	--according to death-info 
	for r in ( select deathid,birthid,dyingdate,dyingtime,dyingplace,causeofdeath,deathrecorddate,refferedby,
	refferencecontact from death_info where dyingplace='Sylhet' and birthid>=1008) loop 
			
			--personal-info insert
			select birthdate into n_birthdate from birth_Info where birthid = r.birthid;
			cntage := myPackage.calculateAge(n_birthdate,r.dyingdate, r.birthid);
		for i in (select birthid ,firstname,lastname,gender,religion,disability,martial_status,occupation from personal_Info where birthid= r.birthid) loop
					
			insert into personal_Info@site_link (birthid ,firstname,lastname,gender,religion,disability,martial_status,occupation,age) values 
			(i.birthid ,i.firstname,i.lastname,i.gender,i.religion,i.disability,i.martial_status,i.occupation,TO_CHAR(cntage));
			commit;
		end loop;
		
				--birth-info insert
		/*for i in (select bid,birthid,birthdate,birthtime,birthplace,weight,height
			,birthrecorddate,refferedby,refferencecontact from birth_Info where birthid=r.birthid) loop 
			
			insert into birth_Info@site_link 
			(bid,birthid,birthdate,birthtime,birthplace,weight,height,birthrecorddate,refferedby,refferencecontact)
			values
			(i.bid,i.birthid,i.birthdate,i.birthtime,i.birthplace,i.weight,i.height
				,i.birthrecorddate,i.refferedby,i.refferencecontact);		
			
			commit;
			
		
		end loop;
		
			-- parent-info insert
		for i in (select pid,birthid,fathersname,mothersname,fathersnationality,mothersnationality,fathersnid,
				mothersnid,fatherscontact,motherscontact
				from parents_Info where birthid= r.birthid) loop
			
			insert into parents_Info@site_link 
			(pid,birthid,fathersname,mothersname,fathersnationality,mothersnationality,fathersnid,
				mothersnid,fatherscontact,motherscontact) 
			values(i.pid,i.birthid,i.fathersname,i.mothersname,i.fathersnationality,i.mothersnationality,i.fathersnid,
				i.mothersnid,i.fatherscontact,i.motherscontact);
			commit;
				
		end loop;
		
		
			--address insert
		for i in (select aid,birthid,vill,p_s,p_o,district,present_add from address where birthid =r.birthid) loop 
			insert into address@site_link (aid,birthid,vill,p_s,p_o,district,present_add)
			values (i.aid, i.birthid, i.vill, i.p_s, i.p_o, i.district, i.present_add);
			commit;
		end loop;*/

			--death-info insert
			
		insert into death_info@site_link (deathid,birthid,dyingdate,dyingtime,dyingplace,causeofdeath,deathrecorddate,refferedby,
		refferencecontact) 
		values (r.deathid,r.birthid,r.dyingdate,r.dyingtime,r.dyingplace,r.causeofdeath,r.deathrecorddate,r.refferedby,
		r.refferencecontact);
			
	
		
		
	
	
	end loop;







	
	
	
	
	
end;
/



