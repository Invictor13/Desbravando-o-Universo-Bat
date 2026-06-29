:: Desenvolvido por: Victor Viana
:: Data: 25/06/26

@echo off
chcp 65001 >nul
color 0c

:: ------------------------------------------------------------------------------
:: CONFIGURACOES - ALTERE ABAIXO CONFORME SEU AMBIENTE
:: ------------------------------------------------------------------------------

set "BROWSER_PATH=C:\Program Files\Google\Chrome\Application\chrome.exe"

set "URL_TOTEM= www.google.com.br"

set "URL_PAINEL=https://br.search.yahoo.com/"

:: Limpando resquícios do navegador, que esteja aberto
::taskkill /F /IM chrome.exe /T >nul 2>&1
::timeout /t 2 /nobreak >nul

:: PREPARACAO - Usando pastas seguras
set "PERFIL_MONITOR_1=%TEMP%\Perfis\USER1"
set "PERFIL_MONITOR_2=%TEMP%\Perfis\USER2"

:: ------------------------------------------------------------------------------0. PREPARANDO O TERRENO---------------------------------------------------------------------------------------------
::					
:: 0.1 Primeiramente, Eliminaremos resquícios de processos, que podem comprometer com a automacao. Informei um timer de 2 segundos, para garantir que a etapa seja concluída.
:: 0.2 A segunda parte é criar ou verificar a existência das pastas de usuário personalizado do totem e painel.
:: 0.3 Essas etapas são fundamentais para criar dois navegadores diferentes, associando eles a um usuário.
:: 0.4 Criamos uma Mensagem Personalizada, para que o cliente não encerre o script.
:: 
:: --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

echo -----------------------------------------------------------------
echo    *      *  **   *****  **      ******   *******
echo    *      *      *       **      *    *   *     *
echo    *      *  **  *      ******   *    *   *     *
echo    *      *  **  *       **      *    *   *   **
echo    *      *  **  *       **      *    *   * *
echo    *      *  **  *       **  *   *    *   *    *
echo        *     **   *****  *****   ******   *     * 
echo.
echo       Desenvolvido por: Victor Viana - 
echo -----------------------------------------------------------------
echo.
echo Atenção, não feche este script!
echo As páginas estão sendo carregadas, favor esperar 10 segundos...
echo.

:: ---------------------------------------------------------------------------------- 1. TOTEM DE SENHA ---------------------------------------------------------------------------------------------
::  										  (MONITOR 1 - TELA CHEIA)
::	
:: 1.1 Esta etapa inicia a pagina noo monitor principal.
:: 1.2 Portanto, a ideia é selecionar o caminho do navegador executal, e associar com um perfil(user-data-dir) da etapa(0. preparando o tereno).
:: 1.3 A seguir, definimos a página do painel de senha para este navegador --app="".
:: 1.4 A etapa do Windows Position é fundamental, para definir que este é o monitor principal.
:: 1.5 Para o Script não criar uma confusão, sobre qual navegador deverá ser arrastado, defini uma espera de 3 segundos, para ele carregar o segundo navegador.
::
:: --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


start "" "%BROWSER_PATH%" --user-data-dir="%PERFIL_MONITOR_1%" --app="%URL_TOTEM%" --window-position=0,0 --kiosk
timeout /t 3 /nobreak >nul


:: ---------------------------------------------------------------------------------- 2. PAINEL TV ---------------------------------------------------------------------------------------------------
::  										(MONITOR 1 - TELA CHEIA)
:: 2.1 O próximo processo, identificará que esse navegador do painel deverá ser arrastado para o próximo monitor, pois foi a última página a ser criada.
:: 2.2 Dentro da automação do Poweshell, devemos nos atentar a esta coordenada SetWindowPos($h, 0, 1950, 50, 1000, 800, 0)
::
:: --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


start "" "%BROWSER_PATH%" --user-data-dir="%PERFIL_MONITOR_2%" --app="%URL_PAINEL%" --window-position=1950,0 --kiosk
timeout /t 3 /nobreak >nul


:: --------------------------------------------------------------------------- 3. Arrastando a Janela e Maximizando ---------------------------------------------------------------------------------
:: 											( Parte mais Técnica )  
:::: --------------------------------------------------------------------------- 3. Arrastando a Janela e Maximizando ---------------------------------------------------------------------------------
:: (Parte Técnica: Interação com a API Nativa do Windows)
:: 3.1 Usamos 'DllImport' para acessar a 'user32.dll', permitindo controle total sobre as janelas via C#.
:: 3.2 O 'Add-Type' compila este código em memória, criando uma interface entre o script e o sistema operacional.
:: 3.3 'GetForegroundWindow' captura a instância do navegador recém-aberto (o Painel TV).
:: 3.4 'SetWindowPos' move e redimensiona a janela com base nas coordenadas X e Y.
:: 3.5-1 IMPORTANTE: As coordenadas (1950, 50) assumem o Monitor 2 posicionado à DIREITA. 
:: 3.5-2 Caso o monitor esteja em outra posição, ajuste os valores ou use números negativos.
:: 3.6 A simulação de clique e o 'SendKeys({F11})' garantem que o navegador entre em modo 'Kiosk/Full Screen'.
:: ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
::
:: ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

powershell -command "$code = '[DllImport(\"user32.dll\")] public static extern IntPtr GetForegroundWindow(); [DllImport(\"user32.dll\")] public static extern bool SetWindowPos(IntPtr hWnd, IntPtr h, int X, int Y, int cx, int cy, uint f); [DllImport(\"user32.dll\")] public static extern bool SetCursorPos(int X, int Y); [DllImport(\"user32.dll\")] public static extern void mouse_event(uint dwFlags, uint dx, uint dy, uint dwData, int dwExtraInfo);'; $w = Add-Type -MemberDefinition $code -Name W -PassThru; $h = $w::GetForegroundWindow(); $w::SetWindowPos($h, 0, 1950, 50, 1000, 800, 0); Start-Sleep -Milliseconds 2000; $w::SetCursorPos(2500, 400); Start-Sleep -Milliseconds 200; $w::mouse_event(2, 0, 0, 0, 0); $w::mouse_event(4, 0, 0, 0, 0); Start-Sleep -Milliseconds 500; $wshell = New-Object -ComObject wscript.shell; $wshell.SendKeys('{F11}')"