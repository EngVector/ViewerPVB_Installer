@echo off
title Vector - Instalador Completo PvBrowser

echo ============================================
echo        Vector - Instalacao Completa
echo ============================================
echo.

echo 🔧 Iniciando instalacao do PvBrowser...
start /wait config\install-pvbrowser-5.1.7-client-msvc.exe

if %errorlevel% neq 0 (
    echo ❌ Erro na instalacao do PvBrowser. Verifique o instalador.
    pause
    exit /b
)

echo.
echo ✅ PvBrowser instalado com sucesso!
echo.

echo 🔧 Aplicando configuracoes personalizadas...
cd config
call application_configs.bat
cd ..

echo.
echo 🚀 Instalacao concluida com sucesso!
echo.
echo Um atalho chamado 'Vector - PvBrowser' foi criado na sua Area de Trabalho.
echo Utilize-o para abrir a aplicacao em tela cheia.
echo.
pause
