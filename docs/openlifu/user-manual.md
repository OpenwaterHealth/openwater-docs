---
title: Open-LIFU User Manual
description: The controlled operator manual for the Open-LIFU platform — safety, system specifications, software operation, cleaning, administration, and troubleshooting.
---

# Open-LIFU User Manual

> **Document ID:** LBL-00009 · **Revision:** A · **Software:** v1.21.1 (Slicer extension), v1.12.1 (Desktop application)
> **Authors:** David Paribello, Peter Hollender, Seemal Tahir, Muhammad Zubair

## Research use only

!!! danger "Read before you operate"
    The Open-LIFU platform is for research use only. **Not for use in
    therapeutic procedures.** The System is **not intended to be used for the
    diagnosis or treatment of any disease or medical condition and is not
    cleared by the FDA for clinical use.**

    This system is only intended to be used and operated by **trained research
    personnel**. Read the complete manual before operating the device.

    **Creating or modifying protocols without properly validating them may
    result in unsafe ultrasound exposure**, leading to serious bodily harm. Use
    only approved and tested protocols.

    **The transducer is not watertight. Never submerge it in water.** Damaged or
    compromised transducer housing may lead to high-voltage leakage and electrical
    shock risk — inspect all enclosures before powering on.

## What this document is

The User Manual is the **operator-facing** reference for Open-LIFU. Where the
[Developer Documentation](index.md) explains how the platform is built, this
manual explains how it is *run*: the safety envelope, the end-to-end software
workflow from subject creation through sonication, and what to do when
something goes wrong.

It is a controlled document. The PDF below is the authoritative revision —
this page summarizes and routes into it.

[:material-file-document-outline: Download LBL-00009 Rev A (PDF, 86 pp.)](LBL-00009-RevA-RUO-Open-LIFU-User-Manual.pdf){ .md-button .md-button--primary }

## Contraindications

The following conditions are contraindicated when using the Open-LIFU platform;
users or individuals displaying these signs or symptoms should not use Open-LIFU:

- Open cuts, sores, or wounds within the transducer contact area
- Head dressings, bandages, or gauze on or around the scan site that may interfere with transducer coupling
- Subjects must be able to remain still for the duration of a procedure
- Prenatal and Obstetric applications
- Targets requiring a beam path that travels through eyes

## Research use

Use of Open-LIFU to perform pre-clinical and/or clinical research may be subject to
various domestic and international laws and regulations. It is the responsibility of
the customer to be aware of and comply with all applicable laws and regulations
pertaining to their particular use.

!!! warning "Provided as-is"
    While Openwater has endeavored to design Open-LIFU with predictable performance
    and documented safety features, **Open-LIFU is provided as-is without warranty.**
    The safety and efficacy of Open-LIFU for any particular use is inherently subject
    to the specific requirements and risks of that application, and assessment and
    mitigation of such risks is the sole responsibility of the user.

## What's inside

| Section | Covers | Page |
|---|---|---|
| **Device Description & Indications** | What the system is, research-use boundaries, contraindications | 5 |
| **Definitions** | Canonical vocabulary — Protocol, Session, Solution, Run, Photoscan, Virtual Fitting | 6 |
| **Safety** | Quality standards the device was **designed in accordance with** (ISO 13485, ISO 14971, IEC 62304, IEC 60601, IEC 62366); general safety, warnings, precautions, electrical safety | 7 |
| **System Specification** | Console, console specs, transducer configurations, coupling pad, software, sonication sequence specs | 15 |
| **Creating & Editing Sonication Protocols** | Pulse, sequence, focal pattern, beamforming, segmentation, constraints, virtual fit | 21 |
| **Software Operation** | Database selection, log in, protocol configuration | 37 |
| **Planning Workflow** | Subject selection, session start, target selection, virtual fitting, saving a session plan | 42 |
| **Sonication Workflow** | Subject prep, photocollections and photoscans, transducer localization wizard, solution generation and approval, sonication, monitoring | 50 |
| **Device Cleaning and Storage** | Coupling pad disposal, transducer cleaning limits | 75 |
| **Administration and User Management** | Admin, operator, and custom roles; account management | 75 |
| **Service and Maintenance** | Support contact and service agreement routing | 78 |
| **Troubleshooting** | Photogrammetry reconstruction, offline/online connection failures, ADB setup | 79 |

## Related documentation

| For | See |
|---|---|
| Setting the device up for the first time | Quickstart Guide (LBL-00007 Rev 2) — *currently distributed in the onboarding packet; page pending* |
| Full protocol parameter reference | [Creating & Editing Sonication Protocols (ER-00017)](sonication-protocols.md) |
| Hardware architecture and specifications | [The Open-LIFU System](system.md) |
| Acoustic output verification | [Water Tank Testing (ER-00016)](water-tank-testing.md) |
| Building on or extending the platform | [Software Development](software.md) |

!!! note "Cleaning limits"
    Do not press directly on or apply excessive force to the transmit module
    array. Do not clean the transducer by submerging it. **Do not use isopropyl
    alcohol** — it damages the photogrammetry patterned veneer. Use CaviWipes or
    a damp cloth on the exposed transducer faces, and dispose of the coupling
    pad per your institution's protocols.

## Service and support

Service and maintenance must only be performed by suitably trained individuals.

- **Email** — [support@openwater.cc](mailto:support@openwater.cc)
- **Phone** — (415) 484-3776
- **Community** — [Discord](https://discord.gg/fS7vfAX4fA) · [community@openwater.cc](mailto:community@openwater.cc)

---

*This page reflects LBL-00009 Revision A. All information — including product
features, specifications, and descriptions — is subject to change without
notice. For the controlled revision, use the
[PDF](LBL-00009-RevA-RUO-Open-LIFU-User-Manual.pdf).*
