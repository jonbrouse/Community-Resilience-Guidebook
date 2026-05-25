# ============================================================
# The Community Resilience Guidebook — Makefile
# ============================================================

# Read the version from the VERSION file
VERSION := $(shell cat VERSION | tr -d '[:space:]')

# Paths
DOCS_DIR        := docs
DOC_SOURCE      := $(DOCS_DIR)/index.md
SITE_OUTPUT_DIR := site
PDF_OUTPUT      := Community-Resilience-Guidebook.pdf

# Virtual environment
VENV_DIR        := .venv
VENV_BIN        := $(VENV_DIR)/bin
VENV_PYTHON     := $(VENV_BIN)/python
VENV_PIP        := $(VENV_BIN)/pip
MKDOCS          := $(VENV_BIN)/mkdocs

# Pandoc options
PANDOC_OPTS := \
	--pdf-engine=xelatex \
	--toc \
	--toc-depth=2 \
	-V geometry:margin=1in \
	-V documentclass=article \
	-V fontsize=11pt \
	-V linkcolor=blue \
	-V mainfont="DejaVu Serif" \
	-V sansfont="DejaVu Sans" \
	-V monofont="DejaVu Sans Mono"

PANDOC_METADATA := \
	--metadata title="The Community Resilience Guidebook" \
	--metadata subtitle="Version $(VERSION)"

.PHONY: help venv install reinstall serve build pdf all clean check version \
        substitute-version restore-version bundle-pdf-into-site

.DEFAULT_GOAL := help

help: ## Show this help
	@echo "         Makefile Help"
	@echo ""
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

# ------------------------------------------------------------
# Virtual environment management
# ------------------------------------------------------------

# Create the venv if it doesn't exist. Other targets depend on this file.
$(VENV_PYTHON):
	@echo "Creating virtual environment in $(VENV_DIR)/"
	python3 -m venv $(VENV_DIR)
	@$(VENV_PIP) install --upgrade pip --quiet

venv: $(VENV_PYTHON) ## Create the Python virtual environment
	@echo "✓ Virtual environment ready at $(VENV_DIR)/"
	@echo "  Activate with: source $(VENV_BIN)/activate"

install: $(VENV_PYTHON) ## Install Python dependencies into the venv
	$(VENV_PIP) install -r requirements.txt
	@echo "✓ Dependencies installed"

reinstall: clean-venv install ## Wipe and rebuild the venv from scratch

clean-venv: ## Remove the virtual environment
	rm -rf $(VENV_DIR)
	@echo "✓ Virtual environment removed"

# ------------------------------------------------------------
# Inspection
# ------------------------------------------------------------

version: ## Print the current version
	@echo "$(VERSION)"

# ------------------------------------------------------------
# Build targets
# ------------------------------------------------------------

serve: $(VENV_PYTHON) ## Run the local dev server (http://localhost:8000)
	$(MKDOCS) serve

build: $(VENV_PYTHON) substitute-version ## Build the static site to ./site
	$(MKDOCS) build --strict
	@$(MAKE) restore-version
	@echo "✓ Site built to ./$(SITE_OUTPUT_DIR)"

pdf: substitute-version ## Build the PDF (requires pandoc + xelatex installed system-wide)
	pandoc $(DOC_SOURCE) -o $(PDF_OUTPUT) $(PANDOC_OPTS) $(PANDOC_METADATA)
	@$(MAKE) restore-version
	@echo "✓ PDF built: $(PDF_OUTPUT)"

all: build pdf ## Build both the site and PDF
	@echo "✓ Both site and PDF built"

check: $(VENV_PYTHON) substitute-version ## Verify both builds work (used in CI; no restore)
	$(MKDOCS) build --strict
	pandoc $(DOC_SOURCE) -o $(PDF_OUTPUT) $(PANDOC_OPTS) $(PANDOC_METADATA)
	@echo "✓ Both site and PDF built successfully"

# ------------------------------------------------------------
# Cleanup
# ------------------------------------------------------------

clean: ## Remove build artifacts (keeps the venv)
	rm -rf $(SITE_OUTPUT_DIR)
	rm -f $(PDF_OUTPUT)
	rm -f $(DOC_SOURCE).bak
	rm -rf .cache __pycache__
	@echo "✓ Cleaned"

clean-all: clean clean-venv ## Remove build artifacts and the venv

# ------------------------------------------------------------
# Helpers (internal — used by other targets)
# ------------------------------------------------------------

bundle-pdf-into-site: ## Copy the PDF into ./site (used by the release workflow)
	cp $(PDF_OUTPUT) $(SITE_OUTPUT_DIR)/$(PDF_OUTPUT)
	@echo "✓ PDF copied into site/"

substitute-version: ## (internal) Replace {{VERSION}} placeholder in docs
	@echo "Substituting version $(VERSION) into $(DOC_SOURCE)"
	@sed -i.bak "s/{{VERSION}}/$(VERSION)/g" $(DOC_SOURCE)

restore-version: ## (internal) Restore the {{VERSION}} placeholder from backup
	@if [ -f $(DOC_SOURCE).bak ]; then \
		echo "Restoring $(DOC_SOURCE) from backup"; \
		mv $(DOC_SOURCE).bak $(DOC_SOURCE); \
	fi
