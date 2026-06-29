@echo off
title Acesso a Pasta Segura

:: -------------------------------- Configuracoes ---------------------------------

:: Importante: Redefina uma Senha forte.
set "SENHA_CORRETA=teste"

:: Define o NOME da pasta que esta no MESMO LOCAL do arquivo .bat
set "NOME_PASTA_ALVO=teste"

:: Combina o caminho do bat com o nome da pasta alvo
set "CAMINHO_COMPLETO_DA_PASTA=%~dp0%NOME_PASTA_ALVO%"

::---------------------------------------------------------------------------------



::--------------------------------- Tela de Loading -------------------------------

:INICIO
cls
echo.
echo ***********************************************************************
echo *                                                                     *
echo *                                                                     *
echo *                   Identificando a Pasta Teste.                      *
echo *                                                                     *
echo *                                                                     *
echo ***********************************************************************
echo.
timeout /t 1 > nul

cls
echo.
echo ***********************************************************************
echo *                                                                     *
echo *                                                                     *
echo *                   Identificando a Pasta Teste..                     *
echo *                                                                     *
echo *                                                                     *
echo ***********************************************************************
echo.
timeout /t 1 > nul

cls
echo.
echo ***********************************************************************
echo *                                                                     *
echo *                                                                     *
echo *                   Identificando a Pasta Teste...                    *
echo *                                                                     *
echo *                                                                     *
echo ***********************************************************************
echo.
timeout /t 1 > nul

cls
echo.
echo ***********************************************************************
echo *                                                                     *
echo *                                                                     *
echo *                         Pasta Identificada!                         *
echo *                                                                     *
echo *                                                                     *
echo ***********************************************************************
echo.
timeout /t 1 > nul
cls

::------------------------------------------------------------------------------



::--------------------- Verificar Visibilidade ---------------------------------
:: OBS1: Se o comando 'attrib' encontrar a pasta oculta, errorlevel sera 0.
:: OBS2: Se nao encontrar (esta visivel), errorlevel sera 1.

attrib "%CAMINHO_COMPLETO_DA_PASTA%" | find "H" >nul
if %errorlevel% equ 0 (
    goto PASTA_OCULTA_PEDIR_SENHA
) else (
    goto PASTA_VISIVEL_OCULTAR
)
::-------------------------------------------------------------------------------




::------------------------ Liberar Acesso a Pasta ----------------------------------

:PASTA_OCULTA_PEDIR_SENHA
    echo.
    set /p "INPUT_SENHA= Digite a senha para liberar a pasta: "

    if "%INPUT_SENHA%"=="%SENHA_CORRETA%" (
	cls	
        :: Remove os atributos de oculto e sistema DA PASTA ALVO e de SEU CONTEUDO
        attrib -h -s "%CAMINHO_COMPLETO_DA_PASTA%" /s /d
       
        cls
        echo.
        echo ***********************************************************************
        echo *                                                                     *
        echo *                    A Pasta Teste esta liberada!	                   *
        echo *                                                                     *
        echo ***********************************************************************
        echo.
	timeout /t 3 > nul

        cls
        echo.
        echo ***********************************************************************
        echo *                                                                     *
        echo *                     Bloquear a pasta apos o uso!                    *
        echo *                                                                     *
        echo ***********************************************************************
        echo.
        timeout /t 2> nul
        exit

    ) else (
       cls
       echo.
       echo ***********************************************************************
       echo *                                                                     *
       echo *                         Senha Incorreta!                            *
       echo *                                                                     *
       echo *                           Encerrando....                            *
       echo *                                                                     *
       echo ***********************************************************************
       echo.
       timeout /t 3 > nul
       exit
    )
::--------------------------------------------------------------------------------------




::------------------------ Bloquear Acesso a Pasta ----------------------------------

:PASTA_VISIVEL_OCULTAR
    :: Adiciona os atributos de oculto e sistema DA PASTA ALVO e de SEU CONTEUDO
    attrib +h +s "%CAMINHO_COMPLETO_DA_PASTA%" /s /d

    cls
    echo ***********************************************************************
    echo *                                                                     *
    echo *                 A Pasta com os Backups esta Bloqueada!              *
    echo *                                                                     *
    echo ***********************************************************************
    echo.
    timeout /t 3 > nul
    
    cls
    echo ***********************************************************************
    echo *                                                                     *
    echo *                    Obrigado pela Contribuicao                       *
    echo *                                                                     *
    echo ***********************************************************************
    echo.
    timeout /t 2 > nul
    exit

::--------------------------------------------------------------------------------------
