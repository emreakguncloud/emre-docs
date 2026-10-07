@echo off
setlocal

REM Desktop yolunu otomatik bul (OneDrive yonlendirmesi varsa onu da yakalar)
for /f "usebackq delims=" %%D in (`powershell -NoP -C "[Environment]::GetFolderPath('Desktop')"`) do set "DESKTOP=%%D"

REM "Bilgi Bankasi" klasorunu joker karakterle bul.
REM Turkce karakteri (dotless i) dosyaya yazmamak icin; boylece kodlama sorunu olmaz.
set "PROJECT="
for /d %%B in ("%DESKTOP%\Emre\Bilgi Banka*") do (
  if exist "%%~fB\emre-docs\mkdocs.yml" set "PROJECT=%%~fB\emre-docs"
)

if not defined PROJECT (
  echo [HATA] emre-docs klasoru bulunamadi.
  echo Beklenen konum: %DESKTOP%\Emre\Bilgi Bankasi\emre-docs
  pause & exit /b 1
)

cd /d "%PROJECT%"

REM Varsa sanal ortam aktivasyon komutu hazirla (.venv oncelikli)
set "ACT="
if exist "venv\Scripts\activate.bat"  set "ACT=call venv\Scripts\activate.bat && "
if exist ".venv\Scripts\activate.bat" set "ACT=call .venv\Scripts\activate.bat && "

REM Sunucuyu yeni pencerede baslat
start "MkDocs Server" cmd /k "%ACT%python -m mkdocs serve -a 127.0.0.1:8000"

REM Port acilana kadar bekle (maks 60 sn) - tek PowerShell cagrisi, hizli TCP denemesi
powershell -NoP -C "$t=(Get-Date).AddSeconds(60); while((Get-Date) -lt $t){ try { $c=New-Object Net.Sockets.TcpClient; $c.Connect('127.0.0.1',8000); $c.Close(); exit 0 } catch { Start-Sleep -Milliseconds 500 } }; exit 1"
if errorlevel 1 (
  echo [HATA] Sunucu 60 sn icinde hazir olmadi. "MkDocs Server" penceresindeki mesaji kontrol et.
  pause & exit /b 1
)

start "" "http://127.0.0.1:8000"
exit /b 0