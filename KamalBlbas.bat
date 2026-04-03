@echo off
:: ======================================================
:: 🛠️  OFFICIAL TOOL: KAMALBLBAS CLEANUP TOOLBOX
:: 👤  DEVELOPER: KAMAL BLBAS (TV_KAMALBLBAS)
:: 🛡️  VERSION: 4.0 (GITHUB FINAL SYNC)
:: ======================================================
title KAMALBLBAS CLEANUP TOOLBOX - SECURE VERSION
color 0B
chcp 65001 >nul

:: --- پاراستنی ناسنامەی کەماڵ بلباس ---
set "owner=Kamal Blbas"
if not "%owner%"=="Kamal Blbas" (exit)

:: پشکنینی دەسەڵاتی ئەدمین
net session >nul 2>&1 || (echo ❌ Error: Run as Admin! & pause & exit)

echo.
echo ######################################################
echo #          🚀  KAMALBLBAS CLEANUP TOOLBOX  🚀         #
echo #          👤 Developed by: %owner%               #
echo ######################################################
echo.

:: --- بەشی پاککردنەوەی vMix ---
echo [🛡️] 1. Removing vMix Registry u Folders...
taskkill /f /im vMix.exe /im vMix64.exe /t >nul 2>&1
rd /s /q "C:/Program Files (x86)/vMix" >nul 2>&1
rd /s /q "%AppData%/vMix" >nul 2>&1
reg delete "HKEY_CURRENT_USER/Software/StudioCoast/vMix" /f >nul 2>&1

:: --- بەشی پاککردنەوەی سیستم ---
echo [🧹] 2. Cleaning System Temp u Logs...
del /s /f /q %temp%/*.* >nul 2>&1
rd /s /q %temp% >nul 2>&1 & mkdir %temp%

:: --- بەشی پاککردنەوەی وێبگەڕەکان ---
echo [🌐] 3. Cleaning Chrome u Opera Cache...
del /q /s /f "%LocalAppData%/Google/Chrome/User Data/Default/Cache/*.*" >nul 2>&1

:: --- کۆتایی و نوێکردنەوە ---
echo [🗑️] 4. Flushing DNS u Recycle Bin...
ipconfig /flushdns >nul 2>&1
rd /s /q %systemdrive%/$Recycle.bin >nul 2>&1

echo.
echo ######################################################
echo ✅  DONE! %owner% Gian, System is Clean!
echo ######################################################
pause >nul
