/*
  Estrutura do bloco anônimo
  
[DECLARE
--Declaração de variaveis, constraints,
--Declaração de cursores, exceções, etc
BEGIN
--Comando SQL 
--Comandos PL/SQL
[EXCEPTION
--Tratamento de exceções
END;
*/

--EXEMPLO de bloco anonimo
SET SERVEROUTPUT ON 
DECLARE 
   vTexto VARCHAR2(100) := 'Seja bem vindo ao PL/SQL';
BEGIN
   DBMS_OUTPUT.PUT_LINE(vTexto);
EXCEPTION
   WHEN OTHERS
   THEN
   DBMS_OUTPUT.PUT_LINE('ERRO ORACLE' || SQLCODE || SQLERRM);
END; 


--Bloco anonimo que soma dois numeros e calcula a média 
SET SERVEROUTPUT ON
DECLARE 
   vnumero1 NUMBER(11,2) := 500;
   vnumero2 NUMBER(11,2) := 400;
   vmedia NUMBER(11,2);
BEGIN 
   vmedia := (vnumero1 + vnumero2) /2;
   DBMS_OUTPUT.PUT_LINE ('Média = ' || vmedia);
END;


/*
Definindo variaveis e constantes
*/
--DECLARAÇÃO DE VARIAVEL SINTAXE:
//DECLARE 
//NomeIdentificador [CONSTANTE] tipo_de_dado
//[NOT NULL] [:= |DEFALTE expressão];

//Declarando variavel do tipo NUMBER

SET SERVEROUTPUT ON 
DECLARE
   vNumero NUMBER(11, 2) := 1200.50;
BEGIN 
DBMS_OUTPUT.PUT_LINE('Numero = ' || vNumero);
END;

--Declarando variaveis do tipo CHAR E VARCHAR2
SET SERVEROUTPUT ON 
DECLARE 
  vCaracterTamFixo    CHAR(2) := 'RS';
  vCaracterTamVariavel VARCHAR2(100) := 'Porto Alegre, RS';
BEGIN 
  DBMS_OUTPUT.PUT_LINE('String Caracteres Tam Fixo = ' || vCaracterTamFixo);
  DBMS_OUTPUT.PUT_LINE('String Caracteres Tam Variável= ' || vCaracterTamVariavel);
END;

--Declarando variaveis do tipo DATE

DECLARE  
     vData1   DATE := '29/04/20';
     vData2   DATE := '29/04/2020';
BEGIN
     DBMS_OUTPUT.PUT_LINE('Data1 = ' || vData1);
     DBMS_OUTPUT.PUT_LINE('Data2 = ' || vData2);
END;


--Declarando constantes do tipo NUMBER 
SET SERVEROUTPUT ON
DECLARE
  vPi CONSTANT NUMBER(38, 15) := 3.141592653589793;
BEGIN
 DBMS_OUTPUT.PUT_LINE('Pi = ' || vPi);
END;


--Declarando constantes do tipo CHAR e VARCHAR2
SET SERVEROUTPUT ON 
DECLARE 
  vCaracterTamFixo     CONSTANT CHAR(2) := 'RS';
  vCaracterTamVariavel CONSTANT VARCHAR2(100) := 'Porto Alegre, RS';
BEGIN 
  DBMS_OUTPUT.PUT_LINE('String Caracteres Tam Fixo = ' || vCaracterTamFixo);
  DBMS_OUTPUT.PUT_LINE('String Caracteres Tam Variável= ' || vCaracterTamVariavel);
END;


/*
Declarando variaveis utilizando os principais tipos de dados 
*/

SET SERVEROUTPUT ON
DECLARE 
  vNumero              NUMBER(11, 2) := 1200.50;
  vCaracterTamFixo     CHAR(100) := 'Texto de Tamanho Fixo de até 32767 bytes';
  vCaracterTamVariavel VARCHAR2(100) := 'Texto de Tamanho Variável de até 32767 bytes';
  vBooleano            BOOLEAN := TRUE;
  vData                DATE := sysdate;
  vLong                LONG := 'Texto de Tamanho Variável de até 32767 bytes';
  vRowid               ROWID;
  vTimestamp           TIMESTAMP  := systimestamp;
  vtimestamptz         TIMESTAMP WITH TIME ZONE := systimestamp;
  vCaracterTamFixoUniversal     NCHAR(100) := 'Texto de Tamanho Fixo Universal de até 32767 bytes';
  vCaracterTamVariavelUniversal NVARCHAR2(100) := 'Texto de Tamanho Variável Universal de até 32767 bytes';
  vNumeroInteiro       BINARY_INTEGER := 1200;
  vNumeroFloat         BINARY_FLOAT   := 15000000;
  vNumeroDouble        BINARY_DOUBLE  := 15000000;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Numero = ' || vNumero);
  DBMS_OUTPUT.PUT_LINE('String Caracteres Tam Fixo = ' || vCaracterTamFixo);
  DBMS_OUTPUT.PUT_LINE('String Caracteres Tam Variável= ' || vCaracterTamVariavel);
  IF vBooleano = TRUE
  THEN 
     DBMS_OUTPUT.PUT_LINE('Booleano = ' || 'TRUE');
  ELSE 
     DBMS_OUTPUT.PUT_LINE('Booleano = ' || 'FALSE OR NULL');
  END IF;
  DBMS_OUTPUT.PUT_LINE('Data = ' || vData);
  DBMS_OUTPUT.PUT_LINE('Long = ' || vLong);
  SELECT rowid
  INTO vRowid
  FROM employees 
  WHERE first_name = 'Steven' AND last_name = 'King';
  DBMS_OUTPUT.PUT_LINE('Rowid = ' || vRowid);
  DBMS_OUTPUT.PUT_LINE('Timestamp = ' || vTimestamp);
  DBMS_OUTPUT.PUT_LINE('Timestamp with time zone = ' || vtimestamptz);
  DBMS_OUTPUT.PUT_LINE('String Caracteres de Tam Fixo = ' ||  vCaracterTamFixoUniversal);
  DBMS_OUTPUT.PUT_LINE('String Caracteres de Tam Variável = ' ||  vCaracterTamVariavelUniversal);
  DBMS_OUTPUT.PUT_LINE('Numero Interiro = ' || vNumeroInteiro);
  DBMS_OUTPUT.PUT_LINE('Numero Float    = ' || vNumeroFloat);
  DBMS_OUTPUT.PUT_LINE('Numero Double   = ' || vNumeroDouble);
END;

  
  
  
  
  
  



  





