#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir avscapbench)"
base="https://huggingface.co/datasets/NJU-LINK/AVSCapBench"

download_url "$base/raw/main/README.md" "$out/README.md"
download_url "https://huggingface.co/api/datasets/NJU-LINK/AVSCapBench" "$out/huggingface-api.json"
download_url "https://raw.githubusercontent.com/NJU-LINK/AVSCap/main/README.md" "$out/evaluation-README.md"
download_url "https://api.github.com/repos/NJU-LINK/AVSCap" "$out/github-api.json"

if [[ "${AVSCAPBENCH_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset "NJU-LINK/AVSCapBench" "$out/hf"
else
  cat <<'EOF'
Downloaded official metadata only.

Set AVSCAPBENCH_DOWNLOAD_HF=1 to fetch the public, ungated Hugging Face
snapshot (approximately 19.6 GB). The card declares CC BY-NC-SA 4.0, while
the paper limits use to academic research; source-video rights also apply.
EOF
fi

echo "AVSCapBench metadata download complete: $out"
