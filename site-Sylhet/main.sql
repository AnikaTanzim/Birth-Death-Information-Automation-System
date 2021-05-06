set verify off;
set serveroutput on;
declare 	
	cnt number :=0;
	year number :=0;	
	val1 number :=0;
	val2 number :=0;
	c number :=0;
	a number := &year;
	b personal_Info.birthid%type :=&birthid; 
	

	error_birthid exception;
	error_deathid exception;
	
begin
	--cnt := myPackage.calculateAge('22-DEC-45', '11-NOV-08', 1001);
	--dbms_output.put_line(TO_CHAR(cnt));
	
	dbms_output.put_line('Total population in this year:' || myPackage.calculatePopulation());
	dbms_output.put_line('__________In ' || a || ':__________');
	
	dbms_output.put_line('Total population:' || myPackage.calculatePopulation1(a));
	
	myPackage.calculateCBR(a, val1);
	dbms_output.put_line('CBR: ' || val1);
	
	myPackage.calculateCDR(a, val2);
	dbms_output.put_line('CDR: ' || val2);
	
	viewRecordsPackage.set_birthid(b);
	
	
	dbms_output.put_line('__________Birth Records of '|| b ||':__________');	
	select count(*) into c from birthrecords;
	
	if c=0 then 
		raise error_birthid;
	else 
		for r in (select * from birthrecords) loop
				
				dbms_output.put_line('Birth Registration no:	' || r.birthid);
				dbms_output.put_line('Name: 	' || r.firstname || ' ' || r.lastname);
				dbms_output.put_line('Place of birth:	' || r.birthplace);
				dbms_output.put_line('Date of birth:	' || r.birthdate );
				dbms_output.put_line('Name of father:	' || r.fathersname);
				dbms_output.put_line('Name of mother:	' || r.mothersname);		
			
		end loop;
	end if;
	
	myPackage.findFamily(b);
	
	dbms_output.put_line('__________Death Records of '|| b ||':__________');
	select count(*) into c from deathrecords;
	
	if c=0 then 
		raise error_deathid;
	else 
		for r in (select * from deathrecords) loop
				
				dbms_output.put_line('Birth Registration no:	' || r.birthid);
				dbms_output.put_line('Name: 	' || r.firstname || ' ' || r.lastname);
				dbms_output.put_line('Date of birth:	' || r.birthdate );
				dbms_output.put_line('Date of death:	' || r.dyingdate);		
			
		end loop;
	end if;
	
	
	
	
			--exception for no birthid or no deathid		
	exception

	when error_birthid then
		dbms_output.put_line('This birthid does not exist.');
	
	when error_deathid then
		dbms_output.put_line('The person did not die yet.');
	
	
	
	
end;
/


--select * from deathrecords;
--P.birthid, P.firstname, P.lastname, B.birthdate, D.dyingdate 

  