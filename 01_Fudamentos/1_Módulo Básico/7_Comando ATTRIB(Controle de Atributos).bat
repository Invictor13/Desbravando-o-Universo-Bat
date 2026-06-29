:: ------------------------------------------------------------------------------------------------------------------------------------
:: -                                               Script por: Victor Viana                                                 -
:: -                                               Aula 07 O Comando ATTRIB                                                -
:: ------------------------------------------------------------------------------------------------------------------------------------

::_____________________________________________________________ Aula Teórica____________________________________________________________

:: 1) O Comando ATTRIB: O Controle de Estado
::    1.1) O comando ATTRIB serve para visualizar e modificar os "atributos" de arquivos e pastas.
::    1.2) Atributos sao marcadores que dizem ao sistema operacional como tratar um item (ex: se ele pode ser visto, modificado, etc.).

:: 2) Os Atributos Fundamentais
::    2.1) H (Hidden / Oculto): Torna o arquivo ou pasta invisivel em visualizacoes normais do Windows Explorer.
::    2.2) R (Read-only / Somente Leitura): Protege um arquivo contra modificacoes ou delecao acidental.
::    2.3) S (System / Sistema): Marca um item como um arquivo critico do sistema, adicionando uma camada extra de protecao e ocultacao.

:: 3) A Sintaxe da Modificacao
::    3.1) O sinal de "+" ADICIONA um atributo. (Ex: ATTRIB +H "PastaSecreta")
::    3.2) O sinal de "-" REMOVE um atributo. (Ex: ATTRIB -H "PastaSecreta")

:: 4) Switches de Execucao para Automacao
::    4.1) /S : Aplica o comando ao alvo E a todos os arquivos e subpastas dentro dele.
::    4.2) /D : Garante que a operacao se aplique as proprias pastas, e nao apenas aos arquivos.

::_____________________________________________________ Código Atual ___________________________________________________________________



:: ------ Cabecalho -------

@ECHO OFF
TITLE AULA07: Comado ATTRIB (v3 - Depurado)
COLOR 0A


:: ----- Definicao de Variaveis -----
SET PastaAlvo=Pasta_Teste
SET ArquivoDeTeste=%PastaAlvo%\Teste.txt

:: Garante que a estrutura exista para o teste
IF NOT EXIST "%PastaAlvo%" MKDIR "%PastaAlvo%"
IF NOT EXIST "%ArquivoDeTeste%" ECHO Este e um arquivo de teste > "%ArquivoDeTeste%"


:: --------- Opcoes de Escolha -------------

:MENU
CLS
ECHO =====================================================
ECHO     Seja Bem vindo, %USERNAME%
ECHO =====================================================
ECHO.
ECHO Alvo: Arquivos dentro da pasta "%PastaAlvo%"
ECHO.
ECHO [1] Ocultar Pasta
ECHO [2] Reexibir Pasta
ECHO [3] Bloquear Edicao de Arquivos
ECHO [4] Desbloquear Edicao de Arquivos
ECHO [5] Sair
ECHO.
SET /P ESCOLHA="INFORME UMA OPCAO: "

IF "%ESCOLHA%"=="1" GOTO :OCULTAR_PASTA
IF "%ESCOLHA%"=="2" GOTO :LIBERAR_PASTA
IF "%ESCOLHA%"=="3" GOTO :BLOQUEAR_EDICAO
IF "%ESCOLHA%"=="4" GOTO :DESBLOQUEAR_EDICAO
IF "%ESCOLHA%"=="5" GOTO :SAIR

ECHO Opcao Invalida! & TIMEOUT /T 2 /NOBREAK >nul & GOTO :MENU

:OCULTAR_PASTA
    CLS & ECHO Ocultando a pasta...
    ATTRIB +H +S "%PastaAlvo%" /D /S
    ECHO A pasta '%PastaAlvo%' foi ocultada. & PAUSE & GOTO :MENU

:LIBERAR_PASTA
    CLS & ECHO Reexibindo a pasta...
    ATTRIB -H +S "%PastaAlvo%" /D /S
    ECHO A pasta '%PastaAlvo%' agora esta visivel. & PAUSE & GOTO :MENU

:BLOQUEAR_EDICAO
    CLS & ECHO Bloqueando edicao dos arquivos...
    :: Atua em todos os arquivos (*.*) dentro da pasta alvo
    ATTRIB +R "%PastaAlvo%\*.*"
    ECHO Os arquivos em '%PastaAlvo%' agora sao Somente Leitura. & PAUSE & GOTO :MENU

:DESBLOQUEAR_EDICAO
    CLS & ECHO Desbloqueando edicao dos arquivos...
    ATTRIB -R "%PastaAlvo%\*.*"
    ECHO Os arquivos em '%PastaAlvo%' agora permitem edicao. & PAUSE & GOTO :MENU

:SAIR
    CLS & ECHO Encerrando... & TIMEOUT /T 1 /NOBREAK >nul & GOTO :EOF






