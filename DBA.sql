--CRIANDO SINONIMOS PUBLICOS PARA TABELAS EM OUTRO SCHEMA
-A-CONECTE AO SYS
CREATE PUBLIC SYNONYM departamentos 
FOR hr.departments;

CREATE PUBLIC SYNONYM dept
FOR hr.departments;

SELECT * FROM departamentos;
SELECT * FROM dept;

--REMOVER SINONIMOS PUBLICOS
--conecte como DBA
DROP PUBLIC SYNONYM departamentos;
DROP PUBLIC SYNONYM dept;

