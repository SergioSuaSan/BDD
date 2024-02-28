select to_char(sysdate,'dd/mm/yyyy hh24:mi:ss') sistema,
to_char(trunc(sysdate),'dd/mm/yyyy hh24:mi:ss') modificado 
from dual;