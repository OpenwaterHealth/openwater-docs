**Openwater GitHub Repository**

**Naming Convention Framework**

Version 1.0 | January 2026

Applies to: github.com/OpenwaterHealth

# Purpose

This framework establishes consistent naming conventions for all repositories in the OpenwaterHealth GitHub organization. It ensures repositories are discoverable, understandable, and maintainable for both internal teams and external community contributors.

The Openwater engineering team adopted these conventions in January 2026, following a comprehensive GitHub organization cleanup that reduced repository count from 141 to a streamlined structure of approximately 42 well-organized repositories.

## Who Should Use This

**Internal Development Teams:** When creating new repositories for features, tools, or projects

**Community Contributors:** When proposing new repositories or understanding the existing structure

**New Team Members:** As an onboarding reference for navigating the codebase

# Quick Reference

Every repository name follows this pattern:

**\[platform\]-\[component\]**

**Platform Prefixes**

|     |     |     |
| --- | --- | --- |
| **Prefix** | **Use For** | **Example** |
| openlifu- | OpenLIFU platform (focused ultrasound) | openlifu-python |
| openmotion- | OpenMOTION platform (optical imaging) | openmotion-firmware |
| openwater- | Shared components, org-wide tools, research | openwater-sdk |

# Core Rules

|     |     |
| --- | --- |
| **Rule** | **Example** |
| Always lowercase | openlifu-python (not OpenLIFU-Python) |
| Use hyphens, never underscores | openlifu-hardware-electrical (not opw_neuromod_hw) |
| Be descriptive, not cryptic | openmotion-bloodflow-analysis (not opw_bf_gen2) |
| No abbreviations unless industry standard | Allowed: api, sdk, cli, bom, fw (firmware) |
| Include component type suffix | \-python, -firmware, -hardware-mechanical, -docs |

# Naming Decision Guide

Follow this decision tree to determine the correct repository name:

**Step 1: Identify the Platform**

Is this for focused ultrasound (OpenLIFU)?

→ YES: Use openlifu-

→ NO: Continue to next question

Is this for optical imaging (OpenMOTION)?

→ YES: Use openmotion-

→ NO: Use openwater- (shared/org-wide)

**Step 2: Identify the Component Type**

Software?

→ Add: -python, -firmware, -api, -cli, -analysis-tools

Hardware?

→ Add: -hardware-mechanical, -hardware-electrical, -bom

Documentation?

→ Add: -docs, -examples, -assembly-guides

Testing/Validation?

→ Add: -verification-tank, -test-fixtures

**Step 3: Special Cases**

Temporary or experimental?

→ Use: openwater-temp-\[name\]

Research experiment?

→ Use: openwater-experiment-\[name\]

Hackathon or contest?

→ Use: openwater-contest-\[name\]

# Component Type Suffixes

Use these standard suffixes after the platform prefix:

## Software Components

|     |     |     |
| --- | --- | --- |
| **Suffix** | **Description** | **Example** |
| \-python | Python libraries and applications | openlifu-python |
| \-firmware | Embedded device firmware | openmotion-firmware |
| \-api | REST APIs, backend services | openlifu-api |
| \-cli | Command-line interface tools | openwater-cli |
| \-sdk | Software development kit | openwater-sdk |
| \-analysis-tools | Data analysis software | openlifu-analysis-tools |

## Hardware Components

|     |     |     |
| --- | --- | --- |
| **Suffix** | **Description** | **Example** |
| \-hardware-mechanical | CAD files, enclosures | openlifu-hardware-mechanical |
| \-hardware-electrical | Schematics, PCB designs | openmotion-hardware-electrical |
| \-bom | Bill of materials | openlifu-bom |

## Documentation Components

|     |     |     |
| --- | --- | --- |
| **Suffix** | **Description** | **Example** |
| \-docs | Technical documentation | openlifu-docs |
| \-examples | Code examples, tutorials | openmotion-examples |
| \-assembly-guides | Hardware assembly instructions | openlifu-assembly-guides |

## Testing & Validation Components

|     |     |     |
| --- | --- | --- |
| **Suffix** | **Description** | **Example** |
| \-verification-tank | Verification test equipment | openlifu-verification-tank |
| \-test-fixtures | Test jigs and fixtures | openmotion-test-fixtures |

# Special Case Repositories

For temporary, experimental, or event-based repositories, use these special prefixes:

|     |     |     |
| --- | --- | --- |
| **Pattern** | **Use Case** | **Example** |
| openwater-temp-\[name\] | Short-term, throwaway work | openwater-temp-demo-jan |
| openwater-experiment-\[name\] | Research experiments, proof-of-concept | openwater-experiment-ml-dosing |
| openwater-contest-\[name\] | Hackathons, community challenges | openwater-contest-sfn-2026 |

**_Note:_** _These repositories should be reviewed quarterly—archive when no longer active._

# Examples: Before and After

These real examples from our organization show the transformation from legacy naming to our new convention:

|     |     |     |
| --- | --- | --- |
| **Old Name (Avoid)** | **New Name (Correct)** | **Why** |
| opw_neuromod_sw | openlifu-python | Descriptive |
| opw_neuromod_hw | openlifu-hardware-electrical | Clear type |
| opw_ustx | openlifu-firmware | No cryptic abbr |
| opw_bloodflow_gen2_sw | openmotion-bloodflow-gen2-software | Full words |
| motion-sensor-fw | openmotion-sensor-firmware | Consistent prefix |
| IntegratingSphere | openwater-integrating-sphere | Lowercase, hyphenated |
| AutoFiducialContest | openwater-contest-auto-fiducial | Special case pattern |
| test_tools | openwater-test-utilities | Hyphens, not underscores |

## Common Mistakes to Avoid

|     |     |
| --- | --- |
| **Mistake** | **Correct Approach** |
| Using underscores: opw_device_sw | Use hyphens: openwater-device-software |
| Cryptic abbreviations: opw_bf_g2_ai | Spell it out: openmotion-bloodflow-gen2-ai |
| Mixed case: OpenLIFU-Python | All lowercase: openlifu-python |
| No platform prefix: firmware-transmitter | Include prefix: openlifu-transmitter-firmware |
| Version in name: openlifu-python-v2 | Use Git tags/branches for versions. |

# Repository Description Guidelines

Every repository must have a clear, informative description. This appears in GitHub search results and organization listings.

## Description Format

Follow this template for descriptions:

\[What it does\] for \[which platform/purpose\]

### Good Description Examples

**openlifu-python:** _"Python library for controlling OpenLIFU focused ultrasound devices and analyzing treatment data."_

**openmotion-firmware:** _"Embedded firmware for OpenMOTION optical imaging sensors."_

**openwater-docs:** _"Central documentation hub for Openwater open-source medical device platforms."_

**openlifu-hardware-mechanical:** _"CAD files and enclosure designs for OpenLIFU device housing."_

### Avoid These Description Patterns

✘ **Too vague:** "Software repository."

✘ **Internal jargon:** "Gen2 BF SW for MOTION platform"

✘ **Empty or missing:** (no description)

✘ **Too long:** Descriptions over 100 characters get truncated

# Required Topic Tags

Add topic tags to every repository to improve discoverability. Topics appear on the repository page and enable filtering in GitHub search.

## Mandatory Tags (All Repositories)

|     |     |
| --- | --- |
| **Tag** | **Purpose** |
| openwater | Identifies all Openwater repositories |
| medical-device | Indicates medical device context |
| open-source | Highlights the open-source nature |

## Platform-Specific Tags

|     |     |
| --- | --- |
| **Tag** | **When to Use** |
| openlifu | All OpenLIFU platform repositories |
| openmotion | All OpenMOTION platform repositories |
| focused-ultrasound | OpenLIFU repositories |
| neuromodulation | Neuromodulation-related work |
| optical-imaging | OpenMOTION repositories |
| bloodflow | Blood flow measurement repositories |

## Component-Type Tags

Add tags based on what the repository contains:

**Software:** python, firmware, embedded, api, cli

**Hardware:** hardware, cad, pcb, schematics, bom

**Documentation:** documentation, examples, tutorials

# Creating New Repositories

## Self-Service Process

Team members have autonomy to create repositories following this framework. Use the decision guide and naming rules to determine your repository name.

## Before Creating a Repository

**1\.** Check if a similar repository already exists

**2\.** Determine if this should be a new repo or a branch/folder in an existing repo

**3\.** Follow the naming decision guide in this document

**4\.** Write a clear description (required)

**5\.** Add the mandatory topic tags

## When to Ask for Help

If you're unsure about naming or the decision guide doesn't clearly cover your case, reach out to Dan Blizinski (dblizinski@openwater.health) before creating the repository.

**Common situations that warrant a quick check:**

• Repository spans multiple platforms (OpenLIFU and OpenMOTION)

• Creating a new component type not listed in this guide

• Working on something that might need to be integrated with the 3D Slicer community

• Unsure if this should be public or private

# Target Organization Structure

For reference, here is the target repository structure for the OpenwaterHealth organization:

**OpenwaterHealth (~42 repos)**

**Core Platform (3):**

openwater-commons, openwater-protocol, openwater-governance

**OpenLIFU Platform (14):**

Software: openlifu-python, openlifu-firmware, openlifu-api...

Hardware: openlifu-hardware-mechanical, -electrical, -bom

Docs: openlifu-docs, openlifu-examples, openlifu-assembly-guides

**OpenMOTION Platform (14):**

\[Similar structure to OpenLIFU\]

**Shared Components (5):**

openwater-sdk, openwater-cli, openwater-phantoms...

**Docs & Community (4):**

openwater-docs, awesome-openwater, openwater-research...

**Internal (2 - private):**

openwater-ci-cd, openwater-internal-tools

———

Document maintained by Dan Blizinski | dblizinski@openwater.health

Last updated: January 2026 | This document lives in openwater-docs