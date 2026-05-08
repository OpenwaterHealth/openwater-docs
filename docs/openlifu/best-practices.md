# Best Practices

Openwater is committed to supplying high-quality, safe, and reliable products
and services. The Quality Statement is published on the
[OpenwaterHealth GitHub organization](https://github.com/OpenwaterHealth).

Openwater recommends that all developers follow open-source standards along
with the appropriate regulatory standards for the region of development.
Contact your local authorities for a complete list of applicable rules and
regulations.

## Development lifecycle

Open-LIFU software follows a modular, iterative, and incremental development
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

- **Safety-first.** Built-in safety systems ensure operation within
  regulatory limits.
- **Open standards.** All product designs are released, enabling academic
  and commercial use with attribution.
- **Modularity.** Component-based architecture allows customization of
  individual subsystems without redesigning the entire platform.
- **Accessibility.** Designed to be manufacturable using standard fabrication
  methodologies and widely available off-the-shelf components.
- **Collaborative iteration.** A transparent, safety-prioritized feedback
  loop gathers community input and contributions through an open-source
  platform.

## Configuration and change management

- All source code and build tools are maintained in Git repositories
- Each commit is tracked, reviewed, and tagged
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

- Developed in C, using **STM32Cube HAL and CMSIS**
- **MISRA C** guidelines applied where practical to improve safety,
  portability, and static-analysis results
- Code structured for:
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
- Enable compiler warnings (`-Wall -Wextra`) and treat warnings as errors
  where feasible

## Software best-practice guidelines

### Python SDK and GUI tools

- Compliant with PEP 8 and fully type-annotated using `typing`
- Modular design with clear separation of:
    - Hardware interface / transport
    - Data processing and analysis
    - GUI and user interaction
- Tested on **Python 3.10+** on Windows 11 and Linux

Additional best practices:

- Use dataclasses or typed models for structured data
- Avoid hardware access in GUI threads; use async or worker threads
- Validate all external inputs and device responses
- Centralize error handling and logging
- Write unit tests for protocol parsing and data processing
- Keep hardware interfaces mockable for offline testing
- Document public APIs and SDK usage with docstrings

## License

All Open-LIFU source code is released under the
[GNU Affero General Public License v3.0](https://www.gnu.org/licenses/agpl-3.0.html)
(AGPLv3). Developers working with or building on Open-LIFU should understand
the key obligations this license imposes.

!!! warning "AGPLv3 obligations"
    **Copyleft applies to network use.** Unlike the standard GPL, AGPLv3
    extends the copyleft requirement to software used over a network. If
    you modify Open-LIFU and provide access to it as a service (for example,
    via an API or web interface), you must also make your modified source
    code publicly available.

    **Derivative works must remain AGPLv3.** Any modifications, extensions,
    or software that links against Open-LIFU code and is distributed or
    deployed must itself be released under AGPLv3. You cannot relicense the
    code or incorporate it into a proprietary product.

    **Source code must be made available.** When distributing AGPLv3-licensed
    software (in binary or source form), you must include or offer access to
    the complete corresponding source code, including any modifications you
    have made.

    **License and copyright notices must be preserved.** All copies of the
    software must retain the original copyright notices, license text, and
    any notices that refer to the absence of warranty.

The full license text is available in the `LICENSE` file in each repository
and at [https://www.gnu.org/licenses/agpl-3.0.html](https://www.gnu.org/licenses/agpl-3.0.html).
Developers with questions about compliance or licensing exceptions should
contact Openwater before integrating Open-LIFU into their own systems.

All Open-LIFU **hardware designs** are released under the
[Creative Commons Attribution-ShareAlike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
(CC BY-SA 4.0) license. This allows anyone to share and adapt the designs for
any purpose, including commercially, as long as appropriate credit is given
and any derivative works are distributed under the same license.
