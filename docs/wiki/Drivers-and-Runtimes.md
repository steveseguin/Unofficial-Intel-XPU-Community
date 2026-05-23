# Drivers And Runtimes

Intel XPU deployments have several layers. Document each layer when posting a result.

## Hardware Layer

- GPU SKU and count
- PCIe generation and lane width
- ReBAR / Above 4G decoding
- IOMMU
- Secure Boot
- cooling and power limits

## OS Driver Layer

Use official Intel driver documentation first.

Windows:

- Intel Graphics Windows DCH driver page
- Device Manager
- Intel Arc Control, if used

Linux:

- Intel discrete GPU docs
- kernel version
- firmware packages
- Level Zero loader and GPU plugin packages
- OpenCL runtime packages
- `xpu-smi`

## Developer Runtime Layer

Common components:

- oneAPI Base Toolkit
- DPC++/C++ compiler
- Level Zero
- OpenCL
- oneCCL
- Intel Extension for PyTorch
- OpenVINO
- OpenVINO GenAI

## Framework Layer

Track exact versions and commits:

- vLLM
- llama.cpp
- OpenVINO
- PyTorch
- Intel Extension for PyTorch
- transformers
- optimum-intel
- oneDNN
- llm-scaler or other extension libraries

## Version Reporting Checklist

Include these when asking for help:

```text
OS:
Kernel:
GPU:
GPU count:
Driver packages:
xpu-smi version:
Level Zero loader:
Level Zero GPU plugin:
OpenCL runtime:
oneAPI version:
PyTorch version:
Intel Extension for PyTorch version:
OpenVINO version:
Framework:
Framework commit:
Model:
Command:
```

## Known Pattern

If a framework cannot see the GPU, test lower layers first. For example:

1. OS can see PCIe device
2. Level Zero can enumerate GPU
3. OpenCL can enumerate GPU
4. PyTorch/OpenVINO can enumerate GPU
5. vLLM/llama.cpp can use the GPU

The failing layer is usually more useful than the final error message alone.
