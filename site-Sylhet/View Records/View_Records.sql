create or replace view birthrecords as
select P.birthid, P.firstname, P.lastname, B.birthdate, B.birthplace , A.fathersname, A.mothersname
from personal_Info P , birth_info B, parents_Info A 
where P.birthid = B.birthid 
and B.birthid = A.birthid
and P.birthid=ViewRecordsPackage.get_birthid;



create or replace view deathrecords as
select P.birthid, P.firstname, P.lastname, B.birthdate, D.dyingdate 
from personal_Info P , birth_info B, death_Info D
where P.birthid = B.birthid 
and B.birthid = D.birthid
and P.birthid=ViewRecordsPackage.get_birthid;



