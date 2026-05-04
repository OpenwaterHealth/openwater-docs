# Open-Motion Software Development

## Overview

The Open-Motion software stack comprises three coordinated layers:

1. **Embedded firmware** running on the cameras, aggregator, and console
2. **Host-side software** running on the PC for device control, data
   acquisition, and visualization
3. **Test and validation utilities** used in development, manufacturing, and
   QA workflows

Each layer is modular and open-source, allowing for extensibility and
integration.

!!! info "Licensing"
    All software developed on Openwater's `main` branch is licensed under the
    **AGPL**. Hardware designs are released under
    [Creative Commons ShareAlike 4.0](https://creativecommons.org/licenses/by-sa/4.0/).

For the latest released version of the Open-Motion application, see the
[`openmotion-bloodflow-app`](https://github.com/OpenwaterHealth/openmotion-bloodflow-app)
repository.

## Tech stack

=== "Front end"

    - **PyQt 6.8** — desktop GUI framework

=== "Middle layer"

    - **`openmotion-sdk`** — Python SDK ([repo](https://github.com/OpenwaterHealth/openmotion-sdk))
    - SDK documentation lives at `openmotion-sdk/docs/`

=== "Back end"

    - Microcontrollers on the sensor modules and console
    - Serial COM port protocol
    - USB 2.0 HS
    - **PySerial 3.5**
    - **libUSB 3.3.1**
    - **PyUSB 1.3.1**

=== "Databases"

    The database is an active roadmap feature and is currently in development.

### Tooling

| Category | Tools / Platforms |
|---|---|
| Version control | Git + GitHub |
| CI/CD (under development) | GitHub Actions |
| IDEs | STM32CubeIDE |
| Documentation | Markdown, `.docx` |
| Testing | Oscilloscope, logic analyzers, unit tests |

## Database architecture

The database is an active roadmap feature and is currently in development.

## Software architecture

The full software-architecture diagram is in
[Figure 6, page 14](ER-00014-RevA-OpenMotion-Developer-Docs.pdf) of the
release PDF. At a glance, the architecture flows:

```
Camera FPGAs ──► Aggregator MCU ──► Console MCU ──► Host PC
   (Verilog)       (STM32)            (STM32)        (Python SDK / PyQt6 app)
```

with control plane and safety interlocks managed by additional FPGAs and
microcontrollers within the Console.

## Embedded firmware layer

This layer includes all firmware running on hardware devices — cameras,
aggregator, and console.

### Camera Module FPGA firmware

| | |
|---|---|
| **Hardware** | Lattice FPGA |
| **Repository** | [`openmotion-camera-fpga`](https://github.com/OpenwaterHealth/openmotion-camera-fpga) |
| **Function** | Converts raw 2 MP grayscale image frames into 1024-bin histograms at 40 FPS |
| **Interface** | Outputs histogram data via SPI |
| **Customizable** | RTL (Verilog) can be modified for alternative processing methods |

### Aggregator Board firmware

| | |
|---|---|
| **Hardware** | STM32 MCU |
| **Repository** | [`openmotion-sensor-fw`](https://github.com/OpenwaterHealth/openmotion-sensor-fw) |
| **Function** | Receives histogram data from 8 camera SPI inputs<br>Aggregates and transmits data over USB HS<br>Provides USB control endpoints for config and status |
| **Interface** | Outputs aggregated data and exposes a control/monitoring interface over USB |

### Console firmware

| | |
|---|---|
| **Hardware** | STM32 MCU + USB hub + laser-control FPGAs |
| **Repositories** | [`openmotion-console-fw`](https://github.com/OpenwaterHealth/openmotion-console-fw)<br>[`motion-safety-fpga`](https://github.com/OpenwaterHealth/motion-safety-fpga)<br>[`motion-seed-fpga`](https://github.com/OpenwaterHealth/motion-seed-fpga)<br>[`motion-ta-fpga`](https://github.com/OpenwaterHealth/motion-ta-fpga) |
| **Function** | Generates FSIN sync pulses<br>Triggers laser pulses with programmable delay<br>Routes Aggregator data to the host PC<br>Controls power, fan, and safety interlocks<br>Provides a monitoring and control interface for the entire system |
| **Interface** | Outputs aggregated data and exposes a control/monitoring interface over USB |

### Sensor Module diagram

A general schematic of the sensor module is included as
[Figure 7, page 15](ER-00014-RevA-OpenMotion-Developer-Docs.pdf) of the
release PDF.

## Host software layer

This layer runs on the PC and provides device control, data acquisition, and
visualization.

### Python SDK

| | |
|---|---|
| **Repository** | [`openmotion-sdk`](https://github.com/OpenwaterHealth/openmotion-sdk) |
| **Function** | Enumerates and connects to aggregators and console<br>Reads and parses 16-camera histogram streams<br>Computes blood flow and volume metrics<br>Provides real-time visualization and logging |
| **Platform support** | Current: Windows 11+<br>Future: macOS 12+, Linux |
| **Extensibility** | Open-source and modular (Python 3.12+)<br>Integrates with NumPy, Pandas, Jupyter, and other scientific tools<br>Example test scripts in `openmotion-sdk`<br>API documentation in `openmotion-sdk/docs` |

## Test & Validation utilities layer

These tools are used in development, manufacturing, and QA workflows.

### Test Engineering Application

| | |
|---|---|
| **Repository** | [`openmotion-test-app`](https://github.com/OpenwaterHealth/openmotion-test-app) |
| **Framework** | Python + PyQt6 |
| **Function** | Live preview of histogram data per camera<br>Validate USB/SPI communication<br>Inspect hardware status (version, ID, sync)<br>Automate production tests |

## Repository map

A consolidated view of all Open-Motion software repositories:

| Layer | Repo | Purpose |
|---|---|---|
| Firmware (FPGA) | [`openmotion-camera-fpga`](https://github.com/OpenwaterHealth/openmotion-camera-fpga) | Camera-side histogramming |
| Firmware (MCU) | [`openmotion-sensor-fw`](https://github.com/OpenwaterHealth/openmotion-sensor-fw) | Aggregator board firmware |
| Firmware (MCU) | [`openmotion-console-fw`](https://github.com/OpenwaterHealth/openmotion-console-fw) | Console MCU firmware |
| Firmware (FPGA) | [`motion-safety-fpga`](https://github.com/OpenwaterHealth/motion-safety-fpga) | Laser safety interlock |
| Firmware (FPGA) | [`motion-seed-fpga`](https://github.com/OpenwaterHealth/motion-seed-fpga) | Laser seed control |
| Firmware (FPGA) | [`motion-ta-fpga`](https://github.com/OpenwaterHealth/motion-ta-fpga) | Timing/aggregator FPGA |
| Host SDK | [`openmotion-sdk`](https://github.com/OpenwaterHealth/openmotion-sdk) | Python SDK |
| Host application | [`openmotion-bloodflow-app`](https://github.com/OpenwaterHealth/openmotion-bloodflow-app) | Reference blood-flow GUI |
| Test/QA | [`openmotion-test-app`](https://github.com/OpenwaterHealth/openmotion-test-app) | Test engineering tool |
