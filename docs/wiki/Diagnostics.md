# Diagnostics

Diagnostics should be repeatable, read-only where possible, and easy to paste into a Discussion.

## Snapshot Scripts

- Linux: [`scripts/collect_xpu_snapshot.sh`](../../scripts/collect_xpu_snapshot.sh)
- Windows: [`scripts/collect_xpu_snapshot.ps1`](../../scripts/collect_xpu_snapshot.ps1)

The scripts collect command output into a local `xpu-snapshot-*` folder. Review the files before posting.

## Linux Commands

```bash
uname -a
cat /etc/os-release
lspci -nn | grep -Ei 'intel|display|vga|3d'
lsmod | grep -Ei 'xe|i915'
xpu-smi discovery
xpu-smi stats -d 0
ze_info
clinfo
python - <<'PY'
import torch
print(torch.__version__)
print(hasattr(torch, "xpu"))
print(torch.xpu.device_count() if hasattr(torch, "xpu") else "no torch.xpu")
PY
```

## Windows Commands

```powershell
Get-ComputerInfo | Select-Object OsName, OsVersion, WindowsVersion
Get-PnpDevice -Class Display
Get-CimInstance Win32_VideoController | Select-Object Name, DriverVersion, AdapterRAM
xpu-smi discovery
python -c "import torch; print(torch.__version__); print(hasattr(torch,'xpu')); print(torch.xpu.device_count() if hasattr(torch,'xpu') else 'no torch.xpu')"
```

## PCIe Notes

On some Arc Pro B-series systems, bridge topology can make one reporting path look slower than the slot-facing link. Include both `lspci -vv` and `xpu-smi` output when asking about PCIe speed.

## What Not To Do First

- do not change five environment variables at once
- do not benchmark before confirming device visibility
- do not post screenshots only when text logs are available
- do not assume a CUDA guide maps directly to XPU
