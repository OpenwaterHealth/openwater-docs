# Open-LIFU figures

Extracted from `ER-00015 Rev A — Open-LIFU Documentation for Developers`
(software v1.19.0, released 2026-05-07).
Released under CC BY-SA 4.0, matching the Open-LIFU hardware license.

## File map

| File | PDF figure | Description |
|---|---|---|
| `figure-1-system-architecture.png` | Fig. 1 | System architecture: PC, Console, Transducer, mobile device |
| `figure-2-console-and-transducer.png` | Fig. 2 | Open-LIFU 1x and 2x configuration overview |
| `figure-3-console-parts.png` | Fig. 3 | Console parts with labels (A) Status LED, (B) Power, (C) USB, (D) Transducer port |
| `figure-4-transducer.png` | Fig. 4 | Transducer 1x configuration close-up |
| `figure-5-coupling-pad.png` | Fig. 5 | Hydrogel coupling pad |
| `figure-6-software-architecture.png` | Fig. 6 | Five-layer software architecture (Desktop, Slicer, Python, SDK, Firmware) |
| `figure-7-application-architecture.png` | Fig. 7 | Application/SDK layer detail with companion app and cloud reconstruction |
| `figure-8-database-layers.png` | Fig. 8 | Layered access model (GUI / Database Class / Python Methods / JSON, Binary) |
| `figure-9-transmit-module-connections.png` | Fig. 9 | Transmit module connection points (input from console, input/output to chained modules) |
| `figure-10-transducer-signal-diagram.png` | Fig. 10 | Transducer logical architecture / signal flow |
| `figure-11-first-module-wiring.png` | Fig. 11 | Transmit module wiring — first in chain (active lines magenta) |
| `figure-12-middle-module-wiring.png` | Fig. 12 | Transmit module wiring — middle of chain (active lines blue) |
| `figure-13-last-module-wiring.png` | Fig. 13 | Transmit module wiring — last in chain (active lines green) |
| `figure-15-slicer-extension-manager.png` | Fig. 15 | Slicer Extensions Manager showing the OpenLIFU extension |
| `figure-16-data-management.png` | Fig. 16 | Data Management module — load Protocol, Transducer, Volume, Fiducial, Photoscan |
| `figure-17-sonication-protocol.png` | Fig. 17 | Sonication Protocol module — pulse and sequence parameters |
| `figure-18-pre-planning.png` | Fig. 18 | Pre-planning module — target placement and virtual fitting |
| `figure-19-transducer-localization-session.png` | Fig. 19 | Transducer Localization with a session — QR code workflow |
| `figure-20-transducer-localization-no-session.png` | Fig. 20 | Transducer Localization without a session — manual photoscan upload |
| `figure-21-sonication-planning.png` | Fig. 21 | Sonication Planning — solution analysis with safety checks |
| `figure-22-sonication-running.png` | Fig. 22 | Sonication module — connection status, run controls, progress |

Figure 14 (Slicer install-path warning) is omitted — fully covered in prose
on the Slicer install page. Figure 7 in this folder corresponds to a
detailed application/SDK architecture diagram from the PDF; the PDF's own
Figure 7 (a screenshot of the Desktop application) was not cleanly
extractable as an embedded raster.

To regenerate after a PDF revision, re-run `pdfimages` against the latest
`ER-00015-RevA-OpenLIFU-Developer-Docs.pdf`.
