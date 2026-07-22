#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir video_mme)"
raw_base="${VIDEO_MME_RAW_BASE_URL:-https://raw.githubusercontent.com/MME-Benchmarks/Video-MME/main}"
repo_url="${VIDEO_MME_REPO_URL:-https://github.com/MME-Benchmarks/Video-MME.git}"
hf_repo="${VIDEO_MME_HF_REPO:-lmms-lab/Video-MME}"

download_url "$raw_base/README.md" "$out/README.md"
download_url "https://huggingface.co/datasets/$hf_repo/raw/main/README.md" "$out/hf_README.md"

if [[ "${VIDEO_MME_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/Video-MME"
else
  echo "Skipping evaluation repo clone. Set VIDEO_MME_CLONE_REPO=1 to clone/update it."
fi

if [[ "${VIDEO_MME_DOWNLOAD_HF:-0}" != "1" ]]; then
  cat <<'EOF'
Downloaded Video-MME documentation only. The public Hugging Face repository
uses about 389 GB. Its custom terms limit use to academic research, prohibit
commercial use, and require prior approval for distribution, publication,
copying, dissemination, or modification.

After reviewing the official README, set both VIDEO_MME_ACK_TERMS=1 and
VIDEO_MME_DOWNLOAD_HF=1 to request the full snapshot.
EOF
  echo "Video-MME metadata download complete: $out"
  exit 0
fi

if [[ "${VIDEO_MME_ACK_TERMS:-0}" != "1" ]]; then
  manual_required "Video-MME" \
    "Review the academic-only and no-redistribution terms in $out/README.md." \
    "Then set VIDEO_MME_ACK_TERMS=1 together with VIDEO_MME_DOWNLOAD_HF=1."
fi

hf_download_dataset "$hf_repo" "$out/hf"

echo "Video-MME requested download complete: $out"
