create or replace package PaqueteExamen2 as
    function biestable return pls_integer;
end PaqueteExamen2;
/
create or replace package body PaqueteExamen2 as
 v_a boolean:= true;
    function biestable return pls_integer as
   
     begin
      if v_a then      
      v_a := not v_a;
      return 1;
      else     
      v_a := not v_a;
      return 0;
      end if;
      
     end;
    
end PaqueteExamen2;
