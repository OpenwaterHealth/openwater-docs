# External Device Connectivity

The Open-Motion device exposes Trigger and Sync capabilities for integrating
with other instruments in your experimental setup. These can be enabled
through SDK functions.

## Sync output

When the system is powered on, the Open-Motion Console outputs a **40 Hz
square wave** on its SMA sync-output port. The square wave is triggered by the
camera capture, so you can use it to synchronize external recording devices,
event markers, or stimulation hardware to the Open-Motion frame timeline.

## Trigger input

The Console also has an SMA trigger-input port for synchronizing Open-Motion
acquisition to an external TTL signal.

!!! info "Roadmap feature"
    Syncing Open-Motion with an incoming TTL signal is an **active roadmap
    feature** and is currently being developed. The hardware port is present;
    the software/firmware support is in progress. Track development on the
    [`openmotion-console-fw`](https://github.com/OpenwaterHealth/openmotion-console-fw)
    repository.

## Connection guidelines

For both ports:

- Use 50 Ω SMA cables of appropriate length for your bench setup.
- Trigger input expects a TTL-level signal (3.3 V or 5 V tolerant — check the
  Console board specifications for exact thresholds).
- Sync output is a TTL-level signal at 40 Hz when the system is acquiring.

## Programmatic access via the SDK

Trigger and sync configuration is exposed through the
[`openmotion-sdk`](https://github.com/OpenwaterHealth/openmotion-sdk). See the
SDK documentation under `openmotion-sdk/docs/` for the function-level API.

## Use cases

Common integration patterns:

- **Stimulation studies** — drive a TMS, tACS, or sensory stimulator off the
  sync output so each stimulation event is timestamped to a known camera frame.
- **Multimodal recording** — feed the sync signal into an EEG amplifier's
  digital input or an analog DAQ to align Open-Motion data with other
  physiological streams.
- **Triggered acquisition** *(roadmap)* — start Open-Motion acquisition on
  receipt of an external event from a behavioral apparatus.
