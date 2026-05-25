# Contributing to the Community Resilience Guidebook

Thank you for considering a contribution. This guidebook exists because community defenders share what they learn, and your improvements make it more useful for the next person who needs it.

## Ways to Contribute

- **Fix errors** — typos, broken links, factual corrections
- **Clarify content** — if something reads as confusing, propose a rewrite
- **Add patterns** — if you've encountered a disruption pattern not covered here, document it
- **Adapt templates** — if you've found wording that works better in practice, share it
- **Add references** — if you know of relevant prior art that should be cited
- **Translate** — adaptations into other languages are welcome (open an issue first to coordinate)

## How to Contribute

### 1. Open an Issue First (for larger changes)

For substantive additions or restructuring, open an issue first to discuss the proposed change. This avoids duplicate work and ensures the change fits the guidebook's direction.

For small fixes (typos, link updates, minor clarifications), skip straight to a PR.

### 2. Fork and Branch

```bash
git clone https://github.com/YOUR-USERNAME/community-resilience-guidebook.git
cd community-resilience-guidebook
git checkout -b your-branch-name
```

Branch naming convention: `type/short-description`, where `type` is one of:

- `fix/` for corrections
- `add/` for new content
- `edit/` for rewording
- `chore/` for repo maintenance

Examples: `fix/appendix-b-link`, `add/manipulation-pattern`, `edit/moderation-charter-clarity`.

### 3. Set Up Local Preview (Optional but Recommended)

```bash
make install   # creates .venv/ and installs dependencies
make serve     # opens dev server at http://localhost:8000
```

Edits to `docs/index.md` reload the page automatically. The site rebuilds on every save.

The first `make install` creates a Python virtual environment in `.venv/` (gitignored) so dependencies don't pollute your system Python. You don't need to activate it manually — the Makefile uses `.venv/bin/mkdocs` directly.

Other useful targets:

- `make build` — build the static site to `./site`
- `make pdf` — build the PDF (requires pandoc + xelatex on your system)
- `make all` — build both
- `make clean` — remove build artifacts (keeps the venv)
- `make clean-all` — remove build artifacts and the venv
- `make reinstall` — wipe and rebuild the venv from scratch
- `make help` — see all available targets

### 4. Make Your Changes

Edit `docs/index.md` directly. The site and PDF are generated from this file on merge.

**Style notes:**

- Match the existing tone: direct, practical, no jargon-for-its-own-sake
- Keep paragraphs reasonably short
- Use plain language; this is for volunteer moderators, not security professionals
- Avoid em-dashes (we replaced all of ours; please don't reintroduce them)
- Use US English spelling
- Markdown only; no inline HTML unless absolutely necessary

### 5. Bump the VERSION File

**This step is mandatory.** Every PR that changes guidebook content must bump `VERSION` according to the rules below.

If your PR only changes repo infrastructure (workflows, README typos, CI configuration) and not the guidebook itself, you can skip this step.

### 6. Update CHANGELOG.md

Add an entry under `## [Unreleased]` describing your change. Use this format:

```markdown
## [Unreleased]

### Added
- New section on X (#PR-number)

### Changed
- Reworded Y for clarity (#PR-number)

### Fixed
- Broken link in Appendix B (#PR-number)
```

On release, the maintainer moves the `[Unreleased]` block into a versioned entry.

### 7. Open a Pull Request

- Title: clear, descriptive (matches branch name format)
- Body: explain what changed and why
- Link any related issue: "Closes #123"
- Be patient during review; this is volunteer work

## Versioning

This project follows a documentation-adapted [Semantic Versioning](https://semver.org/) convention.

The `VERSION` file in the repo root is the single source of truth. The build workflow reads it and substitutes it into the published guidebook.

### The Rules

| Bump | When | Examples |
|---|---|---|
| **Major** (`X.0.0`) | Breaking restructure that requires re-reading | Charter philosophy changes, sections renumbered, severity tiers redefined, fundamental approach shifts, removal of sections that other guidance referenced |
| **Minor** (`1.X.0`) | New content added without breaking existing structure | New pattern added to Part IV, new appendix, new section, new template, significant new guidance in an existing section |
| **Patch** (`1.0.X`) | Edits that don't change meaning | Typo fixes, grammar fixes, link updates, broken-reference fixes, formatting fixes, minor rewording for clarity |

### How to Bump

The current version lives in the `VERSION` file as a single line, e.g.:

```
1.2.3
```

In your PR, edit this file to reflect the new version. Examples:

- Fixing a typo: `1.2.3` → `1.2.4` (patch)
- Adding a new pattern to Part IV: `1.2.3` → `1.3.0` (minor; reset patch to 0)
- Restructuring the charter into a new tier system: `1.2.3` → `2.0.0` (major; reset minor and patch)

### When in Doubt

When uncertain whether a change is patch or minor:

- Will a reader who already knows the guidebook need to be aware of this change? → **Minor**
- Could a reader skim the diff and ignore it? → **Patch**

When uncertain whether a change is minor or major:

- Does this contradict guidance that was previously given? → **Major**
- Does this add to or refine previous guidance? → **Minor**

If the PR review concludes the bump is wrong, the maintainer will request a correction before merge.

### Pre-1.0 Convention

If the guidebook is in `0.X.Y` territory (still being shaped, not yet considered stable):

- Bump the `X` for any meaningful content change
- Bump the `Y` for fixes
- Anything could change without warning; `1.0.0` signals stability

## Commit Messages

We don't enforce Conventional Commits, but please write clear commit messages:

**Good:**
- `Add manipulation pattern: love-bombing`
- `Fix broken link to EFF SSD in Appendix B`
- `Reword Section 6 for clarity on consistency`

**Less helpful:**
- `update`
- `fixes`
- `wip`

If you use squash-merge, the maintainer will write a clean commit message from your PR title and description.

## Review Process

1. PRs are reviewed by at least one maintainer
2. CI must pass (build verification of PDF and site)
3. The `VERSION` bump must match the change type
4. Once approved, the maintainer squash-merges to `main`
5. The release workflow runs automatically, building the PDF, deploying the site, and creating a GitHub Release

Direct pushes to `main` are blocked by branch protection. All changes go through PR.

## Code of Conduct

This project adopts the [Contributor Covenant](https://www.contributor-covenant.org/version/2/1/code_of_conduct/) version 2.1. In short: be respectful, assume good faith, and remember that everyone here is volunteering time to help communities defend themselves.

Reports of conduct issues should go to the maintainers privately.

## License of Contributions

By contributing, you agree that your contributions will be licensed under the same [CC BY-SA 4.0 license](./LICENSE) that covers the rest of the guidebook.

## Recognition

Contributors are listed in the repo's contributors page. If you want to be acknowledged differently (alias, organization, etc.), include that preference in your first PR.

## Questions

Open an issue with the `question` label, or contact the maintainers directly. We'd rather answer a question early than untangle a misunderstanding later.
