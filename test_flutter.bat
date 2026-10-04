@echo off
set PATH=C:\Windows\System32;C:\Windows;C:\Program Files\Git\cmd;C:\flutter\bin;C:\Users\youse\flutter\bin;%PATH%
echo [1] Checking Flutter...
call flutter --version
echo [2] Checking Devices...
call flutter devices
echo [3] Done.
