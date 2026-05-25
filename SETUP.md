# Repository Setup Guide

This guide walks through everything you need to do **after pushing this repo to GitHub** to get the publication workflow running. Most of it is one-time configuration in the GitHub web UI.

Estimated time: 15 minutes.

## 1. Create the GitHub Repository

1. Create a new repository on GitHub (public, so Pages works on the free tier)
2. Push this entire folder to the repo on the `main` branch:

   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git branch -M main
   git remote add origin https://github.com/YOUR-ORG/community-resilience-guidebook.git
   git push -u origin main
   ```

3. After pushing, update these placeholders throughout the files:
   - `YOUR-ORG` in `README.md`, `CHANGELOG.md`, and `mkdocs.yml`
   - The `site_url`, `repo_url`, and `repo_name` in `mkdocs.yml`
   - The `social` link in `mkdocs.yml`

   A quick find-and-replace across the repo for `YOUR-ORG` is the easiest way.

## 2. Enable GitHub Pages

1. Go to **Settings → Pages**
2. Under "Build and deployment", set **Source** to: `GitHub Actions`
3. Save. The first deployment will happen automatically when the next workflow runs.

Once deployed, the site will be at:

```
https://YOUR-ORG.github.io/community-resilience-guidebook/
```

(Or, for a custom domain, see "Optional: Custom Domain" at the bottom.)

## 3. Configure Branch Protection on `main`

This is the critical step that enforces the "only merge via PR, no direct commits" rule.

1. Go to **Settings → Branches → Branch protection rules → Add rule**
2. Under "Branch name pattern", enter: `main`
3. Enable the following:

   - ✅ **Require a pull request before merging**
     - ✅ Require approvals: `1` (or more if you have multiple maintainers)
     - ✅ Dismiss stale pull request approvals when new commits are pushed
     - ✅ Require review from Code Owners (only if you set up a CODEOWNERS file)

   - ✅ **Require status checks to pass before merging**
     - ✅ Require branches to be up to date before merging
     - In the search box, add these checks (they'll appear after the first PR runs):
       - `Verify VERSION was bumped`
       - `Build PDF (verification only)`
       - `Build MkDocs site (verification only)`

   - ✅ **Require conversation resolution before merging**

   - ✅ **Do not allow bypassing the above settings** (under "Restrict pushes" / "Rules applied to everyone including administrators")

4. **Save changes**

After this, even repository admins can't push directly to `main`. All changes must go through PR.

## 4. Configure Actions Permissions

1. Go to **Settings → Actions → General**
2. Under "Workflow permissions", select:
   - ✅ **Read and write permissions**
   - ✅ **Allow GitHub Actions to create and approve pull requests**
3. Save

This allows the release workflow to create tags and releases.

## 5. Local Preview (Optional)

If you want to preview the site locally before pushing:

```bash
pip install -r requirements.txt
mkdocs serve
```

Open http://localhost:8000. Edits to `docs/index.md` reload the page automatically.

## 6. Test the Workflow

1. Create a test branch:

   ```bash
   git checkout -b test/first-pr
   ```

2. Make a small change to `docs/index.md` (e.g., fix a typo)

3. Bump `VERSION` from `1.0.0` to `1.0.1`

4. Update `CHANGELOG.md`:

   ```markdown
   ## [Unreleased]

   ### Fixed
   - Test PR workflow
   ```

5. Commit, push, open a PR

6. Verify:
   - ✅ PR Check workflow runs
   - ✅ VERSION bump is detected
   - ✅ PDF and site build successfully
   - ✅ PR shows the required checks
   - ✅ You can't merge without approval

7. Approve and merge the PR

8. Verify:
   - ✅ Release workflow runs on main
   - ✅ Pages site updates at your GitHub Pages URL
   - ✅ A new GitHub Release `v1.0.1` is created with the PDF attached

## 7. Optional: Custom Domain

If you want to host at a custom domain (e.g., `guidebook.example.org`):

1. Add a `CNAME` file to the `docs/` folder containing your domain:

   ```
   guidebook.example.org
   ```

2. Configure DNS at your domain registrar:
   - For an apex domain: A records pointing to GitHub's IPs (185.199.108.153, 185.199.109.153, 185.199.110.153, 185.199.111.153)
   - For a subdomain: CNAME record pointing to `YOUR-ORG.github.io`

3. In **Settings → Pages**, under "Custom domain", enter the domain and save
4. Enable "Enforce HTTPS" once the certificate provisions (a few minutes)
5. Update `site_url` in `mkdocs.yml` to match the new domain

## 8. Optional: Add a CODEOWNERS File

If you want automatic reviewer assignment:

```
# .github/CODEOWNERS
*                @your-username
docs/            @your-username @another-maintainer
.github/         @your-username
```

## Troubleshooting

### "Pages build and deployment" failing

Check **Settings → Pages → Build and deployment** is set to "GitHub Actions" (not "Deploy from a branch").

### "Required status check 'X' is expected"

The status checks have to run at least once before GitHub recognizes their names. Open a draft PR, let it run, then add the check names to branch protection.

### PDF build failing

The workflow installs `texlive-fonts-extra` which is large. If install times out, try restarting the workflow. If it keeps failing, switch from `xelatex` to `pdflatex` in the workflow (smaller LaTeX dependency, slightly less pretty output).

### MkDocs build failing with "Doc file contains a link that isn't found"

This happens when an anchor link in the guidebook doesn't resolve. The `--strict` flag in the build is intentional — broken links should fail the build. Fix the link or remove `--strict` from the workflow if you need to ship despite the broken link.

### "Warning from the Material for MkDocs team" about MkDocs 2.0

You may see a red warning during builds about upcoming MkDocs 2.0 changes. This is a community advisory, not an error. Your build still succeeds. The MkDocs Material team is signaling concerns about a future MkDocs version; if/when MkDocs 2.0 ships with breaking changes, the team may publish a forked alternative. For now, builds work fine and the warning can be ignored.

### Workflow can't push tags or create release

Check **Settings → Actions → General → Workflow permissions** is set to "Read and write permissions."

### Search doesn't work on the deployed site

The `search` plugin is enabled by default. If results are empty, try a hard refresh — the search index is built at deploy time and the browser may have cached an old one.

## Maintenance Notes

- The `VERSION` file is the single source of truth. Bump it in every content PR.
- The `CHANGELOG.md` has an `[Unreleased]` section. After a release, move that block into a versioned entry. (Future improvement: automate this.)
- PDFs are generated fresh on every release. They're not committed to the repo.
- Old releases stay accessible via the GitHub Releases page.
- MkDocs Material is actively maintained. To update, bump the version in `requirements.txt`.

## Questions

If something here is unclear or wrong, please open an issue.
