# Troubleshooting Guide

Common issues and solutions for Openwater platforms.

---

## Installation Issues

### Python Version Problems

**Error:** `requires Python >=3.9`

**Solution:**
```bash
# Check version
python --version

# Install correct version
# Windows: Download from python.org
# macOS: brew install python@3.9
# Linux: sudo apt install python3.9
```

### pip Install Fails

**Error:** `Could not find a version that satisfies the requirement`

**Solution:**
```bash
# Upgrade pip
python -m pip install --upgrade pip

# Try again
pip install openlifu
```

**Error:** `Permission denied`

**Solution:**
```bash
# Use virtual environment (recommended)
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate
pip install openlifu

# Or use --user
pip install --user openlifu
```

### Import Errors

**Error:** `ModuleNotFoundError: No module named 'openlifu'`

**Solution:**
1. Verify installation:
   ```bash
   pip list | grep openlifu
   ```

2. Check Python path:
   ```python
   import sys
   print(sys.path)
   ```

3. Reinstall:
   ```bash
   pip uninstall openlifu
   pip install openlifu
   ```

---

## Runtime Errors

### OpenLIFU Errors

**Error:** `Transducer not found`

**Solution:**
```python
# List available transducers
import openlifu
print(openlifu.xdc.list_transducers())

# Use correct name
transducer = openlifu.xdc.Transducer('H317')  # not 'h317' or 'H-317'
```

**Error:** `Invalid protocol parameters`

**Solution:**
```python
# Check parameter ranges
protocol = openlifu.Protocol(
    frequency=500000,  # Must be > 0
    pulse_duration=0.001,  # Must be > 0
    pulse_count=1000,  # Must be > 0
)
```

**Error:** `Memory error during simulation`

**Solution:**
```python
# Reduce simulation resolution
plan.calc_focus_pattern(resolution=0.001)  # instead of 0.0001

# Or use lower precision
plan.calc_focus_pattern(precision='low')
```

### OpenMOTION Errors

**Error:** `Sensor not responding`

**Solution:**
1. Check connection:
   ```python
   import openmotion
   print(openmotion.list_sensors())
   ```

2. Reset sensor:
   ```python
   sensor = openmotion.Sensor('COM4')
   sensor.reset()
   ```

3. Re-flash firmware if needed

**Error:** `Buffer overflow`

**Solution:**
```python
# Reduce acquisition rate
sensor.set_sample_rate(1000)  # instead of 10000

# Or increase buffer size
sensor.set_buffer_size(10000)
```

---

## Hardware Issues

### Connection Problems

**USB device not detected:**

=== "Windows"

    1. Check Device Manager
    2. Update/reinstall drivers
    3. Try different USB port
    4. Check USB cable (must be data cable)

=== "Linux"

    ```bash
    # Check USB devices
    lsusb
    
    # Check permissions
    ls -l /dev/ttyUSB*
    
    # Add user to dialout group
    sudo usermod -a -G dialout $USER
    # Logout and login
    ```

=== "macOS"

    ```bash
    # List devices
    ls /dev/tty.*
    
    # Check system report
    system_profiler SPUSBDataType
    ```

### Power Issues

**Device keeps resetting:**
- Check power supply voltage (12V for USTX, 5V for ESP32)
- Use adequate current capacity (>2A)
- Try different power supply
- Check for short circuits

**Thermal shutdown:**
- Allow device to cool
- Improve ventilation
- Reduce duty cycle
- Check for firmware updates

---

## Software Issues

### Visualization Problems

**Matplotlib not displaying:**
```python
# Use appropriate backend
import matplotlib
matplotlib.use('TkAgg')  # or 'Qt5Agg'
import matplotlib.pyplot as plt
```

**Jupyter notebook issues:**
```python
# Use inline plotting
%matplotlib inline

# Or interactive mode
%matplotlib widget
```

### Performance Issues

**Slow simulation:**
```python
# Use lower resolution
plan.calc_focus_pattern(resolution=0.001)

# Enable multiprocessing
openlifu.set_parallel(True)

# Use GPU if available
openlifu.set_device('cuda')
```

**High memory usage:**
```python
# Process data in chunks
for chunk in sensor.acquire_streaming():
    process(chunk)

# Clear cache
openlifu.clear_cache()
```

---

## Data Issues

### File I/O Errors

**Cannot load data:**
```python
# Check file exists
import os
assert os.path.exists('data.mat'), "File not found"

# Check file format
import h5py
with h5py.File('data.mat', 'r') as f:
    print(list(f.keys()))
```

**Cannot save data:**
```python
# Create directory if needed
os.makedirs('output', exist_ok=True)

# Check write permissions
import tempfile
with tempfile.NamedTemporaryFile(dir='output') as f:
    print("Write permissions OK")
```

### Data Format Issues

**DICOM errors:**
```bash
# Install pydicom
pip install pydicom

# Verify DICOM file
import pydicom
ds = pydicom.dcmread('scan.dcm')
print(ds)
```

**NIfTI errors:**
```bash
# Install nibabel
pip install nibabel

# Verify NIfTI file
import nibabel as nib
img = nib.load('scan.nii')
print(img.shape)
```

---

## Common Error Messages

### `RuntimeError: CUDA out of memory`

**Solution:**
```python
# Reduce batch size
model.batch_size = 32  # instead of 128

# Clear GPU cache
torch.cuda.empty_cache()

# Use CPU instead
openlifu.set_device('cpu')
```

### `ValueError: shapes not aligned`

**Solution:**
```python
# Check array shapes
print(f"Array1: {arr1.shape}, Array2: {arr2.shape}")

# Reshape if needed
arr1 = arr1.reshape(-1, 1)
```

### `OSError: Unable to open file`

**Solution:**
```python
# Check file path
import os
print(os.path.abspath('data.mat'))

# Check file permissions
os.access('data.mat', os.R_OK)
```

---

## Getting More Help

### Before Asking for Help

1. **Check the error message carefully**
2. **Search existing GitHub issues**
3. **Try the solutions above**
4. **Check your code for typos**
5. **Verify your environment**

### How to Report Issues

**Include this information:**
```python
# System information
import sys, platform
print(f"Python: {sys.version}")
print(f"Platform: {platform.platform()}")

# Package versions
import openlifu, openmotion
print(f"OpenLIFU: {openlifu.__version__}")
print(f"OpenMOTION: {openmotion.__version__}")

# Error traceback
# Copy the full error message
```

### Where to Get Help

- **GitHub Issues:** [openwaterHealth/openwater-commons/issues](https://github.com/OpenwaterHealth/openwater-commons/issues)
- **Discord:** Join #help channel
- **Email:** [community@openwater.health](mailto:community@openwater.health)
- **Forum:** [discourse.openwater.health](https://discourse.openwater.health)

---

## FAQ

**Q: Which Python version should I use?**  
A: Python 3.9 or newer. We recommend 3.10 for best compatibility.

**Q: Can I use OpenLIFU without hardware?**  
A: Yes! All software works in simulation mode.

**Q: How do I update to the latest version?**  
A: `pip install --upgrade openlifu openmotion`

**Q: Where are the example files?**  
A: [OpenLIFU examples](https://github.com/OpenwaterHealth/OpenLIFU-python/tree/main/examples)

**Q: Is Windows/Mac/Linux supported?**  
A: Yes, all three platforms are supported.

[More FAQs →](../resources/faq.md)

---

**Still stuck?** Don't hesitate to ask for help in our community channels!
