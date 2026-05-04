# Open-Motion Hardware Development

## Overview

All hardware developed using Openwater's base platform is released under
**Creative Commons — ShareAlike 4.0**. The hardware is separated into one and
two-sensor-module CAD assemblies. Part numbers and quantities are provided in
the tables below.

## CAD files

Released design files for Open-Motion are stored in the Mechanical and
Electrical repositories on GitHub:

- **Mechanical:**
  [`openmotion-mechanical`](https://github.com/OpenwaterHealth/openmotion-mechanical)
- **Electrical:**
  [`openmotion-electronics`](https://github.com/OpenwaterHealth/openmotion-electronics)

## Mechanical

The mechanical repository provides:

- 3D mechanical parts and assembly models for Open-Motion devices, including
  sensor modules and housings
- Useful when you need physical dimensions, mechanical constraints, or to
  integrate Open-Motion with custom enclosures
- Best fit for: mechanical CAD work and physical integration requirements

### Sensor Module assembly

Top-level mechanical assemblies for the Open-Motion device:

| Part name | Part number |
|---|---|
| Motion Console with power cable and USB cable | `700-00013` |
| Motion head strap, arm/leg strap, torso strap | `700-00029` |
| Sensor module with cable (Console to Sensor Module) and protective cover | `700-00031` |

## Electronics

The electronics repository contains:

- PCB designs for the Open-Motion platform (Console and sensor modules)
- Board-level schematics and layout sources for building or modifying hardware
- Best fit for: electronics hardware build files

### Open-Motion PCBs

Electronic board designs for the Open-Motion device:

| Part | Board design | Schematic | Status |
|---|---|---|---|
| Console Board | `710-00024` | `720-00010` | In design |
| Camera Board | `710-00021` | `720-00007` | In design |
| Aggregator Board | `710-00019` | `720-00005` | Released |

!!! note "Design status"
    "In design" means the board is actively being revised and not yet released
    for fabrication. "Released" means the board files are stable and have been
    fabricated and validated. Always check the latest tag in the repo before
    sending files to a fabricator.

## Building your own hardware

If you intend to fabricate Open-Motion hardware, please:

1. Use the released revision of each board file from the Electronics
   repository.
2. Source the BOM components per the released BOM (component substitutions
   may affect optical or thermal performance).
3. Follow the assembly instructions in the Mechanical repository for housing
   and cable routing.
4. **Do not modify the laser safety circuitry** without a corresponding update
   to the safety FPGA logic. Disabling or bypassing safety interlocks is
   strictly prohibited under the Class 1 laser certification.
5. Perform the verification tests described in
   [Best Practices → Verification & Validation](best-practices.md#verification-validation)
   before any operational use.

!!! danger "Class 3 laser safety"
    Modifications to the Console enclosure, optical path, or laser safety
    interlocks can expose users to Class 3 laser radiation. Such modifications
    immediately void all warranties and shift all liability to the modifier.
    See the
    [Investigational device disclaimer](index.md#investigational-device-research-use-only)
    for full terms.
