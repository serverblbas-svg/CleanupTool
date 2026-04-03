@echo off
chcp 65001 >nul
title KAMALBLBAS CLEANUP TOOLBOX - v6.0 PRO
color 0B

:: Check Admin
net session >nul 2>&1 || (echo [!] Error: Run as Admin! & pause & exit)

set "owner=Kamal Blbas"

echo.
echo ######################################################
echo #                                                    #
echo #           KAMALBLBAS CLEANUP TOOLBOX               #
echo #       -----------------------------------          #
echo #          Developed by: %owner%               #
echo #          Version: 6.0 (Pro Optimizer)       #
echo #                                                    #
echo ######################################################
echo.

echo [1] Cleaning vMix, Adobe, Discord and Telegram...
taskkill /f /im vMix.exe /im vMix64.exe /im Discord.exe /im Telegram.exe /t >nul 2>&1
rd /s /q "C:\Program Files (x86)\vMix" >nul 2>&1
rd /s /q "%LocalAppData%\Adobe\Common\Media Cache Files" >nul 2>&1
rd /s /q "%AppData%\discord\Cache" >nul 2>&1
rd /s /q "%AppData%\Telegram Desktop\tdata\user_data" >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\StudioCoast\vMix" /f >nul 2>&1

echo [2] Cleaning Windows Update Cache...
net stop wuauserv >nul 2>&1
rd /s /q "C:\Windows\SoftwareDistribution\Download" >nul 2>&1
mkdir "C:\Windows\SoftwareDistribution\Download"
net start wuauserv >nul 2>&1

echo [3] Optimizing Network and Flushing DNS...
ipconfig /flushdns >nul 2>&1
netsh int ip reset >nul 2>&1
netsh winsock reset >nul 2>&1

echo [4] Deep Cleaning System Temp and Logs...
del /s /f /q %temp%\*.* >nul 2>&1
rd /s /q %temp% >nul 2>&1 & mkdir %temp%
del /s /f /q C:\Windows\Temp\*.* >nul 2>&1
del /s /f /q C:\Windows\Prefetch\*.* >nul 2>&1

echo [5] Cleaning Browser Cache (Chrome, Edge, Opera)...
del /q /s /f "%LocalAppData%\Google\Chrome\User Data\Default\Cache\*.*" >nul 2>&1
del /q /s /f "%LocalAppData%\Microsoft\Edge\User Data\Default\Cache\*.*" >nul 2>&1
del /q /s /f "%AppData%\Opera Software\Opera Stable\Cache\*.*" >nul 2>&1

echo [6] Emptying Recycle Bin...
rd /s /q %systemdrive%\$Recycle.bin >nul 2>&1

echo.
echo ######################################################
echo  DONE! %owner%, System is Optimized!
echo ######################################################
pause
