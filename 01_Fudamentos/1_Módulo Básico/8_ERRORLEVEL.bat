:: ------------------------------------------------------------------------------------------------------------------------------------
:: -                                               Script por: Victor Viana                                                 -
:: -                                               Aula 08: ERRORLEVEL - O Sensor de Falhas                                 -
:: ------------------------------------------------------------------------------------------------------------------------------------

::_____________________________________________________________ Aula Teórica____________________________________________________________

:: 1) O Que e ERRORLEVEL?
::    1.1) ERRORLEVEL nao e um comando, mas uma variavel de sistema especial e volatil.
::    1.2) Ela armazena um codigo numerico de saida (Exit Code) do ULTIMO comando que foi executado.
::    1.3) PROPOSITO: Permitir que o script verifique se uma operacao foi bem-sucedida ou se falhou.

:: 2) A Convencao Universal dos Codigos de Saida
::    2.1) ERRORLEVEL 0: Significa SUCESSO. O comando foi executado sem nenhum erro.
::    2.2) ERRORLEVEL 1 (ou maior): Significa FALHA. O comando encontrou algum tipo de erro.
::         - Diferentes comandos podem usar numeros diferentes para diferentes tipos de erro.

:: 3) A Arquitetura de Verificacao com IF
::    3.1) Usamos o comando "IF ERRORLEVEL N" para testar o valor.
::    3.2) PONTO CRITICO DE LOGICA: "IF ERRORLEVEL N" e verdadeiro se o codigo de saida for N OU MAIOR.
::         - Ex: "IF ERRORLEVEL 1" sera verdadeiro para os codigos 1, 2, 3, 100, etc.
::    3.3) Por causa disso, ao testar multiplos erros, a verificacao deve ser feita em ORDEM DECRESCENTE (do maior erro para o menor).
::    3.4) Para testar apenas por SUCESSO (codigo 0), a forma mais segura e: "IF NOT ERRORLEVEL 1".

:: 4) Comandos e Seus ERRORLEVELS Comuns
::    4.1) FIND: Retorna 0 se encontrar o texto, 1 se NAO encontrar.
::    4.2) MKDIR: Retorna 1 se a pasta ja existe ou se houver um erro de permissao.
::    4.3) DEL: Retorna 1 se o arquivo nao for encontrado ou estiver protegido.

::_____________________________________________________ Código Atual ___________________________________________________________________


:: ----- Cabecalho -------
@ECHO OFF
TITLE AULA 08: ERROR LEVEL
COLOR 0A


:: ----- Definicao de Variaveis -----

SET Lista=Clubes.txt
SET Pasta=Clubes_De_Futebol
SET Caminho=%Pasta%\%Lista



:: -- Criando a Estrutura da lista --

IF NOT EXIST "%Pasta%" MKDIR "%Pasta%"


(
	ECHO Flamengo
	ECHO Fluminense
	ECHO Botafogo
	ECHO Vasco	

) > "%Caminho%"


:: --- Interagindo com o usuário ---

SET /P Select="Informe um Clube de Futebol:"


:: Interagindo com a Notificacaos

CLS
ECHO.
ECHO ===========================================================================
ECHO.
ECHO		  Realizando uma Busca pelo Clube: %Select%
ECHO.
ECHO ===========================================================================
ECHO.
TIMEOUT /T 4 /NOBREAK
ECHO.

:: FIND retorna ERRORLEVEL 0 se SUCESSO (encontrou) e 1 se FALHA (nao encontrou)
FIND /I "%Select%" "%Caminho%" > NUL


IF NOT ERRORLEVEL 1 (
	ECHO SUCESSO: O Clube %Select% foi encotrado na lista!
) ELSE (
	ECHO FALHA: O Clube %Select% não foi encontrado na lista!
)

ECHO.
PAUSE









