declare 
  type t_bonoloto is table of integer index by pls_integer;
  v_bonoloto t_bonoloto;
  v_random pls_integer;
  v_cuantos pls_integer := 6;
  v_MAXR constant number(2):=49;
begin
  -- Fase de inicialización
  for i in 1..v_cuantos loop
    v_bonoloto(i):=0; -- Hemos convertido en denso una colección dispersa
    --Hemos convertido un array sin datos ( o null) en un array con datos, aunque sean 0. Lo hemos rellenado
  end loop;
  -- Fase de cálculo o proceso
  for i in 1..v_cuantos loop
    v_random:=dbms_random.value(1,v_MAXR); -- Faltaría iniciar una semilla
    v_bonoloto(i):=v_random;
  end loop;
  -- Fase de impresión de resultados
  for i in 1..6 loop
    dbms_output.put_line('V['||i||']='||v_bonoloto(i));
  end loop;
end;
/