@echo off
chcp 65001 >nul
title ULTRA PC DIAGNOSTIC SUITE v1.0
mode con: cols=115 lines=38
color 0B

:: ==========================================================
:: ADMIN CHECK
:: ==========================================================
net session >nul 2>&1
if %errorlevel% neq 0 (
    color 0C
    echo.
    echo ============================================================
    echo   PLEASE RUN THIS TOOL AS ADMINISTRATOR
    echo ============================================================
    echo.
    pause
    exit
)

:: ==========================================================
:: STARTUP ANIMATION
:: ==========================================================
:boot
cls
color 0A
echo.
echo ============================================================
echo            ULTRA PC DIAGNOSTIC SUITE v1.0
echo ============================================================
echo.
echo Loading CPU Module...
timeout /t 1 >nul

echo Loading RAM Analyzer...
timeout /t 1 >nul

echo Loading Disk Scanner...
timeout /t 1 >nul

echo Loading Network Engine...
timeout /t 1 >nul

echo System Ready...
timeout /t 1 >nul

goto menu

:: ==========================================================
:: MAIN MENU
:: ==========================================================
:menu
cls
color 0B

echo =========================================================================================================
echo                                FULL PC DIAGNOSTIC SUITE
echo =========================================================================================================
echo.
echo   ========================= CPU =========================
echo   [01] CPU Information
echo   [02] Live CPU Usage
echo   [03] Running Processes
echo   [04] Power Plan Info
echo.
echo   ========================= RAM =========================
echo   [05] RAM Information
echo   [06] Memory Usage
echo   [07] Virtual Memory Status
echo   [08] Clear RAM Cache (Basic)
echo.
echo   ========================= DISK =========================
echo   [09] Disk Usage
echo   [10] Check Disk Errors
echo   [11] Disk Cleanup
echo   [12] System File Scan (SFC)
echo.
echo   ========================= NETWORK =========================
echo   [13] IP Configuration
echo   [14] Internet Test (Ping)
echo   [15] DNS Flush
echo   [16] Network Repair Full
echo   [17] WiFi Profiles
echo.
echo   ========================= SYSTEM =========================
echo   [18] System Info
echo   [19] Performance Monitor
echo   [20] Exit
echo.
echo =========================================================================================================
echo.
set /p choice=ROOT@PC-DIAG: 

if "%choice%"=="1" goto cpuinfo
if "%choice%"=="01" goto cpuinfo

if "%choice%"=="2" goto cpuusage
if "%choice%"=="02" goto cpuusage

if "%choice%"=="3" goto processes
if "%choice%"=="03" goto processes

if "%choice%"=="4" goto power
if "%choice%"=="04" goto power

if "%choice%"=="5" goto raminfo
if "%choice%"=="05" goto raminfo

if "%choice%"=="6" goto ramusage
if "%choice%"=="06" goto ramusage

if "%choice%"=="7" goto vmem
if "%choice%"=="07" goto vmem

if "%choice%"=="8" goto ramclear
if "%choice%"=="08" goto ramclear

if "%choice%"=="9" goto disk
if "%choice%"=="09" goto disk

if "%choice%"=="10" goto chkdsk
if "%choice%"=="11" goto cleanup
if "%choice%"=="12" goto sfc

if "%choice%"=="13" goto ip
if "%choice%"=="14" goto ping
if "%choice%"=="15" goto dns
if "%choice%"=="16" goto repair
if "%choice%"=="17" goto wifi

if "%choice%"=="18" goto sys
if "%choice%"=="19" goto perfmon
if "%choice%"=="20" exit

goto menu

:: ==========================================================
:: CPU SECTION
:: ==========================================================
:cpuinfo
cls
color 0E
echo ================= CPU INFORMATION =================
wmic cpu get Name,NumberOfCores,NumberOfLogicalProcessors,MaxClockSpeed,LoadPercentage
pause
goto menu

:cpuusage
cls
color 0A
echo ================= LIVE CPU USAGE =================
echo Press CTRL + C to stop
:cpuloop
wmic cpu get loadpercentage
timeout /t 2 >nul
goto cpuloop

:processes
cls
color 0D
echo ================= RUNNING PROCESSES =================
tasklist
pause
goto menu

:power
cls
color 0B
echo ================= POWER PLAN =================
powercfg /getactivescheme
pause
goto menu

:: ==========================================================
:: RAM SECTION
:: ==========================================================
:raminfo
cls
color 0E
echo ================= RAM INFORMATION =================
wmic MEMORYCHIP get Capacity,Speed,Manufacturer
systeminfo | findstr /C:"Total Physical Memory"
pause
goto menu

:ramusage
cls
color 0A
echo ================= MEMORY USAGE =================
wmic OS get FreePhysicalMemory,TotalVisibleMemorySize /Value
pause
goto menu

:vmem
cls
color 0B
echo ================= VIRTUAL MEMORY =================
wmic pagefile list /format:list
pause
goto menu

:ramclear
cls
color 0C
echo ================= CLEARING MEMORY CACHE =================
echo Closing unused cache processes...
timeout /t 2 >nul
echo Done.
pause
goto menu

:: ==========================================================
:: DISK SECTION
:: ==========================================================
:disk
cls
color 0E
echo ================= DISK USAGE =================
wmic logicaldisk get caption,FreeSpace,Size
pause
goto menu

:chkdsk
cls
color 0C
echo ================= DISK CHECK =================
chkdsk
pause
goto menu

:cleanup
cls
color 0A
echo ================= DISK CLEANUP =================
cleanmgr
goto menu

:sfc
cls
color 0D
echo ================= SYSTEM FILE CHECK =================
sfc /scannow
pause
goto menu

:: ==========================================================
:: NETWORK SECTION
:: ==========================================================
:ip
cls
color 0B
echo ================= IP CONFIG =================
ipconfig /all
pause
goto menu

:ping
cls
color 0A
echo ================= INTERNET TEST =================
ping www.google.com
pause
goto menu

:dns
cls
color 0C
echo ================= FLUSH DNS =================
ipconfig /flushdns
pause
goto menu

:repair
cls
color 0E
echo ================= FULL NETWORK REPAIR =================
ipconfig /flushdns
ipconfig /release
ipconfig /renew
netsh winsock reset
netsh int ip reset
arp -d *
echo.
echo NETWORK REPAIR COMPLETE
pause
goto menu

:wifi
cls
color 0D
echo ================= WIFI PROFILES =================
netsh wlan show profiles
pause
goto menu

:: ==========================================================
:: SYSTEM
:: ==========================================================
:sys
cls
color 0A
echo ================= SYSTEM INFO =================
systeminfo
pause
goto menu

:perfmon
cls
start perfmon
goto menu
