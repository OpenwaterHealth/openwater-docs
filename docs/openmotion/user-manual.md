---
title: Open-Motion Research User Manual
description: The controlled operator manual for the Open-Motion platform — safety, system specifications, software operation, cleaning, and troubleshooting.
---

# Open-Motion Research User Manual

> **Document ID:** LBL-00014 · **Revision:** A · **Software:** v1.5.4 · **Released:** 2026-10-29
> **Authors:** Brad Hartl, Ethan Head, Peter Herzlinger, David Paribello

## Research use only

!!! danger "Read before you operate"
    The Open-Motion platform is for research use only. **Not for use in
    diagnostic or therapeutic procedures.** It is intended to be used by trained
    research professionals to measure changes in blood flow and blood volume.

    Read the complete manual before operating the device.

    **If the fiber optic connections are disconnected or not properly secured to
    the Console, Class 3B laser energy may be emitted from open ports**, which can
    cause serious eye injury. Never open the Console, and always power down and
    unplug it before disconnecting the Sensor Module cables.

    **Operating the device without the delivery optic diffuser in contact with
    the subject's skin may expose the eyes to laser radiation above Class 1
    limits.** Verify the diffuser optic is present, intact, and in contact with
    skin before every scan.

## What this document is

The User Manual is the **operator-facing** reference for Open-Motion. Where the
[Developer Documentation](index.md) explains how the platform is built, this
manual explains how it is *run*: the safety envelope, installing and starting
the Open-Motion Research application, placing the Sensor Modules, running and
reviewing scans, and what to do when something goes wrong.

It is a controlled document. The PDF below is the authoritative revision —
this page summarizes and routes into it.

[:material-file-document-outline: Download LBL-00014 Rev A (PDF, 59 pp.)](LBL-00014-RevA-RUO-Open-Motion-User-Manual.pdf){ .md-button .md-button--primary }
[:material-download: Latest software release](https://github.com/OpenwaterHealth/openmotion-bloodflow-app/releases/latest){ .md-button }

## Contraindications

Do not use the Open-Motion device on subjects with any of the following
conditions:

- Open cuts, sores, or wounds within the contact area
- Head dressings, bandages, or gauze on or around the scan site
- Inability to remain stationary for the duration of the measurements

## Research use

Use of Open-Motion to perform pre-clinical and/or clinical research may be
subject to various domestic and international laws and regulations. It is the
responsibility of the operator to be aware of and comply with all applicable
laws and regulations pertaining to their particular indication.

!!! warning "Provided as-is"
    While Openwater has endeavored to design the device with predictable
    performance and documented safety features, **the device is provided as-is
    without warranty.** The safety and efficacy of the device for any particular
    use are inherently subject to the specific requirements and risks of that
    application, and assessment and mitigation of such risks is the sole
    responsibility of the researcher.

## What's inside

| Section | Covers | Page |
|---|---|---|
| **Introduction** | Device description, indications for use, contraindications, research-use boundaries, definitions (BFI, BVI, Mean, Contrast, P-SCOS), device labels and symbols | 4 |
| **Safety** | Quality standards the device was **designed to conform to** (ISO 13485, ISO 14971, IEC 62304, IEC 60601-1, IEC 60601-1-2, IEC 62366-1, IEC 60825-1); warnings, precautions, electrical safety, laser safety | 6 |
| **System Specifications** | Console, Sensor Module, laser, and user-provided PC requirements | 11 |
| **System Components** | Console ports and status LED, Sensor Module and camera ordering, storage and handling | 13 |
| **Using Open-Motion** | Installing and updating the application and firmware, setup, assembling the Sensor Module frame, placing the Sensor Modules, scan settings and camera patterns, contact-quality checks, running a scan, reading and navigating plots, session notes, Scan History, settings, data storage, shutdown, cleaning, sync, getting help, known issues | 15 |
| **Service and Maintenance** | Support contact and service agreement routing | 46 |
| **Troubleshooting** | Common errors, on-screen messages, the error dialog, and the error code reference (E-101 through E-306) | 46 |
| **Appendix: Sensor Module Replacement** | Connecting the hybrid cables of new or replacement Sensor Modules to the Console | 52 |

## Related documentation

| For | See |
|---|---|
| Getting set up and running your first scan | [Quick Start Guide](developer-quickstart.md) |
| Hardware architecture and specifications | [The Open-Motion System](system.md) |
| Synchronizing Open-Motion with another instrument | [External Connectivity](connectivity.md) |
| Building on or extending the platform | [Software Development](software.md) |
| Installing the application | [Latest Software Release](https://github.com/OpenwaterHealth/openmotion-bloodflow-app/releases/latest) |
| Evaluating optical blood-flow platforms | [Evaluating Optical Blood-Flow Platforms](../research/platform-evaluation/optical-blood-flow-monitoring.md) |

!!! note "Cleaning"
    With the system powered off, clean the Sensor Modules and the Console with
    70% isopropyl alcohol (IPA) and a lint-free cloth, in accordance with your
    facility's protocols. The disposable headband assembly (attachment frame and
    strap) is **single-patient-use**: discard it after each patient and do not
    clean, disinfect, reprocess, or reuse it.

!!! note "Subject data"
    Use a study or subject code in session labels and notes — never a name or
    other subject-identifiable information. In the Research build the scan
    database is not encrypted; protect the computer and any exported files
    according to your study's data-handling rules.

## Service and support

Service and maintenance must only be performed by suitably trained individuals.

- **Email** — [support@openwater.cc](mailto:support@openwater.cc)
- **Phone** — (415) 484-3776
- **Web** — [www.openwater.health](https://www.openwater.health)
- **Community** — [Discord](https://discord.gg/fS7vfAX4fA)

---

*This page reflects LBL-00014 Revision A, software v1.5.4, released 2026-10-29
(ECO-000389). All information — including product features, specifications, and
descriptions — is subject to change without notice. For the controlled
revision, use the
[PDF](LBL-00014-RevA-RUO-Open-Motion-User-Manual.pdf).*
