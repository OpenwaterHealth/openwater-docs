# Best Practices

Openwater is committed to supplying high-quality, safe, and reliable products
and services. The Quality Statement is published on the
[OpenwaterHealth GitHub organization](https://github.com/OpenwaterHealth).

Openwater recommends that all developers follow open-source standards along
with the appropriate regulatory standards for the region in which they develop.
Contact your local authorities for a complete list of applicable rules and
regulations.

## Development lifecycle

Open-Motion software follows a modular, iterative, and incremental development
lifecycle aligned with the principles of **IEC 62304**. Development is managed
through:

- Version-controlled repositories (Git + GitHub)
- Feature-driven development with issue tracking and pull requests
- Milestone-based delivery and release tagging

Each major software component — firmware, FPGA logic, Python SDK, test tools —
is maintained in its own repository.

## Design philosophy

Openwater designs and processes are governed by our Quality Management System
and abide by these core principles:

- **Safety-first.** Built-in safety systems ensure operation within regulatory
  limits.
- **Open standards.** All product designs are released under Creative Commons
  ShareAlike 4.0, enabling academic and commercial use with attribution.
- **Modularity.** Component-based architecture allows customization of
  individual subsystems without redesigning the entire platform.
- **Accessibility.** Designed to be manufacturable using standard fabrication
  methodologies and widely available off-the-shelf components.
- **Collaborative iteration.** A transparent, safety-prioritized feedback loop
  gathers community input and contributions through an open-source platform.

## Configuration and change management

- All source code and build tools are maintained in Git repositories
- Code review is required to merge pull requests
- Releases on `main` are tagged with version numbers
- Issues and bugs are logged in GitHub Issues with associated milestones
- Change logs are maintained per release
- Critical changes are subject to peer code review

## Versioning

Versioning follows **Semantic Versioning** (SemVer):

```
MAJOR.MINOR.PATCH        e.g., v1.2.3
```

| Increment | Meaning |
|---|---|
| **MAJOR** | Breaking architectural or API changes |
| **MINOR** | New backward-compatible features |
| **PATCH** | Bug fixes or performance improvements |

## Verification & validation

- Unit tests implemented for embedded firmware and Python code
- Manual and automated test procedures executed on every release:
    - USB streaming verification
    - Histogram decoding accuracy
    - Frame sync and laser timing tests
    - Full-system functional regression tests
- Test logs, waveform captures, and timing measurements are archived for
  traceability

## Documentation

Software is documented using:

- In-code documentation (docstrings, comments)
- GitHub README files
- Architecture and design documentation in Word and Markdown

User documentation is provided for:

- SDK usage
- CLI tools and GUI
- Developer onboarding

## Maintenance strategy

- Bug reports and feature requests are triaged on GitHub
- Routine releases are issued quarterly or as needed
- Backward compatibility is maintained within major versions
- Deprecated features are clearly marked and scheduled for removal in future
  releases

## Firmware best-practice guidelines

### Embedded firmware (STM32)

- Developed in C, using STM32Cube HAL
- Code is structured for:
    - **Readability** — clear naming, small functions, single responsibility
    - **Safety** — defensive programming, bounds checking, explicit
      initialization
    - **Testability** — hardware abstraction, minimal global state

Additional best practices:

- Use explicit-width types (`uint32_t`, `int16_t`) for all interfaces and
  registers
- Avoid hidden side effects in macros; prefer `static inline` functions
- Initialize all peripherals and state explicitly; do not rely on reset
  defaults
- Separate driver, middleware, and application logic
- Use assertions and error return codes for fault detection
- Guard ISR code for minimal execution time and deterministic behavior
- Enable compiler warnings (`-Wall -Wextra`) and treat warnings as errors where
  feasible

### FPGA logic

- Written in Verilog
- Uses consistent and documented:
    - Module interfaces
    - Clock and reset conventions
    - Internal signal naming

Additional best practices:

- Use synchronous design practices; avoid gated clocks
- Clearly define clock domains and crossing mechanisms (FIFOs, synchronizers)
- Prefer non-blocking assignments in sequential logic
- Parameterize widths, depths, and timing values
- Include reset behavior for all stateful elements
- Separate control logic, datapath, and interfaces
- Include assertions or simulation checks for protocol correctness
- Maintain synthesizable-only code in RTL (no simulation-only constructs)

## Software best-practice guidelines

### Python SDK and GUI tools

- Compliant with PEP 8 and fully type-annotated using `typing`
- Modular design with clear separation of:
    - Hardware interface / transport
    - Data processing and analysis
    - GUI and user interaction
- Tested on Python 3.12

Additional best practices:

- Use dataclasses or typed models for structured data
- Avoid hardware access in GUI threads; use async or worker threads
- Validate all external inputs and device responses
- Centralize error handling and logging
- Write unit tests for protocol parsing and data processing
- Keep hardware interfaces mockable for offline testing
- Document public APIs and SDK usage with docstrings
