:: ------------------------------------------------------------------------------------------------------------------------------------
:: -                                                Script por: Victor Viana                                                          -
:: -                                               Aula 02: Variáveis Globais                                                        -
:: ------------------------------------------------------------------------------------------------------------------------------------

::__________________________________________________ Aula Teórica ___________________________________________________________________

:: 1) O sistema por padrão, possui variáveis globais, que retornam valores do sistema:
::	1.1) %USERNAME%     -> Informa o Nome do Usuário
::	1.2) %COMPUTERNAME% -> Informa o Número da Máquina.
::	1.3) %DATE%	        -> Informa a Data.
::	1.4) %TIME%         -> Informa o Horário.
::	1.5) %USERPROFILE%  -> Informa o caminho Inteiro do perfil do usuário (C:\Users\victor)
::	1.6) %WINDIR%	    -> Aponta para o diretório onde o Windows está instalado.
::	1.7) %SYSTEMROOT%   -> Mesmo caso do item 1.6.
::	1.8) %RANDOM%	    -> Gera um número aleatório entre 0 e 32767.
::	1.9) %PATH%	    -> Uma lista de pastas onde o Windows procura por comandos e programas.

::__________________________________________________ Código Atual ___________________________________________________________________


@ECHO OFF
TITLE AULA 02: VARIAVEIS GLOBAIS
COLOR 0A

ECHO.
ECHO ---------------------Credenciais--------------------------------
ECHO. 								     
ECHO    Usuario: %USERNAME%             Computador:%COMPUTERNAME%      
ECHO. 								     
ECHO -----------------------------------------------------------------
ECHO.
ECHO Data do Acesso:%DATE%           
ECHO Hora do Acesso:%TIME%
ECHO Pasta do Usuario:%USERPROFILE%
ECHO.

PAUSE