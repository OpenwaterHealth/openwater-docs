# Hardware Setup Guide

Connect and configure Openwater hardware devices.

---

## Overview

This guide covers physical hardware setup for OpenLIFU and OpenMOTION platforms.

!!! note "Simulation Mode Available"
    You can use all software features in simulation mode without hardware. Hardware is only required for actual experiments.

---

## OpenLIFU Hardware Setup

### Required Hardware

- **Ultrasound transducer** (H317 or compatible)
- **USTX transmit module**
- **12V power supply**
- **USB-C cable** (for communication)
- **Computer** (Windows/Linux recommended)

### Connection Steps

#### 1. Power Connection

```
[12V Power Supply] ──→ [USTX Module] ──USB──→ [Computer]
                          ↓
                    [Transducer]
```

1. Connect 12V barrel jack to USTX module
2. Connect transducer to USTX output
3. Connect USB-C cable from USTX to computer

#### 2. Driver Installation

=== "Windows"

    1. Download FTDI drivers from [ftdichip.com](https://ftdichip.com/drivers/vcp-drivers/)
    2. Install drivers
    3. Restart computer
    4. Verify COM port in Device Manager

=== "Linux"

    ```bash
    # FTDI drivers usually pre-installed
    # Check connection
    lsusb | grep FTDI
    
    # Add user to dialout group
    sudo usermod -a -G dialout $USER
    
    # Logout and login for changes to take effect
    ```

#### 3. Verify Connection

```python
import openlifu

# List available devices
devices = openlifu.hardware.list_devices()
print(f"Found {len(devices)} device(s)")

# Connect to first device
if devices:
    ustx = openlifu.hardware.USTX(devices[0])
    print(f"Connected to {ustx.get_info()}")
```

### Transducer Configuration

```python
import openlifu

# Load transducer configuration
transducer = openlifu.xdc.Transducer('H317')

# Or create custom configuration
custom_transducer = openlifu.xdc.Transducer(
    name='Custom',
    frequency=500000,  # Hz
    element_count=256,
    element_size=0.001,  # meters
)

# Connect hardware
ustx = openlifu.hardware.USTX('COM3')  # or '/dev/ttyUSB0'
ustx.set_transducer(transducer)
```

---

## OpenMOTION Hardware Setup

### Required Hardware

- **Optical sensor module**
- **LED illumination system**
- **ESP32 controller**
- **5V power supply**
- **USB cable**
- **Sensor mounting**

### Connection Steps

#### 1. Hardware Assembly

```
[5V Power] ──→ [ESP32 Controller] ──USB──→ [Computer]
                    ↓
            [LED + Sensor Module]
```

1. Connect LED system to ESP32
2. Connect optical sensor to ESP32
3. Connect USB cable to computer
4. Power on system

#### 2. Firmware Flash

```bash
# Clone firmware repository
git clone https://github.com/OpenwaterHealth/motion-sensor-fw.git
cd motion-sensor-fw

# Flash firmware (requires esptool)
pip install esptool
esptool.py --port COM4 write_flash 0x0 firmware.bin
```

#### 3. Verify Connection

```python
import openmotion

# List available sensors
sensors = openmotion.list_sensors()
print(f"Found {len(sensors)} sensor(s)")

# Connect to sensor
if sensors:
    sensor = openmotion.Sensor(sensors[0])
    print(f"Connected: {sensor.get_info()}")
    
    # Test acquisition
    data = sensor.acquire(duration=1.0)
    print(f"Acquired {len(data)} samples")
```

---

## Troubleshooting Hardware

### OpenLIFU Issues

**Device not detected:**
```python
# Check COM ports (Windows)
import serial.tools.list_ports
ports = serial.tools.list_ports.comports()
for port in ports:
    print(f"{port.device}: {port.description}")
```

**Connection errors:**
- Verify 12V power supply connected
- Check USB cable is data-capable (not charge-only)
- Try different USB port
- Restart device

**Transducer not responding:**
- Check transducer connection to USTX
- Verify transducer configuration matches hardware
- Test with known-good transducer

### OpenMOTION Issues

**Sensor not found:**
- Check USB connection
- Verify ESP32 powered on (LED should be lit)
- Re-flash firmware if needed

**Poor signal quality:**
- Check LED illumination
- Verify sensor positioning
- Clean optical surfaces
- Adjust exposure settings

---

## Calibration

### OpenLIFU Calibration

```python
import openlifu

# Connect to hardware
ustx = openlifu.hardware.USTX('COM3')

# Run calibration sequence
calibration = ustx.calibrate(
    reference_hydrophone=True,
    water_tank=True
)

# Save calibration
calibration.save('calibration_2025-12-17.json')
```

### OpenMOTION Calibration

```python
import openmotion

# Connect to sensor
sensor = openmotion.Sensor('COM4')

# Dark frame calibration
sensor.calibrate_dark(duration=10)

# Flat field calibration
sensor.calibrate_flat(duration=10)

# Save calibration
sensor.save_calibration('motion_calibration.json')
```

---

## Safety Checklist

### Before Each Use

- [ ] Inspect all cables for damage
- [ ] Verify power supply voltage (12V for USTX, 5V for ESP32)
- [ ] Check transducer/sensor connections
- [ ] Test communication before experiment
- [ ] Review safety protocols for your application

### During Use

- [ ] Monitor device temperature
- [ ] Watch for error messages
- [ ] Keep backup power supply available
- [ ] Log all experiments

### After Use

- [ ] Disconnect power
- [ ] Store hardware properly
- [ ] Clean sensors/transducers as needed
- [ ] Document any issues

---

## Next Steps

✅ Hardware connected!

**What's next?**

1. [Run calibration experiments](../openlifu/basic-usage.md)
2. [Start real experiments](quickstart.md)
3. [Join hardware discussions](../community/index.md)

---

## Support

**Hardware questions?**

- **GitHub Issues:** [Hardware issues](https://github.com/OpenwaterHealth/openwater-commons/issues)
- **Discord:** #hardware channel
- **Email:** [hardware@openwater.health](mailto:hardware@openwater.health)
