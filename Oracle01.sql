/*
VISÃO - É uma representação lógica baseada em um SELECT sobre uma ou mais tabelas ousobre outas visões
      - Uma visão é um sub-conjunto lógico dos dados de uma ou mais tabelas 
      - A visão é armazenada no Dicionario de dados juntamente com o SELECT que a repreenta 
      - É um select na base do banco de dados Oracle 
*/
--CRIANDO UMA VIEW - que ficara armazenada no dicionario de dados
CREATE OR REPLACE VIEW vemployesdept60
AS SELECT employee_id, first_name, last_name, department_id, salary, commission_pct
FROM employees
WHERE department_id = 60;

DESC vemployesdept60;

SELECT * FROM vemployesdept60;

-- CRIANDO UMA VISÃO COMPLEXA - 
CREATE OR REPLACE VIEW vdepartments_total
(department_id, department_name, minsal, maxsal, avgsal)
AS SELECT e.department_id, d.department_name, MIN (e.salary),
          MAX(e.salary), AVG(e.salary)
          FROM employees e
          JOIN departments d
          ON (e.department_id = d.department_id)
          GROUP BY e.department_id, department_name;
          
SELECT * FROM vdepartments_total;


//UTILIZANDO A CLAUSULA CHECK OPTION

CREATE OR REPLACE VIEW vemployeesdept100
AS SELECT employee_id, first_name, last_name, department_id, salary
FROM employees
WHERE department_id = 100
WITH CHECK OPTION CONSTRAINT vemployeesdept100_ck;

//UTILIZANDO A CLAUSULA READ ONLY - só permite consulta 
CREATE OR REPLACE VIEW vemployeesdept20
AS SELECT employee_id, first_name, last_name, department_id, salary
FROM employees
WHERE department_id = 20
WITH READ ONLY;

//remove a VIEW 
DROP VIEW vemployeesdept20;


/*
CRIANDO E GERANDO SEQUENCIAIS 
*/

SELECT MAX (employee_id)
FROM employees;--consulta maior numero do empregado

CREATE SEQUENCE employees_seq
START WITH 208
INCREMENT BY 1 --ENCREMENTO DE 1 EM 1 
NOMAXVALUE --SEM VALOR MAXIMO
NOCACHE--SEM CACHE
NOCYCLE; --SEM VALOR MAXIMO

--DELETAR UMA SEQUENCIA 
DROP SEQUENCE employees_seq;

--CONSULTANDO SEQUENCIA QUE O USUARIO TEM PELO DICIONARIO DE DADOS 
SELECT * 
FROM user_sequences;

--RECUPERANDO PROXIMO VALOR DA SEQUENCIA 
SELECT employees_seq.NEXTVAL
FROM dual;

--RECUPERANDO O VALOR CORRENTE DA SEQUENCIA 
SELECT employees_seq.CURRVAL
FROM dual;

--UTILIZANDO UMA SEQUENCIA 
INSERT INTO employees 
            (employee_id, first_name, last_name,email, 
             phone_number, hire_date, job_id, salary,
             commission_pct, manager_id, department_id)
     VALUES (employees_seq.nextval, 'Paul', 'Simion', 'PSIMO',
             '525.342.237', TO_DATE('12/02/2020', 'DD/MM/YYYY'), 'IT_PROG', 15000,
              NULL, 103, 60);--a sequence gerou o novo id
              
SELECT * 
FROM employees
ORDER BY employee_id DESC;

COMMIT;

--Modificando a sequence - exemplo   
ALTER SEQUENCE employees_id
MAXVALUE 999999
CACHE 20;


--DELETANDO UM INDICE 
DROP INDEX emp_name_ix;
DROP INDEX employees_last_name_idx;

--SELECT 
SELECT *
FROM employees
WHERE last_name = 'Himuro';

--CRIANDO UM INDICE SIMPLES
CREATE INDEX employees_last_name_idx
ON employees(last_name);

--criando indices compostos com mais de uma coluna 
CREATE INDEX employees_last_name_first_name_idx
ON employees(last_name, first_name);

--ANALIZE O CUSTO DE COMANDO NO PLANO DE EXECUÇÃO 
SELECT *
FROM employees 
WHERE last_name  = 'Himuru' AND
      first_name = 'Guy';
      
--Recontruindo e reorganizando um indice
ALTER INDEX employees_last_name_first_name_idx REBUILD;

--consultando indices
SELECT ix.index_name,
       ic.column_position,
       ic.column_name,
       ix.index_type,
       ix.uniqueness,
       ix.status
FROM user_indexes ix
JOIN user_ind_columns ic ON (ix.index_name = ic.index_name)AND
                            (ix.table_name = ic.table_name)
WHERE ix.table_name = 'EMPLOYEES'
ORDER BY ix.index_name, ic.column_position;

--REMOVER O INDICE 
DROP INDEX employees_last_name_idx;
DROP INDEX  employees_last_name_first_name_idx;



--CRIANDO SINONIMOS PRIVADOS 
CREATE SYNONYM departamentos
FOR departments;

SELECT * FROM departamentos;

--REMOVER SINONIMOS 
DROP SYNONYM departamentos;

//somente BDA consegue criar sinonimos publicos
--CRIANDO SINONIMOS PUBLICOS PARA TABELAS EM OUTRO SCHEMA
--CONECTE AO SYS
CREATE PUBLIC SYNONYM departamentos 
FOR hr.departments;
