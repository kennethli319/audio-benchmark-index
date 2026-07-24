#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir spoofceleb)"
hf_repo="${SPOOFCELEB_HF_REPO:-jungjee/spoofceleb}"

download_url "https://jungjee.github.io/spoofceleb/" "$out/project.html"
download_url "https://huggingface.co/api/datasets/$hf_repo" "$out/huggingface-dataset.json"
download_url "https://arxiv.org/abs/2409.17285" "$out/paper.html"
download_url "https://arxiv.org/abs/2607.21127" "$out/recent-evaluation.html"

if [[ "${SPOOFCELEB_DOWNLOAD_HF:-0}" != "1" ]]; then
  cat <<'EOF'
Downloaded SpoofCeleb public documentation and repository metadata only.

The approximately 268.3 GB Hugging Face dataset is gated. Request access on
the official dataset page, agree to its terms, and authenticate locally before
requesting the snapshot.

Set SPOOFCELEB_ACK_TERMS=1 and SPOOFCELEB_DOWNLOAD_HF=1 after approval.
EOF
  echo "SpoofCeleb metadata download complete: $out"
  exit 0
fi

if [[ "${SPOOFCELEB_ACK_TERMS:-0}" != "1" ]]; then
  manual_required \
    "SpoofCeleb" \
    "Request author approval and accept the Hugging Face access terms first." \
    "Dataset: https://huggingface.co/datasets/jungjee/spoofceleb" \
    "After approval and local authentication, run:" \
    "  SPOOFCELEB_ACK_TERMS=1 SPOOFCELEB_DOWNLOAD_HF=1 scripts/download/spoofceleb.sh"
fi

hf_download_dataset "$hf_repo" "$out/huggingface"
echo "SpoofCeleb Hugging Face snapshot complete: $out/huggingface"
echo "Preserve attribution and review original video, voice, likeness, and privacy rights."
