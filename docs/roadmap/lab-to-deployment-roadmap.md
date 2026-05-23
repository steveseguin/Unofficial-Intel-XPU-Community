# Lab To Deployment Roadmap

This roadmap turns [`b70-optimization-lab`](https://github.com/steveseguin/b70-optimization-lab) from a fast research feed into deployable community guides, Docker recipes, patches, and benchmark reports.

## Goal

Keep the lab repo free to move quickly, but promote stable findings here in a format that other B70/XPU users can reproduce.

## Phase 1: Curate Current Lab Results

Create one short promotion candidate for each major result:

- B70 PCIe topology and `xpu-smi` setup
- Windows and Linux driver notes
- single-GPU smoke tests
- two-GPU service split recipes
- three/four-GPU benchmark findings from the quad B70 build
- llama.cpp SYCL Qwen results
- vLLM XPU FP8 and INT4 results
- MiniMax AutoRound work
- negative oneCCL, graph, router, and helper experiments that should not be retried blindly

Each promotion candidate should answer:

- What exact hardware was used?
- What exact software was used?
- What command was run?
- What passed?
- What failed?
- What is safe for others to copy?
- What remains experimental?

## Phase 2: Convert To Reproducible Guides

For each promoted result, create:

- a short guide in `docs/guides/`
- a benchmark result in `templates/benchmark-result.md` format
- a patch summary if local patches were required
- a Discussion post asking for reproduction

Prioritize guides that help new users get unstuck:

1. install and verify drivers
2. run the snapshot scripts
3. verify PyTorch XPU
4. verify OpenVINO
5. run one small llama.cpp SYCL model
6. run one small vLLM XPU model
7. scale to two B70s

## Phase 3: Add Deployment Recipes

Deployment docs should be boring and repeatable.

Target recipes:

- one B70, one model server
- two B70s, two independent model servers
- two B70s, tensor-parallel vLLM smoke test
- OpenVINO model server smoke test
- llama.cpp SYCL server smoke test
- Docker or Podman recipe for each working path
- optional systemd unit files after the manual command is proven

Each deployment recipe must include a rollback path and a minimal health check.

## Phase 4: Benchmark And Patch Registry

Add structured registries once there are enough entries:

- `benchmarks/` for curated result JSON files
- `patches/` for community patch summaries or links
- `docker/` for tested container recipes
- `configs/` for framework configs that are safe to reuse

Do not copy large model files, generated caches, private paths, or secrets into this repo.

## Phase 5: Automation

Useful automation targets:

- validate benchmark JSON against the schema
- check Markdown links
- check Discussion form YAML
- generate a benchmark index from JSON files
- generate a "latest promoted results" page from structured metadata

## Promotion Labels

Use these labels consistently:

- `stable`: repeatable and recommended
- `draft`: useful but needs another reproduction
- `experimental`: patch-heavy or risky
- `negative`: tested and not recommended
- `suspect`: speed or behavior observed, correctness uncertain
- `rumor`: external claim not confirmed by official docs or local testing

## First Three Community Calls

1. "Post your B70/XPU setup snapshot."
2. "Reproduce the simplest PyTorch XPU/OpenVINO smoke tests."
3. "Help turn one lab benchmark into a clean guide."
