@echo off
echo Iniciando servidor PHP en puerto 8000...
echo.
echo Servidor disponible en: http://localhost:8000
echo Para detener el servidor presiona Ctrl+C
echo.
cd /d "%~dp0"
php -S localhost:8000
pause
