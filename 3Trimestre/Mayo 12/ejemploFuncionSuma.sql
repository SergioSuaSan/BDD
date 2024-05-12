declare
sumando1 pls_integer;
sumando2 pls_integer;
res pls_integer;
begin  
    sumando1 := 2;
    sumando2 := 3;
    res := Fsuma(sumando1, sumando2, res);
    dbms_output.put_line(res);
end;