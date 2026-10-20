# Open-Motion Quick Start Guide

Optical blood-flow monitoring for human and animal research. Go from driver
install to first scan in about ten minutes.

!!! danger "Investigational device — research use only"
    The Open-Motion platform is **not yet cleared by the FDA** and is intended
    for research purposes only. It is not for use in diagnostic procedures.
    Read the full [safety and handling warnings](index.md#investigational-device-research-use-only),
    including the Class 3 laser hazard, before you build or operate any
    hardware.

## Welcome to Open-Motion

Open-Motion is Openwater's optical monitoring system: a console, sensor
modules, and software that measure relative changes in blood flow and blood
volume for research. This page is the single place to start. READMEs and the
device user manual link here.

| | |
|---|---|
| **~10 min** | Driver to first scan |
| **2 paths** | App or firmware |
| **BFI + BVI** | Two indices, scaled 0–10 |

## Choose your path

<div class="grid cards" markdown>

-   :material-monitor:{ .lg .middle } __Path A · Run the App__

    ---

    Install the USB driver and BloodFlow app on Windows 11. Best for
    researchers running scans, or Python contributors using `OpenMOTION-Pylib`.

    [:octicons-arrow-right-24: Start with the App](#path-a-run-the-bloodflow-app)

-   :material-chip:{ .lg .middle } __Path B · Build the firmware__

    ---

    Compile and flash the console firmware. Best for embedded contributors; no
    hardware is required to build.

    [:octicons-arrow-right-24: Start with the firmware](#path-b-build-the-console-firmware)

</div>

## Path A · Run the BloodFlow App

Driver, app, first scan, visualize.

### 1. Download the software

!!! info "Platform update (October 2026)"
    Windows 11 is now the only supported Windows version for Open-Motion and
    Open-LIFU. Windows 10 lost Microsoft support in October 2025, so if your lab
    PC still runs it, plan an upgrade to Windows 11.
    [Read the announcement](https://github.com/orgs/OpenwaterHealth/discussions/331).

There are two pieces: the **USB driver** and the **BloodFlow application**. Both
ship on your flash drive, or you can get them from GitHub:

[:octicons-arrow-right-24: openmotion-bloodflow-app releases](https://github.com/OpenwaterHealth/openmotion-bloodflow-app/releases/latest){ .md-button }

!!! warning "Don't run from the flash drive"
    Copy both zips to your local computer first, then unzip.

### 2. Install the USB driver

1. Open `OpenMotionDriver-x64`.
2. If Windows Defender SmartScreen warns you, click **More Info**, then
   **Run Anyway**.
3. Follow the on-screen installer.

### 3. Launch the application

1. Unzip the application package.
2. Double-click `OpenWaterApp.exe`.
3. If the device does not connect, restart the computer and try again.

!!! success "Healthy state"
    Two green Sensor Module indicators and one green Console light.

### 4. Run your first scan

1. Enter the **Subject ID** and notes, and pick a default data directory.
2. Pick the **Left** and **Right** sensor module configurations.
3. Confirm the Console status shows **5× green**.
4. Set the scan duration and click **Start Scan**.

### 5. Visualize

1. Open the Data Analysis view and select the correct Data Directory.
2. Pick the scan from the dropdown.
3. Click **Visualize BFI/BVI** or **Visualize Contrast/Mean**.

### 6. (Optional) Python: OpenMOTION-Pylib

Prefer scripting? Use the Python library directly.

```bash
git clone https://github.com/OpenwaterHealth/OpenMOTION-Pylib.git
cd OpenMOTION-Pylib
python -m venv .venv
# macOS/Linux: source .venv/bin/activate
# Windows:     .venv\Scripts\activate
pip install -e .
python -c "import openmotion; print(openmotion.__version__)"
```

Then run on a sample speckle capture (Git LFS):

```bash
git lfs install
git clone https://github.com/OpenwaterHealth/openmotion-sample-capture
# load a frame, plot, and browse examples/
```

For the host SDK and software architecture, see
[Software Development](software.md).

## Path B · Build the console firmware

Toolchain, build, flash, smoke test. No hardware is needed to build.

### 1. Install the ARM GCC toolchain and a flasher

1. Install [ARM GCC](https://developer.arm.com/Tools%20and%20Software/GNU%20Toolchain)
   for your OS.
2. Install the flashing utility recommended in the repository README
   (typically STM32CubeProgrammer or OpenOCD).

### 2. Clone the firmware repository

```bash
git clone https://github.com/OpenwaterHealth/openmotion-console-v2.git
cd openmotion-console-v2
```

[:octicons-arrow-right-24: openmotion-console-v2 repository](https://github.com/OpenwaterHealth/openmotion-console-v2){ .md-button }

### 3. Build the firmware

Follow the build steps in the repository README. The artifact is the console
firmware binary. No hardware is needed for this step.

### 4. Flash and run a serial smoke test

1. Flash the Console board with your binary.
2. Open a USB serial console (115200 baud unless the README says otherwise).
3. Send `version` and confirm the firmware responds.

!!! success
    If the board replies with a version string, you are ready to start tweaking
    firmware.

## Interpreting BFI and BVI

Two indices, both scaled 0–10, derived from speckle contrast and intensity.

- **BFI (Blood Flow Index)** is derived from speckle contrast `C(t)`. Lower
  contrast means more motion, which means a higher BFI.
- **BVI (Blood Volume Index)** is derived from detected intensity `I(t)`. It
  tracks volume changes over time.

```text
BFI = 10 × (1 − (C(t) − C_min) / (C_max − C_min))
BVI = 10 × (1 − (I(t) − I_min) / (I_max − I_min))
```

!!! warning "Sanity check"
    If BVI is greater than 0.9, suspect poor sensor contact before you
    interpret the trace.

## Make your first contribution

Fork, branch, commit, PR, CLA, merge. Reviews happen within 48 hours. See
[How to Contribute](contributing.md) and [Best Practices](best-practices.md)
for the full process.

Pick a small, shippable change:

- **Docs fix:** a typo, broken link, or unclear README step.
- **Unit test:** add a missing test case for an existing function.
- **Firmware tweak:** a small improvement to the console firmware.

```bash
git checkout -b fix/short-description
# make changes
git add .
git commit -m "Docs: clarify driver install warning"
git push origin fix/short-description
# then open a PR on GitHub
```

!!! note "CLA"
    Your first PR triggers an automated CLA signature. It takes under two
    minutes.

[:octicons-arrow-right-24: Browse Good First Issues](https://github.com/OpenwaterHealth/openmotion-bloodflow-app/issues?q=is%3Aissue+is%3Aopen+label%3A%22good+first+issue%22){ .md-button }

## Where to ask questions

- **Discord** — fastest response: [discord.gg/fS7vfAX4fA](https://discord.gg/fS7vfAX4fA)
- **GitHub Issues** in the relevant repository
- **Email** — [support@openwater.cc](mailto:support@openwater.cc)

Ready to ship your first PR? Browse open issues, pick one, and we will review
within 48 hours. Using Open-LIFU instead? See the
[Open-LIFU Quick Start Guide](../openlifu/developer-quickstart.md).

---

!!! warning ""
    **CAUTION** - The system described here has not been evaluated by the FDA and is not designed for the treatment or diagnosis of any disease. It is provided AS-IS, with no warranties. User assumes all liability and responsibility for identifying and mitigating risks associated with using this software.
