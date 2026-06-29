::-------------------------------------------------
:: Script por: Victor Viana
:: Aula 01: Introducao ao bat
::-------------------------------------------------

::__________________________________________________ Aula Teórica ___________________________________________________________________

:: 1) Introducao a comentarios:
:: 1.1) Ao iniciar a linha com "::" ou "rem", você estará criando comentários no bat.
:: 1.2) Os comentários não são exibidos na tela execução.


:: 2) Sintaxe Básica:
:: 2.1) O que é "@ECHO OFF"?
:: 	2.1.1) É de costume, iniciar o código com "@ECHO OFF", assim, não será exibido uma coordeanada para cada linha impressa:
:: 	2.1.2) Excução sem @ECHO OFF: C:...\Programacao\0.Bat Aulas\Exercicios>echo teste
:: 	2.1.3) Execução com @ECHO OFF: teste

:: 2.2) Para que serve o ECHO?
:: 	2.2.1) Exibir Mensagens: Mostra um texto na tela (ECHO).
::	2.2.2) Exibir Linha em Branco: Usado para formatação e legibilidade (ECHO.).
::	2.2.3) Exibir Conteúdo de Variáveis: Mostra o valor armazenado em uma variável (ECHO %VARIAVEL%).

:: 2.3) CARACTERÍSTICAS NO CMD
::	2.3.1) TITLE, é uma sintaxe para você alterar o nome da janela
::	2.3.2) COLOR, define a cor do background e da fonte

:: 2.4) O QUE É CLS:
::	2.4.1) COMANDO PARA LIMPAR A TELA

::__________________________________________________ Código Atual ___________________________________________________________________


@ECHO OFF
TITLE AULA 01, INTRODUCAO AO BAT
COLOR 0A


ECHO.
ECHO HELLO WORLD!
ECHO.
PAUSE
