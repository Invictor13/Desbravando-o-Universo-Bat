:: ------------------------------------------------------------------------------------------------------------------------------------
:: -                                                      Script por: Victor Viana                                                    -
:: -                                                   Aula 03: Declarando Variaveis                                                  -
:: ------------------------------------------------------------------------------------------------------------------------------------

::__________________________________________________________ Aula Teórica____________________________________________________________

:: 1) O comando "SET" é responsável por criar variáveis no bat, além de atribuir valores:
::    1.1) Sintaxe Correta:   set Variavel=Valor   (ATENCAO: Sem espacos antes ou depois do '=')
::    1.2) Acessando o valor: %Variavel%

:: 2) Os Switches da variável SET:
::    2.1) Switch /A: Realiza calculos matematicos. (Ex: SET /A resultado=10*2)
::    2.2) Switch /P: Pede ao usuario para inserir um valor. (Ex: SET /P nome="Digite seu nome:")

::__________________________________________________ Código Atual ___________________________________________________________________


@ECHO OFF
TITLE AULA 03: DECLARANDO VARIAVEIS (Refatorado)
COLOR 0A

ECHO.
ECHO ------------------------------------------------------------------------------------
ECHO.
ECHO  Ola usuario da maquina, %COMPUTERNAME%!
ECHO.
ECHO ------------------------------------------------------------------------------------
ECHO.

:: CORRECAO: Espacos ao redor do '=' removidos.
SET /P NOME="Digite o seu nome: "


cls

ECHO.
ECHO ------------------------------------------------------------------------------------
ECHO.
ECHO  Seja Bem Vindo, %NOME%.
ECHO.
ECHO ------------------------------------------------------------------------------------
ECHO.

:: CORRECAO: Espacos ao redor do '=' removidos.
SET /P VALOR="Informe um valor: "


cls

ECHO.
ECHO ------------------------------------------------------------------------------------
ECHO.
ECHO  Dobrando o valor fornecido por voce!
ECHO.
ECHO ------------------------------------------------------------------------------------
ECHO.

:: CORRECAO: Espacos ao redor do '=' removidos.
SET /A DOBRO=%VALOR% * 2

:: CORRECAO: Variavel chamada com '%' no final, em vez de '$'.
ECHO O valor dobrado: %DOBRO%
ECHO.

PAUSE