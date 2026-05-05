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

| Category                  | Tools / Platforms                         |
| ------------------------- | ----------------------------------------- |
| Version control           | Git + GitHub                              |
| CI/CD (under development) | GitHub Actions                            |
| IDEs                      | STM32CubeIDE                              |
| Documentation             | Markdown, `.docx`                         |
| Testing                   | Oscilloscope, logic analyzers, unit tests |

## Database architecture

The database is an active roadmap feature and is currently in development.

## Software architecture

<figure markdown="span">
  ![Open-Motion software architecture in three layers: the Application layer (Python) provides User Interface, Application Data Handling, and Device Control to a User who can also interface directly with APIs; the SDK Layer (Python) exposes Sensor Module Control Interface API, Console Module Control Interface API, and Example Code and Documentation; the Firmware layer (C and Verilog) runs on the Console Module (MCU plus Safety/TA/Seed FPGAs, ADCs, GPIO Expander, Temperature, EEPROM, Laser Module, and USB FS/HS hub) and on Sensor Modules (Composite Device, USB HS PHY, MCU for data processing, 9-Axis IMU, Camera Interface); the Camera Module(s) layer handles Sensor Data, Image Processing on FPGA, and Histogram generation; communications use I2C, SPI, Frame Sync, and USB.](images/figure-6-software-architecture.png){ width="800" }
  <figcaption>Figure 6 — Open-Motion software architecture (ER-00014 Rev A, p. 14).</figcaption>
</figure>


At a glance, the architecture flows:

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

|                  |                                                              |
| ---------------- | ------------------------------------------------------------ |
| **Hardware**     | Lattice FPGA                                                 |
| **Repository**   | [`openmotion-camera-fpga`](https://github.com/OpenwaterHealth/openmotion-camera-fpga) |
| **Function**     | Converts raw 2 MP grayscale image frames into 1024-bin histograms at 40 FPS |
| **Interface**    | Outputs histogram data via SPI                               |
| **Customizable** | RTL (Verilog) can be modified for alternative processing methods |

### Aggregator Board firmware

|                |                                                              |
| -------------- | ------------------------------------------------------------ |
| **Hardware**   | STM32 MCU                                                    |
| **Repository** | [`openmotion-sensor-fw`](https://github.com/OpenwaterHealth/openmotion-sensor-fw) |
| **Function**   | Receives histogram data from 8 camera SPI inputs<br>Aggregates and transmits data over USB HS<br>Provides USB control endpoints for config and status |
| **Interface**  | Outputs aggregated data and exposes a control/monitoring interface over USB |

### Console firmware

|                  |                                                              |
| ---------------- | ------------------------------------------------------------ |
| **Hardware**     | STM32 MCU + USB hub + laser-control FPGAs                    |
| **Repositories** | [`openmotion-console-fw`](https://github.com/OpenwaterHealth/openmotion-console-fw)<br>[`motion-safety-fpga`](https://github.com/OpenwaterHealth/motion-safety-fpga)<br>[`motion-seed-fpga`](https://github.com/OpenwaterHealth/motion-seed-fpga)<br>[`motion-ta-fpga`](https://github.com/OpenwaterHealth/motion-ta-fpga) |
| **Function**     | Generates FSIN sync pulses<br>Triggers laser pulses with programmable delay<br>Routes Aggregator data to the host PC<br>Controls power, fan, and safety interlocks<br>Provides a monitoring and control interface for the entire system |
| **Interface**    | Outputs aggregated data and exposes a control/monitoring interface over USB |

### Sensor Module diagram

<figure markdown="span">
  ![Sensor Module schematic: a Camera Sensor (Omnivision OX0x) configured for 1920×1280 at 45 FPS / 10-bit RAW connects via I2C, GPIO, PWR, and CSI RX to a Lattice FPGA (Crosslink) which processes 10-bit RAW images and generates a 1024-bin histogram per frame, buffering with about 4096 bytes per camera sensor; histogram data flows over SPI at approximately 1.5 Mbits per camera sensor up to a Transceiver Module hosting an STM32 MCU; the Transceiver Module aggregates and aligns data from multiple cameras and transmits it over USB 2.0 HS to the Host Processing Unit; SPI is used for data, I2C for configuration, control, and monitoring.](images/figure-7-sensor-module-diagram.png){ width="700" }
  <figcaption>Figure 7 — Sensor Module schematic (ER-00014 Rev A, p. 15). The Lattice Crosslink FPGA performs on-camera histogramming; the STM32 MCU on the Transceiver Module aggregates streams and uplinks via USB HS.</figcaption>
</figure>


## Host software layer

This layer runs on the PC and provides device control, data acquisition, and
visualization.

### Python SDK

|                      |                                                              |
| -------------------- | ------------------------------------------------------------ |
| **Repository**       | [`openmotion-sdk`](https://github.com/OpenwaterHealth/openmotion-sdk) |
| **Function**         | Enumerates and connects to aggregators and console<br>Reads and parses 16-camera histogram streams<br>Computes blood flow and volume metrics<br>Provides real-time visualization and logging |
| **Platform support** | Current: Windows 11+<br>Future: macOS 12+, Linux             |
| **Extensibility**    | Open-source and modular (Python 3.12+)<br>Integrates with NumPy, Pandas, Jupyter, and other scientific tools<br>Example test scripts in `openmotion-sdk`<br>API documentation in `openmotion-sdk/docs` |

## Test & Validation utilities layer

These tools are used in development, manufacturing, and QA workflows.

### Test Engineering Application

|                |                                                              |
| -------------- | ------------------------------------------------------------ |
| **Repository** | [`openmotion-test-app`](https://github.com/OpenwaterHealth/openmotion-test-app) |
| **Framework**  | Python + PyQt6                                               |
| **Function**   | Live preview of histogram data per camera<br>Validate USB/SPI communication<br>Inspect hardware status (version, ID, sync)<br>Automate production tests |

## Repository map

A consolidated view of all Open-Motion software repositories:

| Layer            | Repo                                                         | Purpose                   |
| ---------------- | ------------------------------------------------------------ | ------------------------- |
| Firmware (FPGA)  | [`openmotion-camera-fpga`](https://github.com/OpenwaterHealth/openmotion-camera-fpga) | Camera-side histogramming |
| Firmware (MCU)   | [`openmotion-sensor-fw`](https://github.com/OpenwaterHealth/openmotion-sensor-fw) | Aggregator board firmware |
| Firmware (MCU)   | [`openmotion-console-fw`](https://github.com/OpenwaterHealth/openmotion-console-fw) | Console MCU firmware      |
| Firmware (FPGA)  | [`motion-safety-fpga`](https://github.com/OpenwaterHealth/motion-safety-fpga) | Laser safety interlock    |
| Firmware (FPGA)  | [`motion-seed-fpga`](https://github.com/OpenwaterHealth/motion-seed-fpga) | Laser seed control        |
| Firmware (FPGA)  | [`motion-ta-fpga`](https://github.com/OpenwaterHealth/motion-ta-fpga) | Timing/aggregator FPGA    |
| Host SDK         | [`openmotion-sdk`](https://github.com/OpenwaterHealth/openmotion-sdk) | Python SDK                |
| Host application | [`openmotion-bloodflow-app`](https://github.com/OpenwaterHealth/openmotion-bloodflow-app) | Reference blood-flow GUI  |
| Test/QA          | [`openmotion-test-app`](https://github.com/OpenwaterHealth/openmotion-test-app) | Test engineering tool     |
