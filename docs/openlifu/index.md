# Open-LIFU Developer Documentation

> **Document ID:** ER-00015 · **Revision:** A · **Software:** v1.19.0
> **Released:** 2026-05-07
> **Authors:** David Paribello, Peter Hollender, George Vigelette, Dan Blizinski

Open-LIFU is an open-source platform for **low-intensity focused ultrasound**
(LIFU) research. The system emits programmable sequences of steered, focused
ultrasound pulses, controlled from a PC application and supported by an
Android companion app for transducer localization. Hardware, firmware,
Python toolbox, Slicer extension, and desktop application are all
open-source.

This documentation is the canonical developer reference for the platform.
The release PDF
([ER-00015 Rev A](ER-00015-RevA-OpenLIFU-Developer-Docs.pdf))
is also available for archival download.

## Quick orient

<div class="grid cards" markdown>

-   :material-cog-outline:{ .lg .middle } __System overview__

    ---

    Three primary components: Console, Transducer (with one or more transmit
    modules), and a coupling pad. Specifications, system architecture, and
    hardware components.

    [:octicons-arrow-right-24: The Open-LIFU System](system.md)

-   :material-code-tags:{ .lg .middle } __Software development__

    ---

    Five-layer stack: Desktop App ↔ Slicer Extension ↔ Python ↔ Hardware SDK
    ↔ Firmware. Plus the Android companion app and transmit-module wiring.

    [:octicons-arrow-right-24: Software Development](software.md)

-   :material-cube-outline:{ .lg .middle } __Hardware development__

    ---

    CAD files, mechanical assemblies, and PCB designs released under
    Creative Commons ShareAlike 4.0.

    [:octicons-arrow-right-24: Hardware Development](hardware.md)

-   :material-monitor-dashboard:{ .lg .middle } __Slicer modules__

    ---

    Advanced research workflow through 3D Slicer: data management, protocol
    configuration, pre-planning, transducer localization, sonication
    planning, and sonication.

    [:octicons-arrow-right-24: Slicer Open-LIFU](slicer.md)

</div>

## What Open-LIFU is

Open-LIFU consists of:

- **A Console** that connects to a PC over USB-C. It contains a bipolar high-voltage power supply (up to ±60 V or ±65 V depending on the unit), timing controllers, and communication interfaces.
- **A Transducer** in a wearable headset-style housing, containing one or two **Transmit Modules** (each a 64-element 2D matrix array) and a deformable acoustic coupling pad.
- **An Android companion app** for capturing photo collections used in photogrammetric reconstruction of the transducer position relative to a subject MRI.
- **PC software**: a Desktop Application built on 3D Slicer, the SlicerOpenLIFU extension, the `openlifu` Python toolbox, and the `openlifu-sdk` hardware interface library.

The platform is available in two frequency variants (155 kHz and 400 kHz) and two form factors (1× single-module and 2× dual-module). Custom configurations are supported within the architecture but require recharacterization.

## Key properties

| | |
|---|---|
| **Modality** | Low-intensity focused ultrasound (LIFU) for neuromodulation research |
| **Frequency variants** | 155 kHz, 400 kHz |
| **Configurations** | 1× (single transmit module), 2× (dual transmit module) |
| **Elements per module** | 64 (8×8 matrix array) |
| **Console power** | 120 W (±60 V) or 180 W (±65 V), depending on serial number |
| **Host platforms** | Windows 11+, Linux (Python 3.10–3.12) |
| **Companion app** | Android 14+ (Pixel 5/7/9/10 officially supported) |
| **Software license** | AGPL v3 |
| **Hardware license** | CC BY-SA 4.0 |

## Investigational device — research use only

!!! danger "Read before you build"
    The Open-LIFU platform is **not yet cleared by the FDA** and is intended
    for research purposes only. Not for commercial sale.

    **Reconfiguring or modifying any transducer immediately voids the factory
    calibration**, requiring users to recharacterize the transducer to ensure
    it complies with all necessary application-specific requirements.

    **The transducer is not watertight. Never submerge the transducer in
    water.** Doing so may lead to electric shock or damage.

    By building, creating, or modifying this hardware or software, you assume
    all risks. Openwater disclaims all liability for any harm, injury, or
    damages incurred.

## How this documentation is organized

| If you want to… | Go to |
|---|---|
| Understand the system at a hardware level | [The Open-LIFU System](system.md) |
| Build, extend, or integrate with the SDK | [Software Development](software.md) |
| Get hardware files for fabrication | [Hardware Development](hardware.md) |
| Run the advanced Slicer workflow | [Slicer Open-LIFU](slicer.md) |
| Submit a contribution | [Contributing](contributing.md) |
| Understand our development process | [Best Practices](best-practices.md) |

## Where to ask questions

- **Discord** — fastest response: [discord.gg/fS7vfAX4fA](https://discord.gg/fS7vfAX4fA)
- **GitHub Issues** in the relevant repo (the repo map is in [Software Development](software.md#repository-map))
- **Email** — [support@openwater.cc](mailto:support@openwater.cc)

---

*This page reflects ER-00015 Revision A, software v1.19.0, released 2026-05-07.
For the full controlled-document archive, see the
[release PDF](ER-00015-RevA-OpenLIFU-Developer-Docs.pdf).*
