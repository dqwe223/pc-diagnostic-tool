# ==========================================================
# ULTRA PC DIAGNOSTIC SUITE v1.0 (PowerShell)
# ==========================================================

Clear-Host
$Host.UI.RawUI.WindowTitle = "ULTRA PC DIAGNOSTIC SUITE v1.0"
$Host.UI.RawUI.ForegroundColor = "Cyan"

# ==========================================================
# ADMIN CHECK
# ==========================================================
$isAdmin = ([Security.Principal.WindowsPrincipal] `
    [Security.Principal.WindowsIdentity]::GetCurrent()
).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if (-not $isAdmin) {
    Write-Host "============================================================" -ForegroundColor Red
    Write-Host "   PLEASE RUN THIS TOOL AS ADMINISTRATOR" -ForegroundColor Red
    Write-Host "============================================================" -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit
}

# ==========================================================
# FUNCTIONS
# ==========================================================

function Boot {
    Clear-Host
    Write-Host "============================================================"
    Write-Host "         ULTRA PC DIAGNOSTIC SUITE v1.0"
    Write-Host "============================================================"
    Write-Host ""

    Write-Host "Loading CPU Module..."
    Start-Sleep 1
    Write-Host "Loading RAM Analyzer..."
    Start-Sleep 1
    Write-Host "Loading Disk Scanner..."
    Start-Sleep 1
    Write-Host "Loading Network Engine..."
    Start-Sleep 1
    Write-Host "System Ready..."
    Start-Sleep 1
}

# ---------------- CPU ----------------
function CPU-Info {
    Clear-Host
    Write-Host "=== CPU INFORMATION ===" -ForegroundColor Yellow
    Get-CimInstance Win32_Processor |
        Select-Object Name, NumberOfCores, NumberOfLogicalProcessors, MaxClockSpeed, LoadPercentage
    Pause
}

function CPU-Usage {
    Clear-Host
    Write-Host "=== LIVE CPU USAGE (CTRL+C to stop) ===" -ForegroundColor Green
    while ($true) {
        Get-CimInstance Win32_Processor | Select-Object LoadPercentage
        Start-Sleep 2
    }
}

function Processes {
    Clear-Host
    Write-Host "=== RUNNING PROCESSES ===" -ForegroundColor Magenta
    Get-Process
    Pause
}

function Power-Plan {
    Clear-Host
    Write-Host "=== POWER PLAN ===" -ForegroundColor Cyan
    powercfg /getactivescheme
    Pause
}

# ---------------- RAM ----------------
function RAM-Info {
    Clear-Host
    Write-Host "=== RAM INFORMATION ===" -ForegroundColor Yellow
    Get-CimInstance Win32_PhysicalMemory |
        Select-Object Capacity, Speed, Manufacturer

    systeminfo | Select-String "Total Physical Memory"
    Pause
}

function RAM-Usage {
    Clear-Host
    Write-Host "=== MEMORY USAGE ===" -ForegroundColor Green

    $os = Get-CimInstance Win32_OperatingSystem
    $free = [math]::Round($os.FreePhysicalMemory / 1MB, 2)
    $total = [math]::Round($os.TotalVisibleMemorySize / 1MB, 2)

    Write-Host "Free Memory (GB): $free"
    Write-Host "Total Memory (GB): $total"
    Pause
}

function Virtual-Memory {
    Clear-Host
    Write-Host "=== VIRTUAL MEMORY ===" -ForegroundColor Cyan
    Get-CimInstance Win32_PageFileUsage
    Pause
}

function RAM-Clear {
    Clear-Host
    Write-Host "Clearing memory cache (basic simulation)..." -ForegroundColor Red
    Start-Sleep 2
    Write-Host "Done."
    Pause
}

# ---------------- DISK ----------------
function Disk-Usage {
    Clear-Host
    Write-Host "=== DISK USAGE ===" -ForegroundColor Yellow
    Get-CimInstance Win32_LogicalDisk |
        Select-Object DeviceID, FreeSpace, Size
    Pause
}

function Check-Disk {
    Clear-Host
    Write-Host "Running CHKDSK..." -ForegroundColor Red
    chkdsk
    Pause
}

function Cleanup {
    Clear-Host
    Write-Host "Opening Disk Cleanup..." -ForegroundColor Green
    Start-Process cleanmgr
}

function SFC-Scan {
    Clear-Host
    Write-Host "Running System File Checker..." -ForegroundColor Magenta
    sfc /scannow
    Pause
}

# ---------------- NETWORK ----------------
function IP-Config {
    Clear-Host
    Write-Host "=== IP CONFIGURATION ===" -ForegroundColor Cyan
    ipconfig /all
    Pause
}

function Ping-Test {
    Clear-Host
    Write-Host "=== INTERNET TEST ===" -ForegroundColor Green
    Test-Connection google.com -Count 4
    Pause
}

function Flush-DNS {
    Clear-Host
    Write-Host "Flushing DNS..." -ForegroundColor Red
    ipconfig /flushdns
    Pause
}

function Network-Repair {
    Clear-Host
    Write-Host "FULL NETWORK REPAIR..." -ForegroundColor Yellow

    ipconfig /flushdns
    ipconfig /release
    ipconfig /renew
    netsh winsock reset
    netsh int ip reset
    arp -d *

    Write-Host "NETWORK REPAIR COMPLETE" -ForegroundColor Green
    Pause
}

function WiFi-Profiles {
    Clear-Host
    Write-Host "=== WIFI PROFILES ===" -ForegroundColor Cyan
    netsh wlan show profiles
    Pause
}

# ---------------- SYSTEM ----------------
function System-Info {
    Clear-Host
    Write-Host "=== SYSTEM INFO ===" -ForegroundColor Green
    systeminfo
    Pause
}

function PerfMon {
    Start-Process perfmon
}

# ==========================================================
# MENU
# ==========================================================
Boot

while ($true) {
    Clear-Host
    Write-Host "============================================================"
    Write-Host "                 FULL PC DIAGNOSTIC SUITE"
    Write-Host "============================================================"
    Write-Host ""
    Write-Host "CPU"
    Write-Host " [1] CPU Information"
    Write-Host " [2] Live CPU Usage"
    Write-Host " [3] Running Processes"
    Write-Host " [4] Power Plan"
    Write-Host ""
    Write-Host "RAM"
    Write-Host " [5] RAM Information"
    Write-Host " [6] Memory Usage"
    Write-Host " [7] Virtual Memory"
    Write-Host " [8] Clear RAM Cache"
    Write-Host ""
    Write-Host "DISK"
    Write-Host " [9] Disk Usage"
    Write-Host " [10] Check Disk"
    Write-Host " [11] Disk Cleanup"
    Write-Host " [12] SFC Scan"
    Write-Host ""
    Write-Host "NETWORK"
    Write-Host " [13] IP Config"
    Write-Host " [14] Ping Test"
    Write-Host " [15] Flush DNS"
    Write-Host " [16] Network Repair"
    Write-Host " [17] WiFi Profiles"
    Write-Host ""
    Write-Host "SYSTEM"
    Write-Host " [18] System Info"
    Write-Host " [19] Performance Monitor"
    Write-Host " [20] Exit"
    Write-Host ""

    $choice = Read-Host "ROOT@PC-DIAG"

    switch ($choice) {
        "1" { CPU-Info }
        "2" { CPU-Usage }
        "3" { Processes }
        "4" { Power-Plan }

        "5" { RAM-Info }
        "6" { RAM-Usage }
        "7" { Virtual-Memory }
        "8" { RAM-Clear }

        "9" { Disk-Usage }
        "10" { Check-Disk }
        "11" { Cleanup }
        "12" { SFC-Scan }

        "13" { IP-Config }
        "14" { Ping-Test }
        "15" { Flush-DNS }
        "16" { Network-Repair }
        "17" { WiFi-Profiles }

        "18" { System-Info }
        "19" { PerfMon }
        "20" { exit }
    }
}