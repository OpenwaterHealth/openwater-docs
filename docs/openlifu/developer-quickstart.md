# Open-LIFU Quick Start Guide

Install the Desktop Application, or run from source at whichever layer of the
software stack you need.

!!! danger "Research use only"
    The Open-LIFU platform is **not yet cleared by the FDA** and is intended for
    research purposes only. Not for commercial sale. Read the full
    [safety and handling warnings](index.md#research-use-only) before you build
    or operate any hardware.

## Welcome to Open-LIFU

Open-LIFU is Openwater's programmable low-intensity focused ultrasound platform:
a console, a transducer, and a software stack that runs from a one-click
Desktop Application down to a Python SDK that talks directly to the hardware.
This page is the single place to start. Repositories, READMEs, and the device
user manual all link here.

| | |
|---|---|
| **2 paths** | Desktop Application, or run from source |
| **3 source layers** | Slicer extension · Python library · hardware SDK |
| **~15 min** | Clone to first pull request |

### The stack at a glance

```text
┌──────────────────────────────────────────────────────────────────┐
│ Desktop Application  ◄── standalone installer (bundles Slicer)   │
├──────────────────────────────────────────────────────────────────┤
│ SlicerOpenLIFU       ◄── 3D Slicer extension (10 modules)        │
├──────────────────────────────────────────────────────────────────┤
│ openlifu             ◄── Python library: algorithms, planning    │
├──────────────────────────────────────────────────────────────────┤
│ openlifu-sdk         ◄── low-level hardware I/O                  │
│ openlifu-test-app    ◄── QML engineering UI (binary + source)    │
└──────────────────────────────────────────────────────────────────┘
```

Install the top of the stack (the Desktop Application) **or** run from source
at the layer that matches what you are doing. You do not need to install
multiple layers: pick one entry point. The full architecture is described in
[Software Development](software.md).

## Choose your path

<div class="grid cards" markdown>

-   :material-package-variant-closed:{ .lg .middle } __Path A · Desktop Application__

    ---

    Download the installer and run it. It bundles its own Slicer and all
    OpenLIFU modules. No framework setup and no Python.

    - Best for research and study teams
    - Guided research workflows
    - No separate 3D Slicer install
    - No Python environment

    [:octicons-arrow-right-24: Start with the Desktop Application](#path-a-desktop-application)

-   :material-wrench:{ .lg .middle } __Path B · Run from source__

    ---

    Build and run from any layer of the stack. Three sub-paths, depending on
    whether you want a UI, a library, or raw hardware I/O.

    - B1 · Slicer + extension: power-user GUI
    - B2 · `openlifu`: scripting and pipelines
    - B3 · `openlifu-sdk`: firmware and hardware comms
    - Best for contributors and researchers

    [:octicons-arrow-right-24: Start from source](#path-b-run-from-source)

</div>

## Path A · Desktop Application

Three steps. The Desktop Application bundles its own Slicer, so **do not**
install 3D Slicer separately for this path.

### 1. Download the latest installer

Grab the system-specific installer (`.exe` on Windows, `.tar.gz` on Linux) from
the [latest release](https://github.com/OpenwaterHealth/openlifu-desktop-application/releases/latest).
Approve the security warning if prompted.

!!! warning "NVIDIA GPU required"
    A number of features need an NVIDIA GPU. Make sure your system has one
    before you start.

### 2. Run the installer

Start the installer and follow the prompts.

!!! warning "Windows path gotcha"
    The install path **cannot contain spaces**. The default folder includes a
    space after "OpenLIFU": remove it. Also make sure your Windows username has
    no spaces (install to a different location if it does).

### 3. First launch

Launch the application. The first run finishes installing dependencies before
it opens to the home page. You are then in the guided research workflow: use
**PrePlanning** to pick a target, then **SonicationPlanner** to simulate.

!!! success
    The Desktop Application handles everything. You do not need Slicer, Python,
    or anything else for this path.

For the complete operating procedure, see the [User Manual](user-manual.md).

## Path B · Run from source

Pick the layer that matches what you are building. Each sub-path is
independent: you do not stack them.

### B1 · 3D Slicer + SlicerOpenLIFU extension

*Best for power-user researchers working in Slicer.*

Use your own 3D Slicer install. SlicerOpenLIFU exposes all ten OpenLIFU modules
(Home, Database, Login, Data, PrePlanning, TransducerLocalization,
SonicationPlanner, SonicationControl, ProtocolConfig, Lib). Every parameter is
reachable; there is no curated wrapper. See [Slicer Open-LIFU](slicer.md) for
the module reference.

**Install**

1. Install [3D Slicer](https://download.slicer.org/) (the version is listed in
   the SlicerOpenLIFU release notes).
2. Open Slicer, go to **Extensions Manager**, search for **OpenLIFU**, and
   install it.
3. Restart Slicer.

**Or build from source**

Follow the
[standard Slicer extension build process](https://slicer.readthedocs.io/en/latest/developer_guide/extensions.html#build-an-extension)
for the [`SlicerOpenLIFU` repository](https://github.com/OpenwaterHealth/SlicerOpenLIFU).

**First workflow**

1. Open **OpenLIFUHome**.
2. In **OpenLIFUDatabase**, point at a local clone of
   [`openlifu-sample-database`](https://github.com/OpenwaterHealth/openlifu-sample-database).
3. Sign in as `example_admin`.
4. Open **PrePlanning**, pick a target, then open **SonicationPlanner** and
   simulate.

[:octicons-arrow-right-24: SlicerOpenLIFU repository](https://github.com/OpenwaterHealth/SlicerOpenLIFU){ .md-button }

### B2 · openlifu-python (the `openlifu` library)

*Best for scripting, pipelines, ML, and simulation.*

The core Python library: algorithms, planning, simulation, protocols, and
database structures. It has no GUI. Use it as a standalone library or as the
engine that drives SlicerOpenLIFU.

Install the published package from PyPI:

```bash
pip install openlifu
```

Or set up for development (Python 3.10–3.12 on Windows or Linux):

```bash
git clone https://github.com/<your-username>/openlifu-python.git
cd openlifu-python
git remote add upstream https://github.com/OpenwaterHealth/openlifu-python.git

python -m venv env
# Linux:
source env/bin/activate
# Windows:
.\env\Scripts\activate

pip install -e .          # basic
# or: pip install -e '.[dev]'  # with dev tools

# Smoke test
python -c "import openlifu; print(openlifu.__version__)"
```

Then pull the sample database via Git LFS and browse `examples/`:

```bash
git lfs install
git clone https://github.com/OpenwaterHealth/openlifu-sample-database
```

[:octicons-arrow-right-24: openlifu-python repository](https://github.com/OpenwaterHealth/openlifu-python){ .md-button }

### B3 · openlifu-sdk + Test App

*Best for firmware, hardware communication, and embedded work.*

The lowest layer: direct communication with the TX module and HV controller.
Use it if you are working on firmware, debugging hardware, or building tooling
that needs raw device I/O without the planning layer on top.

**The Python SDK**

Published to PyPI:

```bash
pip install openlifu-sdk
```

Or for development:

```bash
git clone https://github.com/OpenwaterHealth/openlifu-sdk.git
cd openlifu-sdk
pip install -e ".[dev]"
```

Sanity-check the hardware connection:

```python
from openlifu_sdk import LIFUInterface

interface = LIFUInterface()
tx_connected, hv_connected = interface.is_device_connected()
print("TX:", tx_connected, " HV:", hv_connected)
```

**The Test App (engineering UI)**

For end-to-end hardware bring-up, verification, and diagnostics, use the
**OpenLIFU Test App**: a QML-based engineering UI with dedicated pages for
console and transmitter bring-up, sonication, automated verification scripts,
firmware updates, and PDF reporting.

*Easiest:* grab the prebuilt Windows binary from the
[openlifu-test-app releases page](https://github.com/OpenwaterHealth/openlifu-test-app/releases)
and run `TestApp.exe` (or `TestApp_console.exe` to see console output).

*From source* (Python 3.10+; requires both `openlifu-sdk` and `openlifu`
installed):

```bash
git clone https://github.com/OpenwaterHealth/openlifu-test-app.git
cd openlifu-test-app

python -m venv .venv
# Windows: .venv\Scripts\activate
# macOS/Linux: source .venv/bin/activate

pip install -e .          # or .[dev], .[test], .[dev,test]
```

[:octicons-arrow-right-24: openlifu-sdk repository](https://github.com/OpenwaterHealth/openlifu-sdk){ .md-button }
[:octicons-arrow-right-24: openlifu-test-app repository](https://github.com/OpenwaterHealth/openlifu-test-app){ .md-button }

!!! tip "Advanced: developing across layers at once"
    SlicerOpenLIFU and `openlifu` can be developed together. In Slicer's Python
    console, use `slicer.util.pip_install` and `slicer.util.pip_uninstall` to
    side-load your local `openlifu` build, and add your local SlicerOpenLIFU
    clone to Slicer's **Application Settings → Modules** so it loads from your
    working tree. This is the recommended workflow for active extension
    development: you run customized versions of both the UI and the engine at
    the same time. You own compatibility when you do this; SlicerOpenLIFU
    normally pins a tested `openlifu` version on purpose.

## Make your first contribution

The fork, branch, commit, PR, CLA, merge loop is the same regardless of which
layer you started at. See [How to Contribute](contributing.md) and
[Best Practices](best-practices.md) for the full process.

Pick one of these and ship it:

- **Docs fix:** a typo, broken link, or unclear sentence in a README.
- **Unit test:** add a missing test case for an existing function.
- **Sandbox experiment:** a new example notebook in `examples/`.

```bash
git checkout -b fix/short-description
# make changes
git add .
git commit -m "Docs: fix typo in transducer README"
git push origin fix/short-description
# then open a PR on GitHub
```

!!! note "CLA"
    Your first PR triggers an automated CLA signature. It takes under two
    minutes.

**Where to land the PR**

- UI or workflow bug: [`SlicerOpenLIFU`](https://github.com/OpenwaterHealth/SlicerOpenLIFU)
  or [`openlifu-desktop-application`](https://github.com/OpenwaterHealth/openlifu-desktop-application)
- Algorithm, planning, or simulation: [`openlifu-python`](https://github.com/OpenwaterHealth/openlifu-python)
- Hardware comms or firmware support: [`openlifu-sdk`](https://github.com/OpenwaterHealth/openlifu-sdk)

The full repository list is in the [repository map](software.md#repository-map).

[:octicons-arrow-right-24: Browse Good First Issues](https://github.com/OpenwaterHealth/openlifu-python/issues?q=is%3Aissue+is%3Aopen+label%3A%22good+first+issue%22){ .md-button }

## Optional: photogrammetry add-ons

Only needed if you are running transducer-tracking workflows with the Android
scanner. These apply to all paths above.

### Install Meshroom 2025.1.0

Required if you use `openlifu.nav.photoscan` (Python) or run transducer
tracking through the Desktop Application.

1. Download Meshroom **2025.1.0** for your OS from the
   [official release](https://github.com/alicevision/Meshroom/releases/tag/v2025.1.0).
2. Extract the archive to a directory of your choice.
3. **Windows:** add the folder containing `Meshroom.exe` to your user PATH
   (Start menu → "Edit environment variables for your account" → User
   variables → Path → Edit → New).
4. **Linux:** add the extracted folder to your PATH
   (`export PATH="<path-to-meshroom>/Meshroom-2025.1.0-Linux:$PATH"`, or
   persist it by appending that line to `~/.bashrc`).
5. **Optional GPU (Windows):** NVIDIA Control Panel → 3D Settings → Manage 3D
   settings → Program Settings → add `Meshroom.exe` → set "High-performance
   NVIDIA processor".

!!! note "Desktop Application users"
    Launch the application from an environment that has Meshroom on its PATH.

### Install Android Platform Tools (ADB)

**Option 1:** download Google's
[platform-tools](https://developer.android.com/tools/releases/platform-tools),
extract it, and add the folder containing `adb.exe` to your PATH. Verify with
`adb --version`.

**Option 2 (PowerShell):**

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex
scoop install android-platform-tools
```

### Install the Android photogrammetry app

1. On your Android phone, open
   [OpenLIFU-3DScanner](https://github.com/OpenwaterHealth/OpenLIFU-3DScanner/)
   or install it from
   [Google Play](https://play.google.com/store/apps/details?id=health.openwater.openlifu3dscanner).
2. For the GitHub route, open **Releases**, pick the latest version, and tap the
   `.apk`.
3. Approve the install. Open the app and allow camera and storage permissions.

For the full capture and reconstruction workflow, see the
[Photogrammetry App User Manual (LBL-00017)](photogrammetry-app.md).

### Enable Developer Mode and USB debugging

1. Settings → About Phone → tap **Build number** 7 times.
2. Settings → System → Developer options → enable **USB debugging**.
3. Plug the phone into your PC and check "Always allow" when prompted.

## Where to ask questions

- **Discord** — fastest response: [discord.gg/fS7vfAX4fA](https://discord.gg/fS7vfAX4fA)
- **GitHub Issues** in the relevant repo (see the [repository map](software.md#repository-map))
- **Email** — [support@openwater.cc](mailto:support@openwater.cc)

Ready to ship your first PR? Browse open issues, pick one, and we will review
within 48 hours. Using Open-Motion instead? See the
[Open-Motion Quick Start Guide](../openmotion/developer-quickstart.md).

---

*Open-LIFU is a research-use-only platform, not yet cleared by the FDA and not
for commercial sale. See the [Overview](index.md#research-use-only) for the full
statement.*
