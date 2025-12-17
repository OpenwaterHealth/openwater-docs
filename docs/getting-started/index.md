# Getting Started with Openwater

Welcome! This guide will help you install and configure Openwater platforms.

---

## Before You Begin

### System Requirements

**Minimum Requirements:**
- **OS:** Windows 10/11, macOS 10.15+, or Ubuntu 20.04+
- **RAM:** 8 GB (16 GB recommended)
- **Storage:** 10 GB free space
- **Python:** 3.9 or higher
- **Network:** Internet connection for installation

**Recommended for Development:**
- 16+ GB RAM
- SSD storage
- Dedicated GPU (for advanced processing)
- Git installed

### What You'll Need

**Software:**
- Python 3.9+
- pip package manager
- Git (optional but recommended)
- Virtual environment (venv or conda)

**Hardware (Optional):**
- Openwater hardware devices (for hardware testing)
- Ultrasound transducer (for OpenLIFU)
- Optical sensors (for OpenMOTION)

!!! note "Development vs. Hardware Use"
    You can use Openwater software in **simulation mode** without physical hardware. Hardware is only required for actual experiments.

---

## Installation Paths

Choose your path based on your goals:

### :fontawesome-solid-code: Software Development

Install Python packages for software development and simulation.

**Time:** 10-15 minutes

[Software Installation →](installation.md)

### :fontawesome-solid-microchip: Hardware Setup

Connect and configure Openwater hardware devices.

**Time:** 30-60 minutes

[Hardware Setup →](hardware-setup.md)

### :fontawesome-solid-rocket: Quick Start

Run your first experiment in under 10 minutes.

**Time:** 5-10 minutes

[Quick Start →](quickstart.md)

---

## Installation Steps

### Step 1: Install Python

=== "Windows"

    Download Python 3.9+ from [python.org](https://www.python.org/downloads/)
    
    **During installation:**
    - ✅ Check "Add Python to PATH"
    - ✅ Check "Install pip"
    
    **Verify:**
    ```powershell
    python --version
    pip --version
    ```

=== "macOS"

    ```bash
    # Using Homebrew (recommended)
    brew install python@3.9
    
    # Verify
    python3 --version
    pip3 --version
    ```

=== "Linux"

    ```bash
    # Ubuntu/Debian
    sudo apt update
    sudo apt install python3.9 python3-pip
    
    # Verify
    python3 --version
    pip3 --version
    ```

### Step 2: Create Virtual Environment

```bash
# Create virtual environment
python -m venv openwater-env

# Activate (Windows)
openwater-env\Scripts\activate

# Activate (macOS/Linux)
source openwater-env/bin/activate
```

### Step 3: Install Openwater

```bash
# OpenLIFU
pip install openlifu

# OpenMOTION
pip install openmotion

# Both platforms
pip install openlifu openmotion
```

[Detailed Installation Guide →](installation.md)

---

## First Steps

### 1. Verify Installation

```python
# Test OpenLIFU
import openlifu
print(f"OpenLIFU version: {openlifu.__version__}")

# Test OpenMOTION
import openmotion
print(f"OpenMOTION version: {openmotion.__version__}")
```

### 2. Run Quick Start Tutorial

Follow our quick start guide to run your first experiment:

[Quick Start Tutorial →](quickstart.md)

### 3. Explore Examples

Check out example code in our repositories:

- [OpenLIFU Examples](https://github.com/OpenwaterHealth/OpenLIFU-python/tree/main/examples)
- [OpenMOTION Examples](https://github.com/OpenwaterHealth/OpenMOTION-Pylib/tree/main/examples)

---

## Troubleshooting

Having issues? Check our troubleshooting guide:

[Troubleshooting Guide →](troubleshooting.md)

**Common Issues:**
- Python version compatibility
- pip installation failures
- Import errors
- Hardware connection problems

---

## Next Steps

<div class="grid cards" markdown>

-   :material-brain: **OpenLIFU**

    ---

    Learn about focused ultrasound platform

    [OpenLIFU Docs →](../openlifu/index.md)

-   :material-heart-pulse: **OpenMOTION**

    ---

    Explore optical imaging platform

    [OpenMOTION Docs →](../openmotion/index.md)

-   :material-screwdriver-wrench: **Hardware**

    ---

    Set up physical devices

    [Hardware Guide →](../hardware/index.md)

-   :material-account-group: **Community**

    ---

    Join our community

    [Get Involved →](../community/index.md)

</div>

---

## Support

Need help getting started?

- **Discord:** Real-time help from community
- **GitHub Issues:** Report installation problems
- **Email:** [community@openwater.health](mailto:community@openwater.health)
- **Office Hours:** Weekly Q&A sessions

---

**Ready to install?** [Start with the installation guide →](installation.md)
