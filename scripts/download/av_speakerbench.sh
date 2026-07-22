#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir av_speakerbench)"
raw_base_url="${AV_SPEAKERBENCH_RAW_BASE_URL:-https://raw.githubusercontent.com/plnguyen2908/AV-SpeakerBench/master}"
repo_url="${AV_SPEAKERBENCH_REPO_URL:-https://github.com/plnguyen2908/AV-SpeakerBench.git}"
homepage_url="${AV_SPEAKERBENCH_HOMEPAGE_URL:-https://plnguyen2908.github.io/AV-SpeakerBench-project-page/}"
hf_repo="${AV_SPEAKERBENCH_HF_REPO:-plnguyen2908/AV-SpeakerBench}"

download_url "$homepage_url" "$out/project-page.html"
download_url "$raw_base_url/README.md" "$out/README.md"
download_url "https://huggingface.co/datasets/$hf_repo/raw/main/README.md" "$out/hf_README.md"

if [[ "${AV_SPEAKERBENCH_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/AV-SpeakerBench"
else
  echo "Skipping evaluation repo clone. Set AV_SPEAKERBENCH_CLONE_REPO=1 to clone/update it."
fi

if [[ "${AV_SPEAKERBENCH_DOWNLOAD_HF:-0}" != "1" ]]; then
  cat <<'EOF'
Downloaded AV-SpeakerBench docs only. The public Hugging Face snapshot uses
about 123 GB and contains aligned audio-only, visual-only, and audiovisual
clips, so it is opt-in.

Set AV_SPEAKERBENCH_DOWNLOAD_HF=1 to download the full dataset snapshot.
The project page and README state CC BY-NC 4.0, despite conflicting MIT front
matter on the HF card. Use the more restrictive terms and verify source-video
rights before redistribution or commercial use.
EOF
  echo "AV-SpeakerBench metadata download complete: $out"
  exit 0
fi

hf_download_dataset "$hf_repo" "$out/hf"

echo "AV-SpeakerBench requested download complete: $out"
