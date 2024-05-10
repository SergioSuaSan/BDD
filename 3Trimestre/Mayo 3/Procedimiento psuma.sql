DECLARE
    v_op1 number(2);
    v_op2 number(2);
    v_res number(2);

BEGIN
    dbms_output.put_line('Hola');
    v_op1:= 5;
    v_op2 := 3;
    psuma(v_op1,v_op2,v_res);
    dbms_output.put_line(v_res);
END;
/