/*
Conectar ao oracle utilizando o SQL*PLUS
sintaxe
sqlplus username/password@stringdeconexão

C:\Users\maico>mkdir curso

C:\Users\maico>cd curso

C:\Users\maico\curso>sqlplus hr/hr@xepdb1
*/


--Salvando o comando de SQL Buffer em um arquivo de script de comandos 
    SQL>SAVE exemplo01.sql



--Executando o arquivo de script de comandos 
SQL> @exemplo01.sql


--Para ir ao sistema operacional 
SQL> host

sair 
exit



--Direcione a saida da execução do comando para um arquivo SPOOL
--direcionando a saida da execução do comando para um arquivo SPOOL

SQL> SPOOL exemplo01.txt

SQL> SELECT employee_id, first_name, last_name, salary
FROM employees;

SQL> SPOOL OFF

--visualizando o arquivo spool

SQL> EDIT exemplo01.txt


--Utilizando o comando ACCEPT 

SQL> EDIT exemplo02.sql

ACCEPT pnome PROMPT 'Digite o Sobrenome do empregado:'
SELECT employee_id, first_name, last_name
FROM employees
WHERE UPPER (last_name) = UPPER('&pnome');

--Executando o arquivo script de comandos 
SQL> @exemplo02.sql

//DIGITE O ID DO EMPREGADO


--Variavel de ambiente do SQL*PLUS
SQL> show all
SQL> show verify --mostra as modificações e como estava
--executando o arquivo script de comandos 
SQL> @exemplo02.sql
SQL> SET verify OFF
--executando o arquivo script de comandos 
SQL> @exemplo02.sql

--desconectando e encerrando a sessão
 SQL> exit






















