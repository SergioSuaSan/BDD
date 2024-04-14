--GENERA 6 NUMEROS ALEATORIOS SIN REPETIDOS DEL 1 AL 49
DECLARE
    type ArrayDeMierda is table of boolean index by pls_integer;
    v_bonoloto ArrayDeMierda;
    v_randomMax pls_integer :=49;
    v_cuantos pls_integer;
    v_random pls_integer;
    v_maximo constant pls_integer:= 6;

BEGIN
    v_cuantos:= 0;
    
    for v_i in 1..v_randomMax loop
        v_bonoloto(v_i):=false;
    end loop;
    
    while v_cuantos < v_maximo loop
       v_random:=dbms_random.value(1,v_randomMax);
        if not v_bonoloto(v_random) then
            v_bonoloto(v_random):= true;
            v_cuantos:= v_cuantos +1;
        end if;
    end loop;
    
    for v_i in 1..v_randomMax loop
        if v_bonoloto(v_i) then
            dbms_output.put_line(v_i);
        end if;
    end loop;



--    for v_i in 1..v_maximo loop
        
END;
/
