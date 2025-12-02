# Contributing to Openwater

Thank you for your interest in contributing to Openwater! We're building open-source medical devices to democratize healthcare innovation and serve 3.5 billion underserved people globally.

## Code of Conduct

This project adheres to the [Contributor Covenant Code of Conduct](code-of-conduct.md). By participating, you are expected to uphold this code. Please report unacceptable behavior to community@openwater.health.

## How Can I Contribute?

### Reporting Bugs

Found a bug? Help us fix it!

1. **Check existing issues** to avoid duplicates
2. **Use GitHub Issues** with the "bug" label
3. **Include detailed information:**
   - Clear description of the problem
   - Steps to reproduce
   - Expected behavior vs. actual behavior
   - System information (OS, Python version, dependencies)
   - Screenshots or error messages if applicable

**Bug Report Template:**

```markdown
**Description:** Brief summary of the bug

**Steps to Reproduce:**
1. First step
2. Second step
3. ...

**Expected Behavior:** What should happen

**Actual Behavior:** What actually happens

**Environment:**
- OS: [e.g., Ubuntu 22.04]
- Python Version: [e.g., 3.10.12]
- OpenLIFU/OpenMOTION Version: [e.g., 1.2.3]
- Other relevant info

**Additional Context:** Any other relevant information
```

### Suggesting Enhancements

Have an idea for improvement?

1. **Check existing issues** and **discussions**
2. **Use GitHub Issues** with the "enhancement" label
3. **Clearly describe:**
   - The enhancement and its value
   - Use cases and examples
   - Potential implementation approach
4. **Discuss before major work** to ensure alignment

### Contributing Code

Ready to write code? Excellent! Here's the process:

#### 1. Find or Create an Issue

- Look for issues labeled `good first issue` or `help wanted`
- Comment on the issue to indicate you're working on it
- If no issue exists, create one to discuss your approach

#### 2. Fork and Clone

```bash
# Fork the repository on GitHub, then:
git clone https://github.com/YOUR-USERNAME/REPO-NAME.git
cd REPO-NAME

# Add upstream remote
git remote add upstream https://github.com/OpenwaterHealth/REPO-NAME.git
```

#### 3. Create a Feature Branch

```bash
# Update your main branch
git checkout main
git pull upstream main

# Create a feature branch
git checkout -b feature/amazing-feature
```

**Branch Naming Convention:**
- `feature/description` - New features
- `bugfix/description` - Bug fixes
- `docs/description` - Documentation updates
- `refactor/description` - Code refactoring

#### 4. Make Your Changes

**Best Practices:**

- Write clear, self-documenting code
- Follow existing code style and conventions
- Add tests for new functionality
- Update documentation as needed
- Make atomic commits with clear messages

**Commit Message Format:**

```
type(scope): Brief description (50 chars or less)

More detailed explanation if needed (wrap at 72 characters).
Explain the problem this commit solves and why you chose
this solution.

Fixes #123
```

**Types:**
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, no logic change)
- `refactor`: Code restructuring
- `test`: Adding or updating tests
- `chore`: Maintenance tasks

**Examples:**

```bash
git commit -m "feat(openlifu): Add adaptive pulse sequence generation"
git commit -m "fix(openmotion): Correct blood flow calculation for edge cases"
git commit -m "docs(tutorials): Add treatment planning walkthrough"
```

#### 5. Push and Create Pull Request

```bash
# Push to your fork
git push origin feature/amazing-feature
```

Then open a Pull Request on GitHub:

1. Go to your fork on GitHub
2. Click "New Pull Request"
3. Fill out the PR template completely
4. Link related issues
5. Request review from maintainers

**Pull Request Checklist:**

- [ ] Code follows project style guidelines
- [ ] Tests added/updated and passing
- [ ] Documentation updated
- [ ] Commit messages are clear
- [ ] CLA signed (automated on first PR)
- [ ] No merge conflicts
- [ ] PR description clearly explains changes

### Contributing Documentation

Documentation is crucial! Contributions welcome for:

- Tutorials and how-to guides
- API reference improvements
- Example code and notebooks
- Typo fixes and clarity improvements
- Translations (future)

**Documentation Structure:**

```
docs/
├── getting-started/    # Installation, quickstart
├── openlifu/          # OpenLIFU platform docs
├── openmotion/        # OpenMOTION platform docs
├── hardware/          # Hardware assembly, BOM
├── community/         # Community guidelines
├── research/          # Academic collaborations
└── resources/         # Tutorials, videos, FAQ
```

**Writing Style:**

- Use clear, simple language
- Include code examples
- Add diagrams where helpful
- Follow the [Google Developer Documentation Style Guide](https://developers.google.com/style)

### First-Time Contributors

Welcome! We're excited to have you.

**Great First Issues:**

Look for issues labeled `good first issue`:

```bash
# On GitHub, search:
label:"good first issue" is:open
```

**First Contribution Rewards:**

- Recognition in our monthly newsletter
- Contributor badge on your profile
- Possible bounty rewards ($100-$500) for significant contributions

**Need Help?**

- Join our [Discord community](https://discord.gg/openwater)
- Ask questions in GitHub Discussions
- Attend monthly community calls
- Reach out to community@openwater.health

## Development Setup

### Prerequisites

```bash
# Python 3.9 or higher
python --version

# Git
git --version

# Virtual environment (recommended)
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

### OpenLIFU Setup

```bash
# Clone repository
git clone https://github.com/OpenwaterHealth/OpenLIFU-python.git
cd OpenLIFU-python

# Install in development mode
pip install -e ".[dev]"

# Run tests
pytest

# Run linting
flake8 openlifu
black --check openlifu
mypy openlifu
```

### OpenMOTION Setup

```bash
# Clone repository
git clone https://github.com/OpenwaterHealth/OpenMOTION-platform.git
cd OpenMOTION-platform

# Install in development mode
pip install -e ".[dev]"

# Run tests
pytest

# Run linting
flake8 openmotion
black --check openmotion
```

### Documentation Setup

```bash
# Clone docs repository
git clone https://github.com/OpenwaterHealth/openwater-docs.git
cd openwater-docs

# Install MkDocs and dependencies
pip install -r requirements.txt

# Serve locally (auto-reload)
mkdocs serve

# Build for production
mkdocs build
```

## Style Guides

### Python Style

We follow [PEP 8](https://pep8.org/) with some modifications:

- **Maximum line length:** 100 characters (not 79)
- **Use type hints** for all function signatures
- **Use docstrings** for all public functions/classes
- **Format with Black:** `black openlifu/`
- **Sort imports with isort:** `isort openlifu/`

**Example:**

```python
from typing import List, Optional
import numpy as np


def calculate_acoustic_intensity(
    pressure: np.ndarray,
    frequency: float,
    distance: float,
    medium_density: float = 1000.0
) -> np.ndarray:
    """
    Calculate acoustic intensity from pressure measurements.
    
    Args:
        pressure: Array of pressure measurements in Pascals
        frequency: Ultrasound frequency in Hz
        distance: Distance from transducer in meters
        medium_density: Density of propagation medium in kg/m³
        
    Returns:
        Array of intensity values in W/m²
        
    Raises:
        ValueError: If pressure array is empty or invalid
        
    Example:
        >>> pressure = np.array([100, 200, 300])
        >>> intensity = calculate_acoustic_intensity(pressure, 500e3, 0.1)
        >>> print(intensity)
        [... array values ...]
    """
    if len(pressure) == 0:
        raise ValueError("Pressure array cannot be empty")
    
    # Calculate intensity using acoustic equation
    intensity = (pressure ** 2) / (2 * medium_density * SPEED_OF_SOUND)
    
    return intensity
```

### C/C++ Style

For firmware and hardware interface code:

- Follow [Google C++ Style Guide](https://google.github.io/styleguide/cppguide.html)
- Use meaningful variable names
- Comment complex algorithms
- Maintain consistent indentation (4 spaces)

### Git Commit Messages

**Rules:**

1. Use **present tense** ("Add feature" not "Added feature")
2. Use **imperative mood** ("Move cursor to..." not "Moves cursor to...")
3. Limit **first line to 72 characters**
4. Reference **issues and pull requests** liberally
5. Explain **what and why**, not how (code shows how)

**Good Examples:**

```
feat(openlifu): Add support for multi-element transducers

Implements handling for transducers with multiple elements, including:
- Element-specific parameter configuration
- Phased array beam steering
- Safety checks for power distribution

Closes #142
```

```
fix(openmotion): Correct blood flow velocity calculation

Previous implementation didn't account for Doppler angle correction.
Now applies proper trigonometric correction based on probe orientation.

Fixes #98
```

**Bad Examples:**

```
Fixed stuff                    # Too vague
Updated files                  # Doesn't explain what or why
feat: added new feature and fixed some bugs and updated docs  # Too long, multiple changes
```

## Testing Guidelines

### Writing Tests

All new code should include tests:

```python
# test_acoustic.py
import pytest
import numpy as np
from openlifu.acoustic import calculate_acoustic_intensity


def test_calculate_intensity_basic():
    """Test basic intensity calculation."""
    pressure = np.array([100.0, 200.0, 300.0])
    intensity = calculate_acoustic_intensity(pressure, 500e3, 0.1)
    
    assert intensity.shape == pressure.shape
    assert np.all(intensity > 0)


def test_calculate_intensity_zero_pressure():
    """Test handling of zero pressure."""
    pressure = np.zeros(10)
    intensity = calculate_acoustic_intensity(pressure, 500e3, 0.1)
    
    assert np.all(intensity == 0)


def test_calculate_intensity_invalid_input():
    """Test error handling for invalid input."""
    with pytest.raises(ValueError):
        calculate_acoustic_intensity(np.array([]), 500e3, 0.1)
```

### Running Tests

```bash
# Run all tests
pytest

# Run with coverage
pytest --cov=openlifu --cov-report=html

# Run specific test file
pytest tests/test_acoustic.py

# Run specific test function
pytest tests/test_acoustic.py::test_calculate_intensity_basic

# Run with verbose output
pytest -v
```

### Test Coverage

- Aim for **minimum 80% code coverage**
- All critical paths must be tested
- Include edge cases and error conditions

## Code Review Process

### For Contributors

After submitting a PR:

1. **Wait for automated checks** to pass (CI/CD)
2. **Address reviewer feedback** promptly
3. **Update PR** with requested changes
4. **Respond to comments** to clarify decisions

### For Reviewers

When reviewing PRs:

1. **Be constructive and respectful**
2. **Explain reasoning** behind suggestions
3. **Distinguish between:** must-fix issues vs. suggestions
4. **Acknowledge good work**
5. **Approve** when satisfied with changes

### Review Checklist

- [ ] Code follows style guidelines
- [ ] Tests are comprehensive and passing
- [ ] Documentation is updated
- [ ] No obvious security vulnerabilities
- [ ] Performance implications considered
- [ ] Breaking changes are justified and documented
- [ ] Commit history is clean

## Community

### Communication Channels

- **GitHub Issues:** Bug reports, feature requests
- **GitHub Discussions:** General questions, ideas
- **Discord:** Real-time chat, quick questions
- **Monthly Community Calls:** Demos, Q&A, networking
- **Email:** community@openwater.health

### Office Hours

Weekly developer office hours:

- **When:** Every Tuesday, 10:00 AM PST
- **Where:** Discord voice channel
- **Topics:** Technical questions, contribution guidance, pairing

### Community Calls

Monthly community calls:

- **When:** First Wednesday of each month, 2:00 PM PST
- **Where:** Zoom (link in Discord)
- **Format:**
  - Platform updates (15 min)
  - Contributor spotlights (15 min)
  - Q&A (20 min)
  - Networking (10 min)

## Recognition

We value all contributions! Contributors are recognized through:

- **CONTRIBUTORS.md** file in each repository
- **Monthly newsletter** contributor spotlights
- **Annual report** acknowledgments
- **Conference presentations** co-authorship when applicable
- **Bounty rewards** for significant contributions

### Contribution Levels

1. **Contributor:** Anyone who submits a PR (1+)
2. **Regular Contributor:** 5+ merged PRs
3. **Core Contributor:** 25+ merged PRs over 6 months
4. **Committer:** Core contributor + TSC approval (commit rights)
5. **TSC Member:** Elected by community or appointed

Each level unlocks additional privileges and recognition.

## Licensing

### Contributor License Agreement (CLA)

By contributing, you agree to our CLA:

- **First PR:** Automated CLA bot will request signature
- **Quick process:** Takes < 2 minutes via DocuSign
- **One-time:** Covers all future contributions

### Apache 2.0 License

All contributions are licensed under [Apache License 2.0](../about/licensing.md):

- **Permissive:** Commercial use allowed
- **Patent protection:** Explicit patent grant
- **Attribution:** Requires preserving copyright notices

## Getting Help

Stuck? We're here to help!

1. **Check documentation:** Often has the answer
2. **Search GitHub Issues:** Someone may have asked before
3. **Ask in Discord:** Quick questions, real-time help
4. **GitHub Discussions:** Longer-form questions
5. **Email us:** community@openwater.health

**Remember:** There are no stupid questions! Everyone was a beginner once.

## Additional Resources

- [Developer Guide](../openlifu/developer-guide/index.md)
- [API Reference](../openlifu/developer-guide/api-reference.md)
- [Architecture Overview](../openlifu/developer-guide/architecture.md)
- [Tutorials](../resources/tutorials.md)
- [FAQ](../resources/faq.md)

---

**Thank you for contributing to Openwater!** Together, we're building the future of accessible medical device innovation.

Questions? Reach out on [Discord](https://discord.gg/openwater) or email community@openwater.health

[:octicons-arrow-right-24: Back to Community](index.md)
