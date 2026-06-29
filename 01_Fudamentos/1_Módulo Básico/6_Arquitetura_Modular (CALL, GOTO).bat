:: ------------------------------------------------------------------------------------------------------------------------------------
:: -                                               Script por: Victor Viana                                                 -
:: -                                               Aula 07: Arquitetura Modular com CALL e GOTO                             -
:: ------------------------------------------------------------------------------------------------------------------------------------

::_____________________________________________________________ Aula Teórica____________________________________________________________

:: 1) A Necessidade de uma Arquitetura Modular
::    1.1) A medida que um script cresce, coloca-lo em um unico bloco sequencial se torna confuso e ineficiente.
::    1.2) A arquitetura modular consiste em quebrar o codigo em blocos logicos e reutilizaveis, chamados de "sub-rotinas".

:: 2) Ferramentas de Controle de Fluxo
::    2.1) Rotulos (:MeuRotulo): Um rotulo e um marcador, um ponto de destino no seu codigo. Ele comeca com dois-pontos.
::    2.2) GOTO: "Vá Para". Este comando salta a execucao do script DIRETAMENTE para um rotulo especificado.
::         - AVISO DE ARQUITETO: O uso excessivo de GOTO pode criar um fluxo caotico ("codigo espaguete"). Use-o com cautela.
::    2.3) CALL: "Chame". Este e o comando ESTRUTURADO para invocar uma sub-rotina. Ele salta para um rotulo, executa
::         o codigo e, ao final, RETORNA a execucao para a linha seguinte de onde foi chamado. E a base para criar "funcoes".
::    2.4) GOTO :EOF: "Vá para o Fim do Arquivo" (End Of File). Este comando especial encerra a execucao do script
::         ou finaliza uma sub-rotina chamada com CALL, retornando o controle.

:: 3) Pense nisso da seguinte forma:
::	3.1) CALL é uma ligação telefônica. Você liga para um especialista (CALL :OPCAO_A), ele te dá a informação, e quando você desliga (GOTO :EOF), você volta exatamente para o que estava fazendo antes.
:: 	3.2) GOTO é uma passagem de avião só de ida. Você viaja para o destino (GOTO :SAIR), e fim da viagem. Não há passagem de volta automática.

::_____________________________________________________ Código Atual ___________________________________________________________________


:: -------- CABECALHO --------

@ECHO OFF
TITLE AULA 07: ARQUITETURA MODULAR (FINAL)
COLOR 0A

:: ----- PAINEL DE DECISAO [USER] --------

:MENUPRINCIPAL
CLS
ECHO ================================================================================
ECHO.
ECHO PAINEL ACESSADO POR: %USERNAME%
ECHO Selecione uma opcao a seguir:
ECHO.
ECHO    [1] OPCAO A
ECHO    [2] OPCAO B
ECHO    [3] SAIR
ECHO.
ECHO ================================================================================

SET /P OPCAO="INFORME UMA OPCAO:"


:: ---- Processar Escolhas ------
IF "%OPCAO%"=="1" (
    CALL :OPCAO_A
    GOTO :MENUPRINCIPAL
)

IF "%OPCAO%"=="2" (
    CALL :OPCAO_B
    GOTO :MENUPRINCIPAL
)

IF "%OPCAO%"=="3" GOTO :SAIR

ECHO Valor Incorreto, Informe um Numero!
TIMEOUT /T 2 /NOBREAK >nul
CLS
GOTO :MenuPrincipal

:: --- Sub-rotinas Corrigidas ---

:OPCAO_A
    CLS
    ECHO [ OPCAO A: SELECIONADA ]
    ECHO.
    PAUSE
    :: CORRECAO: A sub-rotina agora termina e retorna o controle para o chamador.
    GOTO :EOF

:OPCAO_B
    CLS
    ECHO [ OPCAO B: SELECIONADA ]
    ECHO.
    PAUSE
    :: CORRECAO: A sub-rotina agora termina e retorna o controle para o chamador.
    GOTO :EOF

:SAIR
    CLS
    ECHO.
    ECHO SAINDO DO SISTEMA!
    ECHO.
    PAUSE
    :: Adicionado para garantir o encerramento limpo, embora o script terminaria aqui de qualquer forma.
    GOTO :EOF












