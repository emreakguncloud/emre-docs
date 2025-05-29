@echo off
title MkDocs Sunucusu Başlatiliyor...
cd /d "C:\Users\emrea\OneDrive\Masaüstü\emre-docs"
timeout /t 2 >nul
start http://127.0.0.1:8000
cmd /c python -m mkdocs serve
