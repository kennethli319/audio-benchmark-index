#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir fleurs_slu)"
repo="https://github.com/fdschmidt93/fleurs-slu"

download_url "https://arxiv.org/abs/2501.06117" "$out/paper.html"
download_url "$repo" "$out/project.html"
download_url "https://api.github.com/repos/fdschmidt93/fleurs-slu" \
  "$out/repository.json"
download_url \
  "https://raw.githubusercontent.com/fdschmidt93/fleurs-slu/main/README.md" \
  "$out/repository-README.md"

for dataset in sib-fleurs belebele-fleurs; do
  download_url \
    "https://huggingface.co/datasets/WueNLP/$dataset/raw/main/README.md" \
    "$out/$dataset-README.md"
  download_url \
    "https://huggingface.co/api/datasets/WueNLP/$dataset" \
    "$out/$dataset-repository.json"
done

if [[ "${FLEURS_SLU_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo.git" "$out/repository"
fi

dataset="${FLEURS_SLU_DATASET:-}"
config="${FLEURS_SLU_CONFIG:-}"
if [[ -n "$dataset" || -n "$config" ]]; then
  if [[ "$dataset" != "sib" && "$dataset" != "belebele" ]]; then
    echo "FLEURS_SLU_DATASET must be 'sib' or 'belebele'." >&2
    exit 2
  fi
  if [[ -z "$config" || ! "$config" =~ ^[A-Za-z0-9_-]+$ ]]; then
    echo "Set FLEURS_SLU_CONFIG to one language-script config, such as eng_Latn." >&2
    exit 2
  fi
  case "$dataset" in
    sib) repo_id="WueNLP/sib-fleurs" ;;
    belebele) repo_id="WueNLP/belebele-fleurs" ;;
  esac
  hf_download_dataset "$repo_id" "$out/$dataset/$config" \
    --include "data/$config/**"
fi

cat <<EOF
Fleurs-SLU metadata download complete: $out

The public SIB-Fleurs and Belebele-Fleurs snapshots are approximately 157.2 GB
and 223.4 GB. Set FLEURS_SLU_DATASET and FLEURS_SLU_CONFIG together to fetch
one explicit language-script configuration; this helper never downloads the
complete family by default.
EOF
