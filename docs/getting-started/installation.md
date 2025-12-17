# Installation Guide

Complete guide to installing Openwater platforms on your system.

---

## Quick Installation

```bash
# Install both platforms
pip install openlifu openmotion
```

That's it! For most users, this is all you need.

---

## Detailed Installation

### Prerequisites

#### 1. Python 3.9+

=== "Windows"

    1. Download from [python.org](https://www.python.org/downloads/)
    2. Run installer
    3. ✅ **Important:** Check "Add Python to PATH"
    4. Verify:
       ```powershell
       python --version
       pip --version
       ```

=== "macOS"

    ```bash
    # Install Homebrew (if not installed)
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Install Python
    brew install python@3.9
    
    # Verify
    python3 --version
    pip3 --version
    ```

=== "Linux (Ubuntu/Debian)"

    ```bash
    sudo apt update
    sudo apt install python3.9 python3-pip python3-venv
    
    # Verify
    python3 --version
    pip3 --version
    ```

#### 2. Git (Optional but Recommended)

=== "Windows"

    Download from [git-scm.com](https://git-scm.com/downloads)

=== "macOS"

    ```bash
    brew install git
    ```

=== "Linux"

    ```bash
    sudo apt install git
    ```

---

## Installation Methods

### Method 1: pip (Recommended)

**For most users - simplest and fastest.**

```bash
# Create and activate virtual environment
python -m venv openwater-env

# Windows
openwater-env\Scripts\activate

# macOS/Linux
source openwater-env/bin/activate

# Install
pip install openlifu openmotion

# Verify
python -c "import openlifu; print(openlifu.__version__)"
python -c "import openmotion; print(openmotion.__version__)"
```

### Method 2: From Source (For Developers)

**For contributing or accessing latest features.**

#### OpenLIFU from Source

```bash
# Clone repository
git clone https://github.com/OpenwaterHealth/OpenLIFU-python.git
cd OpenLIFU-python

# Install in development mode
pip install -e .

# Install development dependencies
pip install -e ".[dev]"
```

#### OpenMOTION from Source

```bash
# Clone repository
git clone https://github.com/OpenwaterHealth/OpenMOTION-Pylib.git
cd OpenMOTION-Pylib

# Install in development mode
pip install -e .
```

### Method 3: Conda (Alternative)

**For conda users.**

```bash
# Create conda environment
conda create -n openwater python=3.9
conda activate openwater

# Install via pip
pip install openlifu openmotion
```

---

## Platform-Specific Installation

### OpenLIFU

**Dependencies:**
```bash
pip install openlifu
```

**Optional dependencies:**
```bash
# For 3D Slicer integration
pip install "openlifu[slicer]"

# For advanced visualization
pip install "openlifu[viz]"

# For K-Wave acoustic simulation
# (K-Wave must be installed separately)
pip install "openlifu[simulation]"

# Everything
pip install "openlifu[all]"
```

**Verify installation:**
```python
import openlifu

# Check version
print(openlifu.__version__)

# Test basic functionality
protocol = openlifu.Protocol()
print("OpenLIFU installed successfully!")
```

### OpenMOTION

**Dependencies:**
```bash
pip install openmotion
```

**Optional dependencies:**
```bash
# For hardware communication
pip install "openmotion[hardware]"

# For advanced analysis
pip install "openmotion[analysis]"

# Everything
pip install "openmotion[all]"
```

**Verify installation:**
```python
import openmotion

# Check version
print(openmotion.__version__)

# Test basic functionality
sensor = openmotion.Sensor()
print("OpenMOTION installed successfully!")
```

---

## Additional Dependencies

### For Medical Imaging (OpenLIFU)

#### 3D Slicer

**Download:** [slicer.org](https://download.slicer.org/)

Install SlicerOpenLIFU extension:
1. Open 3D Slicer
2. Extension Manager
3. Search "OpenLIFU"
4. Install
5. Restart Slicer

#### K-Wave (For Acoustic Simulation)

**MATLAB version:**
1. Download from [k-wave.org](http://www.k-wave.org/downloads.php)
2. Extract to MATLAB path
3. Add to MATLAB path:
   ```matlab
   addpath('/path/to/k-wave')
   savepath
   ```

**Python version:**
```bash
pip install k-wave-python
```

### For Data Analysis

```bash
# Scientific computing
pip install numpy scipy matplotlib

# Medical imaging
pip install SimpleITK nibabel pydicom

# Data analysis
pip install pandas seaborn

# Machine learning (optional)
pip install scikit-learn
```

---

## Verification

### Complete Installation Test

Create a file `test_installation.py`:

```python
#!/usr/bin/env python3
"""Test Openwater installation."""

def test_openlifu():
    try:
        import openlifu
        print(f"✓ OpenLIFU {openlifu.__version__} installed")
        return True
    except ImportError as e:
        print(f"✗ OpenLIFU not installed: {e}")
        return False

def test_openmotion():
    try:
        import openmotion
        print(f"✓ OpenMOTION {openmotion.__version__} installed")
        return True
    except ImportError as e:
        print(f"✗ OpenMOTION not installed: {e}")
        return False

def test_dependencies():
    deps = {
        'numpy': 'NumPy',
        'scipy': 'SciPy',
        'matplotlib': 'Matplotlib',
    }
    
    for module, name in deps.items():
        try:
            __import__(module)
            print(f"✓ {name} installed")
        except ImportError:
            print(f"✗ {name} not installed")

if __name__ == '__main__':
    print("Testing Openwater Installation...\n")
    openlifu_ok = test_openlifu()
    openmotion_ok = test_openmotion()
    print("\nTesting dependencies...")
    test_dependencies()
    
    if openlifu_ok or openmotion_ok:
        print("\n✓ Installation successful!")
    else:
        print("\n✗ Installation failed - see errors above")
```

Run the test:
```bash
python test_installation.py
```

---

## Updating

### Update to Latest Release

```bash
# Activate your environment
source openwater-env/bin/activate  # or activate.bat on Windows

# Update OpenLIFU
pip install --upgrade openlifu

# Update OpenMOTION
pip install --upgrade openmotion
```

### Update from Source

```bash
# Navigate to repository
cd OpenLIFU-python

# Pull latest changes
git pull origin main

# Reinstall
pip install -e .
```

---

## Uninstallation

```bash
# Uninstall OpenLIFU
pip uninstall openlifu

# Uninstall OpenMOTION
pip uninstall openmotion

# Remove virtual environment (optional)
deactivate
rm -rf openwater-env  # or delete folder on Windows
```

---

## Troubleshooting

### Common Installation Issues

#### Permission Errors

**Problem:** `Permission denied` or `Access is denied`

**Solution:**
```bash
# Use --user flag
pip install --user openlifu openmotion

# Or use virtual environment (recommended)
python -m venv openwater-env
source openwater-env/bin/activate
pip install openlifu openmotion
```

#### Python Version Issues

**Problem:** `requires Python >=3.9`

**Solution:**
```bash
# Check your Python version
python --version

# Install correct version
# Windows: Download from python.org
# macOS: brew install python@3.9
# Linux: sudo apt install python3.9
```

#### pip Not Found

**Problem:** `pip: command not found`

**Solution:**
```bash
# Use python -m pip instead
python -m pip install openlifu openmotion

# Or install pip
python -m ensurepip --upgrade
```

#### SSL Certificate Errors

**Problem:** `SSL: CERTIFICATE_VERIFY_FAILED`

**Solution:**
```bash
# Upgrade pip and certificates
pip install --upgrade pip certifi

# Or use --trusted-host (not recommended)
pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org openlifu
```

#### Import Errors After Installation

**Problem:** `ModuleNotFoundError: No module named 'openlifu'`

**Solutions:**
1. Verify installation:
   ```bash
   pip list | grep openlifu
   ```

2. Check Python environment:
   ```bash
   which python  # macOS/Linux
   where python  # Windows
   ```

3. Reinstall:
   ```bash
   pip uninstall openlifu
   pip install openlifu
   ```

### Platform-Specific Issues

#### Windows

**Issue:** Long path errors

**Solution:**
- Enable long paths in Windows 10/11
- Or install in shorter path (e.g., `C:\openwater\`)

#### macOS

**Issue:** Permissions on system Python

**Solution:**
- Use Homebrew Python (recommended)
- Or use virtual environment

#### Linux

**Issue:** Missing system dependencies

**Solution:**
```bash
sudo apt install python3-dev build-essential
```

---

## Next Steps

✅ Installation complete!

**What's next?**

1. [Run the Quick Start tutorial →](quickstart.md)
2. [Set up hardware (if you have devices) →](hardware-setup.md)
3. [Explore OpenLIFU documentation →](../openlifu/index.md)
4. [Explore OpenMOTION documentation →](../openmotion/index.md)

---

## Support

Still having issues?

- **GitHub Issues:** [Report installation problems](https://github.com/OpenwaterHealth/openwater-commons/issues)
- **Discord:** Get help from the community
- **Email:** [community@openwater.health](mailto:community@openwater.health)
