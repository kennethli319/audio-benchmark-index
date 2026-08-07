#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir affectdf)"
hf_repo="${AFFECTDF_HF_REPO:-AffectDF/AffectDF_EmotionSDD}"
hf_base="https://huggingface.co/datasets/$hf_repo"

download_url "$hf_base/raw/main/README.md" "$out/README.md"
download_url "https://huggingface.co/api/datasets/$hf_repo" "$out/huggingface_api.json"
download_url "https://huggingface.co/api/datasets/$hf_repo/tree/main?recursive=false&expand=true" "$out/huggingface_tree.json"
download_url "https://raw.githubusercontent.com/affectdf33-data/codes/main/README.md" "$out/evaluation-outputs-README.md"
download_url "https://api.github.com/repos/affectdf33-data/codes" "$out/evaluation-outputs-api.json"
download_url "https://arxiv.org/abs/2608.05507" "$out/paper.html"

if [[ "${AFFECTDF_DOWNLOAD_PROTOCOLS:-0}" == "1" ]]; then
  hf_download_dataset "$hf_repo" "$out/huggingface" --include Protocols.tar.gz
fi

if [[ "${AFFECTDF_DOWNLOAD_AUDIO:-0}" == "1" ]]; then
  splits="${AFFECTDF_SPLITS:-}"
  if [[ -z "$splits" ]]; then
    echo "Set AFFECTDF_SPLITS to one or more of: Train Dev Test" >&2
    exit 2
  fi
  for split in $splits; do
    case "$split" in
      Train|Dev|Test)
        hf_download_dataset "$hf_repo" "$out/huggingface" --include "$split.tar.gz"
        ;;
      *)
        echo "Unknown AffectDF split: $split (expected Train, Dev, or Test)" >&2
        exit 2
        ;;
    esac
  done
fi

cat <<EOF
Downloaded AffectDF documentation and release metadata to: $out

Set AFFECTDF_DOWNLOAD_PROTOCOLS=1 for the approximately 1.0 MB protocol
archive. Audio is approximately 40.2 GB total and requires both
AFFECTDF_DOWNLOAD_AUDIO=1 and an explicit AFFECTDF_SPLITS selection.
The dataset is CC BY-NC 4.0 subject to source-corpus and generation-model terms;
the separate evaluation-output repository does not state a code/data license.
EOF
