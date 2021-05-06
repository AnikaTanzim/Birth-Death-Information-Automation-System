	
create or replace trigger trigger_log_1
after insert on personal_info

begin
	dbms_output.put_line('data inserted on personal_info');
end;
/

create or replace trigger trigger_log_2
after insert on birth_info

begin
	dbms_output.put_line('data inserted on birth_info');
end;
/


create or replace trigger trigger_log_3
after insert on parents_info

begin
	dbms_output.put_line('data inserted on parents_info');
end;
/


create or replace trigger trigger_log_4
after insert on address

begin
	dbms_output.put_line('data inserted on adress');
end;
/


create or replace trigger trigger_log_5
after insert on death_info

begin
	dbms_output.put_line('data inserted on death_info');
end;
/

