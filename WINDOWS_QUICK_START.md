# Windows Quick Start Card

**Get openwater-docs deployed on Windows in 1 hour**

---

## 📥 STEP 1: Download Files (2 minutes)

From this cloud environment, download to your Windows machine:

**Option A - Single Archive:**
- Download: `openwater-docs-complete.tar.gz`

**Option B - Individual Files:**
- `mkdocs.yml`
- `requirements.txt`
- `setup-windows.ps1`
- `docs/` folder (all contents)
- `.github/` folder (all contents)

---

## 💻 STEP 2: Extract & Setup (5 minutes)

**Open PowerShell on Windows:**

```powershell
# Navigate to Downloads
cd $HOME\Downloads

# Extract archive (Windows 10+ has tar built-in)
tar -xzf openwater-docs-complete.tar.gz

# Navigate into folder
cd openwater-docs

# Run automated setup
.\setup-windows.ps1
```

**If you get execution policy error:**
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

---

## 🧪 STEP 3: Test Locally (2 minutes)

```powershell
# Activate virtual environment
.\venv\Scripts\Activate.ps1

# Serve documentation
mkdocs serve

# Open browser to: http://127.0.0.1:8000
```

**You should see your documentation!** ✅

---

## 📤 STEP 4: Deploy to GitHub (10 minutes)

```powershell
# Initialize git
git init
git add .
git commit -m "Initial commit: Complete OpenWater documentation"

# Add remote (create repo first on GitHub web interface)
git remote add origin https://github.com/OpenwaterHealth/openwater-docs.git

# Push to GitHub
git branch -M main
git push -u origin main
```

**Create GitHub Repo First:**
1. Go to: https://github.com/organizations/OpenwaterHealth/repositories/new
2. Name: `openwater-docs`
3. Public, Apache 2.0 license
4. **Don't** initialize with README

---

## ⚙️ STEP 5: Configure GitHub Pages (5 minutes)

**In web browser:**

1. Go to: `Settings → Pages`
2. Source: **GitHub Actions** (not "Deploy from branch")
3. Go to: `Settings → Actions → General`
4. Select: ✅ **Read and write permissions**
5. Check: ✅ **Allow GitHub Actions to create and approve pull requests**

**Watch deployment:**
- Go to `Actions` tab
- Wait for green ✅ (2-3 minutes)
- Visit: `https://openwaterhealth.github.io/openwater-docs/`

---

## 🌐 STEP 6: Custom Domain (30 minutes)

**In GitHub:**
1. `Settings → Pages → Custom domain`
2. Enter: `docs.openwater.health`
3. Save

**In your DNS provider:**
Add CNAME record:
```
Type: CNAME
Name: docs
Value: openwaterhealth.github.io
TTL: 3600
```

**Wait for DNS (10 min - 24 hours):**
```powershell
nslookup docs.openwater.health
```

**Enable HTTPS:**
1. `Settings → Pages`
2. ✅ **Enforce HTTPS**
3. Wait 10-30 minutes

**Done!** Visit: https://docs.openwater.health

---

## 🔧 Common Issues

**Python not found?**
→ Install: https://www.python.org/downloads/
→ Check: "Add Python to PATH" during install

**Git not found?**
→ Install: https://git-scm.com/download/win

**Execution policy error?**
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

**Port 8000 in use?**
```powershell
mkdocs serve -a 127.0.0.1:8001
```

---

## 📖 Full Documentation

After downloading, read these files on your Windows machine:

1. **START_HERE.md** - Complete overview
2. **WINDOWS_DEPLOYMENT.md** - Full PowerShell guide (512 lines)
3. **DEPLOYMENT_CHECKLIST.md** - Detailed checklist
4. **SETUP_GUIDE.md** - Troubleshooting

---

## ✅ Success Checklist

- [ ] Files downloaded and extracted
- [ ] Python & Git installed
- [ ] Virtual environment created
- [ ] Dependencies installed
- [ ] Local server works (http://127.0.0.1:8000)
- [ ] GitHub repo created
- [ ] Files pushed to GitHub
- [ ] GitHub Pages configured
- [ ] First deployment successful
- [ ] Custom domain configured
- [ ] DNS propagated
- [ ] HTTPS enabled
- [ ] Site live at docs.openwater.health

---

## ⏱️ Timeline

- **Now:** Download files (2 min)
- **+5 min:** Setup environment (5 min)
- **+10 min:** Test locally (2 min)
- **+15 min:** Push to GitHub (5 min)
- **+20 min:** Configure Pages (5 min)
- **+25 min:** Watch deployment (3 min)
- **+30 min:** Configure domain (5 min)
- **+1 hour:** DNS propagates (wait)
- **DONE:** Site live!

---

**Total Active Time: ~30 minutes**
**Total Wait Time: ~30 minutes (DNS)**

**Let's go!** 🚀
