# Unofficial Intel XPU Community

Intel GPU notes for people trying to run local AI without losing a weekend to driver/runtime weirdness.

This is an unofficial community project. It is not owned by Intel.

## Start Here

- Ask for help: https://github.com/steveseguin/Unofficial-Intel-XPU-Community/discussions
- Read the wiki: https://github.com/steveseguin/Unofficial-Intel-XPU-Community/wiki
- Share a benchmark: [template](templates/benchmark-result.md)
- Run a system snapshot: [Linux](scripts/collect_xpu_snapshot.sh) / [Windows](scripts/collect_xpu_snapshot.ps1)
- Research lab repo: https://github.com/steveseguin/b70-optimization-lab

## What This Community Is For

Intel Arc and XPU local AI is promising, but setup is still scattered across drivers, oneAPI, OpenVINO, PyTorch XPU, Level Zero, SYCL, vLLM, llama.cpp, Docker, and random forum posts.

This repo is meant to be the stable hub:

- setup guides for Linux and Windows
- Docker notes people can actually run
- benchmark templates and comparable results
- patch notes for vLLM, llama.cpp, OpenVINO, oneAPI, and SYCL
- troubleshooting for drivers, PCIe topology, XPU visibility, and runtime mismatches
- discussion categories for setup help, benchmarks, guides, patches, build photos, and research leads

## Quick Links

| I want to... | Go here |
| --- | --- |
| Ask a setup question | [Discussions](https://github.com/steveseguin/Unofficial-Intel-XPU-Community/discussions) |
| Read community notes | [Wiki](https://github.com/steveseguin/Unofficial-Intel-XPU-Community/wiki) |
| Get started | [Getting Started](docs/wiki/Getting-Started.md) |
| Check drivers/runtimes | [Drivers and Runtimes](docs/wiki/Drivers-and-Runtimes.md) |
| Diagnose XPU visibility | [Diagnostics](docs/wiki/Diagnostics.md) |
| Share benchmark results | [Benchmarks and Results](docs/wiki/Benchmarks-and-Results.md) |
| Try containers | [Docker and Containers](docs/wiki/Docker-and-Containers.md) |
| Understand 2x B70 use cases | [Two B70 Use Cases](docs/wiki/Two-B70-Use-Cases.md) |
| See research status | [Current Research Snapshot](docs/research/intel-xpu-b70-snapshot-2026-05-23.md) |

## Good First Post

If you need help, open a Discussion and include:

- GPU model and count
- Windows or Linux version
- what you are trying to run
- what guide or command you followed
- what failed
- logs or screenshots if you have them

If you are on Linux, attach output from:

```bash
bash scripts/collect_xpu_snapshot.sh
```

If you are on Windows PowerShell, attach output from:

```powershell
.\scripts\collect_xpu_snapshot.ps1
```

## What Counts As A Useful Benchmark

A useful result says more than "I got 80 tok/s."

Include:

- model and quantization
- GPU model/count
- engine: vLLM, llama.cpp, OpenVINO, PyTorch, etc.
- prompt length, output length, context length
- batch size or concurrency
- output tok/s and total tok/s if available
- whether quality was checked
- exact command or linked recipe

Use the [benchmark template](templates/benchmark-result.md).

## Current Focus

Near-term community priorities:

- make B70/B-series setup reproducible
- document Windows and Linux paths clearly
- get Docker/container recipes that work outside one private machine
- collect comparable vLLM, llama.cpp, OpenVINO, and PyTorch XPU results
- track driver/runtime mismatches and fixes
- promote stable recipes from the fast-moving [B70 optimization lab](https://github.com/steveseguin/b70-optimization-lab)

## Repo Map

- [COMMUNITY.md](COMMUNITY.md): what belongs here and how to write useful posts
- [CONTRIBUTING.md](CONTRIBUTING.md): contribution rules
- [community/](community/): suggested discussion categories and welcome text
- [docs/wiki/](docs/wiki/): wiki-ready guide drafts
- [docker/](docker/): container notes
- [scripts/](scripts/): snapshot/diagnostic helpers
- [templates/](templates/): benchmark/report templates
- [schemas/](schemas/): structured result schema

## Important Caveat

This is community research. Some notes will be experimental, incomplete, or wrong for your exact machine. Prefer posts with commands, versions, logs, and reproducible steps.

Do not post API keys, private model files, proprietary data, or copied vendor docs. Link to sources instead.
