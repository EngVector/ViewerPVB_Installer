@echo off
title Vector - Aplicacao PvBrowser - Configuracoes
setlocal EnableDelayedExpansion

echo ============================================
echo        Vector - Configuracao da Aplicacao
echo ============================================

echo 🔧 Copiando arquivo de configuracao...
copy /Y "pvbrowser.ini" "%USERPROFILE%\pvbrowser.ini" >nul
if %errorlevel%==0 (
    echo ✅ Arquivo de configuracao aplicado com sucesso!
) else (
    echo ❌ Falha ao copiar o arquivo pvbrowser.ini
    goto end
)
echo.

echo 🔍 Buscando executável pvbrowser.exe em subpastas com 'win-msvc'...

:: Define base de busca: Program Files (x86) ou Program Files
if defined ProgramFiles(x86) (
    set "BASEDIR=%ProgramFiles(x86)%"
) else (
    set "BASEDIR=%ProgramFiles%"
)

set "TARGETFILE="
for /d /r "%BASEDIR%" %%D in (win-msvc) do (
    if exist "%%D\bin\pvbrowser.exe" (
        set "TARGETFILE=%%D\bin\pvbrowser.exe"
        goto found
    )
)

echo ❌ Executável pvbrowser.exe não encontrado em subpastas de '%BASEDIR%'.
goto end

:found
echo ✅ Executável localizado: !TARGETFILE!
echo.

:: Caminho do atalho e do ícone
set "SHORTCUTFILE=%Public%\Desktop\VectorPVB.lnk"
set "ICONFILE=%CD%\logo.ico"

echo 🔧 Criando atalho na Desktop Publica com logo personalizado...

powershell -ExecutionPolicy Bypass -Command " $WScriptShell = New-Object -ComObject WScript.Shell; $Shortcut = $WScriptShell.CreateShortcut('%SHORTCUTFILE%'); $Shortcut.TargetPath = '%TARGETFILE%'; $Shortcut.IconLocation = '%ICONFILE%'; $Shortcut.Save()"

if exist "%SHORTCUTFILE%" (
    echo ✅ Atalho criado com sucesso: VectorPVB.lnk
) else (
    echo ❌ Falha ao criar o atalho. Verifique caminhos e permissões.
)

echo.
echo 🚀 Configuracao concluida.
echo.
:end
pause
endlocal