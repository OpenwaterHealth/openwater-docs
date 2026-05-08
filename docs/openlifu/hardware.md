# Open-LIFU Hardware Development

## Overview

All hardware developed using Openwater's base platform is released under
**Creative Commons Attribution-ShareAlike 4.0** (CC BY-SA 4.0). The
hardware is separated into 1× and 2× transmit-module configuration CAD
assemblies. Part numbers are provided in the tables below.

## CAD files

Released design files for Open-LIFU live in two repositories:

- **Mechanical:**
  [`OpenLIFU-Mechanical`](https://github.com/OpenwaterHealth/OpenLIFU-Mechanical)
- **Electrical:**
  [`openlifu-electrical`](https://github.com/OpenwaterHealth/openlifu-electrical)

## Mechanical

The mechanical repository provides:

- 3D mechanical parts and assembly models for Open-LIFU devices, including
  transducers and housings
- Useful when you need physical dimensions, mechanical constraints, or to
  integrate Open-LIFU with custom enclosures
- Best fit for: mechanical CAD work and physical integration requirements

### Open-LIFU mechanical design files

| Part name | Part number |
|---|---|
| LIFU Console with power cable and USB cable | `700-00012` |
| 1× Transducer Housing | `700-00018` |
| 2× Transducer Housing | `700-00021` |
| LIFU Transducer Strap | `700-00022` |
| Transmit Module (155 kHz) | `700-00039` |
| Transmit Module (400 kHz) | `700-00040` |

## Electrical

The electrical repository contains:

- PCB designs for the Open-LIFU platform (Console, Transmit modules, etc.)
- Board-level schematics and layout sources for building or modifying
  hardware
- Best fit for: actual electronics hardware build files

### Open-LIFU PCBs

| Part | Board design | Schematic |
|---|---|---|
| Console Board | `710-00025` | `720-00011` |
| Transmit Board | `710-00015` | `720-00001` |

## Building your own hardware

If you intend to fabricate Open-LIFU hardware:

1. Use the released revision of each board file from the electrical
   repository.
2. Source the BOM components per the released BOM (component substitutions
   may affect acoustic, thermal, or RF performance).
3. Follow the assembly instructions in the mechanical repository for
   housing, strap, and cable routing.
4. Perform the verification tests described in
   [Best Practices → Verification & Validation](best-practices.md#verification-validation)
   before any operational use.

!!! danger "Recharacterization required for any modification"
    All Open-LIFU transducers and transmit modules are factory calibrated.
    Reconfiguring or modifying any transducer immediately voids the factory
    calibration and shifts all liability for safety, integrity, and
    performance to the modifier. Recharacterize against
    application-specific requirements before use. See the
    [investigational-device disclaimer](index.md#investigational-device-research-use-only)
    for full terms.

!!! note "Custom transmit-module configurations"
    The architecture supports more transmit modules or modules arranged
    differently than the standard 1× / 2× configurations, and these are
    generally supported by the software. The customization of Open-LIFU
    hardware itself is beyond the scope of this document — reach out on
    [Discord](https://discord.gg/fS7vfAX4fA) if you are pursuing a
    non-standard build.
