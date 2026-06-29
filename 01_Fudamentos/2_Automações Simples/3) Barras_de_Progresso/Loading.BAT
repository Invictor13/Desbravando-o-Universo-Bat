::_____________________________________________________ Código Corrigido e Otimizado ___________________________________________________________________


@ECHO OFF
TITLE AULA 09 - BARRA DE PROGRESSO SIMPLES
COLOR 0B

:: ETAPA 1: Ativando o modo de "expansao atrasada".
SETLOCAL EnableDelayedExpansion

:: ETAPA 2: Inicializando a variavel que contera nossa barra de progresso.
SET "barra="
SET "bloco=X"


CLS
ECHO.
ECHO ==========================================================================
ECHO                   Varredura em Andamento...	
ECHO ==========================================================================
ECHO.

:: ETAPA 3: O laco FOR que ira construir e exibir a barra.
:: Ele dara 20 voltas (5% por volta).
FOR /L %%i IN (1, 1, 20) DO (
    
    :: A cada volta, adicionamos um "X" a variavel "barra".
    SET "barra=!barra!!bloco!"
    
    :: Calculamos a porcentagem atual
    SET /A porcentagem = %%i * 5
    
    :: Limpa a tela para a proxima atualizacao
    CLS
    
    ECHO.
    ECHO ==========================================================================
    ECHO                   Varredura em Andamento...	
    ECHO ==========================================================================
    ECHO.
    
    :: Exibe a barra e a porcentagem. Note o uso de "!" para exibir os valores ATUAIS.
    ECHO [!barra!] !porcentagem!%%
    
    :: Pausa para que a animacao seja visivel
    PING -n 2 127.0.0.1 > NUL
)


CLS
ECHO.
ECHO ==========================================================================
ECHO                  TAREFA CONCLUIDA COM SUCESSO!
ECHO ==========================================================================
ECHO.
ECHO [XXXXXXXXXXXXXXXXXXXX] 100%%
ECHO.

:: Desativa o modo de expansao atrasada. Boa pratica.
ENDLOCAL
PAUSE