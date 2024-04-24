DECLARE
    v_Alojamiento Alojamiento%rowtype;
    v_resp Alojamiento.responsable%type;
    Cursor c_Alojamiento is
        select responsable
        from Alojamiento
        for update of responsable nowait;
BEGIN
    dbms_output.put_line('kjhsaflaskjdfa');
    Open c_alojamiento;
    Loop
        Fetch c_alojamiento into v_resp;
        Exit when c_alojamiento%notfound;
        v_resp:=trim(v_resp)||'S';
        update Alojamiento
        set responsable =v_resp
        where current of c_alojamiento;
        dbms_output.put_line(trim(v_resp));
    End loop;
    close c_alojamiento;
    
    
END;
/

rollback;