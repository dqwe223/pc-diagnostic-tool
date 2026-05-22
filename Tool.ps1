<#
Clean PowerShell Hardware & Network Troubleshooting Suite
Author: Iruka (Customized Build)
Purpose: Safe offline diagnostic tool for PC technicians
#>

Clear-Host
Write-Host "==============================================" -ForegroundColor Cyan
Write-Host "   PC HARDWARE & NETWORK DIAGNOSTIC TOOL" -ForegroundColor Cyan
Write-Host "==============================================" -ForegroundColor Cyan

# ------------------------------
# SYSTEM INFO
# ------------------------------
Write-Host "\n[ SYSTEM INFORMATION ]" -ForegroundColor Yellow
Get-ComputerInfo | Select-Object CsName, WindowsProductName, WindowsVersion, TotalPhysicalMemory

# CPU Info
Write-Host "\n[ CPU INFO ]" -ForegroundColor Yellow
Get-CimInstance Win32_Processor | Select-Object Name, NumberOfCores, NumberOfLogicalProcessors, MaxClockSpeed

# RAM Info
Write-Host "\n[ MEMORY INFO ]" -ForegroundColor Yellow
Get-CimInstance Win32_PhysicalMemory | Select-Object Manufacturer, Capacity, Speed

# DISK INFO
Write-Host "\n[ DISK INFO ]" -ForegroundColor Yellow
Get-CimInstance Win32_DiskDrive | Select-Object Model, Size, MediaType

# ------------------------------
# NETWORK INFO
# ------------------------------
Write-Host "\n[ NETWORK ADAPTERS ]" -ForegroundColor Yellow
Get-NetAdapter | Select-Object Name, Status, LinkSpeed, MacAddress

Write-Host "\n[ IP CONFIGURATION ]" -ForegroundColor Yellow
ipconfig | Select-String "IPv4|Subnet|Gateway"

# ------------------------------
# INTERNET TEST
# ------------------------------
Write-Host "\n[ INTERNET CONNECTIVITY TEST ]" -ForegroundColor Yellow
$testHosts = @("8.8.8.8", "1.1.1.1", "google.com")
foreach ($host in $testHosts) {
    if (Test-Connection $host -Count 2 -Quiet) {
        Write-Host "$host -> OK" -ForegroundColor Green
    } else {
        Write-Host "$host -> FAILED" -ForegroundColor Red
    }
}

# ------------------------------
# DNS TEST
# ------------------------------
Write-Host "\n[ DNS TEST ]" -ForegroundColor Yellow
try {
    Resolve-DnsName google.com -ErrorAction Stop | Out-Null
    Write-Host "DNS Resolution: OK" -ForegroundColor Green
} catch {
    Write-Host "DNS Resolution: FAILED" -ForegroundColor Red
}

# ------------------------------
# WIFI INFO (if available)
# ------------------------------
Write-Host "\n[ WIFI PROFILES ]" -ForegroundColor Yellow
netsh wlan show profiles

# ------------------------------
# PERFORMANCE SNAPSHOT
# ------------------------------
Write-Host "\n[ PERFORMANCE SNAPSHOT ]" -ForegroundColor Yellow
Get-CimInstance Win32_OperatingSystem | Select-Object FreePhysicalMemory, TotalVisibleMemorySize, LastBootUpTime

# ------------------------------
# BASIC REPAIR SUGGESTIONS
# ------------------------------
Write-Host "\n[ QUICK FIX COMMANDS ]" -ForegroundColor Cyan
Write-Host "1. Reset Network:" -ForegroundColor White
Write-Host "   netsh winsock reset" -ForegroundColor Gray
Write-Host "   netsh int ip reset" -ForegroundColor Gray
Write-Host "   ipconfig /flushdns" -ForegroundColor Gray

Write-Host "\n2. System File Check:" -ForegroundColor White
Write-Host "   sfc /scannow" -ForegroundColor Gray

Write-Host "\n3. DISK Check:" -ForegroundColor White
Write-Host "   chkdsk /f" -ForegroundColor Gray

# ------------------------------
# END
# ------------------------------
Write-Host "\n==============================================" -ForegroundColor Cyan
Write-Host "   DIAGNOSTIC COMPLETE" -ForegroundColor Cyan
Write-Host "==============================================" -ForegroundColor Cyan
