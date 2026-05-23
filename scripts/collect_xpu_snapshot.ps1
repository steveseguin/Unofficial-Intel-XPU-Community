param(
  [string]$OutDir = "xpu-snapshot-$(Get-Date -Format yyyyMMdd-HHmmss)"
)

New-Item -ItemType Directory -Force -Path $OutDir | Out-Null

function Run-Cmd {
  param(
    [string]$Name,
    [scriptblock]$Command
  )
  $Path = Join-Path $OutDir "$Name.txt"
  try {
    & $Command *>&1 | Out-File -FilePath $Path -Encoding utf8
  } catch {
    $_ | Out-File -FilePath $Path -Encoding utf8
  }
}

Run-Cmd "computer-info" { Get-ComputerInfo | Select-Object OsName, OsVersion, WindowsVersion, CsProcessors, CsTotalPhysicalMemory }
Run-Cmd "display-devices" { Get-PnpDevice -Class Display }
Run-Cmd "video-controller" { Get-CimInstance Win32_VideoController | Select-Object Name, DriverVersion, AdapterRAM, PNPDeviceID }
Run-Cmd "xpu-smi-discovery" { xpu-smi discovery }
Run-Cmd "xpu-smi-topology" { xpu-smi topology -m }
Run-Cmd "python-version" { python --version }
Run-Cmd "pip-freeze" { python -m pip freeze }
Run-Cmd "torch-xpu" { python -c "import torch; print('torch', torch.__version__); print('has_xpu', hasattr(torch,'xpu')); print('xpu_count', torch.xpu.device_count() if hasattr(torch,'xpu') else 'n/a')" }
Run-Cmd "openvino-devices" { python -c "import openvino as ov; print(ov.__version__); print(ov.Core().available_devices)" }
Run-Cmd "docker-version" { docker --version }

@"
Intel XPU snapshot created at $(Get-Date -Format o)

Review files before sharing publicly.
Remove usernames, private paths, model names, hostnames, IPs, tokens, and any data you do not want public.
"@ | Out-File -FilePath (Join-Path $OutDir "README.txt") -Encoding utf8

Write-Host "Wrote $OutDir"
