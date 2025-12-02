# Windows PowerShell Deployment Guide

**Deploying openwater-docs on Windows with PowerShell**

---

## 🪟 Windows-Specific Instructions

### Step 1: Download Files from This Environment

Since you're working in a cloud environment, you'll need to download the files to your Windows machine.

#### Option A: Download Complete Archive (Recommended)

The file `openwater-docs-complete.tar.gz` contains everything. 

**To extract .tar.gz on Windows:**

```powershell
# If you have 7-Zip installed:
& "C:\Program Files\7-Zip\7z.exe" x openwater-docs-complete.tar.gz
& "C:\Program Files\7-Zip\7z.exe" x openwater-docs-complete.tar

# Or use Windows built-in (Windows 10+):
tar -xzf openwater-docs-complete.tar.gz
```

#### Option B: Download Files Individually

Download these key files/folders from `/home/claude/`:

**Core Files:**
- `mkdocs.yml`
- `requirements.txt`
- `README.md`
- `.gitignore`

**Directories:**
- `.github\` (entire folder)
- `docs\` (entire folder with all subdirectories)
- `overrides\` (entire folder)

**Guide Documents:**
- `START_HERE.md`
- `DEPLOYMENT_CHECKLIST.md`
- `SETUP_GUIDE.md`
- `REPOSITORY_STRUCTURE.md`

---

## 🚀 Deployment Steps (Windows PowerShell)

### Step 2: Organize Files Locally

```powershell
# Navigate to your projects folder
cd $HOME\Documents\Projects

# Create directory for the repo
New-Item -ItemType Directory -Path "openwater-docs"
cd openwater-docs

# Extract or copy all files here
# (If you extracted the tar.gz, move files from the extracted folder)
```

### Step 3: Set Up Python Virtual Environment

```powershell
# Create virtual environment
python -m venv venv

# Activate virtual environment (IMPORTANT!)
.\venv\Scripts\Activate.ps1

# If you get an execution policy error, run this first:
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Then activate again:
.\venv\Scripts\Activate.ps1

# Install dependencies
pip install -r requirements.txt
```

### Step 4: Test Locally (Optional but Recommended)

```powershell
# Make sure virtual environment is activated (you should see (venv) in prompt)
# If not: .\venv\Scripts\Activate.ps1

# Serve documentation locally
mkdocs serve

# Open browser to: http://127.0.0.1:8000
# Press Ctrl+C to stop when done
```

### Step 5: Initialize Git Repository

```powershell
# Initialize git (if not already done)
git init

# Add all files
git add .

# Create initial commit
git commit -m "Initial commit: Complete OpenWater documentation

- Add MkDocs configuration with Material theme
- Add comprehensive docs structure for OpenLIFU and OpenMOTION
- Add GitHub Actions workflow for auto-deployment
- Add Apache 2.0 license transition documentation
- Add TSC governance documentation
- Configure navigation and theming"
```

### Step 6: Create GitHub Repository

**In your web browser:**

1. Go to: https://github.com/organizations/OpenwaterHealth/repositories/new
2. Fill in:
   - Repository name: `openwater-docs`
   - Description: "Comprehensive documentation for Openwater's open-source medical device platforms"
   - Visibility: **Public**
   - **DO NOT** check "Initialize with README" (you already have one)
   - Add license: **Apache License 2.0**
3. Click "Create repository"

### Step 7: Push to GitHub

```powershell
# Add remote (replace with your actual repo URL if different)
git remote add origin https://github.com/OpenwaterHealth/openwater-docs.git

# Push to GitHub
git branch -M main
git push -u origin main

# You may be prompted to authenticate - use your GitHub credentials
```

### Step 8: Configure GitHub Pages

**In your web browser:**

1. Go to: `https://github.com/OpenwaterHealth/openwater-docs/settings/pages`

2. **Set Source:**
   - Source: **GitHub Actions** (not "Deploy from a branch")

3. **Set Workflow Permissions:**
   - Go to: `Settings → Actions → General`
   - Scroll to "Workflow permissions"
   - Select: ✅ **Read and write permissions**
   - Check: ✅ **Allow GitHub Actions to create and approve pull requests**
   - Click "Save"

### Step 9: Watch Deployment

```powershell
# Open GitHub Actions in your browser
Start-Process "https://github.com/OpenwaterHealth/openwater-docs/actions"

# Wait for green checkmark (2-3 minutes)
# Then visit your site:
Start-Process "https://openwaterhealth.github.io/openwater-docs/"
```

---

## 🌐 Custom Domain Setup (Windows)

### Step 10: Configure Custom Domain in GitHub

**In your web browser:**

1. Go to: `https://github.com/OpenwaterHealth/openwater-docs/settings/pages`
2. Under "Custom domain", enter: `docs.openwater.health`
3. Click "Save"

### Step 11: Configure DNS

**In your DNS provider dashboard** (wherever openwater.health is hosted):

**Add CNAME record:**
```
Type: CNAME
Name: docs
Value: openwaterhealth.github.io
TTL: 3600 (or Auto)
```

### Step 12: Verify DNS Propagation

```powershell
# Check DNS resolution
nslookup docs.openwater.health

# Should eventually show: openwaterhealth.github.io
# May take 10 minutes to 24 hours
```

### Step 13: Enable HTTPS

After DNS propagates:

1. Go back to: `Settings → Pages`
2. Check: ✅ **Enforce HTTPS**
3. Wait 10-30 minutes for certificate issuance

🎉 **Done!** Visit: https://docs.openwater.health

---

## 🔧 Windows PowerShell Commands Reference

### Common Tasks

**Navigate directories:**
```powershell
cd $HOME\Documents\Projects
cd openwater-docs
```

**List files:**
```powershell
Get-ChildItem          # or just: dir
Get-ChildItem -Recurse # List all files recursively
```

**Copy files:**
```powershell
Copy-Item -Path "source.txt" -Destination "dest.txt"
Copy-Item -Path "folder" -Destination "newfolder" -Recurse
```

**Check Python version:**
```powershell
python --version
```

**Check Git status:**
```powershell
git status
git log --oneline
```

**Activate virtual environment:**
```powershell
.\venv\Scripts\Activate.ps1
# You should see (venv) in your prompt
```

**Deactivate virtual environment:**
```powershell
deactivate
```

---

## 📝 Making Updates After Deployment

### Edit Documentation

```powershell
# Navigate to repo
cd $HOME\Documents\Projects\openwater-docs

# Activate virtual environment
.\venv\Scripts\Activate.ps1

# Edit any .md file in docs\ folder
# For example, in VS Code:
code docs\getting-started\quickstart.md

# Test locally
mkdocs serve
# Open: http://127.0.0.1:8000

# Commit and push
git add docs\getting-started\quickstart.md
git commit -m "Update quickstart guide"
git push origin main

# GitHub Actions automatically rebuilds (2-3 minutes)
# Refresh docs.openwater.health to see changes
```

### Add New Page

```powershell
# Create new file
New-Item -Path "docs\tutorials\advanced-guide.md" -ItemType File

# Edit it with your preferred editor
notepad docs\tutorials\advanced-guide.md
# or: code docs\tutorials\advanced-guide.md (VS Code)

# Update mkdocs.yml to add to navigation
# Add under appropriate section in 'nav:' section

# Test locally
mkdocs serve

# Commit and push
git add docs\tutorials\advanced-guide.md
git add mkdocs.yml
git commit -m "Add advanced guide tutorial"
git push origin main
```

---

## ⚠️ Common Windows Issues & Solutions

### Issue: PowerShell Execution Policy Error

**Error:** "cannot be loaded because running scripts is disabled"

**Solution:**
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Issue: Python not found

**Error:** "python: The term 'python' is not recognized"

**Solution:**
1. Install Python from: https://www.python.org/downloads/
2. During installation, CHECK: ✅ "Add Python to PATH"
3. Restart PowerShell
4. Test: `python --version`

### Issue: Git not found

**Error:** "git: The term 'git' is not recognized"

**Solution:**
1. Install Git from: https://git-scm.com/download/win
2. Use default settings during installation
3. Restart PowerShell
4. Test: `git --version`

### Issue: Can't extract .tar.gz

**Solution Option 1 - Use Windows built-in tar:**
```powershell
tar -xzf openwater-docs-complete.tar.gz
```

**Solution Option 2 - Install 7-Zip:**
1. Download from: https://www.7-zip.org/
2. Install it
3. Extract using 7-Zip File Manager (right-click on .tar.gz)

### Issue: Port 8000 already in use

**Error:** "Address already in use"

**Solution:**
```powershell
# Find process using port 8000
Get-NetTCPConnection -LocalPort 8000

# Kill that process (use PID from above)
Stop-Process -Id <PID>

# Or use different port:
mkdocs serve -a 127.0.0.1:8001
```

---

## 💻 Recommended Windows Tools

### Essential
- ✅ **Git for Windows** - https://git-scm.com/download/win
- ✅ **Python 3.8+** - https://www.python.org/downloads/
- ✅ **PowerShell 7** (optional upgrade) - https://github.com/PowerShell/PowerShell

### Helpful
- 📝 **VS Code** - https://code.visualstudio.com/
- 📦 **7-Zip** - https://www.7-zip.org/
- 🖥️ **Windows Terminal** - Microsoft Store (better than default PowerShell)

---

## 🎨 Windows Terminal Configuration (Optional)

If you use Windows Terminal, add this to make it prettier:

```json
{
    "profiles": {
        "defaults": {
            "fontFace": "Cascadia Code",
            "fontSize": 10
        }
    }
}
```

---

## 📋 Windows Deployment Checklist

### Prerequisites
- [ ] Python 3.8+ installed and in PATH
- [ ] Git for Windows installed
- [ ] PowerShell 5.1+ or PowerShell 7
- [ ] GitHub account with OpenwaterHealth access
- [ ] Text editor (VS Code, Notepad++, etc.)

### Deployment Steps
- [ ] Download files from cloud environment
- [ ] Create openwater-docs folder
- [ ] Set up Python virtual environment
- [ ] Install dependencies with pip
- [ ] Test locally with mkdocs serve
- [ ] Initialize git repository
- [ ] Create GitHub repository (web)
- [ ] Push files to GitHub
- [ ] Configure GitHub Pages (Actions)
- [ ] Set workflow permissions
- [ ] Watch first deployment succeed
- [ ] Configure custom domain
- [ ] Set up DNS CNAME record
- [ ] Verify DNS propagation
- [ ] Enable HTTPS
- [ ] Verify site works at docs.openwater.health

### Post-Deployment
- [ ] Announce to team
- [ ] Update links in other repos
- [ ] Add to Discord resources
- [ ] Train team on updates
- [ ] Set up local development workflow

---

## 🔄 Quick Reference: Full Workflow

```powershell
# INITIAL SETUP (one time)
cd $HOME\Documents\Projects\openwater-docs
python -m venv venv
.\venv\Scripts\Activate.ps1
pip install -r requirements.txt
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/OpenwaterHealth/openwater-docs.git
git push -u origin main

# MAKING UPDATES (regular workflow)
cd $HOME\Documents\Projects\openwater-docs
.\venv\Scripts\Activate.ps1
mkdocs serve  # Test locally
# Make changes to docs\*.md files
git add .
git commit -m "Description of changes"
git push origin main
# Wait 2-3 minutes, changes live at docs.openwater.health
```

---

## 🆘 Getting Help

### First Steps
1. Check this guide for Windows-specific solutions
2. Review `DEPLOYMENT_CHECKLIST.md` for detailed steps
3. Check GitHub Actions logs for deployment errors

### PowerShell Help Commands
```powershell
Get-Help <command>              # Get help for a command
Get-Command *git*               # Find commands with "git"
Get-Process                     # List running processes
Get-NetTCPConnection           # List network connections
```

### Resources
- PowerShell Documentation: https://docs.microsoft.com/powershell/
- Git for Windows: https://git-scm.com/download/win
- MkDocs Documentation: https://www.mkdocs.org/
- Material Theme: https://squidfunk.github.io/mkdocs-material/

---

## ✅ You're Ready for Windows!

All commands are now Windows PowerShell compatible. Follow this guide and you'll have your documentation deployed in 1-2 hours!

**Key Differences from Linux/Mac:**
- Use `.\venv\Scripts\Activate.ps1` instead of `source venv/bin/activate`
- Use backslashes `\` in paths (or forward slashes `/` work too)
- Use `New-Item` instead of `touch`
- Use `Copy-Item` instead of `cp`
- Everything else (git, mkdocs, pip) works the same!

---

**Time to deploy: 1-2 hours**  
**Platform: Windows 10/11 with PowerShell**  
**Result: Professional documentation at docs.openwater.health**

**Let's go!** 🚀
