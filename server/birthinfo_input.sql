set verify off;
set serveroutput on;


declare 
	
	cnt birth_Info.bid%type ;
	--personalinfo
	n_birthid personal_info.birthid%type ;
	n_firstname personal_info.firstname%type := '&firstname';
	n_lastname personal_info.lastname%type := '&lastname';
	n_gender personal_info.gender%type := '&gender';
	n_religion personal_info.religion%type := '&religion';
	n_disability personal_info.disability%type := '&disability';
	n_martial_status personal_info.martial_status%type := '-';
	n_occupation personal_info.occupation%type := '-';
	
	--birth info
	n_birthdate birth_info.birthdate%type :='&birthdate';
	n_birthtime birth_info.birthtime%type :='&birthtime';
	n_birthplace birth_info.birthplace%type :='&birthplace';
	n_weight birth_info.weight%type :='&weight';
	n_height birth_info.height%type :='&height';
	n_birthrecorddate birth_info.birthrecorddate%type :=sysdate;
	n_refferedby birth_info.refferedby%type :='&refferedby';
	n_refferencecontact birth_info.refferencecontact%type :='&refferencecontact';
	
	--parent info
	
	n_fathersname parents_Info.fathersname%type :='&fathersname';
	n_mothersname parents_Info.mothersname%type :='&mothersname';
	n_fathersnationality parents_Info.fathersnationality%type :='&fathersnationality';
	n_mothersnationality parents_Info.mothersnationality%type :='&mothersnationality';
	n_fathersnid parents_Info.fathersnid%type :='&fathersnid';
	n_mothersnid parents_Info.mothersnid%type :='&mothersnid';
	n_fatherscontact parents_Info.fatherscontact%type :='&fatherscontact';
	n_motherscontact parents_Info.motherscontact%type :='&motherscontact';

	--address
	
	n_vill address.vill%type :='&village';
	n_p_s address.p_s%type :='&p_s';
	n_p_o address.p_o%type :='&p_o';
	n_district address.district%type :='&district';
	n_present_add address.present_add%type :='&present_add';
	
	a number :=0;
	
	error_birthid exception;
	
begin

	for r in (select birthid from personal_Info ) loop
	
		if n_birthid = r.birthid then
			raise error_birthid;
		end if;
	end loop;
	
	-- inersting into server
	insert into personal_Info (birthid ,firstname,lastname,gender,religion,disability,martial_status,occupation) 
	values (birthid.nextval ,n_firstname,n_lastname,n_gender,n_religion,n_disability,n_martial_status,n_occupation); 
	
	select max(birthid) into n_birthid from personal_Info;
	
	insert into birth_Info (bid,birthid,birthdate,birthtime,birthplace,weight,height,birthrecorddate,refferedby,refferencecontact) 
	values (bid.nextval,n_birthid,n_birthdate,n_birthtime,n_birthplace,n_weight,n_height,n_birthrecorddate,n_refferedby,n_refferencecontact);
	select max(bid) into cnt from birth_Info;
	
	insert into parents_Info (pid,birthid,fathersname,mothersname,fathersnationality,mothersnationality,fathersnid,mothersnid,fatherscontact,motherscontact)
	values (cnt,n_birthid,n_fathersname,n_mothersname,n_fathersnationality,n_mothersnationality,n_fathersnid,n_mothersnid,n_fatherscontact,n_motherscontact);
	
	
	insert into address (aid,birthid,vill,p_s,p_o,district,present_add)
	values(cnt,n_birthid,n_vill,n_p_s,n_p_o,n_district,n_present_add); 
	
	
	--inserting into site
	
	if n_birthplace = 'Sylhet' then
		
		insert into personal_Info@site_link (birthid ,firstname,lastname,gender,religion,disability,martial_status,occupation) 
		values (n_birthid ,n_firstname,n_lastname,n_gender,n_religion,n_disability,n_martial_status,n_occupation); 

		
		insert into birth_Info@site_link (bid,birthid,birthdate,birthtime,birthplace,weight,height,birthrecorddate,refferedby,refferencecontact) 
		values (cnt,n_birthid,n_birthdate,n_birthtime,n_birthplace,n_weight,n_height,n_birthrecorddate,n_refferedby,n_refferencecontact);

		
		insert into parents_Info@site_link (pid,birthid,fathersname,mothersname,fathersnationality,mothersnationality,fathersnid,mothersnid,fatherscontact,motherscontact)
		values (cnt,n_birthid,n_fathersname,n_mothersname,n_fathersnationality,n_mothersnationality,n_fathersnid,n_mothersnid,n_fatherscontact,n_motherscontact);
		
		
		insert into address@site_link (aid,birthid,vill,p_s,p_o,district,present_add)
		values(cnt,n_birthid,n_vill,n_p_s,n_p_o,n_district,n_present_add); 
		
	end if;
	commit;

		--exception for duplicate birthid
		
	exception

	when error_birthid then
		dbms_output.put_line('This birthid is already taken');
	
	
end;
/



