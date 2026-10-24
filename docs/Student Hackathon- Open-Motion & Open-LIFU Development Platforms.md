**OPENWATER**

*Open-Source Healthware*

**STATEMENT OF WORK**

Student Hackathon: Open-Motion & Open-LIFU Development Platforms

Openwater × Neurotechnology at Berkeley, University of California, Berkeley

| **SOW reference** | OW-UCB-HACK-2026-001  (draft)                                |
| ----------------- | ------------------------------------------------------------ |
| **Prepared by**   | Openwater  (Dan Blizinski, Director of Open Source Business Strategy) |
| **Counterparty**  | Neurotechnology  at Berkeley (ASUC student organization), UC Berkeley *[coordinator name and contact]* |
| **Event**         | Neurotechnology  at Berkeley Hackathon, October 24 to 25, 2026, Bakar BioEnginuity Hub, 2625  Durant Ave, Berkeley, CA |
| **Version**       | Draft  v0.1 for coordinator review, adapted from the UC San Diego SOW (v0.4) |
| **Date**          | October  20, 2026                                            |
| **Status**        | Exploratory,  subject to mutual agreement                    |

 

For Research Use Only. Not for use in diagnostic or therapeutic procedures. This document is a non-binding draft prepared to support an exploratory discussion.

 

# 1. Parties and Purpose

This Statement of Work ("SOW") is between **Openwater** ("Openwater") and **Neurotechnology at Berkeley** ("the Student Team"), an ASUC student organization at the **University of California, Berkeley**. It describes the scope, responsibilities, resources, and terms under which the parties will collaborate on Openwater's participation in the Neurotechnology at Berkeley hackathon on October 24 to 25, 2026.

The purpose is to give an interdisciplinary Berkeley student community hands-on experience building on production-grade, open-source medical device platforms, while surfacing new tools, applications, and improvements that benefit the wider open-source community. This SOW is a working document to align both sides on scope; sponsorship, commercial, and legal terms will be finalized in a mutually executed agreement or sponsor confirmation.

## 1.1 Platforms and how Openwater participates

Openwater will participate as a **sponsor on three fronts**: a sponsor pitch at the opening of the event, a challenge-track sponsorship with problem statements for students, and an in-kind **devices sponsorship**. Both Openwater platforms will be present:

•  **Open-Motion**, Openwater's wearable speckle contrast imaging system for real-time cerebral blood flow and volume measurement (Track A, §4.1).

•  **Open-LIFU**, Openwater's modular low-intensity focused ultrasound research platform (Track B, §4.2).

Openwater will bring **one Open-Motion unit and one Open-LIFU unit**, carried to the venue by Openwater staff. The units are shared, supervised development stations, not one device per team (see §7 and §9). All tracks are therefore designed so that a team can make full progress from documentation, open-source repositories, provided datasets, and simulation, and use the physical hardware for bring-up, demonstration, and bench validation during scheduled slots.

  **Important  for participants**  Openwater's  devices are **research prototypes and are not FDA cleared or approved**.  They must **not be placed on or applied to any person** during this event.  Participants study how the devices are designed and build software, analysis,  and mechanical ideas on top of them. See §6.  

# 2. Background

Openwater develops open-source "healthware": openly licensed hardware, firmware, and software for medical sensing and stimulation. Licensing is controlled at the repository level: core software is generally reciprocal (AGPL-3.0), selected integration and extension repositories may use permissive licenses such as Apache-2.0, and current Open-LIFU hardware designs are released under CC BY-SA 4.0. Participants must follow the license in each upstream repository.

Openwater has supported prior student hackathons, including at USC and UC Berkeley. The challenge structure in this SOW follows the open-ended, track-based format developed for the UC San Diego engagement and the Neuro Hackathon 2026 scope, adapted to a two-day event with two shared devices.

# 3. Event Format and Schedule

The event is Neurotechnology at Berkeley's two-day, in-person hackathon. The venue, dates, and core schedule below are set by the host and are reproduced here for alignment.

| **Item**            | **Detail**                                                   |
| ------------------- | ------------------------------------------------------------ |
| **Dates**           | Saturday,  October 24 and Sunday, October 25, 2026           |
| **Location**        | Bakar  BioEnginuity Hub, 2625 Durant Ave, Berkeley, CA       |
| **Day 1 hours**     | Saturday,  October 24: 9:00 am to 5:00 pm                    |
| **Day 2 hours**     | Sunday,  October 25: 9:00 am to 7:00 pm                      |
| **Sponsor pitches** | Saturday,  October 24, 9:00 am (in-person or pre-recorded)   |
| **Judging**         | Sunday,  October 25, 3:00 pm to 5:00 pm; judges arrive by 2:45 pm |

 

**Hackathon ethos.** A hackathon rewards creativity, working demos, and bold ideas over polished production code. The challenge tracks in §5 are intentionally open-ended: they point to problems worth solving and offer optional seed ideas, but the project is for the team to invent.

## 3.1 Indicative run of show for Openwater

| **When**                        | **Activity**               | **Openwater role**                                           |
| ------------------------------- | -------------------------- | ------------------------------------------------------------ |
| Before  the event               | Preparation  (this week)   | Share  this SOW; confirm sponsorship tier and payment; send pitch slides, poster or  marketing material, track briefs, and links to docs.openwater.health,  repositories, and sample data; confirm mentors and judges |
| Sat  Oct 24, 9:00 am            | Sponsor  pitch and opening | Company  pitch (Dan Blizinski in person); announce the development-only boundary and  research-use-only status of the devices; introduce tracks and device stations |
| Sat  Oct 24, 9:00 am to 5:00 pm | Build,  day 1              | Mentor  support; device station open for scheduled bring-up slots; demo-table time if  the sponsorship tier includes it |
| Sun  Oct 25, 9:00 am to 3:00 pm | Build,  day 2              | Mentor  support; scheduled device slots; check-ins on minimum viable demos |
| Sun  Oct 25, 2:45 pm            | Judges  arrive             | At  least two Openwater judges (Dan Blizinski and an Openwater engineer, in  person or remote if the venue supports it) |
| Sun  Oct 25, 3:00 pm to 5:00 pm | Demos  and judging         | Judge  against the rubric in Annex B; contribute to awards   |
| Sun  Oct 25, evening            | Wrap-up                    | Retrieve  devices; collect team repository links             |
| T+1  to T+2 weeks               | Post-event                 | Repository  hand-off and pull requests, retrospective, optional continuation for standout  projects |

# 4. Platform Overview

## 4.1 Track A: Open-Motion (Pulsed-SCOS speckle contrast imaging)

Open-Motion is Openwater's next-generation speckle contrast imaging system for wearable optical sensing and real-time hemodynamic measurement. It uses Pulsed-Speckle Contrast Optical Spectroscopy (P-SCOS): pulsed near-infrared light (795 ± 5 nm) and camera-based speckle contrast analysis to derive a Blood Flow Index (BFI) and Blood Volume Index (BVI), sampled at 40 Hz, at depths up to approximately 3.5 cm. The USB, Windows-hosted console streams left and right hemodynamic traces that support signal processing, visualization, machine learning, SDK, firmware, and mechanical projects. Open-Motion is certified open-source hardware.

Reference repositories: openmotion-bloodflow-app, openmotion-sdk, opw_bloodflow_gen2_ai, openmotion-console-fw, openmotion-sensor-fw, openmotion-camera-fpga, openmotion-ta-fpga, openmotion-electrical, openmotion-mechanical.

## 4.2 Track B: Open-LIFU (low-intensity focused ultrasound)

Open-LIFU is a fully modular, open-source low-intensity focused ultrasound research platform for programmable, steered, and focused ultrasound. The current platform uses one or two 64-element (8×8) 2D matrix transmit modules at 155 kHz or 400 kHz, with software-controlled beamforming and target localization. The software stack includes the Open-LIFU Desktop Application, SlicerOpenLIFU, the openlifu Python toolbox, the openlifu-sdk hardware interface, embedded firmware, and an Android photogrammetry companion app. Berkeley teams can work on acoustic simulation, medical image processing and registration, planning UX, SDK and firmware work, and software-side verification, none of which requires applying ultrasound energy to anyone.

  **Safety  boundary: Track B is development only.**  Open-LIFU  is designated For Research Use Only. **No ultrasound energy will be  delivered to any person at this event under any circumstances.** The only  powered operation is the live demonstration in Openwater's sealed water-tank  fixture (§4.3), run by Openwater staff. Participants may not operate the  transducer. All other Track B work is inspection, powered-down mechanical and  electrical study, and software or firmware development against documented  interfaces and simulation.  

 

Reference repositories: openlifu-python, openlifu-desktop-application, SlicerOpenLIFU, openlifu-sdk, OpenLIFU-3DScanner, openlifu-transmitter-fw, openlifu-console-fw, openlifu-electrical, openlifu-mechanical, openlifu-sample-database.

## 4.3 Open-LIFU live demonstration: water-tank station

The Open-LIFU station is a **live visual demonstration**. The transducer sits **beneath a silicone membrane in a sealed, clear water-tank fixture**. When Openwater staff run it, the focused ultrasound visibly disturbs the water above the membrane, and the focus can be **rastered along selected dimensions** so participants can see steering and focal positioning in action rather than only reading about them. The demo uses a bench fixture only; nothing is applied to a person.

•  **Who runs it:** Openwater staff, at scheduled demo times and by request during mentor hours.

•  **What teams can do with it:** watch how a configuration or scan pattern translates into focal movement; compare simulation output from openlifu-python with the live raster; and propose target or scan configurations for Openwater staff to run on the tank during a scheduled slot.

•  **What it is not:** a calibrated acoustic measurement setup. The demo is qualitative and visual; quantitative claims should come from simulation or from measurements Openwater supplies.

# 5. Challenge Tracks

Openwater is sponsoring challenge tracks rather than fixed project assignments. Each track names a problem space worth exploring, explains why it matters, and offers optional seed ideas. Teams pick one track or propose their own under the Wildcard track, and are free to take a seed idea, remix several, or invent something new. The goal is a creative, working demonstration by Sunday afternoon, not the completion of a pre-written spec. The tracks are suggestions to inspire teams; they do not need to be followed strictly.

  **Data  and scope for all tracks**  Every  track can be completed with provided datasets, open-source repositories,  simulation, and software. Physical devices are shared stations available in  scheduled slots. **No track involves placing a device on a person or  collecting human data.** Outputs are research engineering demonstrations,  not diagnostic, screening, or clinical-decision tools.  

 

| **Track**                           | **Platform** | **Example directions**                                       | **Typical skills**                |
| ----------------------------------- | ------------ | ------------------------------------------------------------ | --------------------------------- |
| 1  · Signal & Physiology            | Open-Motion  | Pulse  and heart rate, respiration, HRV, artifact rejection, left-right asymmetry | DSP,  Python                      |
| 2  · Real-Time Viz & Interface      | Open-Motion  | Dashboards,  laterality views, annotation, replay            | UI/UX,  visualization             |
| 3  · ML & Brain-State               | Open-Motion  | Cognitive-load  or task classification on provided data, leakage-free evaluation | ML,  statistics                   |
| 4  · Developer Tools & SDK          | Both         | Logging,  LSL or REST or CLI integrations, exports, tests, docs | Software  engineering             |
| 5  · Acoustic Simulation & Planning | Open-LIFU    | Beam  steering and pressure-field simulation, target workflows, SlicerOpenLIFU UX | Acoustics,  numerical methods, Qt |
| 6  · Imaging & Registration         | Open-LIFU    | MRI  tissue segmentation, landmark detection, surface-registration error metrics | Medical  imaging, 3D geometry, ML |
| 7  · Hardware & Wearables           | Both         | Headset  fit and coupling, fixtures, firmware or FPGA study on the bench | ME,  EE, firmware                 |
| 8  · Wildcard                       | Any          | Anything  creative that fits none of the above               | Any                               |

 

## 5.1 Track 1: Signal & Physiology (Open-Motion)

Making sense of blood flow. Every downstream application stands on clean physiology extraction from the BFI and BVI streams.

•  **Seed ideas:** pulse and heart-rate extraction from BFI; respiration estimation and HRV; motion-artifact rejection with a continuous 0 to 1 signal-quality index; blood-flow laterality and inter-hemispheric asymmetry.

•  **A strong entry:** a robust, documented signal pipeline with an honest evaluation and a clear analysis of when and why it fails.

•  **Data:** provided pre-recorded and synthetic P-SCOS, BFI, and BVI datasets.

## 5.2 Track 2: Real-Time Visualization & Interface (Open-Motion)

Make the signal legible. A hemodynamic stream only creates value if a person can read it at a glance.

•  **Seed ideas:** low-latency multi-channel dashboards for BFI and BVI; laterality views with configurable asymmetry display; event annotation, session export, and replay; a "replay from CSV" teaching mode.

•  **A strong entry:** a responsive interface someone would want to use, with a clear UX and performance rationale.

•  **Data:** provided datasets and replayed logs; live stream from the shared station when available.

## 5.3 Track 3: ML & Brain-State Classification (Open-Motion)

Infer states from hemodynamics. Rigorous evaluation matters more here than a headline accuracy number.

•  **Seed ideas:** cognitive-load or attention detection; event or task classification from hemodynamic patterns; exploratory modeling of brain-state dynamics, with candid caveats about single-modality inference.

•  **A strong entry:** leakage-free, subject-wise evaluation with ROC and confusion analysis, a baseline comparison, and a grounded interpretation of what the model learned. A well-run null result is a good result.

•  **Data:** provided or synthetic datasets only. No new human data is collected at this event, and no diagnostic or screening claims should be made.

## 5.4 Track 4: Developer Tools, SDK & Integrations (Both)

Make the platform easier to build on. Tooling built this weekend can help every future developer on either platform.

•  **Seed ideas:** openmotion-sdk data logging with session metadata; Lab Streaming Layer, REST, or CLI integrations; standardized exports; a replay server; unit tests, CI workflows, and improved documentation; helper tooling around openlifu-python or the openlifu-sdk.

•  **A strong entry:** an upstream-able pull request with tests and docs.

•  **Data:** provided datasets, replayed logs, and sample databases.

## 5.5 Track 5: Acoustic Simulation & Planning (Open-LIFU)

Show where the energy goes before anything is switched on. Simulation and planning tools help researchers understand where a configuration is expected to concentrate acoustic pressure.

•  **Seed ideas:** reproducible simulation workflow from transducer configuration and target to pressure field and focal metrics; comparison of candidate steering configurations; a bounded UX improvement to SlicerOpenLIFU or the desktop application.

•  **Tank tie-in:** compare a simulated focal path against the live raster on the demo tank, or submit a scan pattern for Openwater staff to run during a scheduled slot (§4.3).

•  **A strong entry:** a workflow that moves from defined inputs to quantitative focal outputs with no hidden manual steps.

•  **Data:** openlifu-sample-database and simulation examples. Planning software is not used to direct sonication of any person.

## 5.6 Track 6: Imaging & Registration (Open-LIFU)

Anatomy in, coordinates out. Localization and registration quality set the ceiling for any planning workflow.

•  **Seed ideas:** MRI tissue segmentation into brain, bone, scalp, air, and CSF; automatic landmark detection (nose tip, left and right tragus) on MRI-derived surfaces or photogrammetry meshes; surface-registration error metrics and heatmaps.

•  **A strong entry:** reproducible pipeline with real quantitative error (Dice, millimeters) rather than only attractive images.

•  **Data:** de-identified sample imaging and photogrammetry data supplied by Openwater, used only under the event data-handling rules.

## 5.7 Track 7: Hardware & Wearables (Both)

The physical device. Signal quality begins at the sensor, and software begins at the firmware.

•  **Seed ideas:** Open-Motion headset fit, sensor coupling, and mounting concepts validated on phantoms or benchtop fixtures; firmware or FPGA study using the open repositories; mechanical or enclosure improvements from the open CAD; electrical design review.

•  **A strong entry:** a bench-validated improvement with clear before-and-after evidence and documented trade-offs.

•  **Data:** open hardware files, phantoms and fixtures, and the shared stations. No modification of safety-critical optical or acoustic output.

## 5.8 Track 8: Wildcard / Open Innovation

The best hackathon ideas often do not fit the categories. Teaching tools, data-art, accessibility-focused uses, and cross-instrument mashups are welcome, provided they are achievable in a weekend, buildable with the provided resources, and consistent with the development-only scope. Openwater mentors will help teams right-size an idea at kickoff.

# 6. Scope of Human Involvement

Both platforms are For Research Use Only and are not to be used for diagnosis or treatment. The scope for this event is **development and engineering only**.

|             | **Scope at this event**                                      |
| ----------- | ------------------------------------------------------------ |
| Open-Motion | Development  only: provided and synthetic data, optical phantoms, benchtop fixtures. Not  applied to any person, including self-testing by team members or mentors. No  human data collection. |
| Open-LIFU   | Development  only: simulation, software, de-identified imaging, documentation,  powered-down hardware study, and the Openwater-run water-tank demonstration.  No ultrasound energy is delivered to any person. |

 

This is stricter than the UC San Diego scope, which allowed incidental engineering self-test of Open-Motion at Openwater's discretion. At Berkeley, Openwater will announce at the opening that the devices are not FDA cleared or approved and must not be placed on anyone; this keeps the event consistent with the host's plan and removes any ambiguity for participants.

**No human-subjects research.** The structured collection of human data is not part of this event. Because no human data is collected, the optional ethics-gated annex used in other SOWs is omitted. Any later study would require its own review through the appropriate UC Berkeley human-subjects review process and a separate agreement.

# 7. Openwater Responsibilities and Provided Resources

Subject to final agreement and availability, Openwater will provide:

1. **Sponsor pitch.** Company pitch at the Saturday 9:00 am sponsor session, presented in person by Dan Blizinski. Openwater will send its slides in advance.
2. **Devices.** One Open-Motion unit and one Open-LIFU unit with cabling and accessories, hand-carried to and from the venue by Openwater staff, with a Windows host for Open-Motion. Final quantities and accessories are confirmed before the event and listed in Annex A. Units are shared stations; they are not one device per team.
3. **Challenge-track sponsorship.** The problem statements and seed ideas in §5, plus a short brief per track released ahead of the event.
4. **Software, repositories, and data.** Links to the relevant open-source repositories and sample and pre-recorded datasets sufficient to build and test without human participants.
5. **Documentation.** Developer documentation at docs.openwater.health and quick-start guides.
6. **Mentors.** Dan Blizinski and *[number]* Openwater engineers *[names to be confirmed]*, on site and/or remote, for technical briefing and build support. Remote mentors will use the event's chat channel *[Discord/Slack, to confirm]*.
7. **Judges.** At least two Openwater judges for the Sunday judging block: Dan Blizinski and one Openwater engineer *[in person or remote, to confirm]*.
8. **Safety briefing.** A short device-handling and boundaries briefing at kickoff, covering the no-human-application rule and shared-station etiquette.
9. **Marketing material.** Logo, pitch slides, and any flyers for distribution, per the sponsorship tier in §10.

# 8. Neurotechnology at Berkeley (Student Team) Responsibilities

1. **Event logistics.** Venue and space at Bakar BioEnginuity Hub, scheduling, food, and on-the-ground operations.
2. **Device-station setup.** A table for each device station with at least *[two]* grounded outlets and reliable network access; a location that allows supervised access. The Open-LIFU station holds a water tank, so it should sit on a stable surface away from laptops and power strips, with access to water for filling and towels for spills *[Openwater can bring water and towels, to confirm]*. Confirm whether secure overnight storage exists; if not, Openwater will take the devices at the end of Day 1 and return them Day 2.
3. **Recruiting, teams, and conduct.** Participant recruiting across disciplines, team formation, and code-of-conduct enforcement.
4. **Sponsor recognition.** Delivery of the recognition benefits for the confirmed tier (§10), including the pitch slot, slides, and flyers.
5. **Pre-event promotion.** A marketing poster for pre-event promotion, shared with Openwater for review and distribution through Openwater channels.
6. **Safety communication.** Ensuring participants hear and follow the development-only boundaries and the no-device-on-body rule.
7. **Judging logistics.** Coordinating judges, scheduling demos in the Sunday 3:00 to 5:00 pm block, and administering the rubric; a remote-judge link if needed.
8. **Equipment stewardship.** Supervised handling during the event and return of equipment to Openwater staff at the end of the event.
9. **Student policies.** Confirming that any UC Berkeley or ASUC policy relevant to student projects, photography, and waivers is handled in event registration.

# 9. Hardware, Data, and Technical Support

| **Resource**     | **Open-Motion**                                              | **Open-LIFU**                                                |
| ---------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| Quantity on site | 1  unit (shared station)                                     | 1  unit (shared station)                                     |
| Core hardware    | Console  and sensor headset (USB, Windows host)              | Transmit  module(s), 64-channel 2D array, console            |
| Software         | Blood-flow  app, openmotion-sdk (Python)                     | Desktop  app, SlicerOpenLIFU, openlifu-python, openlifu-sdk  |
| Datasets         | Representative  pre-recorded and synthetic P-SCOS, BFI, and BVI data | openlifu-sample-database;  simulation-generated fields; de-identified imaging |
| Test targets     | Optical  phantoms, benchtop fixtures                         | Sealed  demo water tank (transducer beneath a silicone membrane), run by Openwater  staff; simulation and documentation |
| Host / toolchain | Windows  10 host, Python; FPGA and firmware toolchains for Track 7 | Python,  3D Slicer; STM32 toolchain for firmware study       |
| Mentor focus     | Signal  processing and ML, visualization, SDK, mechanical    | Acoustics  and simulation, planning UX, imaging, firmware    |

 

**Access model.** Because there is one unit of each platform, Openwater and the host will run a simple sign-up sheet for bring-up slots (suggested 20 to 30 minutes per team), prioritizing teams whose projects need live data. Teams without a slot work from the provided datasets and replay tools, which are sufficient for every track.

# Annex A: Equipment Schedule (to be completed)

| **Item**                                                     | **Qty** | **Serial / asset** | **Event period** | **Return condition**          |
| ------------------------------------------------------------ | ------- | ------------------ | ---------------- | ----------------------------- |
| Open-LIFU  kit (transmit module(s), console, cabling)        | 1       | *[serial]*         | Oct  24 to 25    | Good  working order           |
| Open-Motion  kit (console, sensor headset, cabling)          | 1       | *[serial]*         | Oct  24 to 25    | Good  working order           |
| Windows  host laptop for Open-Motion                         | *[1]*   | *[serial]*         | Oct  24 to 25    | Good  working order           |
| Open-LIFU  demo water-tank fixture (clear tank, silicone membrane) | 1       | *[asset]*          | Oct  24 to 25    | Good  working order, no leaks |
| Water,  towels, spill tray                                   | *[#]*   | n/a                | Oct  24 to 25    | Consumable                    |
| Phantom  / fixture set                                       | *[#]*   | n/a                | Oct  24 to 25    | Good  working order           |

 

Equipment remains in Openwater custody or supervised use throughout. Loss, damage, insurance, and liability terms to be set in the executed agreement.

# Annex B: Suggested Judging Rubric

A hackathon-oriented rubric that weights creativity and a working demo. Weights are placeholders for the host and Openwater to finalize.

| **Criterion**             | **Weight** | **What judges look for**                                     |
| ------------------------- | ---------- | ------------------------------------------------------------ |
| Innovation  & creativity  | 25%        | Originality  of the idea; a fresh use of the platform; ambition balanced with feasibility |
| Technical  merit          | 25%        | Sound  engineering; correct use of the platform, SDK, and data; honest evaluation |
| Execution  & demo         | 25%        | A  working demo; clarity; how much was achieved in two days  |
| Open-source  contribution | 15%        | Quality  of the repository or pull request; documentation; upstream-ability |
| Impact  & relevance       | 10%        | Usefulness  to the platform, research, or the open-source community |

 