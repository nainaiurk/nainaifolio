# Native Portfolio Deployment Script
# Run this script to deploy to Vercel

Write-Host "====================================" -ForegroundColor Cyan
Write-Host "  Native Portfolio Deployment" -ForegroundColor Cyan
Write-Host "====================================" -ForegroundColor Cyan
Write-Host ""

# Check if in correct directory
$currentDir = Split-Path -Leaf (Get-Location)
if ($currentDir -ne "native-portfolio") {
    Write-Host "Navigating to native-portfolio directory..." -ForegroundColor Yellow
    cd native-portfolio
}

Write-Host "✓ Directory: $(Get-Location)" -ForegroundColor Green
Write-Host ""

# Display options
Write-Host "Choose deployment method:" -ForegroundColor Yellow
Write-Host "1. Deploy to Vercel (Recommended)"
Write-Host "2. Start local server (Python)"
Write-Host "3. Start local server (Node.js)"
Write-Host "4. Open in browser (File)"
Write-Host "5. Exit"
Write-Host ""

$choice = Read-Host "Enter choice (1-5)"

switch ($choice) {
    "1" {
        Write-Host "`nDeploying to Vercel..." -ForegroundColor Cyan
        Write-Host "Make sure you have Vercel CLI installed: npm i -g vercel" -ForegroundColor Yellow
        Write-Host ""
        vercel --prod
    }
    "2" {
        Write-Host "`nStarting Python server on http://localhost:8000..." -ForegroundColor Cyan
        Write-Host "Press Ctrl+C to stop" -ForegroundColor Yellow
        python -m http.server 8000
    }
    "3" {
        Write-Host "`nStarting Node.js server on http://localhost:8080..." -ForegroundColor Cyan
        Write-Host "Make sure you have http-server: npm i -g http-server" -ForegroundColor Yellow
        Write-Host "Press Ctrl+C to stop" -ForegroundColor Yellow
        npx http-server -p 8080
    }
    "4" {
        Write-Host "`nOpening in default browser..." -ForegroundColor Cyan
        Start-Process "index.html"
    }
    "5" {
        Write-Host "Exiting..." -ForegroundColor Gray
        exit
    }
    default {
        Write-Host "Invalid choice. Exiting..." -ForegroundColor Red
        exit
    }
}
