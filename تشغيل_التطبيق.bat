@echo off
chcp 65001 > nul
title تطبيق يوسف - المساعد الجامعي الشامل

echo ========================================================
echo       🚀 جاري تشغيل تطبيق يوسف على اللابتوب...
echo ========================================================
echo.

where python >nul 2>nul
if %errorlevel% equ 0 (
    echo [OK] تم العثور على بايثون. جاري تشغيل تطبيق يوسف على Localhost:8080...
    python "%~dp0run_flutter_server.py"
) else (
    where py >nul 2>nul
    if %errorlevel% equ 0 (
        echo [OK] تم العثور على py. جاري تشغيل تطبيق يوسف على Localhost:8080...
        py "%~dp0run_flutter_server.py"
    ) else (
        echo [INFO] جاري فتح التطبيق...
        start "" "%~dp0youssef_app\build\web\index.html"
    )
)
pause
