# Research Pipeline

The community repo should stay useful for deployment. The lab repo can stay fast and messy.

## Roles

### b70-optimization-lab

Use for:

- daily AI-assisted research updates
- raw benchmark payloads
- local patch artifacts
- experiments that may fail
- LocalMaxxing payloads and responses
- detailed optimization diaries

Repo: https://github.com/steveseguin/b70-optimization-lab

### Unofficial-Intel-XPU-Community

Use for:

- setup guides
- Docker guides
- troubleshooting pages
- curated benchmark results
- patch summaries
- discussion templates
- wiki pages

## Promotion Checklist

Before moving a lab result here:

- Is the result still current?
- Is it reproducible by someone else?
- Are commands included?
- Are versions included?
- Is the patch linked?
- Is correctness or quality validated?
- Is the status clear?
- Are secrets and private paths removed?

## Suggested Workflow

1. AI agent runs research in `b70-optimization-lab`.
2. AI agent opens a draft "promotion candidate" issue or PR here.
3. Human reviews the risk and clarity.
4. Community reproduces or challenges it.
5. The guide moves into the wiki or docs with status labels.

## Stable Output Types

- `docs/wiki/*` for GitHub wiki import pages
- `docs/guides/*` for longer guides
- `templates/*` for repeatable submissions
- `schemas/*` for structured benchmark data
- `scripts/*` for read-only diagnostics and safe helpers
- `docker/*` for tested container recipes
