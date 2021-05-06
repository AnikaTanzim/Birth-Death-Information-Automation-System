create or replace package myPackage as
	
	function calculateAge(birthdate in birth_Info.birthdate%type, dyingdate in death_Info.dyingdate%type , bid in birth_Info.birthid%type)
		return number;
	
	procedure calculateCBR(n_number in number, res out number);	
	
	procedure calculateCDR(n_number in number, res out number);
	
	function calculatePopulation
		return number;
	
	function calculatePopulation1(n_number in number)
		return number;
	
	procedure findFamily( bid in birth_Info.birthid%type);
	
	
end myPackage;
/