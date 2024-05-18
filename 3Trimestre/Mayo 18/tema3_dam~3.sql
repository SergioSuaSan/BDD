declare
    v_kk number;

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE KK';
    EXECUTE IMMEDIATE 'CREATE TABLE KK (COL1 number(4))';
    EXECUTE IMMEDIATE 'insert into kk values (345)';
    execute immediate 'select count(*) into V_kk from kk';
    
    
        
END;
