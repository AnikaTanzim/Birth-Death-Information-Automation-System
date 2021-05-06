create or replace package viewRecordsPackage as


	n_birthid personal_info.birthid%type ;
		
	function get_birthid
		return personal_info.birthid%type;
		
		
	procedure set_birthid(n_number in personal_info.birthid%type);	
	
	
	
	
end viewRecordsPackage;
/