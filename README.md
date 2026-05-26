# The Community Resilience Guidebook

> A field manual for protecting mission-driven communities from disruption and infiltration.

[![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)](./VERSION)
[![License: CC BY-SA 4.0](https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg)](./LICENSE)
[![Open Source](https://img.shields.io/badge/open%20source-yes-brightgreen.svg)](#contributing)
[![Built with MkDocs Material](https://img.shields.io/badge/built%20with-MkDocs%20Material-blue.svg)](https://squidfunk.github.io/mkdocs-material/)

## What This Is

An open-source guidebook for anyone running a mission-driven online community: advocacy groups, civic forums, professional networks, volunteer coalitions, political organizations, or any space where people gather around shared purpose.

It exists because most communities are built by people who care about a mission, not by people trained in operational security. When disruption arrives, those communities often have no framework for what to do. The knowledge to defend a community exists, but it lives scattered across activist security zines, trust & safety industry curricula, academic research, and platform docs that newcomers don't know to look in. This guidebook puts it somewhere the next person can actually find it.

## Read It

- **Web:** [Read the guidebook online](https://jonbrouse.github.io/Community-Resilience-Guidebook/)
- **PDF:** [Download the latest PDF](https://jonbrouse.github.io/Community-Resilience-Guidebook/Community-Resilience-Guidebook.pdf)
- **Markdown source:** [`docs/index.md`](./docs/index.md)

## What's Inside

- **Part I: Foundations** — core philosophy, the one-question test, acting on behavior not intent
- **Part II: The Moderation Charter** — removal tiers, moderator rules of engagement, handling pushback
- **Part III: Technical Security Controls** — platform config, verification, behavioral monitoring
- **Part IV: Recognizing Disruption Patterns** — bad-faith tactics, movement disruption, social engineering, the four horsemen
- **Part V: Structural Defenses** — tiered trust, decision-making, founder protection, compartmentalization
- **Part VI: Quick Reference** — red flag checklist, pattern-to-response card, message templates
- **Appendices** — adapting the guidebook, prior art and further reading

## Local Preview

To preview the site locally before opening a PR:

```bash
make install   # creates .venv/ and installs dependencies
make serve     # http://localhost:8000
```

Edits to `docs/index.md` reload automatically.

The first `make install` creates a Python virtual environment in `.venv/` (gitignored) so the project's dependencies stay isolated from your system Python.

Other useful commands:

```bash
make build       # build the static site
make pdf         # build just the PDF (needs pandoc + xelatex)
make all         # build both
make clean       # remove build artifacts
make clean-all   # remove build artifacts and the venv
make reinstall   # wipe and rebuild the venv from scratch
make help        # see all available targets
```

## Contributing

We welcome improvements, corrections, new patterns, adapted templates, and field reports from communities using this guidebook.

Please read [CONTRIBUTING.md](./CONTRIBUTING.md) before opening a pull request. It covers:

- How to propose changes
- The versioning convention
- How to bump the `VERSION` file
- The review process

In short: fork, branch, edit, open a PR. All changes go through pull request review. Direct pushes to `main` are blocked.

## Versioning

This project follows a documentation-adapted [Semantic Versioning](https://semver.org/) convention:

| Change | Bump | Examples |
|---|---|---|
| **Major** (`X.0.0`) | Breaking restructure | Charter philosophy changes, sections renumbered, fundamental approach shifts |
| **Minor** (`1.X.0`) | New content | New pattern added, new appendix, new section |
| **Patch** (`1.0.X`) | Edits | Typo fixes, clarifications, link updates, rewording |

Full versioning rules live in [CONTRIBUTING.md](./CONTRIBUTING.md#versioning).

See [CHANGELOG.md](./CHANGELOG.md) for the history of changes.

## License

This guidebook is released under [Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)](./LICENSE).

You are free to:

- **Share** — copy and redistribute the material in any medium or format
- **Adapt** — remix, transform, and build upon the material for any purpose, even commercially

Under the following terms:

- **Attribution** — give appropriate credit and indicate if changes were made
- **ShareAlike** — distribute your contributions under the same license

## Acknowledgments

This guidebook stands on the shoulders of decades of work. See [Appendix B: Prior Art and Further Reading](./docs/index.md#appendix-b-prior-art-and-further-reading) in the guidebook itself for the lineage and recommended further reading.

## Contact

For substantive questions or to report issues with this guidebook, please [open an issue](../../issues). For sensitive matters, contact the maintainers directly through the methods listed in [CONTRIBUTING.md](./CONTRIBUTING.md).
