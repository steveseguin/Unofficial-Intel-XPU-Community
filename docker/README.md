# Docker

This directory is for tested Intel XPU container recipes.

The first community goal is to produce a minimal, reproducible set of containers for:

- PyTorch XPU smoke test
- OpenVINO device query and sample inference
- vLLM XPU smoke test
- llama.cpp SYCL build and small-model smoke test

## Required Metadata For Each Recipe

Each container guide should include:

- host OS and kernel
- host Intel GPU driver/runtime packages
- Docker or Podman version
- required device mounts
- required groups and permissions
- base image and digest
- exact run command
- smoke test command
- known failures

## Do Not Add Yet

Avoid adding a Dockerfile that only works on one private machine unless it is clearly labeled as experimental and includes host requirements.
