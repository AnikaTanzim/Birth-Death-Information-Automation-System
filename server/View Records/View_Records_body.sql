create or replace package body viewRecordsPackage as

	
	
	procedure set_birthid(n_number in personal_info.birthid%type)
		IS
		
	begin
		
		n_birthid :=n_number;
		commit;
		
	end set_birthid;
	
	function get_birthid
		return personal_info.birthid%type
		IS
	begin 
		return n_birthid;
	end get_birthid;
	
		
end viewRecordsPackage;
/





