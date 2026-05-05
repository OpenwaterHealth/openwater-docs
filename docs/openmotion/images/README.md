# Open-MOTION figures

Extracted from `ER-00014 Rev A — Open-Motion Documentation for Developers`.
Released under CC BY-SA 4.0, matching the Open-Motion hardware license.

## File map

| File | Source | Description |
|---|---|---|
| `figure-1-console-parts.png` | PDF p. 8 | Console rear panel and Sensor Module side panels with port labels (A–G) |
| `figure-2-camera-ordering.png` | PDF p. 9 | Sensor Module connector close-up showing camera ordering (0–7) |
| `figure-3-system-architecture.png` | PDF p. 10 | System architecture: Host PC, Console, Sensor Modules |
| `figure-4-console-signal-pathways.png` | PDF p. 11 | Console internal signal pathways (power, USB, laser, safety) |
| `figure-5-sensor-module-signal-pathways.png` | PDF p. 12 | Sensor Module signal pathways: aggregator + 8-camera array |
| `figure-6-software-architecture.png` | PDF p. 14 | Software stack: Application, SDK, Firmware, Camera layers |
| `figure-7-sensor-module-diagram.png` | PDF p. 15 | Sensor Module schematic: camera sensor + Lattice FPGA + transceiver |

To regenerate after a PDF revision, re-run extraction with `pdfimages` and
`pdftocairo` against the latest `ER-00014-RevA-OpenMotion-Developer-Docs.pdf`.
