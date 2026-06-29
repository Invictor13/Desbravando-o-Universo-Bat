:: ------------------------------------------------------------------------------------------------------------------------------------
::                                                       Script por: Victor Viana                                                 
::                                                     Aula 06: Gerador de Logs N2                                              
:: ------------------------------------------------------------------------------------------------------------------------------------

::_____________________________________________________________ Aula Teórica____________________________________________________________

:: 1) O Que e um Log e Por Que Ele e Vital?
::    1.1) Um arquivo de log e um registro cronologico de eventos e operacoes que seu script realizou.
::    1.2) PROPOSITO: Rastreabilidade (saber o que aconteceu), Auditoria (provar o que foi feito) e,
::         principalmente, Depuracao (encontrar a causa de um erro).

:: 2) Ferramentas Fundamentais para Gerar Logs:
::    2.1) Operador > (Redirecionamento - Sobrescrever): Usado UMA VEZ no inicio para criar
::         o arquivo de log e seu cabecalho. Se o arquivo ja existir, sera substituido.
::    2.2) Operador >> (Redirecionamento - Anexar): A ferramenta PRINCIPAL do logging. Usado para
::         adicionar novas entradas ao final do arquivo de log, sem apagar o conteudo anterior.

::_____________________________________________________ Código Atual ___________________________________________________________________

@ECHO OFF
TITLE AULA06:GERADOR_DE_LOGS
COLOR 0A

REM CRIANDO O ARQUIVO ".TXT"
SET ArquivoLog="Log.txt"


REM ESCREVENDO O CONTEÚDO DO LOG
ECHO *************************************************************************** >> %ArquivoLog%
ECHO *   								         >> %ArquivoLog%
ECHO				      LOG CRIADO >> %ArquivoLog%
ECHO               [%DATE% - %TIME%] Olá, %USERNAME% >> %ArquivoLog% 
ECHO * 									         >> %ArquivoLog%
ECHO **************************************************************************** >> %ArquivoLog%

ECHO.
PAUSE



































