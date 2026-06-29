:: ------------------------------------------------------------------------------------------------------------------------------------
:: -                                               Script por: Victor Viana                                                           -
:: -                                               Aula 08: Gerador de Logs N3                                                	      -
:: ------------------------------------------------------------------------------------------------------------------------------------

::_____________________________________________________________ Aula Teórica____________________________________________________________

:: 1) A Logica por Tras dos Niveis de Severidade
::    1.1) O objetivo e classificar cada evento registrado no log para entender rapidamente sua importancia.
::    1.2) BENEFICIO: Permite filtrar o log em busca de problemas criticos (ex: buscar pela palavra "[ERRO]")
::         sem precisar ler centenas de linhas de informacoes rotineiras.

:: 2) A Hierarquia de Classificacao
::    2.1) [INFO]:  Para eventos informativos e rotineiros. Mostra que o script esta executando como esperado.
::         - Ex: "Processo iniciado.", "Arquivo copiado com sucesso."
::    2.2) [AVISO]: Para eventos inesperados que nao impediram a execucao, mas que merecem atencao.
::         - Ex: "Pasta de destino nao encontrada, criando uma nova.", "O arquivo X ja existe, foi ignorado."
::    2.3) [ERRO]:  Para falhas criticas. Uma operacao especifica nao pode ser concluida.
::         - Ex: "Acesso negado ao tentar deletar arquivo.", "Disco cheio."

:: 3) A Tecnica de Implementacao
::    3.1) Nao existe um comando novo. Trata-se de um padrao de formatacao que aplicamos com o ECHO.
::    3.2) Usamos a logica do "IF" e do "ERRORLEVEL" para decidir qual nivel de severidade registrar no log.
::         - Sintaxe: ECHO [%TIME%] [NIVEL]: Mensagem >> %ArquivoLog%

::_____________________________________________________ Código Atual ___________________________________________________________________

@ECHO OFF
TITLE AULA 08: GERADOR DE LOGS N3
COLOR 0A


:: --- Definição de Variáveis ----
SET ArquivoLog="historico.log"
SET PastaLog="Pasta_log"
SET CAMINHOPASTALOG=%PastaLog%\%ArquivoLog%

:: -- Criando a Pasta --

ECHO ========================================================================================
ECHO.
ECHO                		Autenticando a Pasta LOG
ECHO.
ECHO ========================================================================================
IF NOT EXIST %PastaLog% MKDIR %PastaLog%
TIMEOUT /T 1 /NOBREAK
CLS



:: -- INICIALIZANDO O LOG --
(
	ECHO ======================================================================
	ECHO			    RELATORIO GERADO POR:
	ECHO				%USERNAME%
	ECHO ======================================================================
) >> %CAMINHOPASTALOG%

ECHO ========================================================================================
ECHO.
ECHO                		Processando Informacoes.
ECHO.
ECHO ========================================================================================
TIMEOUT /T 1 /NOBREAK
CLS

:: -- PROCESSANDO [INFO] --
ECHO [%TIME%][INFO]: Preparando o Ambiente de Teste. >> %CAMINHOPASTALOG%
ECHO [%TIME%][INFO]: Ambiente de Teste criado. >> %CAMINHOPASTALOG%

ECHO ========================================================================================
ECHO.
ECHO                		 Ambiente criado!
ECHO.
ECHO ========================================================================================
TIMEOUT /T 1 /NOBREAK
CLS

ECHO [%TIME%][AVISO]: Este é um log simples e sem profundidade. >> %CAMINHOPASTALOG%
ECHO [%TIME%][ERRO]: Toma Vergonha na cara! >> %CAMINHOPASTALOG%

ECHO ========================================================================================
ECHO.
ECHO                		 Finalizando...
ECHO.
ECHO ========================================================================================
TIMEOUT /T 1 /NOBREAK
CLS

ECHO [%TIME%][INFO]: Log Finalizado! >> %CAMINHOPASTALOG%

(
	ECHO ======================================================================
	ECHO			     RELATORIO FINALIZADO
	ECHO			     %DATE% - %TIME%
	ECHO.
	ECHO.
) >> %CAMINHOPASTALOG%


PAUSE











