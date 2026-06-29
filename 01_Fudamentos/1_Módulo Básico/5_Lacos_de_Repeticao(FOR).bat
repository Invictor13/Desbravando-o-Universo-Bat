:: ------------------------------------------------------------------------------------------------------------------------------------
:: -                                               Script por: Victor Viana                                                 -
:: -                                               Aula 05: O Comando FOR /L                                                -
:: ------------------------------------------------------------------------------------------------------------------------------------

::________________________________________________________ Aula Teórica (Refatorada)______________________________________________________

:: 1) O Comando FOR: O Motor da Repeticao
::    1.1) O comando FOR e usado para executar uma acao repetidamente para um conjunto de itens.
::    1.2) Sintaxe Fundamental: FOR %%V IN (conjunto) DO (comando)
::    1.3) A variavel de iteracao (ex: %%i) e um container temporario que guarda o item atual do laco.
::    1.4) ATENCAO: Em scripts (.bat), a variavel SEMPRE usa DOIS sinais de porcentagem (%%i).

:: 2) O Laco Numerico com FOR /L
::    2.1) O switch /L modifica o FOR para criar um laco que conta atraves de uma sequencia de numeros.
::    2.2) Sintaxe do /L: FOR /L %%V IN (inicio, passo, fim) DO (comando)
::         - inicio: O numero onde a contagem comeca.
::         - passo:  O valor a ser somado/subtraido a cada volta. (Usamos -1 para contagem regressiva).
::         - fim:    O numero onde a contagem para.

:: 3) Comandos de Apoio Usados no Codigo
::    3.1) TIMEOUT /T 1: Pausa a execucao do script por 1 segundo.
::    3.2) > NUL: Redireciona a saida de texto de um comando para o "nada", mantendo a tela limpa.
::    3.3) CLS: Limpa toda a tela do terminal.

::___________________________________________________________ Código Atual _________________________________________________________________

@ECHO OFF
TITLE TEMPORIZADOR DA TOCA
COLOR 0C

ECHO.
ECHO ************************************************************************************
ECHO * *
ECHO                  Seja Bem Vindo, ao temporizador!
ECHO * *
ECHO ************************************************************************************
ECHO.

:: Pede ao usuario para definir o tempo de inicio
SET /P inicio_tempo="Informe o tempo da contagem regressiva (em segundos): "

:: Limpa a tela antes de comecar
cls

ECHO Iniciando contagem...
ECHO.

:: O laco FOR /L comeca no valor que o usuario digitou,
:: subtrai 1 a cada passo (-1), e continua ate chegar a 1.
FOR /L %%i IN (%inicio_tempo%, -1, 1) DO (
    cls
    ECHO %%i segundos restantes...
    
    :: Pausa por 1 segundo e oculta a saida do comando TIMEOUT
    TIMEOUT /T 1 /NOBREAK > NUL
    cls

)

ECHO.
ECHO ************************************************************************************
ECHO * *
ECHO                                   ACABOU!
ECHO * *
ECHO ************************************************************************************
ECHO.

PAUSE