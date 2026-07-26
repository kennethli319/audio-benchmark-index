#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir compspoof_v2)"
hf_repo="${COMPSPOOF_V2_HF_REPO:-XuepingZhang/ESDD2-CompSpoof-V2}"

download_url \
  "https://huggingface.co/api/datasets/$hf_repo" \
  "$out/huggingface-dataset.json"
download_url \
  "https://raw.githubusercontent.com/XuepingZhang/ESDD2-Baseline/main/README.md" \
  "$out/baseline-README.md"
download_url \
  "https://api.github.com/repos/XuepingZhang/ESDD2-Baseline" \
  "$out/baseline-repository.json"
download_url \
  "https://arxiv.org/abs/2606.10791" \
  "$out/challenge-paper.html"
download_url \
  "https://arxiv.org/abs/2607.16369" \
  "$out/recent-evaluation.html"

if [[ "${COMPSPOOF_V2_DOWNLOAD_HF:-0}" != "1" ]]; then
  cat <<'EOF'
Downloaded CompSpoof V2 public documentation and repository metadata only.

The approximately 130.0 GB Hugging Face release is gated. Log in, review and
acknowledge its CC BY-NC 4.0 and upstream-source terms, and authenticate
locally before requesting the snapshot.

Set COMPSPOOF_V2_ACK_TERMS=1 and COMPSPOOF_V2_DOWNLOAD_HF=1 after acceptance.
EOF
  echo "CompSpoof V2 metadata download complete: $out"
  exit 0
fi

if [[ "${COMPSPOOF_V2_ACK_TERMS:-0}" != "1" ]]; then
  manual_required \
    "CompSpoof V2" \
    "Accept the Hugging Face access conditions and authenticate locally first." \
    "Dataset: https://huggingface.co/datasets/XuepingZhang/ESDD2-CompSpoof-V2" \
    "Then run:" \
    "  COMPSPOOF_V2_ACK_TERMS=1 COMPSPOOF_V2_DOWNLOAD_HF=1 scripts/download/compspoof_v2.sh"
fi

hf_download_dataset "$hf_repo" "$out/huggingface"
echo "CompSpoof V2 Hugging Face snapshot complete: $out/huggingface"
echo "Use is noncommercial; preserve every incorporated source's provenance and terms."
