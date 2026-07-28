#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir audiblelight_eigenmike32)"
hf_repo="${AUDIBLELIGHT_HF_REPO:-PhilippXXY/AudibleLight_Eigenmike32-5_DCASE-STARSS23_Dataset}"
benchmark_raw="${AUDIBLELIGHT_BENCHMARK_RAW_URL:-https://raw.githubusercontent.com/PhilippXXY/upsampler-lam-benchmarking/v1.0.1}"

download_url "https://huggingface.co/datasets/$hf_repo/raw/main/README.md" "$out/hf-README.md"
download_url "https://huggingface.co/api/datasets/$hf_repo" "$out/hf-api.json"
download_url "https://arxiv.org/abs/2607.24463" "$out/arxiv-2607.24463.html"
download_url "$benchmark_raw/README.md" "$out/benchmark-README.md"
download_url "https://zenodo.org/api/records/19735049" "$out/benchmark-zenodo.json"
download_url "https://zenodo.org/api/records/18607188" "$out/generator-zenodo.json"

if [[ "${AUDIBLELIGHT_DOWNLOAD_HF:-0}" != "1" ]]; then
  cat <<'EOF'
Downloaded AudibleLight documentation and API metadata only. The Hugging Face
API reports about 57.1 GB of repository storage. Its card declares only the
ambiguous license identifier "cc"; ESC-50 and Gibson upstream terms also apply.

Set AUDIBLELIGHT_DOWNLOAD_HF=1 to request the full public snapshot.
EOF
  echo "AudibleLight metadata download complete: $out"
  exit 0
fi

hf_download_dataset "$hf_repo" "$out/hf"

echo "AudibleLight requested download complete: $out"
