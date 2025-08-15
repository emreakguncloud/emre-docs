@echo off
setlocal EnableDelayedExpansion

REM Desktop yolunu otomatik bul
for /f "usebackq delims=" %%D in (`powershell -NoP -C "[Environment]::GetFolderPath('Desktop')"`) do set "DESKTOP=%%D"

set "PROJECT=%DESKTOP%\emre-docs"
if not exist "%PROJECT%" (
  echo [HATA] emre-docs klasoru bulunamadi: "%PROJECT%"
  pause & exit /b 1
)

cd /d "%PROJECT%"

REM Varsa sanal ortam aktivasyon komutu hazirla
set "ACT="
if exist ".venv\Scripts\activate.bat" set "ACT=call .venv\Scripts\activate.bat && "
if exist "venv\Scripts\activate.bat"  set "ACT=call venv\Scripts\activate.bat && "

REM Sunucuyu yeni pencerede baslat (venv aktif edilerek)
start "MkDocs Server" cmd /k "%ACT% python -m mkdocs serve -a 127.0.0.1:8000"

REM Port acilana kadar bekle (maks 20 sn)
for /l %%i in (1,1,40) do (
  powershell -NoP -C "Start-Sleep -Milliseconds 500; exit (Test-NetConnection -ComputerName 127.0.0.1 -Port 8000).TcpTestSucceeded ? 0 : 1"
  if not errorlevel 1 goto :OPEN
)

echo [HATA] Sunucu hazir hale gelmedi. "MkDocs Server" penceresindeki mesaji kontrol et.
pause & exit /b 1

:OPEN
start "" "http://127.0.0.1:8000"
exit /b 0
