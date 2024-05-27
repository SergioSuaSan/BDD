DECLARE
    TYPE T_TABLA IS TABLE OF PLS_INTEGER;
    V_TABLA T_TABLA;
    V_RES PLS_INTEGER;
    PROCEDURE KK (P_TABLA T_TABLA, P_RES OUT PLS_INTEGER) IS
        V_I PLS_INTEGER;
    BEGIN
        P_RES := 0;
        V_I := P_TABLA.FIRST;
        WHILE V_I IS NOT NULL LOOP
            IF MOD(V_I, 2) = 0 THEN
                P_RES := P_RES + P_TABLA(V_I);
            ELSE 
                P_RES := P_RES - P_TABLA(V_I);
            END IF;
            V_I := P_TABLA.NEXT(V_I);
        END LOOP;
    END;
    
BEGIN
    V_TABLA := T_TABLA (3,4,5,6);
    V_TABLA.DELETE(2);
    KK(V_TABLA, V_RES);
    DBMS_OUTPUT.PUT_LINE(V_RES);

END;