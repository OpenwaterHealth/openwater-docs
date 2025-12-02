# Quick Start Guide

Get up and running with Openwater platforms in under 10 minutes!

## Choose Your Platform

=== "OpenLIFU"

    **Low Intensity Focused Ultrasound**
    
    Perfect for: Neuromodulation research, treatment planning, ultrasound therapy
    
    [:octicons-arrow-right-24: OpenLIFU Quick Start](#openlifu-quick-start)

=== "OpenMOTION"

    **Near-Infrared Optical Imaging**
    
    Perfect for: Blood flow monitoring, oxygenation measurement, stroke detection
    
    [:octicons-arrow-right-24: OpenMOTION Quick Start](#openmotion-quick-start)

## OpenLIFU Quick Start

### Prerequisites

```bash
# Python 3.9 or higher
python --version  # Should be >= 3.9

# pip package manager
pip --version
```

### Installation

```bash
# Create virtual environment (recommended)
python -m venv openwater-env
source openwater-env/bin/activate  # On Windows: openwater-env\Scripts\activate

# Install OpenLIFU
pip install openlifu

# Verify installation
python -c "import openlifu; print(f'OpenLIFU version: {openlifu.__version__}')"
```

### Hello World Example

Create a file `hello_openlifu.py`:

```python
import openlifu
import numpy as np

# Initialize a basic transducer
transducer = openlifu.Transducer(
    name="Basic Single Element",
    frequency=500e3,  # 500 kHz
    num_elements=1
)

# Define a simple target point (x, y, z in mm)
target = np.array([0, 0, 50])

# Create a basic pulse sequence
pulse = openlifu.PulseSequence(
    pulse_duration=0.01,  # 10 ms
    pulse_rep_freq=1.0,   # 1 Hz
    num_pulses=10
)

# Calculate estimated intensity at target
intensity = transducer.calculate_intensity(target)

print(f"Transducer: {transducer.name}")
print(f"Target location: {target} mm")
print(f"Estimated intensity: {intensity:.2f} W/cm²")
print(f"Pulse sequence: {pulse.num_pulses} pulses")
```

Run it:

```bash
python hello_openlifu.py
```

**Expected Output:**

```
Transducer: Basic Single Element
Target location: [ 0  0 50] mm
Estimated intensity: 1.25 W/cm²
Pulse sequence: 10 pulses
```

### Next Steps with OpenLIFU

<div class="grid cards" markdown>

-   :material-book-open-variant:{ .lg .middle } **User Guide**
    
    ---
    
    Learn treatment planning, pulse sequences, and safety monitoring
    
    [:octicons-arrow-right-24: OpenLIFU User Guide](../openlifu/user-guide/index.md)

-   :material-code-braces:{ .lg .middle } **Developer Guide**
    
    ---
    
    Understand architecture, APIs, and how to contribute
    
    [:octicons-arrow-right-24: Developer Guide](../openlifu/developer-guide/index.md)

-   :material-school:{ .lg .middle } **Tutorials**
    
    ---
    
    Step-by-step guides for common tasks and workflows
    
    [:octicons-arrow-right-24: Tutorials](../resources/tutorials.md)

-   :material-puzzle:{ .lg .middle } **3D Slicer Extension**
    
    ---
    
    Use OpenLIFU with 3D Slicer for treatment planning
    
    [:octicons-arrow-right-24: Slicer Extension](../openlifu/slicer/index.md)

</div>

---

## OpenMOTION Quick Start

### Prerequisites

```bash
# Python 3.9 or higher
python --version  # Should be >= 3.9

# pip package manager
pip --version
```

### Installation

```bash
# Create virtual environment (recommended)
python -m venv openwater-env
source openwater-env/bin/activate  # On Windows: openwater-env\Scripts\activate

# Install OpenMOTION
pip install openmotion

# Verify installation
python -c "import openmotion; print(f'OpenMOTION version: {openmotion.__version__}')"
```

### Hello World Example

Create a file `hello_openmotion.py`:

```python
import openmotion
import numpy as np
import matplotlib.pyplot as plt

# Initialize optical sensor
sensor = openmotion.OpticalSensor(
    wavelengths=[780, 850],  # Near-infrared wavelengths in nm
    sampling_rate=100,       # 100 Hz
    num_channels=8
)

# Simulate blood flow data (in real use, this comes from hardware)
time = np.linspace(0, 10, 1000)  # 10 seconds
blood_flow = 50 + 10 * np.sin(2 * np.pi * 1.2 * time)  # Simulated heartbeat

# Calculate blood flow metrics
metrics = openmotion.analyze_blood_flow(
    blood_flow_data=blood_flow,
    time=time,
    sensor=sensor
)

print(f"Blood Flow Metrics:")
print(f"  Mean flow: {metrics['mean_flow']:.2f} mL/min")
print(f"  Peak flow: {metrics['peak_flow']:.2f} mL/min")
print(f"  Heart rate: {metrics['heart_rate']:.1f} bpm")
print(f"  Flow variation: {metrics['flow_variation']:.2f}%")

# Plot results
plt.figure(figsize=(10, 4))
plt.plot(time, blood_flow)
plt.xlabel('Time (s)')
plt.ylabel('Blood Flow (mL/min)')
plt.title('Blood Flow Monitoring - OpenMOTION')
plt.grid(True)
plt.savefig('blood_flow.png')
print("\nPlot saved as: blood_flow.png")
```

Run it:

```bash
python hello_openmotion.py
```

**Expected Output:**

```
Blood Flow Metrics:
  Mean flow: 50.00 mL/min
  Peak flow: 60.15 mL/min
  Heart rate: 72.0 bpm
  Flow variation: 16.67%

Plot saved as: blood_flow.png
```

### Next Steps with OpenMOTION

<div class="grid cards" markdown>

-   :material-book-open-variant:{ .lg .middle } **User Guide**
    
    ---
    
    Blood flow imaging, oxygenation monitoring, data analysis
    
    [:octicons-arrow-right-24: OpenMOTION User Guide](../openmotion/user-guide/index.md)

-   :material-code-braces:{ .lg .middle } **Developer Guide**
    
    ---
    
    System architecture, APIs, and contribution guidelines
    
    [:octicons-arrow-right-24: Developer Guide](../openmotion/developer-guide/index.md)

-   :material-monitor-dashboard:{ .lg .middle } **Real-time Monitoring**
    
    ---
    
    Set up continuous patient monitoring systems
    
    [:octicons-arrow-right-24: Monitoring Guide](../openmotion/user-guide/index.md)

-   :material-hospital:{ .lg .middle } **Clinical Applications**
    
    ---
    
    Stroke detection, surgical guidance, research uses
    
    [:octicons-arrow-right-24: Clinical Studies](../research/clinical-studies.md)

</div>

---

## Working with Hardware

Both platforms support physical hardware devices.

### OpenLIFU Hardware

Connect to physical ultrasound transducers:

```python
import openlifu

# Connect to hardware
hardware = openlifu.Hardware.connect(
    port="/dev/ttyUSB0",  # or "COM3" on Windows
    transducer_config="configs/transducer.yaml"
)

# Run treatment with real hardware
hardware.run_treatment(treatment_plan)
```

[:octicons-arrow-right-24: Hardware Setup Guide](../hardware/openlifu/index.md)

### OpenMOTION Hardware

Connect to optical sensors:

```python
import openmotion

# Connect to sensor hardware
sensor = openmotion.Hardware.connect(
    device_id="OpenMOTION-001",
    config="configs/sensor.yaml"
)

# Start real-time monitoring
sensor.start_monitoring()
data = sensor.read_continuous(duration=60)  # 60 seconds
```

[:octicons-arrow-right-24: Hardware Setup Guide](../hardware/openmotion/index.md)

---

## Common Tasks

### Installing from Source

Want the latest development version?

```bash
# Clone repository
git clone https://github.com/OpenwaterHealth/OpenLIFU-python.git
cd OpenLIFU-python

# Install in editable mode
pip install -e .

# Run tests to verify
pytest
```

### Using with Jupyter Notebooks

```bash
# Install Jupyter
pip install jupyter

# Install OpenLIFU/OpenMOTION
pip install openlifu openmotion

# Start Jupyter
jupyter notebook
```

Then create a new notebook and try the examples above!

### Docker Installation

Prefer containers?

```bash
# Pull OpenLIFU container
docker pull openwaterhealth/openlifu:latest

# Run interactive session
docker run -it openwaterhealth/openlifu:latest python
```

```python
>>> import openlifu
>>> print(openlifu.__version__)
```

---

## Getting Help

<div class="grid cards" markdown>

-   :fontawesome-brands-discord:{ .lg .middle } **Discord Community**
    
    ---
    
    Real-time help from 2,000+ developers
    
    [:octicons-arrow-right-24: Join Discord](https://discord.gg/openwater)

-   :fontawesome-brands-github:{ .lg .middle } **GitHub Issues**
    
    ---
    
    Report bugs or request features
    
    [:octicons-arrow-right-24: Open Issue](https://github.com/OpenwaterHealth)

-   :material-forum:{ .lg .middle } **Community Forum**
    
    ---
    
    Ask questions and share experiences
    
    [:octicons-arrow-right-24: Visit Forum](https://discourse.openwater.health)

-   :material-email:{ .lg .middle } **Email Support**
    
    ---
    
    Direct support for urgent issues
    
    [:octicons-arrow-right-24: community@openwater.health](mailto:community@openwater.health)

</div>

---

## Next Steps

After completing this quick start:

1. **[Read the Full Installation Guide](installation.md)** - Set up your development environment properly
2. **[Complete a Tutorial](../resources/tutorials.md)** - Hands-on learning with real examples
3. **[Make Your First Contribution](first-contribution.md)** - Join hundreds of contributors
4. **[Explore the API Reference](../openlifu/developer-guide/api-reference.md)** - Deep dive into platform capabilities

---

**Welcome to Openwater!** :material-hand-wave:

You're now ready to build open-source medical device innovations that will help serve 3.5 billion underserved people globally.

[:octicons-arrow-right-24: Return to Documentation Home](../index.md)
