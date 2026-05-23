#!/usr/bin/env bash
set -u

OUT_DIR="${1:-xpu-snapshot-$(date +%Y%m%d-%H%M%S)}"
mkdir -p "$OUT_DIR"

run() {
  local name="$1"
  shift
  {
    echo "$ $*"
    "$@"
  } > "$OUT_DIR/$name.txt" 2>&1 || true
}

run_shell() {
  local name="$1"
  shift
  {
    echo "$ $*"
    sh -c "$*"
  } > "$OUT_DIR/$name.txt" 2>&1 || true
}

run uname uname -a
run os-release cat /etc/os-release
run lspci lspci -nn
run_shell lspci-display "lspci -nn | grep -Ei 'intel|display|vga|3d'"
run lsmod lsmod
run_shell lsmod-gpu "lsmod | grep -Ei 'xe|i915|drm'"
run xpu-smi-discovery xpu-smi discovery
run xpu-smi-topology xpu-smi topology -m
run ze-info ze_info
run clinfo clinfo
run python-version python3 --version
run pip-freeze python3 -m pip freeze
run torch-xpu python3 -c 'import torch; print("torch", torch.__version__); print("has_xpu", hasattr(torch, "xpu")); print("xpu_count", torch.xpu.device_count() if hasattr(torch, "xpu") else "n/a")'
run openvino-devices python3 -c 'import openvino as ov; print(ov.__version__); print(ov.Core().available_devices)'
run docker-version docker --version
run podman-version podman --version

cat > "$OUT_DIR/README.txt" <<EOF
Intel XPU snapshot created at $(date -Is)

Review files before sharing publicly.
Remove usernames, private paths, model names, hostnames, IPs, tokens, and any data you do not want public.
EOF

echo "Wrote $OUT_DIR"
