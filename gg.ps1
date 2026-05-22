# ==========================================
# SIMPLE NETWORK TEST TOOL
# Save as: network-test.ps1
# ==========================================

Clear-Host
Write-Host "======================================" -ForegroundColor Cyan
Write-Host "        NETWORK TEST TOOL             " -ForegroundColor Green
Write-Host "======================================" -ForegroundColor Cyan
Write-Host ""

# Test Google DNS
Write-Host "[1] Testing connection to Google DNS (8.8.8.8)..." -ForegroundColor Yellow
ping 8.8.8.8

Write-Host ""
Write-Host "--------------------------------------"
Write-Host ""

# Test Google Website
Write-Host "[2] Testing connection to google.com..." -ForegroundColor Yellow
ping google.com

Write-Host ""
Write-Host "======================================"
Write-Host "Test Completed"
Write-Host "======================================" -ForegroundColor Cyan

Pause