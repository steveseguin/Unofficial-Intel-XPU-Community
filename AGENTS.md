# Agent Notes

This file is for AI agents and maintainers working on this repository. Keep the main `README.md` human-first, short, and scan-friendly.

## Purpose

`Unofficial-Intel-XPU-Community` is intended to be the stable community-facing hub for Intel XPU local AI work.

Use this repo for:

- reproducible setup guides for Linux and Windows
- Docker and container notes that other people can run
- benchmark templates and comparable results
- patch notes for vLLM, llama.cpp, OpenVINO, oneAPI, and SYCL
- troubleshooting guides for drivers, PCIe topology, XPU visibility, runtime mismatches, and package/version problems
- discussion categories and templates for setup help, benchmarks, guides, patches, build photos, and research leads

Use `steveseguin/b70-optimization-lab` for fast-moving experiments, deep lab notes, raw optimization history, and active benchmark artifacts.

## README Rule

The README is for human guests who skim.

Keep it:

- short
- plain-language
- action-oriented
- link-heavy
- friendly to people who read eight words and scroll

Do not put long internal memos, dense benchmark chronology, or agent instructions in the README. Put that material here, in wiki docs, or in research notes.

## Promotion Flow

When moving material from the lab repo into this community repo:

1. Start from a result, script, or note in `b70-optimization-lab`.
2. Remove machine-private assumptions.
3. Pin versions and commands.
4. Explain what the guide proves and what it does not prove.
5. Include Linux/Windows differences when known.
6. Add troubleshooting notes and known failures.
7. Link back to the lab artifact for deeper evidence.

Do not promote a speed result without enough context for another person to compare or reproduce it.

## Benchmark Rules

A benchmark entry should include:

- model and quantization
- GPU model/count
- OS/kernel or Windows build
- driver/runtime versions
- engine/backend: vLLM, llama.cpp, OpenVINO, PyTorch, etc.
- prompt length, output length, context length
- batch size and concurrency
- output tok/s and total tok/s when available
- whether quality was checked
- whether speculative decoding was used
- exact command or linked recipe
- raw logs/artifacts where possible

Avoid naked tok/s numbers. Label the workload.

## Community Post Guidance

For setup help, ask users for:

- GPU model/count
- motherboard/CPU/RAM/PSU if relevant
- OS and kernel/build
- Secure Boot state when relevant
- driver package versions
- `xpu-smi`, Level Zero, OpenCL, PyTorch XPU, OpenVINO, vLLM, llama.cpp, or oneAPI versions depending on the issue
- exact command and error
- snapshot script output

Snapshot scripts:

- Linux: `scripts/collect_xpu_snapshot.sh`
- Windows: `scripts/collect_xpu_snapshot.ps1`

## Repo Map

- `README.md`: human landing page
- `AGENTS.md`: agent and maintainer notes
- `COMMUNITY.md`: what belongs here and how to write useful posts
- `CONTRIBUTING.md`: contribution policy
- `community/`: discussion category suggestions and welcome text
- `docs/wiki/`: wiki-ready guide drafts
- `docs/guides/`: longer process guides
- `docs/research/`: stable research snapshots
- `docs/roadmap/`: lab-to-community promotion plans
- `docker/`: container notes
- `scripts/`: diagnostics and snapshot helpers
- `templates/`: benchmark/report templates
- `schemas/`: structured data schemas

## Content Boundaries

Do not commit:

- API keys
- private tokens
- proprietary model weights
- private benchmark data
- copied vendor documentation beyond short attributed excerpts
- full raw logs with secrets or personal data

Prefer links to official sources and short summaries.

## Tone

Write for capable users who may be new to Intel XPU.

Be direct about rough edges:

- drivers can be confusing
- runtime compatibility matters
- containers are not magic if the host stack is wrong
- multi-GPU memory is software-managed, not one automatic pool
- performance claims require workload labels

Keep the community tone practical and welcoming.
