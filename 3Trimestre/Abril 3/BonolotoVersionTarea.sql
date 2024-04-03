DECLARE
    type t_bonoloto is table of boolean index by pls_integer;
    v_bonoloto t_bonoloto;
BEGIN
    for v_i in 1..49 loop
        v_bonoloto(v_i):=false;
    end loop;

END;
/