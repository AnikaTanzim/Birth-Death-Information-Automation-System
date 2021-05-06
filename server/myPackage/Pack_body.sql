create or replace package body myPackage as


			--1 : calcualting age when system gets death information and automatically fill up the age column
	function calculateAge(birthdate in birth_Info.birthdate%type, dyingdate in death_Info.dyingdate%type , bid in birth_Info.birthid%type)
		return number
		is
		 total number(2) := 0; 
		 n_birthdate date ;
		
	begin

		--select birthdate into n_birthdate from birth_Info where birthid = bid;
		dbms_output.put_line(dyingdate);
		dbms_output.put_line(bid);
		SELECT ROUND((TO_DATE(dyingdate) - TO_DATE(birthdate))/365.25, 0) INTO total from DUAL;
		
		if TO_NUMBER(total)<0 then
			total := 100 + TO_NUMBER(total);
		end if;
		
		return TO_NUMBER(total);
		
		
	end calculateAge;
	
	
	
	
	
	
			--2: calculating CBR ( crude birth rate) by giving a selected year
	procedure calculateCBR(n_number in number, res out number)
		IS
		population number :=0;
		liveBirth number :=0;
		year number :=0;
		
	begin
		--number of live births
		--select count(birthid) into liveBirth from birth_info where birthdate in (SELECT TO_DATE('2020', 'YYYY') FROM dual);
		for r in (select birthdate from birth_info) loop
	
			SELECT EXTRACT( YEAR FROM TO_DATE( r.birthdate,  'DD-Mon-YY' ) ) YEAR  into year FROM DUAL;
						
			if year > 2020 then
				year:= year - 100;
			end if;
			
			if year = n_number then
				liveBirth := liveBirth + 1;
			end if;
	
		end loop;
			
		
		--total population 
		population:= calculatePopulation1(n_number);
		
		res := (liveBirth/ population)*1000;
		select ROUND(res, 3) into res from dual; 
		
		
	end calculateCBR;
	
	
	
	
	
			--3: calculating CDR (crude death rate) by giving a selected year
	procedure calculateCDR(n_number in number, res out number)
		IS
		population number :=0;
		totalDeath number :=0;
		year number :=0;
		
	begin
		--number of total death
		
		for r in (select dyingdate from death_info) loop
	
			SELECT EXTRACT( YEAR FROM TO_DATE( r.dyingdate,  'DD-Mon-YY' ) ) YEAR  into year FROM DUAL;
						
			if year > 2020 then
				year:= year - 100;
			end if;
			
			if year = n_number then
				totalDeath := totalDeath + 1;
			end if;
	
		end loop;
			
		
		--total population 
		population:= calculatePopulation1(n_number);
		
		res:= (totalDeath/ population)*1000 ;
		select ROUND(res, 3) into res from dual; 
		
		
		
		
	end calculateCDR;
	
	
	--4 : calcualting current population
	function calculatePopulation
		return number
		is
		 
		 population number :=0;
				
	begin
		
		select count(birthid) into population from personal_Info where birthid not in (select birthid from death_info);
		
		return population;
		
		
	end calculatePopulation;
	
	
		--5 : calcualting population by specific year
	function calculatePopulation1(n_number in number)
		return number
		is
		 
		 population number :=0;
		 year number :=0;
				
	begin
		
		-- persons who didn't die yet
		for r in (select birthdate from birth_Info where birthid not in (select birthid from death_info) ) loop
	
			SELECT EXTRACT( YEAR FROM TO_DATE( r.birthdate,  'DD-Mon-YY' ) ) YEAR  into year FROM DUAL;
						
						--year returns 2000-2099 value
			if year > 2020 then
				year:= year - 100;
			end if;
			
				--who was born before or in that year
			if year <= n_number then
				population := population + 1;
			end if;
	
		end loop;
		
		return population;
		
		
	end calculatePopulation1;
	
	--6: finding siblings and ancestors
	
	procedure findFamily( bid in birth_Info.birthid%type)
		IS
	begin
	
		dbms_output.put_line('__________Siblings of	' ||bid ||':__________');
		
		for r in
		(select birthid, firstname,lastname from personal_Info where birthid in 
		(select birthid from parents_info where fathersname in 
		(select fathersname from parents_info where birthid=bid)))
		loop
		
			if(r.birthid <> bid) then
			dbms_output.put_line(r.birthid || ':	'||r.firstname || ' ' ||r.lastname);
			end if;
			
		end loop;
		
	
	
	
	end findFamily;
	
	
	
	
end myPackage;
/