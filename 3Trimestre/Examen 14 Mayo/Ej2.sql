create or replace package PaqueteExamen as
    function cuantoTiempo return pls_integer;
end PaqueteExamen;
/

create or replace package body PaqueteExamen as
    v_num date;
    function cuantoTiempo return pls_integer as   
        begin
            if v_num is null then
            v_num := sysdate;
            return 0;
            else
            return (sysdate - v_num) *24*3600;
         --SYSDATE
            end if;
        end;
end PaqueteExamen;

