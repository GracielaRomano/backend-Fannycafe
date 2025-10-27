@echo off
echo Creando enlace simbolico usando PowerShell...
echo.

REM Verificar si se ejecuta como administrador
net session >nul 2>&1
if %errorLevel% == 0 (
    echo Ejecutando como administrador...
    echo.
    
    REM Cambiar al directorio de assets del backend
    cd /d "%~dp0assets"
    
    REM Verificar si ya existe el enlace
    if exist "images" (
        echo El enlace simbolico 'images' ya existe.
        echo ¿Desea eliminarlo y crear uno nuevo? (S/N)
        set /p choice=
        if /i "%choice%"=="S" (
            rmdir "images"
            echo Enlace anterior eliminado.
        ) else (
            echo Operacion cancelada.
            pause
            exit /b
        )
    )
    
    REM Crear el enlace simbolico usando PowerShell
    powershell -Command "New-Item -ItemType SymbolicLink -Path 'images' -Target 'C:\Users\Lenovo\Downloads\cafeteriaFanny\cafeteriafanny\src\assets\images'"
    
    if %errorLevel% == 0 (
        echo.
        echo ¡Enlace simbolico creado exitosamente!
        echo Las imagenes del frontend ahora estan disponibles en: backend\assets\images\
        echo.
        dir images
    ) else (
        echo.
        echo Error al crear el enlace simbolico.
    )
    
) else (
    echo.
    echo ERROR: Este script debe ejecutarse como administrador.
    echo.
    echo Para ejecutar como administrador:
    echo 1. Haga clic derecho en el archivo
    echo 2. Seleccione "Ejecutar como administrador"
    echo.
    echo O ejecute desde una ventana de comandos como administrador:
    echo 1. Presione Win + X
    echo 2. Seleccione "Símbolo del sistema (Administrador)" o "Windows PowerShell (Administrador)"
    echo 3. Navegue al directorio y ejecute: create-symlink-ps.bat
)

echo.
pause
