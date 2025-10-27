@echo off
echo Iniciando servidor PHP con router en puerto 8000...
echo.
echo Servidor disponible en: http://localhost:8000
echo API disponible en: http://localhost:8000/backend/api/
echo Para detener el servidor presiona Ctrl+C
echo.
cd /d "%~dp0"
php -S localhost:8000 -t . index.php
pause
