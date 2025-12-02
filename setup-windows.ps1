# Openwater Docs - Windows Setup Script
# Run this after extracting files to set up your local environment

Write-Host "==================================" -ForegroundColor Cyan
Write-Host "Openwater Documentation Setup" -ForegroundColor Cyan
Write-Host "==================================" -ForegroundColor Cyan
Write-Host ""

# Check Python
Write-Host "Checking Python installation..." -ForegroundColor Yellow
try {
    $pythonVersion = python --version 2>&1
    Write-Host "✓ Found: $pythonVersion" -ForegroundColor Green
    
    # Check if version is 3.8+
    $versionMatch = $pythonVersion -match "Python (\d+)\.(\d+)"
    if ($versionMatch) {
        $major = [int]$matches[1]
        $minor = [int]$matches[2]
        if ($major -eq 3 -and $minor -lt 8) {
            Write-Host "⚠ Warning: Python 3.8+ recommended (you have $major.$minor)" -ForegroundColor Yellow
        }
    }
} catch {
    Write-Host "✗ Python not found!" -ForegroundColor Red
    Write-Host "  Install from: https://www.python.org/downloads/" -ForegroundColor Red
    Write-Host "  Make sure to check 'Add Python to PATH' during installation" -ForegroundColor Red
    exit 1
}

# Check Git
Write-Host "Checking Git installation..." -ForegroundColor Yellow
try {
    $gitVersion = git --version 2>&1
    Write-Host "✓ Found: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ Git not found!" -ForegroundColor Red
    Write-Host "  Install from: https://git-scm.com/download/win" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "==================================" -ForegroundColor Cyan
Write-Host "Setting up virtual environment..." -ForegroundColor Cyan
Write-Host "==================================" -ForegroundColor Cyan
Write-Host ""

# Create virtual environment
if (Test-Path "venv") {
    Write-Host "Virtual environment already exists" -ForegroundColor Yellow
    $recreate = Read-Host "Recreate it? (y/N)"
    if ($recreate -eq "y" -or $recreate -eq "Y") {
        Remove-Item -Recurse -Force venv
        python -m venv venv
        Write-Host "✓ Virtual environment recreated" -ForegroundColor Green
    }
} else {
    python -m venv venv
    Write-Host "✓ Virtual environment created" -ForegroundColor Green
}

Write-Host ""
Write-Host "==================================" -ForegroundColor Cyan
Write-Host "Installing dependencies..." -ForegroundColor Cyan
Write-Host "==================================" -ForegroundColor Cyan
Write-Host ""

# Activate virtual environment and install dependencies
Write-Host "Activating virtual environment..." -ForegroundColor Yellow

# Create a temporary script to activate venv and install packages
$activateScript = @"
& .\venv\Scripts\Activate.ps1
pip install --upgrade pip
pip install -r requirements.txt
"@

# Save to temp file and execute
$tempScript = [System.IO.Path]::GetTempFileName() + ".ps1"
$activateScript | Out-File -FilePath $tempScript -Encoding utf8

try {
    & powershell.exe -ExecutionPolicy Bypass -File $tempScript
    Write-Host "✓ Dependencies installed" -ForegroundColor Green
} catch {
    Write-Host "✗ Failed to install dependencies" -ForegroundColor Red
    Write-Host "Try running manually:" -ForegroundColor Yellow
    Write-Host "  .\venv\Scripts\Activate.ps1" -ForegroundColor Yellow
    Write-Host "  pip install -r requirements.txt" -ForegroundColor Yellow
} finally {
    Remove-Item $tempScript -ErrorAction SilentlyContinue
}

Write-Host ""
Write-Host "==================================" -ForegroundColor Cyan
Write-Host "Testing MkDocs..." -ForegroundColor Cyan
Write-Host "==================================" -ForegroundColor Cyan
Write-Host ""

# Test mkdocs
$testScript = @"
& .\venv\Scripts\Activate.ps1
mkdocs --version
"@

$tempTest = [System.IO.Path]::GetTempFileName() + ".ps1"
$testScript | Out-File -FilePath $tempTest -Encoding utf8

try {
    $mkdocsVersion = & powershell.exe -ExecutionPolicy Bypass -File $tempTest 2>&1
    Write-Host "✓ MkDocs installed: $mkdocsVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ MkDocs test failed" -ForegroundColor Red
} finally {
    Remove-Item $tempTest -ErrorAction SilentlyContinue
}

Write-Host ""
Write-Host "==================================" -ForegroundColor Green
Write-Host "Setup Complete!" -ForegroundColor Green
Write-Host "==================================" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "  1. Activate virtual environment:" -ForegroundColor White
Write-Host "     .\venv\Scripts\Activate.ps1" -ForegroundColor Cyan
Write-Host ""
Write-Host "  2. Test documentation locally:" -ForegroundColor White
Write-Host "     mkdocs serve" -ForegroundColor Cyan
Write-Host "     Then open: http://127.0.0.1:8000" -ForegroundColor Cyan
Write-Host ""
Write-Host "  3. Initialize Git (if not done):" -ForegroundColor White
Write-Host "     git init" -ForegroundColor Cyan
Write-Host "     git add ." -ForegroundColor Cyan
Write-Host "     git commit -m 'Initial commit'" -ForegroundColor Cyan
Write-Host ""
Write-Host "  4. Follow WINDOWS_DEPLOYMENT.md for full deployment" -ForegroundColor White
Write-Host ""
Write-Host "Need help? Read START_HERE.md or WINDOWS_DEPLOYMENT.md" -ForegroundColor Yellow
Write-Host ""
