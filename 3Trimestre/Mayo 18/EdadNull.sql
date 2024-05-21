Create or replace trigger edad_null
before insert on empleado
for each row

begin
    if :new.edad is null then
        :new.edad := :new.numemp;
    end if;
end;