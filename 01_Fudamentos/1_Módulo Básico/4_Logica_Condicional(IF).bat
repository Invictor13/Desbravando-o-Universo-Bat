:: ------------------------------------------------------------------------------------------------------------------------------------
:: -                                                      Script por: Victor Viana                                                    -
:: -                                                       Aula 04: Condicionais                                                      -
:: ------------------------------------------------------------------------------------------------------------------------------------

::_____________________________________________________________ Aula Teórica____________________________________________________________

:: 1) Sintaxe do "IF"
::	1.1) O comando IF avalia se uma condição é verdadeira. Se for, ele executa uma ação.
::	1.2) O comando ELSE deve, obrigatoriamente, estar na mesma linha que o parêntese de fechamento ")" do bloco IF.

:: 2) Switch de Otimização "/I": Usado para fazer uma comparação que ignora se as letras são maiúsculas ou minúsculas (case-insensitive).

:: 3) Comparação Numérica:
::	3.1) EQU - Igual (Equals)
::	3.2) NEQ - Diferente (Not Equals)
::	3.3) LSS - Menor que (Less Than)
::	3.4) LEQ - Menor ou igual que (Less or Equal)
::	3.5) GTR - Maior que (Greater Than)
::	3.6) GEQ - Maior ou igual que (Greater or Equal)

::_____________________________________________________ Código Atual ___________________________________________________________________

@ECHO OFF
TITLE AULA 04: CONDICIONAIS
COLOR 0A
SET SENHA=teste


ECHO.
ECHO *************************************************************************************
ECHO *											  
ECHO    Seja bem vindo, %USERNAME%.
ECHO 	Para prosseguir com o sistema, informe a senha de seguranca:
ECHO *											     
ECHO *************************************************************************************
ECHO.

set /P USERSENHA="Digite a Senha:"
ECHO.

IF /I "%SENHA%"=="%USERSENHA%" (
	REM CONDICIONAL CASO POSITIVO
	ECHO Acesso liberado!

) ELSE (
	REM CONDICIONAL CASO NEGATIVO
	ECHO ACESSO NEGADO!
)


ECHO.
ECHO Senha_do_sistema: %SENHA%
ECHO Senha_Informada: %USERSENHA%
ECHO.
PAUSE