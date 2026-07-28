#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir msrbench)"
repo="https://github.com/yongyizang/MSRKit"
raw="https://raw.githubusercontent.com/yongyizang/MSRKit/main"
dataset="yongyizang/MSRBench"

download_url "https://msrchallenge.com/" "$out/challenge.html"
download_url "https://arxiv.org/abs/2510.10995" "$out/paper.html"
download_url "https://export.arxiv.org/api/query?id_list=2510.10995" \
  "$out/paper-metadata.xml"
download_url "https://huggingface.co/datasets/$dataset/raw/main/README.md" \
  "$out/dataset-card.md"
download_url "https://huggingface.co/api/datasets/$dataset" \
  "$out/dataset-metadata.json"
download_url "https://api.github.com/repos/yongyizang/MSRKit" \
  "$out/repository.json"
download_url "$raw/README.md" "$out/toolkit-README.md"
download_url "$raw/LICENSE" "$out/toolkit-LICENSE"

if [[ "${MSRBENCH_CLONE_TOOLKIT:-0}" == "1" ]]; then
  clone_or_update "$repo.git" "$out/MSRKit"
fi

if [[ -n "${MSRBENCH_STEM:-}" ]]; then
  case "$MSRBENCH_STEM" in
    Bass | Drums | Guitars | Keyboards | "Orchestral Elements" | Percussions | Synthesizers | Vocals)
      ;;
    *)
      echo "Invalid MSRBENCH_STEM: $MSRBENCH_STEM" >&2
      echo "Choose one of: Bass, Drums, Guitars, Keyboards, Orchestral Elements, Percussions, Synthesizers, Vocals" >&2
      exit 2
      ;;
  esac
  hf_download_dataset "$dataset" "$out/audio" --include "$MSRBENCH_STEM.zip"
fi

cat <<EOF
MSRBench documentation download complete: $out

The public dataset is approximately 28.4 GB on Hugging Face and is licensed
CC BY-NC 4.0. To download one large instrument archive, set MSRBENCH_STEM to
an exact class name such as Vocals. The MIT license applies to MSRKit code,
not to the benchmark audio.
EOF
