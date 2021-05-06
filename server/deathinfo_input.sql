set verify off;
set serveroutput on;


declare 
	
	cnt number :=0;
	cntsite number :=0;
	cntage number:=0;
	
	n_deathid death_Info.deathid%type ;
	n_birthid death_Info.birthid%type := &birthid;
	n_dyingdate death_Info.dyingdate%type := '&dyingdate';
	n_dyingtime death_Info.dyingtime%type := '&dyingtime';
	n_dyingplace death_Info.dyingplace%type := '&dyingplace';
	n_causeofdeath death_Info.causeofdeath%type := '&causeofdeath';
	n_deathrecorddate death_Info.deathrecorddate%type := sysdate;
	n_refferedby death_Info.refferedby%type := '&refferedby';
	n_refferencecontact death_Info.refferencecontact%type := '&refferencecontact';
	
	n_martial_status personal_info.martial_status%type := '&martial_status';
	n_occupation personal_info.occupation%type := '&occupation';
	n_birthdate birth_Info.birthdate%type;
	
	error_birthid exception;
	
	
begin
	
	select count(*) into cnt from personal_Info where birthid = n_birthid;
	select count(*) into cntsite from personal_Info@site_link where birthid = n_birthid;
	if cnt=0 then
		raise error_birthid; 
		
	else
			--automatically age fill up 
		select birthdate into n_birthdate from birth_Info where birthid = n_birthid;
		cntage := myPackage.calculateAge(n_birthdate,n_dyingdate, n_birthid);
		--dbms_output.put_line(TO_CHAR(cntage));
	
			--inserting into server
		insert into death_Info (deathid,birthid,dyingdate,dyingtime,dyingplace,causeofdeath,deathrecorddate,refferedby,refferencecontact)
		values (deathid.nextval,n_birthid,n_dyingdate,n_dyingtime,n_dyingplace,n_causeofdeath,n_deathrecorddate,n_refferedby,n_refferencecontact);
		select max(deathid) into n_deathid from death_Info;
		
		update personal_Info 
		set martial_status= n_martial_status, occupation = n_occupation, age = TO_CHAR(cntage)
		where birthid = n_birthid;
		
		
		
		
			--inserting into site 
		if cntsite =0 and n_dyingplace= 'Sylhet' then

			
			
			for i in (select birthid ,firstname,lastname,gender,religion,disability,martial_status,occupation from personal_Info where birthid= n_birthid) loop
					
				insert into personal_Info@site_link (birthid ,firstname,lastname,gender,religion,disability,martial_status,occupation,age) values 
				(i.birthid ,i.firstname,i.lastname,i.gender,i.religion,i.disability,n_martial_status,n_occupation,TO_CHAR(cntage));
				commit;
			end loop; 
			
			
			insert into death_Info@site_link (deathid,birthid,dyingdate,dyingtime,dyingplace,causeofdeath,deathrecorddate,refferedby,refferencecontact)
			values (n_deathid,n_birthid,n_dyingdate,n_dyingtime,n_dyingplace,n_causeofdeath,n_deathrecorddate,n_refferedby,n_refferencecontact);
		
		elsif n_dyingplace= 'Sylhet' then
			
			--inserting into site while birth id is already present in personal_info site_link
		
			insert into death_Info@site_link (deathid,birthid,dyingdate,dyingtime,dyingplace,causeofdeath,deathrecorddate,refferedby,refferencecontact)
			values (n_deathid,n_birthid,n_dyingdate,n_dyingtime,n_dyingplace,n_causeofdeath,n_deathrecorddate,n_refferedby,n_refferencecontact);
		
			
			update personal_Info@site_link
			set martial_status= n_martial_status, occupation = n_occupation, age = TO_CHAR(cntage)
			where birthid = n_birthid;
			
	
			
		end if;
		
	end if;
	
	
	
		
		--exception for duplicate birthid		
	exception

	when error_birthid then
		dbms_output.put_line('This birthid does not exist.');
		
	
end;
/



