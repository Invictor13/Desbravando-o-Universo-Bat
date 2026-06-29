:: ------------------------------------------------------------------------------------------------------------------------------------
:: -                                               Script por: Victor Viana                                                           -
:: -                                               Aula 07: Gerador de Logs N2                                                 	      -
:: ------------------------------------------------------------------------------------------------------------------------------------

::_____________________________________________________________ Aula Teórica____________________________________________________________

:: 1) A Arquitetura da Tarefa
::    1.1) O objetivo e criar um processo autocontido: uma pasta que contem o registro (log) de sua propria criacao e das operacoes internas.
::    1.2) Fluxo Logico:
::         - 1. Definir os nomes da pasta principal e do arquivo de log.
::         - 2. Construir o caminho completo onde o log sera salvo (dentro da pasta principal).
::         - 3. Criar a pasta principal.
::         - 4. Iniciar o log DENTRO da nova pasta usando o caminho completo.
::         - 5. Executar acoes e "aumentar" o log com novas entradas.

:: 2) Ferramentas-Chave para Esta Aula
::    2.1) Construcao de Caminhos: Combinamos variaveis para criar um caminho de arquivo dinamico.
::         (Ex: SET CaminhoCompleto=%PastaPai%\%ArquivoFilho%)
::    2.2) MKDIR: Comando para criar um novo diretorio (pasta).
::    2.3) FOR /L: Usado para criar um laco numerico que simulara varias operacoes sendo executadas e registradas no log.

::_____________________________________________________ Código Atual ___________________________________________________________________


@ECHO OFF
TITLE  AULA 07: GERADOR DE LOGS N2
COLOR 0A


rem ETAPA INICIAL: DEFINICAO DA ARQUITETURA
SET PastaBKP=BKP
SET Texto_Log=Log.txt
SET CaminhoPastaBKP=%PastaBKP%\%Texto_Log%


CLS
ECHO.
ECHO ****************************************************************************
ECHO *										*
ECHO			      Gerador de Logs - Nivel II
ECHO *										* 
ECHO ****************************************************************************
ECHO.
TIMEOUT /T 3 /NOBREAK
CLS

ECHO.
ECHO ****************************************************************************
ECHO *										*
ECHO                           Criando a Estrutura do Log!
ECHO *										* 
ECHO ****************************************************************************
ECHO.
IF NOT EXIST %PastaBKP% MKDIR %PastaBKP%
TIMEOUT /T 3 /NOBREAK
CLS

ECHO.
ECHO ****************************************************************************
ECHO *										*
ECHO                           Gerando Conteudo do LOG
ECHO *										* 
ECHO ****************************************************************************
ECHO.

( 
	ECHO *********************************************************
	ECHO		LOG CRIADO EM %DATE% AS %TIME%
	ECHO *********************************************************
	ECHO.
) >> %CaminhoPastaBKP%



TIMEOUT /T 3 /NOBREAK
CLS

ECHO.
ECHO ****************************************************************************
ECHO *										*
ECHO 		A pasta %PastaBKP% foi criada com sucesso!
ECHO 		Conteudo do %Texto_Log% encaminhado!
ECHO *										* 
ECHO ****************************************************************************
ECHO.
TIMEOUT /T 3 /NOBREAK
CLS

















