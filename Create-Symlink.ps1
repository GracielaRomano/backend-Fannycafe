# Script para crear enlace simbólico de las imágenes del frontend
# Archivo: Create-Symlink.ps1

Write-Host "Creando enlace simbólico para las imágenes del frontend..." -ForegroundColor Green
Write-Host ""

# Verificar si se ejecuta como administrador
if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "ERROR: Este script debe ejecutarse como administrador." -ForegroundColor Red
    Write-Host ""
    Write-Host "Para ejecutar como administrador:" -ForegroundColor Yellow
    Write-Host "1. Haga clic derecho en el archivo" -ForegroundColor Yellow
    Write-Host "2. Seleccione 'Ejecutar con PowerShell' como administrador" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "O ejecute desde PowerShell como administrador:" -ForegroundColor Yellow
    Write-Host "1. Presione Win + X" -ForegroundColor Yellow
    Write-Host "2. Seleccione 'Windows PowerShell (Administrador)'" -ForegroundColor Yellow
    Write-Host "3. Navegue al directorio y ejecute: .\Create-Symlink.ps1" -ForegroundColor Yellow
    Write-Host ""
    Read-Host "Presione Enter para salir"
    exit 1
}

Write-Host "Ejecutando como administrador..." -ForegroundColor Green
Write-Host ""

# Cambiar al directorio de assets del backend
$assetsPath = Join-Path $PSScriptRoot "assets"
Set-Location $assetsPath

Write-Host "Directorio actual: $assetsPath" -ForegroundColor Cyan

# Verificar si ya existe el enlace
if (Test-Path "images") {
    Write-Host "El enlace simbólico 'images' ya existe." -ForegroundColor Yellow
    $choice = Read-Host "¿Desea eliminarlo y crear uno nuevo? (S/N)"
    if ($choice -eq "S" -or $choice -eq "s") {
        Remove-Item "images" -Force
        Write-Host "Enlace anterior eliminado." -ForegroundColor Green
    } else {
        Write-Host "Operación cancelada." -ForegroundColor Yellow
        Read-Host "Presione Enter para salir"
        exit 0
    }
}

# Ruta de destino
$targetPath = "C:\Users\Lenovo\Downloads\cafeteriaFanny\cafeteriafanny\src\assets\images"

# Verificar que la ruta de destino existe
if (-not (Test-Path $targetPath)) {
    Write-Host "ERROR: La ruta de destino no existe: $targetPath" -ForegroundColor Red
    Read-Host "Presione Enter para salir"
    exit 1
}

Write-Host "Creando enlace simbólico..." -ForegroundColor Cyan
Write-Host "Origen: $targetPath" -ForegroundColor Gray
Write-Host "Destino: $assetsPath\images" -ForegroundColor Gray

try {
    # Crear el enlace simbólico
    New-Item -ItemType SymbolicLink -Path "images" -Target $targetPath -Force
    
    Write-Host ""
    Write-Host "¡Enlace simbólico creado exitosamente!" -ForegroundColor Green
    Write-Host "Las imágenes del frontend ahora están disponibles en: backend\assets\images\" -ForegroundColor Green
    Write-Host ""
    
    # Mostrar contenido del enlace
    Write-Host "Contenido del enlace simbólico:" -ForegroundColor Cyan
    Get-ChildItem "images" | Select-Object Name, Length, LastWriteTime | Format-Table -AutoSize
    
} catch {
    Write-Host ""
    Write-Host "Error al crear el enlace simbólico: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host ""
Read-Host "Presione Enter para salir"
