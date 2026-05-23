# Getting Started

This is the recommended first path for a new Intel XPU system.

## 1. Inventory The System

Before changing drivers or installing frameworks, collect:

- GPU model and count
- motherboard, CPU, RAM, power supply, and risers
- operating system and kernel
- BIOS settings for Above 4G decoding, ReBAR, IOMMU, PCIe speed, and Secure Boot
- current driver packages
- visible XPU devices from Level Zero, OpenCL, PyTorch, OpenVINO, and framework tools

Use:

- Linux: [`scripts/collect_xpu_snapshot.sh`](../../scripts/collect_xpu_snapshot.sh)
- Windows: [`scripts/collect_xpu_snapshot.ps1`](../../scripts/collect_xpu_snapshot.ps1)

These scripts are read-only except for writing a local snapshot folder.

## 2. Install Official Drivers First

Start from the official driver path for your OS.

- Windows: Intel Graphics Windows DCH drivers
- Linux: Intel GPU Linux documentation for your distro and kernel

Do not mix random package repos until you have a known-good baseline.

## 3. Verify Device Visibility

A useful baseline sees the GPUs through several layers:

- `lspci` or Device Manager
- `xpu-smi` if available
- Level Zero tools such as `ze_info`
- OpenCL tools such as `clinfo`
- PyTorch XPU
- OpenVINO device query
- the target framework, such as vLLM or llama.cpp

If one layer sees the GPU and another does not, post both outputs.

## 4. Pick A First Workload

Choose a small, known workload first:

- OpenVINO model device query or sample
- PyTorch XPU tensor smoke test
- llama.cpp SYCL small model smoke test
- vLLM XPU smoke test with a model that fits comfortably

Do not start with a huge multi-GPU model and driver tuning all at once.

## 5. Record The Baseline

Post the baseline in Discussions:

- snapshot script output
- installed driver/runtime versions
- exact command
- pass/fail
- benchmark numbers if any
- what you want to improve next
