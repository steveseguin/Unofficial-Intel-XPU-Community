# Benchmarks And Results

Benchmarks are useful only when they can be compared.

## Required Metadata

- date
- GPU SKU and count
- OS and kernel
- driver/runtime versions
- framework and commit or package version
- model and quantization
- context length
- prompt tokens and output tokens
- batch size or concurrency
- exact command
- environment variables
- throughput and latency
- validation or quality check
- power limits or thermal constraints if changed

Use [`templates/benchmark-result.md`](../../templates/benchmark-result.md).

## Result Status Labels

- **stable**: repeated, validated, and recommended
- **draft**: likely useful but needs another reproduction
- **experimental**: interesting but risky or patch-heavy
- **negative**: tested and did not improve
- **suspect**: reproduced a speed result but quality/correctness is uncertain
- **rumor**: not confirmed by official docs or direct testing

## Good Benchmark Posts

Good posts include:

- command output as text
- logs or linked gist
- model source and quantization
- exact framework version
- whether this was cold or warm
- whether the result is one run or a mean
- validation method

## Negative Results Are Welcome

If a knob regressed performance, caused a crash, changed output quality, or was impossible to reproduce, post it. Negative results are often the most valuable part of early hardware work.
