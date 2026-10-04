@echo off
chcp 65001 > nul
title Youssef App Runner

echo Starting Youssef Web App on your laptop...

where python >nul 2>nul
if %errorlevel% equ 0 (
    python "%~dp0run_server.py"
) else (
    where py >nul 2>nul
    if %errorlevel% equ 0 (
        py "%~dp0run_server.py"
    ) else (
        start "" "%~dp0youssef_web\index.html"
    )
)
pause
