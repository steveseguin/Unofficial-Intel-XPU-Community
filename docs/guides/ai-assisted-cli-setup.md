# AI-Assisted CLI Setup

An AI agent can help configure an Intel XPU system, but it should work in stages.

## What An AI Can Do Well

- collect hardware and software inventory
- compare installed packages against official docs
- generate install commands for the chosen OS
- create Dockerfiles and compose files
- run smoke tests
- collect logs
- generate benchmark matrices
- summarize failures into Discussion posts
- turn working commands into repo docs

## What Needs Human Control

- physical GPU placement
- power cabling
- BIOS updates and BIOS settings
- accepting package trust changes
- installing kernel modules
- rebooting
- disabling Secure Boot or security settings
- changing production services
- running unknown commands as administrator/root

## Recommended Agent Flow

1. Run the read-only snapshot script.
2. Identify the first broken layer.
3. Propose one change.
4. Show the exact command.
5. Run it only after approval if it uses root/admin privileges.
6. Re-run the smoke test.
7. Record the before/after result.

## Good First Prompt

```text
You are helping configure an Intel Arc Pro B70 XPU machine.
First collect a read-only hardware/software snapshot.
Do not install packages or use sudo/admin until you show the exact command and explain why.
After each change, run a small smoke test and record the result.
The goal is a reproducible setup guide for the Unofficial Intel XPU Community repo.
```

## Useful Smoke Tests

- PCIe inventory
- `xpu-smi discovery`
- `ze_info`
- `clinfo`
- PyTorch XPU device count
- OpenVINO available devices
- one small framework inference
