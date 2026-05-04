# Open-MOTION Developer Documentation

> **Document ID:** ER-00014 · **Revision:** A · **Released:** 2026-04-15
> **Authors:** David Paribello, Ethan Head, George Vigelette, Dan Blizinski

Open-MOTION is a modular, open-source platform for laboratory research that uses
low-intensity near-infrared light to measure blood flow, blood volume, and
micro-motions deep within tissue. The system is configurable, portable, and
fully open-source — firmware, FPGA logic, and host software are all available
for study, modification, and extension.

This documentation is the canonical developer reference for the platform. The
release PDF
([ER-00014-Rev A](ER-00014-RevA-OpenMotion-Developer-Docs.pdf))
is also available for archival download.

## Quick orient

<div class="grid cards" markdown>

-   :material-cog-outline:{ .lg .middle } __System overview__

    ---

    Three primary components: the Console, one or more Sensor Modules, and the
    Laser. Specifications, architecture diagrams, and signal pathways.

    [:octicons-arrow-right-24: The Open-Motion System](system.md)

-   :material-code-tags:{ .lg .middle } __Software development__

    ---

    Tech stack, software architecture, embedded firmware layer, host SDK, and
    test/QA tooling.

    [:octicons-arrow-right-24: Software Development](software.md)

-   :material-cube-outline:{ .lg .middle } __Hardware development__

    ---

    CAD files, mechanical assemblies, and PCB designs released under
    Creative Commons ShareAlike 4.0.

    [:octicons-arrow-right-24: Hardware Development](hardware.md)

-   :material-handshake:{ .lg .middle } __Contributing__

    ---

    Code of Conduct, fork-and-PR workflow, where to ask for help. The on-ramp
    for new contributors.

    [:octicons-arrow-right-24: Contributing](contributing.md)

</div>

## What Open-MOTION is

The system consists of:

- **A Console** that houses the laser system, safety circuits, and the sensor
  module hub. It connects to a standard PC over USB.
- **One or more Sensor Modules**, each equipped with eight camera sensors and an
  on-board processing engine that converts raw image frames into 1024-bin
  histograms before they hit the host. This dramatically reduces data-transfer
  requirements relative to streaming raw video.
- **A Class 1 laser system** at 795 nm, pulsed at 40 Hz, integrated into the
  Console.

The platform supports multiple sensor modules for diverse applications. Host
control software runs on Windows today, with macOS and Linux support on the
roadmap. The SDK and reference applications are written in Python.

## Key properties

| | |
|---|---|
| **Modality** | Low-intensity near-infrared optical imaging |
| **Measurements** | Blood flow, blood volume, micro-motions in deep tissue |
| **Frame rate** | 40 Hz |
| **Sensor cameras per module** | 8 |
| **Image processing** | On-module histogramming (1024-bin), then USB to host |
| **Host platforms** | Windows 11+ (current); macOS 12+, Linux (roadmap) |
| **SDK** | Python 3.12+ |
| **Hardware license** | CC BY-SA 4.0 |
| **Software license** | AGPL (main branch) |

## Investigational device — research use only

!!! danger "Read before you build"
    The Open-MOTION platform is **not yet cleared by the FDA** and is intended
    for research purposes only. Not for commercial sale. This device and
    documentation are intended strictly for laboratory research and development;
    clinical or diagnostic use is prohibited.

    **Class 3 laser hazard.** Disassembly may expose the user to hazardous
    Class 3 laser radiation, capable of causing permanent eye injury. The
    Console should never be opened.

    A one-year limited warranty applies only to manufacturer's defects. Any
    modification, disassembly, or installation of unauthorized software or
    firmware that alters device performance immediately voids all warranties.
    By building, creating, or modifying this hardware or software, you assume
    all risks. Openwater disclaims all liability for any harm, injury, or
    damages incurred, and the user agrees to indemnify Openwater against any
    claims arising from such modifications.

## How this documentation is organized

This documentation reflects the structure of the released ER-00014 specification.
Each section maps directly to the corresponding section of the PDF.

| If you want to… | Go to |
|---|---|
| Understand the system at a hardware level | [The Open-Motion System](system.md) |
| Build, extend, or integrate with the SDK | [Software Development](software.md) |
| Get hardware files for fabrication | [Hardware Development](hardware.md) |
| Sync Open-Motion with another instrument | [External Connectivity](connectivity.md) |
| Submit a contribution | [Contributing](contributing.md) |
| Understand our development process | [Best Practices](best-practices.md) |

## Where to ask questions

- **Discord** — fastest response: [discord.gg/fS7vfAX4fA](https://discord.gg/fS7vfAX4fA)
- **GitHub Issues** in the relevant repo (see [Software Development](software.md)
  for the repo map)
- **Email** — [support@openwater.cc](mailto:support@openwater.cc)

---

*This page reflects ER-00014 Revision A, released 2026-04-15.
Approved by George Vigelette, Christopher Bush, David Paribello, Madhumita Srikanth.
For the full controlled-document archive, see the
[release PDF](ER-00014-RevA-OpenMotion-Developer-Docs.pdf).*
