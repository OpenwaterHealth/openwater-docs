# Openwater Documentation

[![Deploy Documentation](https://github.com/OpenwaterHealth/openwater-docs/actions/workflows/deploy.yml/badge.svg)](https://github.com/OpenwaterHealth/openwater-docs/actions/workflows/deploy.yml)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)

Comprehensive documentation for Openwater's open-source medical device platforms.

**Live Site:** https://docs.openwater.health

## About Openwater

Openwater is democratizing medical device innovation through open-source hardware and software platforms:

- **OpenLIFU:** Low Intensity Focused Ultrasound for non-invasive neuromodulation
- **OpenMOTION:** Near-infrared optical imaging for blood flow and oxygenation monitoring

**Mission:** Reduce medical device development costs from $119M to $15M through open-source collaboration, serving 3.5 billion underserved people globally.

## Documentation Structure

```
docs/
├── getting-started/    # Installation and quickstart guides
├── openlifu/          # OpenLIFU platform documentation
├── openmotion/        # OpenMOTION platform documentation
├── hardware/          # Hardware assembly and BOM
├── community/         # Community guidelines and governance
├── research/          # Academic collaborations and publications
├── resources/         # Tutorials, videos, and FAQ
└── about/             # Mission, team, licensing
```

## Local Development

### Prerequisites

- Python 3.9 or higher
- pip package manager
- Git

### Setup

```bash
# Clone repository
git clone https://github.com/OpenwaterHealth/openwater-docs.git
cd openwater-docs

# Create virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt
```

### Running Locally

```bash
# Serve with hot-reload at localhost:8000
mkdocs serve

# Build static site
mkdocs build

# Deploy to GitHub Pages (maintainers only)
mkdocs gh-deploy
```

### Preview Your Changes

1. Run `mkdocs serve`
2. Open http://localhost:8000 in your browser
3. Edit markdown files - changes appear instantly

## Contributing

We welcome documentation contributions! See our [Contributing Guide](docs/community/contributing.md).

### Quick Contribution Workflow

1. Fork this repository
2. Create a feature branch (`git checkout -b docs/my-improvement`)
3. Make your changes
4. Test locally with `mkdocs serve`
5. Commit with clear message (`git commit -m "docs: Add installation troubleshooting"`)
6. Push to your fork (`git push origin docs/my-improvement`)
7. Open a Pull Request

### Documentation Guidelines

- Use clear, simple language
- Include code examples
- Add diagrams where helpful
- Follow the [Google Developer Documentation Style Guide](https://developers.google.com/style)
- Test all code examples
- Keep line length to 100 characters for readability

## Technology Stack

- **[MkDocs](https://www.mkdocs.org/):** Static site generator
- **[Material for MkDocs](https://squidfunk.github.io/mkdocs-material/):** Beautiful, responsive theme
- **[GitHub Pages](https://pages.github.com/):** Free hosting
- **[GitHub Actions](https://github.com/features/actions):** Automated deployment

## Repository Structure

```
openwater-docs/
├── .github/
│   └── workflows/
│       └── deploy.yml          # CI/CD for automated deployment
├── docs/                       # Documentation source files
│   ├── assets/                 # Images, logos, icons
│   ├── stylesheets/            # Custom CSS
│   ├── javascripts/            # Custom JavaScript
│   └── [content folders]/      # Documentation organized by topic
├── overrides/                  # Theme customization
├── mkdocs.yml                  # MkDocs configuration
├── requirements.txt            # Python dependencies
└── README.md                   # This file
```

## Deployment

Documentation is automatically deployed to https://docs.openwater.health when changes are pushed to the `main` branch.

### Deployment Workflow

1. Push to `main` branch or merge PR
2. GitHub Actions runs `mkdocs build`
3. Site is deployed to GitHub Pages
4. Changes are live in 1-2 minutes

### Manual Deployment (Maintainers)

```bash
# Build and deploy in one command
mkdocs gh-deploy

# Or build first, then deploy
mkdocs build
mkdocs gh-deploy --force
```

## Getting Help

- **Discord:** [Join our community](https://discord.gg/openwater)
- **GitHub Issues:** [Report bugs or request features](https://github.com/OpenwaterHealth/openwater-docs/issues)
- **Email:** community@openwater.health

## License

Documentation is licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).

Code examples in documentation are licensed under [Apache License 2.0](LICENSE).

## Links

- **Main Website:** [openwater.health](https://openwater.health)
- **Documentation:** [docs.openwater.health](https://docs.openwater.health)
- **GitHub Organization:** [OpenwaterHealth](https://github.com/OpenwaterHealth)
- **Discord Community:** [discord.gg/openwater](https://discord.gg/openwater)

---

**Openwater** | Open Source, Always | Building the Linux of Medical Devices
