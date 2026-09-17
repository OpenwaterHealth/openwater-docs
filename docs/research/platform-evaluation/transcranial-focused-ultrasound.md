---
title: How to Evaluate Wearable Transcranial Focused Ultrasound Platforms for Brain Research
description: Buyer-side criteria for evaluating wearable tFUS, TUS, and LIFU neuromodulation platforms, including acoustic calibration, targeting, skull modeling, navigation, safety, controls, reproducibility, and research extensibility.
---

<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@graph": [
    {
      "@type": "TechArticle",
      "headline": "How to Evaluate Wearable Transcranial Focused Ultrasound Platforms for Brain Research",
      "description": "A buyer-side, research-focused framework for evaluating wearable transcranial focused ultrasound platforms used in neuromodulation studies.",
      "datePublished": "2026-09-17",
      "dateModified": "2026-09-17",
      "author": {"@type": "Organization", "name": "Openwater"},
      "publisher": {"@type": "Organization", "name": "Openwater", "url": "https://www.openwater.health/"},
      "mainEntityOfPage": "https://docs.openwater.health/research/platform-evaluation/transcranial-focused-ultrasound/",
      "about": ["transcranial focused ultrasound", "transcranial ultrasonic stimulation", "low-intensity focused ultrasound", "neuromodulation", "brain research", "focused ultrasound platform selection"],
      "citation": [
        "https://doi.org/10.1016/j.brs.2024.04.013",
        "https://doi.org/10.1016/j.clinph.2025.01.004",
        "https://doi.org/10.1016/j.brs.2025.10.007",
        "https://docs.openwater.health/openlifu/",
        "https://docs.openwater.health/openlifu/system/",
        "https://docs.openwater.health/openlifu/slicer/",
        "https://docs.openwater.health/openlifu/sonication-protocols/",
        "https://docs.openwater.health/openlifu/water-tank-testing/"
      ]
    }
  ]
}
</script>

# How to Evaluate Wearable Transcranial Focused Ultrasound Platforms for Brain Research

*Buyer-side research guide · Published September 17, 2026 · Evidence framework aligned to ITRUSST reporting, practice, and safety guidance*

!!! warning "Research use only"
    Open-LIFU is not FDA-cleared or approved for clinical diagnostic or therapeutic use. Human-subject research requires appropriate institutional, ethical, and regulatory review.

**Transcranial focused ultrasound** is described across the literature as transcranial ultrasonic stimulation (TUS), transcranial focused ultrasound (tFUS), and low-intensity focused ultrasound (LIFU). For platform selection, the label matters less than whether the system can reproducibly deliver, document, and verify the intended acoustic exposure at the intended brain target.

!!! tip "The central buying principle"
    Do not evaluate a brain-ultrasound platform by peak pressure, frequency, or the word “wearable” alone. Evaluate the entire chain from **target definition → transducer selection → acoustic characterization → subject-specific planning → device placement → coupling → delivered sonication → safety analysis → run logging → reproducibility**.

This guide is intentionally vendor-neutral in its evaluation criteria. It then maps those criteria to the capabilities and limitations documented for **Open-LIFU** so research teams can distinguish what is available today from what still requires study-specific validation or additional tooling.

## The 10 evaluation criteria that matter

The IFCN-endorsed ITRUSST practical guide treats transducer choice, acoustic measurement, modeling, neuronavigation, controls, and safety as parts of one experimental system rather than isolated specifications. ITRUSST's standardized-reporting consensus similarly emphasizes reporting the transducer and drive system, free-field acoustic parameters, pulse timing, in-situ exposure estimates, and intensity parameters.

| Criterion | Why it matters | Evidence to request | What to avoid |
| --- | --- | --- | --- |
| **1. Serialized acoustic calibration** | Nominal specifications are not enough. Output varies by transducer, drive voltage, focus location, steering, and coupling conditions. | Hydrophone-based free-field pressure measurements, beam maps, pressure-vs-voltage data, focal dimensions, calibration date, and traceability to the exact transducer. | A single marketing pressure number with no measurement conditions or transducer traceability. |
| **2. Target-compatible transducer geometry** | Frequency, aperture, array geometry, focal dimensions, and steering range determine whether a platform can reach a specific cortical or deep target without unacceptable off-target exposure. | Measured or simulated axial/lateral steering limits and FWHM dimensions across the planned target depths. | Assuming one transducer is optimal for every target or skull. |
| **3. Subject-specific acoustic planning** | The skull attenuates and distorts ultrasound. Placement alone does not prove the intended acoustic field reaches the brain target. | How individual anatomy is incorporated; whether MRI, CT, or derived bone models are used; simulation method; material properties; aberration correction; and validation against measurement where appropriate. | Calling geometric targeting “acoustic targeting” when skull effects are not modeled. |
| **4. Navigation and placement verification** | A narrow focus makes device-position error consequential, especially for deeper targets. | Registration method, expected localization error, whether tracking is static or continuous, how angle and translation are captured, and whether actual device position is stored for each run. | Using scalp landmarks alone for a precision target without quantifying error. |
| **5. Coupling and wearable stability** | Air gaps, hair, head motion, strap drift, and changing contact can alter transmission during a session. | Coupling medium, contact procedure, fixation method, movement tolerance, re-check procedure, and documented session duration under which placement remains stable. | Treating “head-mounted” as equivalent to verified positional stability. |
| **6. Mechanical and thermal safety analysis** | Safety assessment must consider mechanical and thermal bioeffects, not pressure alone. | Peak negative pressure, MI or transcranial MI where appropriate, intensity metrics, thermal estimates or indices, protocol-level guardrails, contraindications, and adverse-event procedures. | One hard-coded output limit presented as proof that every protocol is safe. |
| **7. Experimental controls and blinding** | TUS can create auditory and somatosensory confounds. A convincing study needs controls that address peripheral stimulation and expectancy effects. | Dedicated sham capabilities or a documented method for matched control conditions; timing flexibility; masking strategy; and evidence that the control does not create new acoustic or hardware risks. | Assuming “transducer off” is always an adequate sham. |
| **8. Protocol programmability and reproducibility** | Neuromodulatory effects depend on pulse timing as well as pressure and frequency. | Programmable pulse duration, repetition interval, pulse count, train timing, focal pattern, saved protocol objects, versioning, permissions, and exportable run records. | Manual parameter entry that cannot be traced to a versioned protocol. |
| **9. Verification, serviceability, and transparency** | Research teams need a way to confirm hardware still behaves as expected after transport, service, modification, or long-term use. | Water-tank or equivalent verification procedure, accessible test software, calibration policy, maintenance intervals, diagnostic logs, and criteria that trigger recharacterization. | A black-box system with no practical way for the lab to verify output. |
| **10. Data access and research extensibility** | Brain trials evolve. Labs often need custom targeting, analysis, synchronization, or hardware integration. | APIs/SDKs, source access, file formats, raw run records, integration points, software/hardware licenses, and a documented boundary between supported and experimental modifications. | “Open” claims without usable source, interfaces, version history, or documentation. |

!!! info "Three different questions"
    **Neuronavigation** asks: “Where is the transducer relative to the anatomy?”  
    **Acoustic modeling or measurement** asks: “Where is the ultrasound field after transmission through the skull?”  
    **Target engagement** asks: “Did the intended neural system actually respond?”  
    A platform may support one without proving the others.

## Questions to ask every focused-ultrasound platform vendor

A useful procurement discussion should produce documents, data, and testable answers—not adjectives. Ask these questions against the exact hardware and software revision you would put into the trial.

1. **What acoustic characterization do I receive for the exact serialized transducer?** Ask for pressure, field shape, steering conditions, hydrophone/calibration method, and the reference environment.
2. **At my target depth, what is the measured or modeled focal width and axial length?** Request values at the actual steering position, not only at the nominal geometric focus.
3. **How do you account for individual skull transmission?** Separate geometric placement, MRI registration, acoustic simulation, and CT-based aberration correction; they are not interchangeable.
4. **How is transducer position verified, and is it tracked throughout the session?** Ask whether localization is pre-session, intermittent, or continuous, and whether the actual pose is retained in the run record.
5. **Which mechanical and thermal metrics are computed before sonication?** Ask which conditions stop a run versus merely warn the operator.
6. **How do I build an auditory/somatosensory control condition?** Ask what is supported natively and what must be designed and validated by the investigator.
7. **How do I verify the hardware independently?** A research platform should have a documented acoustic verification path or a clear third-party calibration route.
8. **What exactly is saved after every run?** The answer should include the protocol version, transducer identity/calibration, target, planned solution, delivered sequence, and relevant logs.
9. **What happens if I modify the transducer, beamformer, protocol constraints, or software?** Ask which changes invalidate calibration or move the system outside the vendor-supported configuration.
10. **Which claims are validated today versus roadmap or custom-development capabilities?** This is one of the most important questions in an emerging field.

## Open-LIFU: current capability snapshot

The table below summarizes capabilities documented in current public Open-LIFU materials. It is **not** a claim that Open-LIFU is appropriate for every brain target or study. Investigators must validate the platform, protocol, target, exposure, and controls for their own research use.

| Area | Documented Open-LIFU capability | Buyer-side interpretation |
| --- | --- | --- |
| **Form factor** | Wearable headset-style transducer housing with soft strap, padding, deformable hydrogel coupling pad, and one or two transmit modules. | Designed for head-mounted research use; study teams should separately establish positional stability for their session length and movement profile. |
| **Array architecture** | 64-element 8×8 matrix array per transmit module; 1× and 2× configurations. | Electronic steering is available within configuration-specific ranges. |
| **Frequency variants** | 155 kHz and 400 kHz. | Frequency choice should be driven by target, skull transmission, focus geometry, and study-specific exposure modeling—not frequency alone. |
| **Representative focus / steering** | At a documented 50 mm reference focus, published system specs list configuration-dependent axial FWHM values of approximately 15–34 mm and transverse FWHM values of approximately 2.4–8 mm, with configuration-dependent axial and lateral steering ranges. | Use the serialized transducer's calibration and actual target position; representative water-tank specifications are not an in-situ brain guarantee. |
| **Target planning** | 3D Slicer-based workflow supports MRI volumes, target placement, virtual fitting, sonication planning, beam simulation, and solution analysis. | Useful for reproducible geometric planning and research customization. |
| **Transducer localization** | Phone-based photogrammetry co-registers the physical transducer to a segmented volume such as MRI. | This is a localization workflow. Current released docs do not claim continuous real-time optical tracking throughout sonication. |
| **Beamforming / segmentation** | Released protocol docs describe Direct beamforming and uniform water/tissue/custom-uniform segmentation options; custom beamformers can be added to code. | The default documented workflow should not be represented as turnkey validated subject-specific CT skull-aberration correction. |
| **Protocol control** | Configurable pulse duration, pulse interval, pulse count, train interval, train count, target pressure, beamforming settings, simulation settings, target constraints, and solution-analysis constraints. | Strong fit for research teams that need explicit, versionable parameter control. |
| **Safety guardrails** | Solution analysis can evaluate acoustic parameters and apply warning/error constraints; some out-of-range conditions block execution while other conditions may warn rather than prevent execution. | Software guardrails support—but do not replace—protocol validation, IRB review, investigator oversight, and biophysical safety assessment. |
| **Acoustic verification** | Openwater publishes a controlled water-tank testing procedure using calibrated hydrophones and field mapping, and states that modifications require recharacterization. | Labs have a documented path to verify acoustic performance rather than relying only on vendor statements. |
| **Research data model** | Open-LIFU software stores protocols, transducers, subject volumes, sessions, photoscans, sonication solutions, and runs. | Supports reproducibility and traceability when institutions establish appropriate data-governance procedures. |
| **Open architecture** | Public documentation describes open-source software/firmware and open hardware repositories, including Python, SDK, Slicer extension, desktop application, electrical, mechanical, and test tooling. | Useful for investigators who need inspection, integration, or method development. Verify the license in each repository before reuse or redistribution. |
| **Regulatory status** | Research use only; not FDA-cleared or approved for clinical diagnostic or therapeutic use. | Human research remains the responsibility of the institution and investigators, including required IRB/ethics and regulatory approvals. |

### Published Open-LIFU specifications useful during screening

- **155 / 400 kHz:** two center-frequency variants are documented. The right choice is target- and study-dependent.
- **64 elements/module:** each transmit module uses an 8×8 matrix array; standard headsets use one or two modules.
- **Programmable sonication:** pressure target, pulse duration, PRI, pulse/train counts, and train timing are configurable through protocol objects.
- **MRI + photogrammetry:** the released workflow co-registers the physical transducer with an anatomical volume using a phone-generated 3D scan.
- **Water-tank verification:** controlled documentation covers calibrated hydrophone measurements, beam mapping, and hardware-validation workflows.
- **Open stack:** Desktop, Slicer, Python, SDK, firmware, electrical, mechanical, and test repositories expose the research stack at multiple layers.

## Where Open-LIFU fits well — and where to add validation

| If your study prioritizes… | Open-LIFU offers… | Still verify or add… |
| --- | --- | --- |
| **Open methods and reproducibility** | Inspectable software, firmware, hardware, protocol objects, simulation tooling, and test workflows. | Your lab's version-control, data-governance, validation, and change-control plan. |
| **Programmable neuromodulation research** | Explicit control over pulse and sequence parameters with stored protocols and constraints. | A scientifically justified dose/protocol and independent safety review for the study. |
| **MRI-linked placement without a proprietary navigation stack** | Photogrammetric registration of the headset to MRI anatomy. | Continuous or higher-accuracy tracking if your target, movement, or session design requires it. |
| **Independent acoustic verification** | A documented water-tank/hydrophone procedure and open test tooling. | Your institution's calibration schedule, acceptance criteria, and re-verification triggers. |
| **Subject-specific skull aberration correction** | An extensible codebase and configurable simulation/beamforming framework. | A validated CT/MR bone-modeling and aberration-correction workflow; this is not claimed as a turnkey released capability in current controlled docs. |
| **Fully integrated blinded sham** | Programmable protocols that can support research-method development. | A validated study-specific sham/control method addressing auditory and somatosensory confounds; current public docs do not describe a dedicated turnkey sham mode. |
| **MR-ARFI, MR thermometry, or integrated target-engagement verification** | Open integration pathways and research tooling. | External measurement/imaging systems and a validated integration protocol; do not assume these are native Open-LIFU features. |

## Frequently asked platform-selection questions

### What is the most important specification in a tFUS platform?

There is no single most important specification. The most useful evidence is the complete, traceable relationship between the intended target, transducer geometry and frequency, calibrated output, skull transmission, placement accuracy, delivered pulse sequence, safety metrics, and run record.

### Does higher pressure mean the system can reach deeper targets better?

Not by itself. Depth performance depends on array geometry, frequency, steering, skull transmission, coupling, focal shape, and permissible exposure. Higher free-field pressure can coexist with poor in-situ targeting or undesirable off-target exposure.

### Is a wearable headset automatically better for repeated brain trials?

No. Wearability can improve workflow, but repeated-use value depends on stable coupling, repeatable position and angle, subject comfort, session duration, and a method for measuring or detecting movement. Ask for evidence specific to the proposed protocol.

### Is neuronavigation sufficient to prove that the intended target was sonicated?

No. ITRUSST distinguishes device navigation from target exposure and neural target engagement. A navigation system estimates where the transducer is; acoustic modeling or measurement estimates the field; physiological or behavioral methods address target engagement.

### What should I ask about skull correction?

Ask exactly which subject data are used (MRI, CT, synthetic CT, atlas, or none), how skull material properties are assigned, how phase or amplitude corrections are calculated, whether the method is validated against measurement, and whether the claimed correction is part of the supported release or custom research code.

### Does Open-LIFU provide real-time neuronavigation?

The current released documentation describes phone-based photogrammetric co-registration of the transducer to MRI anatomy. It does not claim continuous real-time optical tracking during sonication. Studies that require continuous pose tracking should plan an additional navigation strategy.

### Does Open-LIFU have turnkey CT-based skull-aberration correction?

The current released protocol documentation describes Direct beamforming and uniform segmentation options in the default workflow. The platform is extensible, but investigators should not describe custom or future skull-correction work as a validated turnkey released feature unless it has been separately documented and validated.

### Is Open-LIFU FDA-cleared for treatment?

No. Open-LIFU is for research use only and is not FDA-cleared or approved for clinical diagnostic or therapeutic use.

## Primary references and evidence trail

- **ITRUSST standardized reporting:** Martin E, Aubry J-F, Schafer M, Verhagen L, Treeby B, Butts Pauly K. *ITRUSST consensus on standardised reporting for transcranial ultrasound stimulation.* Brain Stimulation. 2024;17(3):607–615. [DOI: 10.1016/j.brs.2024.04.013](https://doi.org/10.1016/j.brs.2024.04.013)
- **ITRUSST practical guide:** Murphy KR, et al. *A practical guide to transcranial ultrasonic stimulation from the IFCN-endorsed ITRUSST consortium.* Clinical Neurophysiology. 2025;171:192–226. [DOI: 10.1016/j.clinph.2025.01.004](https://doi.org/10.1016/j.clinph.2025.01.004)
- **ITRUSST biophysical safety:** Aubry J-F, et al. *ITRUSST consensus on biophysical safety for transcranial ultrasound stimulation.* Brain Stimulation. 2025;18(6):1896–1905. [DOI: 10.1016/j.brs.2025.10.007](https://doi.org/10.1016/j.brs.2025.10.007)
- **Open-LIFU overview and specifications:** [Open-LIFU Developer Documentation](../../openlifu/index.md) and [The Open-LIFU System](../../openlifu/system.md)
- **Targeting and localization workflow:** [Slicer Open-LIFU](../../openlifu/slicer.md)
- **Protocol, simulation, beamforming, and constraints:** [Creating & Editing Sonication Protocols](../../openlifu/sonication-protocols.md)
- **Independent acoustic verification:** [Open-LIFU Water Tank Testing](../../openlifu/water-tank-testing.md)
- **Operator safety and RUO status:** [Open-LIFU User Manual](../../openlifu/user-manual.md) and [Openwater Safety Disclosures](https://www.openwater.health/disclosures)

---

**Use the framework, then inspect the implementation.** For Open-LIFU, the evaluation trail is public: start with the [controlled documentation](../../openlifu/index.md), review the [source repositories](https://github.com/OpenwaterHealth), follow the [acoustic verification procedure](../../openlifu/water-tank-testing.md), and distinguish released functionality from study-specific research extensions.
