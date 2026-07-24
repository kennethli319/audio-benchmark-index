#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir mlc_slm_eval)"
hf_repo="${MLC_SLM_EVAL_HF_REPO:-bsmu/MLC-SLM-Eval}"
repo_api="${MLC_SLM_EVAL_REPO_API_URL:-https://api.github.com/repos/mubingshen/MLC-SLM-Baseline}"

download_url "https://huggingface.co/datasets/$hf_repo/raw/main/README.md" "$out/hf_README.md"
download_url "https://huggingface.co/api/datasets/$hf_repo" "$out/hf-dataset.json"
download_url "https://raw.githubusercontent.com/mubingshen/MLC-SLM-Baseline/main/README.md" "$out/baseline_README.md"
download_url "$repo_api" "$out/github-repo.json"
download_url "https://arxiv.org/abs/2509.13785" "$out/paper.html"

if [[ "${MLC_SLM_EVAL_DOWNLOAD_HF:-0}" != "1" ]]; then
  cat <<'EOF'
Downloaded MLC-SLM Eval documentation and repository metadata only.

Set MLC_SLM_EVAL_DOWNLOAD_HF=1 to download the approximately 6.55 MB public
ground-truth repository. It contains Eval-1 and Eval-2 segmentation, speaker
labels, and transcriptions, but no audio. Challenge participants previously
received evaluation recordings; the reviewed official sources provide no
current public audio URL or audio-license terms.
EOF
  echo "MLC-SLM Eval metadata download complete: $out"
  exit 0
fi

hf_download_dataset "$hf_repo" "$out/hf"
echo "MLC-SLM Eval annotation download complete: $out"
