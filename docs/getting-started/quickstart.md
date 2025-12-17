# Quick Start Guide

Get up and running with Openwater in under 10 minutes!

---

## Prerequisites

✅ Python 3.9+ installed  
✅ pip package manager  
✅ 10 minutes of time

[Need to install? →](installation.md)

---

## 5-Minute Quick Start

### Step 1: Install (2 minutes)

```bash
pip install openlifu openmotion
```

### Step 2: Choose Your Platform

=== "OpenLIFU Quick Start"

    **Your First Focused Ultrasound Experiment**
    
    ```python
    import openlifu
    import numpy as np
    
    # Create a simple protocol
    protocol = openlifu.Protocol()
    protocol.pulse_count = 1000
    protocol.pulse_duration = 0.001  # 1ms
    protocol.frequency = 500000  # 500 kHz
    
    # Define a target point (in mm)
    target = np.array([0, 0, 50])  # 50mm depth
    
    # Create transducer (simulation)
    transducer = openlifu.xdc.Transducer('H317')
    
    # Calculate focal point
    focal_pattern = transducer.calc_focal_pattern(target)
    
    print(f"Focal pressure: {focal_pattern.pressure.max():.2f} MPa")
    print("✓ OpenLIFU experiment complete!")
    ```
    
    **What you just did:**
    - Created ultrasound protocol
    - Defined brain target
    - Simulated focal pressure
    
    [Learn more →](../openlifu/basic-usage.md)

=== "OpenMOTION Quick Start"

    **Your First Blood Flow Measurement**
    
    ```python
    import openmotion
    import numpy as np
    
    # Create sensor (simulation mode)
    sensor = openmotion.Sensor(mode='simulation')
    
    # Generate simulated blood flow data
    data = sensor.acquire(duration=5.0)  # 5 seconds
    
    # Analyze blood flow
    flow_rate = openmotion.analysis.calculate_flow(data)
    
    print(f"Average flow rate: {flow_rate:.2f} mL/min")
    print(f"Data points collected: {len(data)}")
    print("✓ OpenMOTION measurement complete!")
    ```
    
    **What you just did:**
    - Created virtual sensor
    - Collected flow data
    - Calculated flow rate
    
    [Learn more →](../openmotion/basic-usage.md)

### Step 3: Visualize Results

```python
import matplotlib.pyplot as plt

# Plot your results
plt.figure(figsize=(10, 6))
plt.plot(data)
plt.title('Blood Flow Measurement')
plt.xlabel('Time (s)')
plt.ylabel('Signal Intensity')
plt.show()
```

---

## 10-Minute Tutorials

### OpenLIFU: Treatment Planning

**Create a complete treatment plan in 10 minutes.**

```python
import openlifu
import numpy as np

# 1. Load a transducer
transducer = openlifu.xdc.Transducer('H317')

# 2. Define treatment parameters
protocol = openlifu.Protocol(
    pulse_count=1000,
    pulse_duration=0.001,
    frequency=500000,
    pulse_interval=0.1
)

# 3. Define target(s)
targets = [
    np.array([10, 0, 50]),   # Target 1
    np.array([-10, 0, 50]),  # Target 2
]

# 4. Create treatment plan
plan = openlifu.Plan(
    transducer=transducer,
    protocol=protocol,
    targets=targets
)

# 5. Calculate acoustic field
plan.calc_focus_pattern()

# 6. Visualize
plan.visualize()

print("Treatment plan created!")
print(f"Number of targets: {len(targets)}")
print(f"Estimated duration: {plan.duration:.1f} seconds")
```

[Full treatment planning guide →](../openlifu/treatment-planning.md)

### OpenMOTION: Real-Time Monitoring

**Set up real-time blood flow monitoring.**

```python
import openmotion
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation

# 1. Initialize sensor
sensor = openmotion.Sensor()

# 2. Set up real-time plot
fig, ax = plt.subplots()
line, = ax.plot([], [])

def update(frame):
    # Acquire new data
    data = sensor.acquire(duration=0.1)
    
    # Update plot
    line.set_data(range(len(data)), data)
    ax.relim()
    ax.autoscale_view()
    return line,

# 3. Start real-time visualization
ani = FuncAnimation(fig, update, interval=100)
plt.show()
```

[Full monitoring guide →](../openmotion/blood-flow.md)

---

## Example Projects

### Project 1: Brain Stimulation Simulator

**Simulate neuromodulation effects.**

```python
import openlifu
import numpy as np

class BrainStimulator:
    def __init__(self):
        self.transducer = openlifu.xdc.Transducer('H317')
        self.protocol = openlifu.Protocol()
    
    def stimulate_region(self, region_name, intensity):
        """Stimulate a brain region with specified intensity."""
        # Define region targets
        targets = self.get_region_targets(region_name)
        
        # Calculate stimulation pattern
        plan = openlifu.Plan(
            transducer=self.transducer,
            targets=targets
        )
        
        # Run simulation
        results = plan.simulate(intensity=intensity)
        return results
    
    def get_region_targets(self, region):
        """Get target coordinates for brain region."""
        regions = {
            'dlpfc': [np.array([40, 10, 30])],
            'motor_cortex': [np.array([0, -10, 60])],
            'hippocampus': [np.array([25, -30, 0])],
        }
        return regions.get(region, [])

# Use the simulator
sim = BrainStimulator()
results = sim.stimulate_region('dlpfc', intensity=0.5)
print(f"Stimulation complete: {len(results)} points calculated")
```

### Project 2: Stroke Detector

**Detect blood flow anomalies.**

```python
import openmotion
import numpy as np

class StrokeDetector:
    def __init__(self, baseline_threshold=0.7):
        self.sensor = openmotion.Sensor()
        self.threshold = baseline_threshold
        self.baseline = None
    
    def calibrate(self):
        """Establish baseline blood flow."""
        data = self.sensor.acquire(duration=60)  # 1 minute
        self.baseline = np.mean(data)
        print(f"Baseline flow: {self.baseline:.2f} mL/min")
    
    def monitor(self, duration=300):
        """Monitor for stroke indicators."""
        data = self.sensor.acquire(duration=duration)
        
        # Analyze flow patterns
        flow_ratio = np.mean(data) / self.baseline
        
        if flow_ratio < self.threshold:
            return {
                'alert': True,
                'flow_reduction': (1 - flow_ratio) * 100,
                'recommendation': 'Seek medical attention'
            }
        return {'alert': False, 'status': 'Normal flow'}

# Use the detector
detector = StrokeDetector()
detector.calibrate()
result = detector.monitor(duration=60)

if result['alert']:
    print(f"⚠️  ALERT: {result['flow_reduction']:.1f}% flow reduction detected")
else:
    print("✓ Blood flow normal")
```

---

## Next Steps

<div class="grid cards" markdown>

-   :material-school: **Tutorials**

    ---

    Comprehensive tutorials for both platforms

    [View Tutorials →](../resources/tutorials.md)

-   :material-api: **API Reference**

    ---

    Complete API documentation

    [OpenLIFU API →](../openlifu/api-reference.md)  
    [OpenMOTION API →](../openmotion/api-reference.md)

-   :material-code-braces: **Examples**

    ---

    Browse example code on GitHub

    [OpenLIFU Examples](https://github.com/OpenwaterHealth/OpenLIFU-python/tree/main/examples)  
    [OpenMOTION Examples](https://github.com/OpenwaterHealth/OpenMOTION-Pylib/tree/main/examples)

-   :material-hammer-wrench: **Hardware**

    ---

    Connect real hardware devices

    [Hardware Setup →](hardware-setup.md)

</div>

---

## Troubleshooting Quick Fixes

**Import errors:**
```bash
pip install --upgrade openlifu openmotion
```

**Visualization not working:**
```bash
pip install matplotlib
```

**Need more help?**  
[Full troubleshooting guide →](troubleshooting.md)

---

## Community Examples

Check out projects from the community:

- [Awesome Openwater List](https://github.com/OpenwaterHealth/awesome-openwater)
- [Community Projects](../community/index.md)
- [Research Papers](../research/publications.md)

---

**Congratulations! You've completed the quick start.** 🎉

**What's next?** Explore the full platform documentation or join our community!
