# Unofficial Intel XPU Community

Community notes, setup guides, benchmarks, patches, and discussion space for Intel Arc Pro B-series GPUs, Intel XPU runtimes, oneAPI, OpenVINO, PyTorch XPU, SYCL, Level Zero, vLLM, llama.cpp, and related tools.

This is an unofficial community project. It is not owned by Intel. Treat everything here as community research unless it links to official vendor documentation.

## Why This Exists

Intel Arc Pro B-series cards, especially the Arc Pro B70, are interesting for local AI because they combine large VRAM, modern media engines, and Intel's XPU software stack. The public information is scattered across Intel docs, driver release notes, GitHub issues, benchmark posts, X threads, and local experiments.

This repository is meant to become the stable, community-facing hub:

- reproducible setup guides for Windows and Linux
- Docker and container notes that other people can actually run
- benchmark templates and results that can be compared
- patch notes for vLLM, llama.cpp, OpenVINO, oneAPI, and SYCL work
- troubleshooting guides for drivers, PCIe topology, XPU visibility, and runtime mismatches
- Discussion categories for setup help, benchmarks, guides, patches, and research leads

## Start Here

- [Wiki home draft](docs/wiki/Home.md)
- [Getting started](docs/wiki/Getting-Started.md)
- [Two B70 use cases](docs/wiki/Two-B70-Use-Cases.md)
- [Drivers and runtimes](docs/wiki/Drivers-and-Runtimes.md)
- [Diagnostics](docs/wiki/Diagnostics.md)
- [Benchmarks and results](docs/wiki/Benchmarks-and-Results.md)
- [Docker and containers](docs/wiki/Docker-and-Containers.md)
- [Research pipeline](docs/wiki/Research-Pipeline.md)
- [Current research snapshot](docs/research/intel-xpu-b70-snapshot-2026-05-23.md)
- [GitHub Wiki and Discussions setup](docs/guides/github-wiki-and-discussions-setup.md)

## Current Working Model

Use this repo for stable community material. Use [`steveseguin/b70-optimization-lab`](https://github.com/steveseguin/b70-optimization-lab) as the fast-moving research feed.

The intended flow is:

1. Experiment in the lab repo.
2. Promote a result here only when it has enough detail for another person to reproduce.
3. Capture the hardware, driver, runtime, command line, model, and validation evidence.
4. Mark anything speculative, negative, or unsafe as such.

## Good First Contributions

- Post your B70 or other Intel XPU system in Discussions using the setup form.
- Run the snapshot script in [`scripts/`](scripts/) and attach the output to a setup discussion.
- Convert a lab note into a short, reproducible guide.
- Add a benchmark result with the template in [`templates/benchmark-result.md`](templates/benchmark-result.md).
- Link useful upstream issues, PRs, release notes, and forum threads.

## For Two B70 Owners

The best practical use case for two B70s depends on software support:

- run two independent 32 GB GPU workloads when you want reliability and simple scheduling
- run tensor parallel inference when the framework supports XPU communication cleanly
- split services, for example one GPU for an LLM and the other for embeddings, vision, transcription, video, or test builds
- benchmark scaling, driver versions, oneCCL settings, and model layouts

Two cards do not automatically behave like one 64 GB GPU. Treat multi-GPU memory as software-managed unless a specific framework path proves otherwise.

## Can An AI Configure This From The CLI?

An AI agent can help a lot from the CLI: inventory hardware, install packages, generate Docker files, run diagnostics, collect logs, write systemd units, benchmark repeatably, and convert the results into documentation.

Human approval is still needed for physical hardware, BIOS settings, slot layout, power, reboots, kernel changes, package trust, and anything run as root. The safe pattern is: collect a read-only snapshot first, then make one controlled change at a time, then benchmark.

## Community Links

- Discussions: https://github.com/steveseguin/Unofficial-Intel-XPU-Community/discussions
- Research lab: https://github.com/steveseguin/b70-optimization-lab
- Steve on X: https://x.com/xyster

## License

This repository is currently published under CC0. Contributions should be suitable for public reuse and should not include private tokens, proprietary model weights, private benchmark data, or copied vendor text beyond short quotes and links.
