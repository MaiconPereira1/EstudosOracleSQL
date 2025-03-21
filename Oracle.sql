SELECT department_id, location_id FROM departments;
SELECT
     job_id,
     job_title
FROM 
     jobs;

SELECT employee_id, first_name, last_name, manager_id, salary, job_title
FROM employees, jobs;

SELECT first_name, last_name, salary, (salary + 100) * 1.15
FROM employees;

SELECT first_name, last_name, job_id, commission_pct 
FROM employees
WHERE commission_pct IS NULL;

//RENOMEAR 
SELECT first_name nome, last_name sobrenome, salary salário
FROM employees;

// use aspas duplas para escrever a primeira letra maiuscula como na comparação      
SELECT first_name "Nome", last_name "Sobrenome", salary "Salário"
FROM employees;

//concatenar 
SELECT first_name || ' ' || last_name || ', data de admissão: ' || hire_date "Funcionário"
FROM employees;

//concatenar 
SELECT first_name || ' ' || last_name || ', salário: ' || salary "Funcionário"
FROM employees;


//para usar aspas como caracter use o q[ no começo e ] no fim, assim como no exemplo 

SELECT department_name || q'[ Department's Manager Id: ]' || manager_id "Departamento e Gerente"
FROM departments;

//linhas duplicadas, usar distinct para eliminar linhas duplas 

SELECT DISTINCT department_id 
FROM employees;

SELECT DISTINCT last_name, first_name
FROM employees;


//somente exibir linhas de departamento com id 60

SELECT employee_id, last_name, job_id, department_id
FROM employees 
WHERE department_id = 60;


//String de caracter ou data são aspas simples 

SELECT employee_id, last_name, job_id, department_id
FROM employees 
WHERE job_id = 'IT_PROG';


//utilizando Strings de caractere na clausula WHERE

SELECT employee_id, last_name, job_id, department_id, hire_date
FROM employees 
WHERE last_name = 'King';

SELECT employee_id, last_name, job_id, department_id, hire_date
FROM employees 
WHERE hire_date = '30/01/04';

//Utilizando operadores de comparação na clausula WHERE

SELECT last_name, salary 
FROM employees
WHERE salary >= 10000;

//selecione faixas de valores utilizando o  operador BETWEEN

SELECT last_name, salary 
FROM employees
WHERE salary BETWEEN 10000 AND 15000.

//o operador IN permite comparar um valor com uma lista de valores

SELECT employee_id, last_name, salary, manager_id, job_id
FROM employees
WHERE job_id IN ('IT_PROG', 'FI_ACCOUNT', 'SA_REP');

//OPERADOR LIKE PARA TRABALHAR COM OBJETOS MAGICOS, CARACTERES QUE PODEM SER SUBSTITUIDOS 

SELECT first_name, last_name
FROM employees
WHERE first_name LIKE 'Sa%';

//todos cujo sobrenome seja o 'a' como segunda letra exemplo

SELECT first_name, last_name
FROM employees
WHERE last_name LIKE '_a%';

//A ultima letra seja o a 
SELECT first_name, last_name
FROM employees
WHERE last_name LIKE '%a';

//comparações com valor nulo 
SELECT last_name, manager_id
FROM employees
WHERE manager_id = NULL;

//utilizar a expressão de comparação IS NULL
SELECT last_name, manager_id
FROM employees
WHERE manager_id IS NULL;

//USANDO OOPERADOR AND onde cujo os empregados tenham as duas condições verdadeiras
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary >= 5000
AND job_id = 'IT_PROG';

//USANDO OOPERADOR OR onde cujo os empregados tenha pelo menos uma condição verdadeira
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary >= 5000
OR job_id = 'IT_PROG';

//USANDO OOPERADOR NOT EXIBE OS FUNCIONARIOS QUE NÃO ESTÃO EM NENHUM DESSES CARGOS

SELECT employee_id, last_name, salary, manager_id, job_id
FROM employees
WHERE job_id NOT IN ('IT_PROG', 'FI_ACCOUNT', 'SA_REP');

//regras de precedencia na pratica 

SELECT last_name, job_id, salary
FROM employees
WHERE job_id = 'SA_REP' OR job_id = 'IT_PROG' AND salary > 10000;

// alterar a precedencia utilizando parenteses

SELECT last_name, job_id, salary
FROM employees
WHERE (job_id = 'SA_REP' OR job_id = 'IT_PROG') AND salary > 10000;

//ordenar lista por data de admissão ascendente

SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date ASC;

// mesmo resultado 
SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date;


//ordenar lista por data de admissão Descendente

SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY hire_date DESC;

//Referenciar o ALIAS da coluna se houver

SELECT employee_id, last_name, salary*12 salario_anual
FROM employees
ORDER BY salario_anual;

//Referenciar o posição da coluna ou expessão

SELECT last_name, job_id, department_id, hire_date
FROM employees
ORDER BY 2;

//utilizando a clausula order by para multiplas colunas ou expessões 

SELECT last_name, job_id, department_id, salary
FROM employees
ORDER BY department_id DESC, salary DESC;

//utilizar variaveis de substituição = & 

SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE employee_id = &employee_id;

SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE employee_id = &&employee_id;

SELECT last_name, department_id, job_id, salary*12
FROM employees
WHERE job_id = '&job_id';

//para definir a variavel utilize DEFINE 

DEFINE employee_id = 101
SELECT employee_id, last_name, salary, department_id
FROM employees
WHERE employee_id = &employee_id;

DEFINE employee_id

//para remover use o nome da variavel 
UNDEFINE employee_id


//FUNÇÕES SINGLE E ROW


//encontrar o caracter independente de como esteja escrito, em maiusculo ou minusculo 
SELECT employee_id, last_name, department_id
FROM employees
WHERE last_name = 'KING';

SELECT employee_id, last_name, department_id
FROM employees
WHERE UPPER (last_name) = 'KING';


//funções e manipulação de caracteres

SELECT CONCAT (' Curso: ', 'Introdução ORACLE 19c'), SUBSTR('Introdução ORACLE 19c', 1, 11),
       LENGTH ('Introdução ORACLE 19c'), INSTR ('Introdução ORACLE 19c', 'ORACLE')
FROM dual;


//alinhamento em tabela

SELECT first_name "Nome", 
LPAD(first_name, 20, ' ') "Nome alinhado a direita",
RPAD(first_name, 20, ' ')"Nome alinhado a esquerda"
FROM employees;

//exemplo com REPLACE para substituir President por Presidente

SELECT job_title, REPLACE(job_title, 'President', 'Presidente') CARGO
FROM jobs
WHERE job_title = 'President';

//funções do tipo number

//arredondar 
SELECT ROUND(45.923,2), ROUND(45.923,0)
FROM dual;

//cortar sem arredondar
SELECT TRUNC(45.923,2), TRUNC(45.923,0)
FROM dual;

//Resto da divisão, sendo o primeiro o dividendo e o segundo o divisor assim exibindo o resto
SELECT MOD(1300, 600) RESTO
FROM dual;

// ABS retorna o valor absoluto e SQRT a raiz quadrada
SELECT ABS(-9), SQRT(9)
FROM dual;

//FUNÇÕES TIPO DATE

SELECT sysdate
FROM dual;


SELECT sysdate, sysdate + 30, sysdate + 60, sysdate - 30
FROM dual;

SELECT last_name, ROUND((SYSDATE-hire_date)/7,2)"SEMANAS DE TRABALHO"
FROM employees;

//outro tipo de date 

SELECT first_name, last_name, ROUND(MONTHS_BETWEEN(sysdate, hire_date),2) "MESES DE TRABALHO"
FROM employees;

SELECT SYSDATE, ADD_MONTHS(SYSDATE, 3), NEXT_DAY(SYSDATE, 'SEXTA-FEIRA'), LAST_DAY(SYSDATE)
FROM dual;

//ARREDONDAR DATA 

SELECT sysdate, ROUND(SYSDATE, 'MONTH'), ROUND(SYSDATE, 'YEAR'),
       TRUNC(SYSDATE, 'MONTH'), TRUNC(SYSDATE, 'YEAR')
       FROM dual;
  
SELECT SYSDATE, TO_CHAR(TRUNC(SYSDATE), 'DD/MM/YYYY HH24:MI:SS')
FROM dual;

//funções de conversão e expressões condicionais 

//utilizando função to_char com datas
SELECT last_name, TO_CHAR(hire_date, 'DD/MM/YYYY HH24:MI:SS') DT_ADMISSÃO
FROM employees;

SELECT sysdate, TO_CHAR(sysdate, 'DD/MM/YYYY HH24:MI:SS') DATA
FROM dual;

SELECT last_name, TO_CHAR(hire_date, 'DD, "de" Month "de" YYYY') DT_ADMISSÃO
FROM employees;

//eliminar zero a esquerda e espaços desnecessarios FMDD
SELECT last_name, TO_CHAR(hire_date, 'FMDD, "de" Month "de" YYYY') DT_ADMISSÃO
FROM employees;           

//utilizando a função   TO_CHAR com numeros
SELECT first_name, last_name, TO_CHAR(salary, 'L99G999G999D99')SALARIO
FROM employees;

//utilizando a função TO_NUMBER convertendo para numero
SELECT TO_NUMBER('12000,50')
FROM dual;

//utilizando a função TO_DATE convertendo um String de caracter para data
SELECT TO_DATE('06/02/2020', 'DD/MM/YYYY') DATA
FROM dual;

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date = TO_DATE('17/06/2003', 'DD/MM/YYYY');

//Utilizando funções aninhadas
SELECT first_name last_name, ROUND(MONTHS_BETWEEN(SYSDATE, hire_date),0) NUMERO_MESES
FROM employees
WHERE hire_date = TO_DATE('17/06/2003', 'DD/MM/YYYY');

//Utilizando a função NVL que se algum valor for nulo ele usa o segundo argumento para dar valor
SELECT last_name, salary, NVL(commission_pct, 0), salary*12 SALARIO_ANUAL, 
       (salary*12) + (salary*12*NVL(commission_pct, 0)) REMUNERACAO_ANUAL
FROM employees;

//função COALESCE retorna a primeira expressão da esquerda para a direita que for diferente de nulo
SELECT COALESCE(NULL, NULL, 'Espressão 3'), COALESCE(NULL, 'Espressão 2', 'Espressão 3'),
                COALESCE('Espressão 1', 'Espressão 2', 'Espressão 3')
FROM dual;

SELECT last_name, employee_id, commission_pct, manager_id, 
       COALESCE (TO_CHAR(commission_pct), TO_CHAR(manager_id),
       'SEM PERCENTUAL DE COMISSÃO E SEM GERENTE')
FROM employees;

//Utilizamdo a função NVL2, se o primeiro argumento for nulo ele usa o segundo ou ate o terceiro
SELECT last_name, salary, commission_pct, 
       NVL2(commission_pct, 10, 0)PERCENTUAL_ALTERADO
FROM employees;

//expressão CASE á pacerido com if e else 
SELECT last_name, job_id, salary,
                        CASE job_id
                         WHEN 'IT_PROG'
                          THEN 1.10*salary
                         WHEN 'ST_CLERK'
                          THEN 1.15*salary
                         WHEN 'SA_REP'
                          THEN 1.20*salary
                         ELSE salary
                        END "NOVO SALARIO"
FROM employees;

//função DECODE

SELECT last_name, job_id, salary,
DECODE(job_id, 'IT_PROG' , 1.10*salary,
               'ST_CLERK', 1.15*salary,
               'SA_REP'  , 1.20*salary
                         , salary)"NOVO SALARIO"
FROM   employees;

//AGREGANDO DADOS UTILIZANDO FUNÇÕES DE GRUPO

//UTILIZANDO AVG E SUM 
SELECT AVG(salary), SUM(salary)
FROM employees;

//funções MIN e MAX
SELECT MIN(hire_date), MAX(hire_date)
FROM employees;

SELECT MIN(salary), MAX(salary)
FROM employees;

//função count retorna o numero de linhas 
SELECT COUNT (*)
FROM employees;

SELECT COUNT (commission_pct)
FROM employees;

SELECT COUNT(commission_pct), COUNT(*)
FROM employees;

SELECT COUNT(NVL(commission_pct,0))
FROM employees;

//função count com distinct
SELECT  COUNT(DISTINCT department_id)
FROM employees;

SELECT  COUNT(department_id)
FROM employees;

//funções de grupo e valores NULOS
SELECT AVG(commission_pct)
FROM employees;

//tratamento de NULOS em funções de grupo
SELECT AVG(NVL(commission_pct, 0))
FROM employees;

//criar grupos utilizando a clausula GROUP BY

SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id
ORDER BY department_id;

//Utilizando a clausula Group by com mais de uma coluna ou expressão
SELECT department_id, job_id, SUM(salary)
FROM employees
GROUP BY department_id, job_id 
ORDER BY department_id, job_id ;

//consultas incorretas utilizando funções de grupo
SELECT department_id, MAX(salary)
FROM employees
WHERE MAX(salary) > 10000
GROUP BY department_id;
//corrigindo
SELECT department_id, MAX(salary)
FROM employees
GROUP BY department_id
HAVING MAX(salary) > 10000;

//sequencia logica de como entender o uso de funções de grupo
SELECT job_id, SUM(salary) TOTAL
FROM  employees
WHERE job_id <> 'SA_REP'
GROUP BY job_id
HAVING SUM(salary) > 10000 
ORDER BY SUM(salary);

//aninhar funções de grupo
//exibindo a maior media de salario por departamento
SELECT MAX(AVG(salary)
FROM employees
GROUP BY department_id;

//JOINS
//Utilizando prefixos coluna com nomes de tabela 
SELECT employees.employee_id, employees.last_name,
       employees.department_id, departments.department_name
FROM   employees JOIN departments
       ON (employees.department_id = departments.department_id);
              

//Utilizando ALIAS na tabela 
SELECT e.employee_id, e.last_name, e.department_id, d.department_name
FROM employees e JOIN departments d
ON (e.department_id = d.department_id);

//Utilizando Natural Joins
SELECT department_id, department_name, location_id, city
FROM departments
NATURAL JOIN locations;

//JOIN COM A CLAUSULA USING

SELECT e.employee_id, e.last_name, d.location_id, department_id, d.department_name
FROM employees e
 JOIN departments d USING (department_id);

//JOIN COM A CLAUSULA ON 
SELECT e.employee_id, e.last_name, e.department_id, d.department_id, d.location_id
FROM employees e JOIN departments d 
ON (e.department_id = d.department_id);

//Join com varias tabelas utilizando a clausula ON
SELECT e.employee_id, j.job_title, d.department_name, l.city, l.state_province, l.country_id
FROM employees e 
  JOIN jobs         j ON (e.job_id = j.job_id)
  JOIN departments  d ON (d.department_id = e.department_id)
  JOIN locations    l ON (d.location_id = l.location_id)
ORDER BY e.employee_id;

SELECT e.employee_id, e.last_name, e.salary, e.department_id, d.department_name 
FROM employees e JOIN departments d
ON (e.department_id = d.department_id)
WHERE (e.salary BETWEEN 10000 AND 15000);

--self Join utilizandoa clausula on 

SELECT empregado.employee_id "Id empregado", empregado.last_name "Sobrenome empregado",
       gerente.employee_id "Id gerente", gerente.Last_name "Sobrenome gerente"
FROM employees empregado JOIN employees gerente
ON (empregado.manager_id = gerente.employee_id)
        ORDER BY empregado.employee_id;

//NONEQUIJOINS
CREATE TABLE job_grades(
 grade_level VARCHAR(2) NOT NULL,
 lowest_sal  NUMBER(11, 2),
 highest_sal  NUMBER(11, 2),
 CONSTRAINT job_grades_pk PRIMARY KEY (grade_level));
 
 //inserindo linhas na tabela JOB_GRADES
 
 INSERT INTO job_grades VALUES ('A', 1000, 2999);
 INSERT INTO job_grades VALUES ('B', 3000, 5999);
 INSERT INTO job_grades VALUES ('C', 6000, 9999);
 INSERT INTO job_grades VALUES ('D', 10000, 14999);
 INSERT INTO job_grades VALUES ('E', 15000, 24999);
 INSERT INTO job_grades VALUES ('F', 25000, 40000);
 
 //efetivar transação
 COMMIT;
 
//NONEQUIJOINS  
SELECT e.employee_id, e.salary, j.grade_level, j.lowest_sal, j.highest_sal
FROM employees e
JOIN job_grades j
ON NVL(e.salary, 0) BETWEEN j.lowest_sal AND j.highest_sal
ORDER BY e.salary;

//JOIN com a clausula ON
SELECT e.employee_id, j.job_title, d.department_name, l.city, l.state_province, l.country_id
FROM employees e 
  INNER JOIN jobs         j ON (e.job_id = j.job_id)
  INNER JOIN departments  d ON (d.department_id = e.department_id)
  INNER JOIN locations    l ON (d.location_id = l.location_id)
ORDER BY e.employee_id;

//utiliza natural join *inner é opcional
SELECT department_id, department_name, location_id, city
FROM departments
NATURAL INNER JOIN locations;

SELECT department_id, department_name, location_id, city
FROM departments
NATURAL JOIN locations;

//Join com a clausula USING 
SELECT e.employee_id, e.last_name, d.location_id, department_id, d.department_name 
FROM employees e 
JOIN departments d USING (department_id);

//OUTER JOIN - left or right
SELECT e.first_name, e.last_name, d.department_id, d.department_name
FROM employees e LEFT OUTER JOIN departments d
  ON (e.department_id = d.department_id)
  ORDER BY d.department_id;
  
SELECT d.department_id, d.department_name, e.first_name, e.last_name 
FROM employees e RIGHT OUTER JOIN departments d
  ON (e.department_id = d.department_id)
  ORDER BY d.department_id;  
  
//FULL OUTER JOIN
SELECT d.department_id, d.department_name, e.first_name, e.last_name 
FROM employees e FULL OUTER JOIN departments d
  ON (e.department_id = d.department_id)
  ORDER BY d.department_id;
  
//CROSS JOIN une as tabelas 
SELECT last_name, department_name
FROM employees
CROSS JOIN departments;

//JOINS UTILIZANDO SINTAXE ORACLE 
//EQUIJOIN--sintaxe
--SELECT tabela1.coluna, tabela2.coluna...
--FROM tabela1, tabela2
--WHERE tabela1.coluna = tabela2.coluna; 
SELECT e.employee_id, e.last_name, e.department_id, d.department_id, d.location_id
FROM employees e, departments d
WHERE e.department_id = d.department_id
ORDER BY e.department_id;

--JOIN ENTRE VARIAS TABELAS UTILIZANDO A SINTAXE ORACLE
SELECT e.employee_id, j.job_title, d.department_name, l.city, l.state_province, l.country_id
FROM employees e,
     jobs j,
     departments d,
     locations l
WHERE e.job_id = j.job_id               AND
      d.department_id = e.department_id AND
      d.location_id = l.location_id
ORDER BY e.employee_id;  
  
--incluindo condições adicionais a condição de JOIN utilizando AND
SELECT e.employee_id, e.salary, j.job_title,
       d.department_name, l.city, l.state_province, l.country_id
FROM employees e,
     jobs j,
     departments d,
     locations l
WHERE e.job_id = j.job_id               AND
      d.department_id = e.department_id AND
      d.location_id = l.location_id     AND
      e.salary >= 1000
ORDER BY e.employee_id;  
  
--NONEQUIJOIN UTILIZANDO A SINTAXE ORACLE
SELECT e.employee_id, e.salary, j.grade_level,
         j.lowest_sal, j.highest_sal
FROM employees e, 
       job_grades j 
WHERE NVL(e.salary,0) BETWEEN  j.lowest_sal AND j.highest_sal
      ORDER BY e.salary;
      
--OUTER JOIN UTILIZANDO SINTAXE ORACLE      
SELECT e.first_name, e.last_name, d.department_id, d.department_name
FROM employees e,
     departments d 
WHERE e.department_id = d.department_id(+)
ORDER BY e.department_id;

SELECT e.first_name, e.last_name, d.department_id, d.department_name
FROM employees e,
     departments d 
WHERE e.department_id(+) = d.department_id
ORDER BY e.first_name;  

--SELF-JOIN UTILIZANDO SINTAXE ORACLE 
SELECT empregado.employee_id "Id do empregado", empregado.last_name "Sobrenome do empregado", 
       gerente.employee_id "Id do gerente", gerente.last_name "Sobrenome do gerente"
FROM employees empregado,
     employees gerente
WHERE empregado.manager_id = gerente.employee_id
ORDER BY empregado.employee_id;

--OUTER JOIN UTILIZANDO SINTAXE ORACLE 
SELECT empregado.employee_id "Id do empregado", empregado.last_name "Sobrenome do empregado", 
       gerente.employee_id "Id do gerente", gerente.last_name "Sobrenome do gerente"
FROM employees empregado,
     employees gerente
WHERE empregado.manager_id = gerente.employee_id(+)
ORDER BY empregado.employee_id;

--PRODUTO CARTESIANO 
SELECT e.employee_id, e.first_name, e.last_name, j.job_id, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id ;

--SINTAXE DE SUB-CONSULTA single-row, só funcionarios onde o salario for maior que a média
SELECT first_name, last_name, job_id, salary
FROM employees
WHERE salary > 
               (SELECT AVG(NVL(salary,0))
                 FROM employees);

--Utilizando sub-consultas na clausula HAVING maior salario menor que a média 
SELECT e1.department_id, MAX(e1.salary)
FROM employees e1
GROUP BY e1.department_id
HAVING MAX(salary) <
                     (SELECT AVG(e2.salary)
                     FROM employees e2); 
                     
-- sub-consultas multiple-row  
--utilizando operador IN
SELECT employee_id, first_name, last_name
FROM employees
WHERE salary IN 
               (SELECT AVG(NVL(salary, 0))
               FROM   employees
               GROUP BY department_id);

--para os que não estão dentro da lista 
SELECT employee_id, first_name, last_name
FROM employees
WHERE salary NOT IN 
               (SELECT AVG(NVL(salary, 0))
               FROM   employees
               GROUP BY department_id);

--ANY é qualquer coisa para o resultado da sub-consulta
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ANY 
                    (SELECT AVG(NVL(salary, 0))
                    FROM employees
                    WHERE job_id = 'IT_PROG');    

--Utilizando o operador ALL em sub-consultas Multiple-row
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ALL 
                    (SELECT salary
                     FROM employees
                     WHERE job_id = 'IT_PROG'); 
                     
--cuidados com valores null em uma sub-consulta com operador IN
SELECT emp.employee_id, emp.last_name
FROM employees emp
WHERE emp.employee_id IN 
                      (SELECT mgr.manager_id
                       FROM employees mgr);

--cuidados com valores null em uma sub-consulta com operador NOT IN
SELECT emp.employee_id, emp.last_name
FROM employees emp
WHERE emp.employee_id  NOT IN 
                      (SELECT mgr.manager_id
                       FROM employees mgr);//não retornara nada

--utilizando operador EXISTS
SELECT d.department_id, d.department_name
FROM departments d
WHERE EXISTS 
         (SELECT e.department_id
          FROM   employees e
          WHERE  d.department_id = e.department_id);
                       
--utilizando operador NOT EXISTS
SELECT d.department_id, d.department_name
FROM departments d
WHERE NOT EXISTS 
         (SELECT e.department_id
          FROM   employees e
          WHERE  d.department_id = e.department_id);
          
//utilizando sub-consultas correlacionadadas
SELECT e1.employee_id, e1.first_name, e1.last_name, e1.department_id, e1 .salary
FROM employees e1 
WHERE e1.salary >=
                  (SELECT TRUNC(AVG(NVL(salary,0)),0)
                   FROM employees e2
                   WHERE e1.department_id = e2.department_id);
                                
                                                   
//utilizando sub-consultas multiple-column
SELECT e1.employee_id, e1.first_name, e1.last_name, e1.job_id, e1 .salary
FROM employees e1 
WHERE (e1.job_id, e1.salary) IN 
                              (SELECT e2.job_id, MAX (e2.salary)
                               FROM employees e2
                               GROUP BY e2.job_id);

//sub-consultas na clausula from                            
SELECT empregados.employee_id, empregados.first_name, empregados.last_name, empregados.job_id,
       empregados.salary, ROUND(MAX_salary_job.max_salary,2)MAX_SALARY,
       empregados.salary - ROUND(max_salary_job.max_salary, 2) DIFERENÇA
FROM employees empregados
   LEFT JOIN (SELECT e2.job_id, MAX(e2.salary) max_salary
              FROM employees e2
              GROUP BY e2.job_id)max_salary_job
              ON empregados.job_id = max_salary_job.job_id;  


//OPERADORES SET

//OPERADOR UNION 
SELECT employee_id, job_id, hire_date, salary
FROM employees
WHERE department_id IN (60, 90, 100)
UNION 
SELECT employee_id, job_id, hire_date, salary
FROM employees
WHERE job_id = 'IT_PROG'
ORDER BY employee_id;// o order by só ordena o resultado              
//resultado do primeiro select eliminando linhas duplicadas

//OPERADOR UNION ALL
SELECT employee_id, job_id, hire_date, salary
FROM employees
WHERE job_id = 'IT_PROG'
UNION ALL
SELECT employee_id, job_id, hire_date, salary
FROM employees
WHERE department_id = 60
ORDER BY employee_id;
//resultado mantem linhas duplicadas **é mais rapido

//OPERADOR INTERSECT 
SELECT employee_id, job_id
FROM employees
WHERE job_id = 'IT_PROG'
INTERSECT 
SELECT employee_id, job_id
FROM employees
WHERE department_id IN (60, 90, 100)
ORDER BY employee_id;//resultado mantem linhas em comum

//UTILIZANDO O OPERADOR MINUS
SELECT employee_id, job_id
FROM employees
WHERE department_id IN (60, 90, 100)
MINUS 
SELECT employee_id, job_id
FROM employees
WHERE job_id = 'IT_PROG'
ORDER BY employee_id;//retornar as linhas do primeiro select que não estão no segundo select
        
        
//COMANDOS DML - MANIPULAÇÃO DE DADOS  
/*
SELECT, INSERT, UPDATE, DELETE
*/

desc departments//consutar tabela
//INSERT 
INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES (280, 'Project Management', 103, 1400) ;

//INSERT com valores nullos - Método Explicito
INSERT INTO departments
VALUES (290, 'Data Science', null, null) ;

INSERT INTO departments
VALUES (301, 'Inovation', null, null) ;

//INSERT com valores nullos - Método Implicito
INSERT INTO departments (department_id, department_name)
VALUES (300, 'Business Intelligence') ;

INSERT INTO departments (department_id, department_name)
VALUES (302, 'IOT') ;

COMMIT;//salvar

--inserindo valores especiais retornados de funções 
INSERT INTO employees
           (employee_id, first_name, last_name, email, 
            phone_number, hire_date, job_id, salary,
            commission_pct, manager_id, department_id)
    VALUES (207, 'Rock', 'Bolboa', 'DROK',
            '525.342.237', SYSDATE, 'IT_PROG', 7000,
            NULL, 103, 60);
            
--inserindo utilizando data e hora especificas
INSERT INTO employees
           (employee_id, first_name, last_name, email, 
            phone_number, hire_date, job_id, salary,
            commission_pct, manager_id, department_id)
    VALUES (208, 'Vito', 'Corleone', 'VCORL',
            '525.342.237', TO_DATE('11/02/2020', 'DD/MM/YYYY'), 'IT_PROG', 20000,
            NULL, 103, 60);
            
SELECT * 
FROM employees ORDER BY employee_id DESC;//consulta 

COMMIT;

--Utilizando variaveis de substituição 
INSERT INTO departments 
(department_id, department_name, location_id)
VALUES (&department_id, '&department_name', &location);

SELECT * 
FROM departments ORDER BY department_id DESC;

COMMIT;//efetivar transação 

--Inserir linhas a partir de uma sub-consulta 

DROP TABLE sales_reps;//deletar tabela

CREATE TABLE sales_reps(
id NUMBER(6, 0),
name VARCHAR(20),
salary NUMBER(8, 2),
commission_pct NUMBER(2,2));

INSERT INTO sales_reps(id, name, salary, commission_pct)
SELECT employee_id, last_name, salary, commission_pct
FROM employees
WHERE job_id = 'SA_REP';

COMMIT; 

SELECT * 
FROM sales_reps;

--COMANDO UPDATE PARA ALTERAR DADOS DA TABELA

//errado
UPDATE employees
SET salary = salary * 1.2;

ROLLBACK;//desfazer transação 

//corrigindo
UPDATE employees
SET salary = salary * 1.2
WHERE last_name = 'King';

COMMIT;

SELECT * FROM employees 
WHERE last_name = 'King';



//UTILIZANDO O COMANDO UPDATE COM SUB-CONSULTAS
UPDATE employees
SET job_id = (SELECT job_id
              FROM employees
              WHERE employee_id = 139),
    salary = (SELECT salary
              FROM employees
              WHERE employee_id = 139)
WHERE employee_id = 140;

COMMIT;

--UTILIZANDO COMANDO DELETE
DELETE FROM countries
WHERE country_name = 'Nigeria';

ROLLBACK;

/*
CRIANDO SAVEPOINT
*/

DELETE FROM employees
WHERE employee_id IN (207, 208);

COMMIT;

INSERT INTO employees
           (employee_id, first_name, last_name, email, 
            phone_number, hire_date, job_id, salary,
            commission_pct, manager_id, department_id)
    VALUES (207, 'Rock', 'Bolboa', 'DROCK',
            '525.342.237', SYSDATE, 'IT_PROG', 7000,
            NULL, 103, 60);
            
      
SAVEPOINT A;//PONTO SALVAMENTO
            

INSERT INTO employees
           (employee_id, first_name, last_name, email, 
            phone_number, hire_date, job_id, salary,
            commission_pct, manager_id, department_id)
    VALUES (208, 'Vito', 'Corleone', 'VCORL',
            '525.342.237', TO_DATE('11/02/2020', 'DD/MM/YYYY'), 'IT_PROG', 20000,
            NULL, 103, 60);
            
            
ROLLBACK TO SAVEPOINT A;//DESFAZER TUDO QUE FOI FEITO A PARTIR DO SAVEPOINT A

COMMIT;

SELECT *
FROM employees
ORDER BY employee_id DESC;//na consulta nota-se que só ficou o Rock e o Vito não


//CLAUSULA FOR UPDATE NO COMANDO SELECT garante que ninguem, altere a tabela enquanto eu estiver alterando ou consultando
SELECT employee_id, salary , commission_pct, job_id
FROM employees
WHERE job_id = 'SA_REP'
FOR UPDATE
ORDER BY employee_id;

COMMIT;

SELECT e.employee_id, e.salary, e.commission_pct
FROM employees e JOIN departments d
USING (department_id)
WHERE job_id = 'ST_CLERK'
AND location_id = 1500
FOR UPDATE of e.salary
ORDER BY e.employee_id;

COMMIT;

//COMANDOS DDL 
--Pesquisar objetos 
SELECT * 
FROM user_objects
ORDER BY object_type;


/*
REFERENCIANDO TABELAS DE OUTROS USUARIOS

SELECT *                                       SELECT *
FROM userB.employees;                          FROM userA.employees;

*/

DROP TABLE projects;

CREATE TABLE projects(
project_id      NUMBER(6)   NOT NULL,
project_code    VARCHAR2(10)  NOT NULL,
project_name    VARCHAR2(100) NOT NULL,
CREATION_DATE   DATE DEFAULT sysdate NOT NULL,
START_DATE      DATE,
END_DATE        DATE,
STATUS          VARCHAR2(20)    NOT NULL,
PRIORITY        VARCHAR2(10)    NOT NULL,
BUDGET          NUMBER  (11, 2) NOT NULL,
DESCRIPTION     VARCHAR2(400)   NOT NULL
);

DESC projects;//ver a estrutura da tabela

SELECT * FROM projects;//consultar tabelas

CREATE TABLE TEAMS (
project_id  NUMBER(6) NOT NULL,
employee_id NUMBER(6) NOT NULL
);

DESC TEAMS;

--TIPO ROWID endereço logico da linha 
SELECT employee_id, first_name, rowid, LENGTH(rowid)
FROM employees;

--consultando tabelas existentes pelo dicionario de dados 
SELECT table_name
FROM user_tables;

/*
DRIANDO TABELA A PARTIR DE UMA SUB-CONSULTA
*/
CREATE TABLE employees_department60
AS
SELECT employee_id, last_name, salary*12 ANNSAL, hire_date
FROM employees 
WHERE department_id = 60;

SELECT * FROM employees_department60;

/*
COMANDO TRUNCATE TABLE --Não tem volta  
*/
/*
DROP TABLE removendo tabelas mesmo que estaja com(constraints)
DROP TABLE nometabela [CASCADE
CONSTRAINTS]
[PURGE];
*/
DROP TABLE employees_department60;//apagar tabela 

//consultar lixeira 
SELECT * FROM user_recyclebin;


/*
ALTERAR ESTRUTURA DA TABELA COM ALTER TABLE 
*/

--adicionar colunas
ALTER TABLE projects 
ADD (department_id NUMBER(3)NOT NULL);

SELECT * FROM employees_department60;

--remover coluna 
ALTER TABLE projects 
DROP COLUMN department_id; 

DESC projects;

--modificar colunas 
ALTER TABLE projects 
MODIFY (project_code VARCHAR2(6));

DESC projects;

--renomear coluna 
ALTER TABLE projects
RENAME COLUMN project_name TO name;

DESC projects;

--ALTER TABLE - READ ONLY - NÃO PERMITINDO COMANDOS DDL OU DML
ALTER TABLE employees READ ONLY;

--ALTER TABLE - READ WRITE -PERMITINDO COMANDOS DDL OU DML
ALTER TABLE employees READ WRITE;


/*
CONSTRAINTS
NOT NULL
UNIQUE
PRIMARY KEY
FOREIGN KEY
CHECK
*/
/*
CRIANDO E GERENCIANDO CONSTRAINTS 
*/

--DEFININDO CONSTRAINTS A NIVEL DE TABELA - NOT NULL
DROP TABLE projects;


CREATE TABLE projects(
project_id      NUMBER(6)     NOT NULL,
project_code    VARCHAR2(10)  NOT NULL,
project_name    VARCHAR2(100) NOT NULL,
department_id   NUMBER(4)     NOT NULL, 
CREATION_DATE   DATE DEFAULT sysdate NOT NULL,
START_DATE      DATE,
END_DATE        DATE,
STATUS          VARCHAR2(20)    NOT NULL,
PRIORITY        VARCHAR2(10)    NOT NULL,
BUDGET          NUMBER  (11, 2) NOT NULL,
DESCRIPTION     VARCHAR2(400)   NOT NULL
);

--DEFININDO CONSTRAINTS A NIVEL DE TABELA - PRIMARY KEY
CREATE TABLE projects(
project_id      NUMBER(6)     NOT NULL
CONSTRAINT projects_project_id_pk PRIMARY KEY,
project_code    VARCHAR2(10)  NOT NULL,
project_name    VARCHAR2(100) NOT NULL,
department_id   NUMBER(4)     NOT NULL, 
CREATION_DATE   DATE DEFAULT sysdate NOT NULL,
START_DATE      DATE,
END_DATE        DATE,
STATUS          VARCHAR2(20)    NOT NULL,
PRIORITY        VARCHAR2(10)    NOT NULL,
BUDGET          NUMBER  (11, 2) NOT NULL,
DESCRIPTION     VARCHAR2(400)   NOT NULL
);

--DEFININDO CONSTRAINTS A NIVEL DE TABELA - PRIMARY KEY
CREATE TABLE projects(
project_id      NUMBER(6)     NOT NULL
CONSTRAINT projects_project_id_pk PRIMARY KEY,
project_code    VARCHAR2(10)  NOT NULL,
project_name    VARCHAR2(100) NOT NULL,
department_id   NUMBER(4)     NOT NULL, 
CREATION_DATE   DATE DEFAULT sysdate NOT NULL,
START_DATE      DATE,
END_DATE        DATE,
STATUS          VARCHAR2(20)    NOT NULL,
PRIORITY        VARCHAR2(10)    NOT NULL,
BUDGET          NUMBER  (11, 2) NOT NULL,
DESCRIPTION     VARCHAR2(400)   NOT NULL
);

--DEFININDO CONSTRAINTS A NIVEL DE TABELA - PRIMARY KEY A NIVEL DE TABELA 
CREATE TABLE projects(
project_id      NUMBER(6)     NOT NULL,
project_code    VARCHAR2(10)  NOT NULL,
project_name    VARCHAR2(100) NOT NULL,
department_id   NUMBER(4)     NOT NULL, 
CREATION_DATE   DATE DEFAULT sysdate NOT NULL,
START_DATE      DATE,
END_DATE        DATE,
STATUS          VARCHAR2(20)    NOT NULL,
PRIORITY        VARCHAR2(10)    NOT NULL,
BUDGET          NUMBER  (11, 2) NOT NULL,
DESCRIPTION     VARCHAR2(400)   NOT NULL,
CONSTRAINT projects_project_id_pk PRIMARY KEY(project_id)
--CONSTRAINT projects_project_id_pk PRIMARY KEY(project_id, colunax, colunay)caso fosse composta de varias colunas
);

--DEFININDO CONSTRAINTS A NIVEL DE TABELA - UNIQUE A NIVEL DE COLUNA 
CREATE TABLE projects(
project_id      NUMBER(6)     NOT NULL
CONSTRAINT projects_project_id_pk PRIMARY KEY,
project_code    VARCHAR2(10)  NOT NULL
CONSTRAINT projects_project_code_uk UNIQUE,
project_name    VARCHAR2(100) NOT NULL,
department_id   NUMBER(4)     NOT NULL, 
CREATION_DATE   DATE DEFAULT sysdate NOT NULL,
START_DATE      DATE,
END_DATE        DATE,
STATUS          VARCHAR2(20)    NOT NULL,
PRIORITY        VARCHAR2(10)    NOT NULL,
BUDGET          NUMBER  (11, 2) NOT NULL,
DESCRIPTION     VARCHAR2(400)   NOT NULL
);

--DEFININDO CONSTRAINTS A NIVEL DE TABELA - UNIQUE A NIVEL DE TABELA
CREATE TABLE projects(
project_id      NUMBER(6)     NOT NULL,
project_code    VARCHAR2(10)  NOT NULL,
project_name    VARCHAR2(100) NOT NULL,
department_id   NUMBER(4)     NOT NULL, 
CREATION_DATE   DATE DEFAULT sysdate NOT NULL,
START_DATE      DATE,
END_DATE        DATE,
STATUS          VARCHAR2(20)    NOT NULL,
PRIORITY        VARCHAR2(10)    NOT NULL,
BUDGET          NUMBER  (11, 2) NOT NULL,
DESCRIPTION     VARCHAR2(400)   NOT NULL,
CONSTRAINT projects_project_id_pk PRIMARY KEY(project_id),
CONSTRAINT projects_project_code_uk UNIQUE(project_code)
);

DROP TABLE TEAMS;

--DEFININDO CONSTRAINTS A NIVEL DE TABELA - FOREIGN KEY A NIVEL DE COLUNA
CREATE TABLE projects(
project_id      NUMBER(6)     NOT NULL
CONSTRAINT projects_project_id_pk PRIMARY KEY,
project_code    VARCHAR2(10)  NOT NULL
CONSTRAINT projects_project_code_uk UNIQUE,
project_name    VARCHAR2(100) NOT NULL,
department_id   NUMBER(4)     NOT NULL
CONSTRAINTS projects_department_id_fk REFERENCES departments(department_id),
CREATION_DATE   DATE DEFAULT sysdate NOT NULL,
START_DATE      DATE,
END_DATE        DATE,
STATUS          VARCHAR2(20)    NOT NULL,
PRIORITY        VARCHAR2(10)    NOT NULL,
BUDGET          NUMBER  (11, 2) NOT NULL,
DESCRIPTION     VARCHAR2(400)   NOT NULL
);

--DEFININDO CONSTRAINTS A NIVEL DE TABELA - FOREIGN KEY A NIVEL DE TABELA
CREATE TABLE projects(
project_id      NUMBER(6)     NOT NULL,
project_code    VARCHAR2(10)  NOT NULL,
project_name    VARCHAR2(100) NOT NULL,
department_id   NUMBER(4)     NOT NULL, 
CREATION_DATE   DATE DEFAULT sysdate NOT NULL,
START_DATE      DATE,
END_DATE        DATE,
STATUS          VARCHAR2(20)    NOT NULL,
PRIORITY        VARCHAR2(10)    NOT NULL,
BUDGET          NUMBER  (11, 2) NOT NULL,
DESCRIPTION     VARCHAR2(400)   NOT NULL,
CONSTRAINT  projects_project_id_pk    PRIMARY KEY(project_id),
CONSTRAINT  projects_project_code_uk  UNIQUE(project_code),
CONSTRAINTS projects_department_id_fk FOREIGN KEY(department_id)
REFERENCES  departments(department_id)
);

--FOREIGN KEY - REGRAS DE DELEÇÃO - Default no action
CREATE TABLE TEAMS(
project_id  NUMBER(6)  NOT NULL,
employee_id NUMBER(6)  NOT NULL,
CONSTRAINT teams_project_id_fk FOREIGN KEY (project_id)
REFERENCES projects(project_id),
CONSTRAINT teams_employee_id_fk FOREIGN KEY (employee_id)
REFERENCES employees(employee_id)
);

--FOREIGN KEY - REGRAS DE DELEÇÃO - ON DELETE CASCADE - pouco usado pois deleta sem perguntar
CREATE TABLE TEAMS(
project_id  NUMBER(6)  NOT NULL,
employee_id NUMBER(6)  NOT NULL,
CONSTRAINT teams_project_id_fk FOREIGN KEY (project_id)
REFERENCES projects(project_id) ON DELETE CASCADE,
CONSTRAINT teams_employee_id_fk FOREIGN KEY (employee_id)
REFERENCES employees(employee_id)
);
DROP TABLE TEAMS;

--FOREIGN KEY - REGRAS DE DELEÇÃO - ON DELETE SET NULL - pouco usado pois precisa permitir nulo
CREATE TABLE TEAMS(
project_id  NUMBER(6),
employee_id NUMBER(6)  NOT NULL,
CONSTRAINT teams_project_id_fk FOREIGN KEY (project_id)
REFERENCES projects(project_id) ON DELETE SET NULL,
CONSTRAINT teams_employee_id_fk FOREIGN KEY (employee_id)
REFERENCES employees(employee_id)
);

/*
CONSTRAINT CHECK define uma condição que cada linha deve satisfazer
EXPRESSÕES PERMITIDAS:
CURRVAL
NEXTVAL
LEVEL 
ROWNUM
*/

--Oracle Functions - não podem ser referenciadas nas constraint CHECK
SELECT uid, userenv('language'), user, sysdate
FROM dual;

--rownum retorna a numeração sequencial da saida do select 
SELECT employee_id, first_name, rownum
FROM employees;

--Definindo uma CHEKE constraint a nivel de coluna
DROP TABLE projects CASCADE CONSTRAINTS;--APAGAR TABELA mesmo que esteja com cheves estrangeiras

CREATE TABLE projects(
project_id      NUMBER(6)     NOT NULL
CONSTRAINT projects_project_id_pk PRIMARY KEY,
project_code    VARCHAR2(10)  NOT NULL
CONSTRAINT projects_project_code_uk UNIQUE,
project_name    VARCHAR2(100) NOT NULL,
department_id   NUMBER(4)     NOT NULL, 
CREATION_DATE   DATE DEFAULT sysdate NOT NULL,
START_DATE      DATE,
END_DATE        DATE,
STATUS          VARCHAR2(20)    NOT NULL,
PRIORITY        VARCHAR2(10)    NOT NULL,
BUDGET          NUMBER  (11, 2) NOT NULL
CONSTRAINT projects_budget_ck CHECK (budget > 0),
DESCRIPTION     VARCHAR2(400)   NOT NULL
);

--Definindo uma CHEKE constraint a nivel de tabela
CREATE TABLE projects(
project_id      NUMBER(6)     NOT NULL,
project_code    VARCHAR2(10)  NOT NULL,
project_name    VARCHAR2(100) NOT NULL,
department_id   NUMBER(4)     NOT NULL, 
CREATION_DATE   DATE DEFAULT sysdate NOT NULL,
START_DATE      DATE,
END_DATE        DATE,
STATUS          VARCHAR2(20)    NOT NULL,
PRIORITY        VARCHAR2(10)    NOT NULL,
BUDGET          NUMBER  (11, 2) NOT NULL,
DESCRIPTION     VARCHAR2(400)   NOT NULL,
CONSTRAINT  projects_project_id_pk    PRIMARY KEY(project_id),
CONSTRAINT  projects_project_code_uk  UNIQUE(project_code),
CONSTRAINTS projects_department_id_fk FOREIGN KEY(department_id)
REFERENCES  departments(department_id),
CONSTRAINT  projects_budget_ck CHECK (budget > 0)
);

--UMA VEZ DEFINIDO UMA CONSTRAINT NINGUEM CONSEGUI VIOLAR EX: --erro
INSERT INTO projects(
   project_id, project_code, project_name, department_id,
   creation_date, start_date, end_date, status, priority, 
   budget, description)
   VALUES (
   1, 'ERPIMP', 'ERP Implementation', 77,
   sysdate, null, null, 'Aproved', 'HIGH', 
   1000000.00, 'Oracle ERP Implementation');
   
--PARA CORRIGIR É NECESSARIOINSERIR UM CODIGO DE DEPARTAMENTO QUE EXTSTA --corrigindo
INSERT INTO projects(
   project_id, project_code, project_name, department_id,
   creation_date, start_date, end_date, status, priority, 
   budget, description)
   VALUES (
   1, 'ERPIMP', 'ERP Implementation', 60,
   sysdate, null, null, 'Aproved', 'HIGH', 
   1000000.00, 'Oracle ERP Implementation');
   
COMMIT;

--consultar constraints pelo dicionario de dados 
DESC user_constraints;

DESC user_cons_columns;//coluna que compões as constraints


--consultar as constraints da tabela PROJECTS pelo dicionario de dados  
SELECT co.constraint_name, 
       co.constraint_type, 
       co.search_condition,
       co.r_constraint_name,
       co.delete_rule,
       cc.column_name, 
       cc.position, 
       co.status
FROM user_constraints  co
JOIN user_cons_columns cc ON (co.constraint_name = cc.constraint_name) AND
                             (co.table_name = cc.table_name)
WHERE co.table_name = 'PROJECTS'
ORDER BY co.constraint_name,
         cc.position;
   
--PARA REMOVER CONSTRAINTS DE UMA TABELA MESMO QUE TENHA REFERENCIAS EM OUTRA TABELA

ALTER TABLE projects 
DROP CONSTRAINT projects_department_id_fk;

--REMOVER MESMO QUE TENHA REFERENCIAS 
ALTER TABLE projects 
DROP CONSTRAINT projects_project_id_pk CASCADE;

--ADICIONAR UMA CONSTRAINT EM UMA TABELA;
ALTER TABLE projects
ADD CONSTRAINT projects_department_id_fk FOREIGN KEY (department_id)      
REFERENCES departments(department_id);

ALTER TABLE projects
ADD CONSTRAINT projects_project_id_pk PRIMARY KEY (project_id);

--DESABILITANDO UMA CONSTRAINT 
ALTER TABLE projects
DISABLE CONSTRAINT projects_department_id_fk;

ALTER TABLE projects
DISABLE CONSTRAINT projects_project_id_pk CASCADE;

--HABILITAR UMA CONSTRAINT 
ALTER TABLE projects
ENABLE CONSTRAINT projects_department_id_fk;

ALTER TABLE projects
ENABLE CONSTRAINT projects_project_id_pk;















