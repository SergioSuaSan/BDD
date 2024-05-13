create or replace package PaqueteExamen as
     
    procedure mostrar;

end PaqueteExamen;
/

create or replace package body PaqueteExamen as
 v_contador pls_integer := 0;

    procedure mostrar as
        
       
        begin
            v_contador:= v_contador +1;
            dbms_output.put_line('Has ejecutado este procedimiento ' ||v_contador|| ' veces.');
        end;

end PaqueteExamen;

