:: _________________________________________________CABECALHO____________________________________________________

@ECHO OFF
:: CORRECAO: Muda a pagina de codigo do console para UTF-8 para suportar caracteres graficos.
:: O "> NUL" oculta a mensagem de confirmacao "Active code page: 65001".
CHCP 65001 > NUL
COLOR 0A
TITLE Teste - DIAGNOSTICADOR DE SISTEMA v2.0

:: ___________________________________________MOTOR DA INTERFACE_____________________________________________

SETLOCAL EnableDelayedExpansion
SET "BARRA="
SET "BLOCO=█"

:: Laco FOR /L para controlar a animacao da barra de progresso
FOR /L %%i IN (1, 1, 20) DO (
    SET "BARRA=!BARRA!!BLOCO!"
    CLS

    ECHO.
    ECHO ==================================================================
    ECHO.
    ECHO                   Diagnosticador de Computador v2.0
    ECHO                           por: Victor Viana
    ECHO.
    ECHO ==================================================================
    ECHO.
    ECHO     Analisando o sistema... Por favor, aguarde.
    ECHO.
    ECHO     [!BARRA!]
    
    PING -n 2 127.0.0.1 > NUL
)

:: (O restante do seu código de relatório continua aqui...)
:: _____________________________________________ RELATORIO FINAL ____________________________________________________

CLS
ECHO.
ECHO ==================================================================
ECHO.
ECHO                   RELATORIO DE DIAGNOSTICO DO SISTEMA
ECHO.
ECHO ==================================================================
ECHO.
ECHO  1. INFORMACOES BASICAS:
ECHO    - Data e Hora da Analise...: %DATE% - %TIME%
ECHO    - Nome do Usuario............: %USERNAME%
ECHO    - Nome da Maquina............: %COMPUTERNAME%
ECHO.
ECHO.
ECHO  2. DIAGNOSTICO DE REDE:
ECHO.
ECHO    - Status da Conexao com a Internet:
PING -n 1 8.8.8.8 > NUL
IF NOT ERRORLEVEL 1 (
    ECHO      Ativa
) ELSE (
    ECHO      Inativa ou com Falha
)
ECHO.
ECHO    - Endereco IPv4 Principal:
ipconfig | find "IPv4"
ECHO.
ECHO.
ECHO  3. DIAGNOSTICO DE HARDWARE E SISTEMA:
ECHO.
ECHO    - Ultima Inicializacao do Sistema:
systeminfo | find "System Boot Time"
ECHO.
ECHO    - Processador (CPU):
wmic cpu get name
ECHO.
ECHO    - Memoria Fisica Total (RAM):
systeminfo | find "Total Physical Memory"
ECHO.
ECHO    - Espaco Livre no Disco C:
fsutil volume diskfree c:
ECHO.
ECHO.
ECHO  4. DIAGNOSTICO DE SOFTWARE (SISTEMA OPERACIONAL):
ECHO.
ECHO    - Versao do Sistema Operacional:
wmic os get Caption,Version
ECHO.
ECHO    - Servicos Ativos em Execucao:
net start
ECHO.
ECHO.
ECHO ==================================================================
ECHO                   RELATORIO FINALIZADO
ECHO ==================================================================
ECHO.

ENDLOCAL
PAUSE