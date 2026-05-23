# Docker And Containers

Container support is a major goal for this community, but Intel XPU containers are sensitive to host driver/runtime compatibility.

## Current Rule

Do not publish a "works everywhere" Dockerfile until it has been tested on at least one real system and includes host requirements.

## What A Good Container Guide Needs

- host OS and kernel
- host driver packages
- Level Zero and device node requirements
- container runtime version
- Docker or Podman command
- required device mounts
- group permissions
- image digest or Dockerfile commit
- smoke test
- known failures

## Starter Topics

- XPU device pass-through
- Level Zero visibility inside containers
- OpenCL visibility inside containers
- PyTorch XPU smoke test
- OpenVINO smoke test
- vLLM XPU smoke test
- llama.cpp SYCL build container

## Draft Run Checklist

Inside a container, verify:

```bash
ls -l /dev/dri || true
ls -l /dev/accel || true
ze_info || true
clinfo || true
python - <<'PY'
import torch
print(torch.__version__)
print(hasattr(torch, "xpu"))
print(torch.xpu.device_count() if hasattr(torch, "xpu") else "no torch.xpu")
PY
```

## Promotion Criteria

A container recipe should move from draft to guide when:

- a second person can run it
- the image is pinned
- the host requirements are explicit
- it has a minimal smoke test
- it says what it does not solve
