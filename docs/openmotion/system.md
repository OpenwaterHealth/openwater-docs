# The Open-Motion System

The Open-Motion hardware platform consists of three primary components.

| Component | Description |
|---|---|
| **Console** | Houses the laser, electronics and optics, power cable, and an on/off switch on the back. Should **never be opened** — risk of laser radiation exposure and electrical hazards. |
| **Sensor Module(s)** | Wearable modules containing an array of camera sensors (configurable via software) and on-module histogram processing. |
| **Laser** | Class 1, 795 nm, pulsed, integrated inside the Console. |

!!! danger "Do not disassemble the Console"
    The Console contains a Class 3 laser source and high-voltage electronics.
    Opening the enclosure risks permanent eye injury and electric shock and
    voids all warranties.

## Open-Motion specifications

### Console

| | |
|---|---|
| **Operating voltage** | 100–240 VAC, 50–60 Hz, 0.5 A |
| **Connections** | 1× USB-C (USB 3.0)<br>1× SMA trigger (input)<br>1× SMA sync (output)<br>2× electrical ports (left / right)<br>2× optical ports (left / right) |
| **Device status** | LED indicator |
| **Dimensions (W × H × D)** | 9.8 × 3.0 × 6.3 in (250 × 75 × 160 mm) |
| **Weight** | 3 lb (1.36 kg) |

**Console parts:** SMA trigger output (sync other devices to Open-Motion data),
left/right Sensor Module electrical and optical ports, SMA trigger input
(sync Open-Motion to other devices — in development), power switch, USB port,
status LED.

### Sensor Module

Each Open-Motion device uses two Sensor Modules.

| | |
|---|---|
| **Image sensors** | 1/3.52" CMOS |
| **Resolution** | 1920 × 1280 |
| **Frame rate** | 40 Hz |
| **Pixel size** | 2.2 μm × 2.2 μm |
| **Dimensions (W × H × D)** | 2.1 × 1.6 × 2.5 in (52.5 × 39.4 × 64.1 mm) |
| **Cable length** | 6 ft (2 m) |
| **Weight** | 0.5 lb (0.2 kg) |

The Sensor Module diagram identifies how the cameras are ordered in software.
See [Software Development → Sensor Module Diagram](software.md#sensor-module-diagram)
for the layout.

### Laser

| | |
|---|---|
| **Laser classification** | Class 1 |
| **Wavelength** | 795 nm |
| **Pulse duration** | 250–1000 μs |
| **Pulse repetition rate** | 40 Hz |
| **Average power** | 12 mW |
| **Energy per pulse** (at delivery fiber tip) | 300–500 μJ |

## System architecture

The general system architecture connects the host PC to the Console over USB,
and the Console to one or two Sensor Modules over paired electrical and optical
links.

!!! note "USB cable requirement"
    The USB cable must be a USB-A to USB-C cable and **can only be sourced from
    Openwater** (part number `100-00049`). Substituting a generic cable can
    cause data integrity issues at full link speed.

The full architecture diagram is in the release PDF
([Figure 3, page 10](ER-00014-RevA-OpenMotion-Developer-Docs.pdf)). A web
version is on the roadmap; until then, the PDF is canonical for visual
reference.

## System signals

### Console signal pathways

Console-internal signal pathways are documented in
[Figure 4, page 11](ER-00014-RevA-OpenMotion-Developer-Docs.pdf) of the release
PDF. They cover:

- USB host communication
- Sensor Module electrical and optical interfaces
- Laser control and safety interlocks
- SMA trigger input/output paths
- Status LED control

### Sensor Module signal pathways

Sensor Module signal pathways are documented in
[Figure 5, page 12](ER-00014-RevA-OpenMotion-Developer-Docs.pdf) of the release
PDF. They cover:

- Camera SPI inputs (8 cameras per module)
- Aggregation logic
- USB high-speed output to the Console
- Internal clocking and frame sync

---

*Next: [Software Development](software.md) for tech stack, architecture, and
the firmware/host/test layers.*
