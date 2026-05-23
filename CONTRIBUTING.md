# Contributing

This repo is meant to turn scattered Intel XPU experiments into reproducible community knowledge.

## Contribution Types

- **Guide**: a setup, build, Docker, benchmark, or troubleshooting process that another person can run.
- **Benchmark**: a result with enough metadata to compare against other systems.
- **Patch note**: a focused explanation of a local patch, why it exists, how to apply it, and whether it is safe.
- **Research note**: a sourced observation, release note, upstream issue, rumor, or compatibility update.
- **Negative result**: a tested path that did not work, including what failed and what to avoid.

## Promotion Rule

Use [`steveseguin/b70-optimization-lab`](https://github.com/steveseguin/b70-optimization-lab) for raw, fast-moving experiments. Promote material here when it has:

1. a clear environment
2. exact commands or patch references
3. a pass/fail result
4. enough context for someone else to repeat it
5. a clear status: stable, draft, experimental, negative, or rumor

## Benchmark Minimums

Every benchmark should include:

- date
- GPU model and count
- OS and kernel
- driver/runtime versions
- framework and commit or package version
- model and quantization
- command line and environment variables
- prompt length, output length, context length, batch/concurrency
- throughput and latency numbers
- validation method, if any

Use [`templates/benchmark-result.md`](templates/benchmark-result.md) or the JSON schema in [`schemas/benchmark-result.schema.json`](schemas/benchmark-result.schema.json).

## Safety

Avoid publishing commands that blindly overwrite system files, disable security features, or install unsigned packages without explaining the risk. Prefer diagnostic commands first.

Do not commit secrets, private model paths, API keys, SSH keys, or account tokens.
