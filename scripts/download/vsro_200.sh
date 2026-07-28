#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir vsro_200)"
hf_base="${VSRO_200_HF_BASE:-https://huggingface.co/datasets/vsro200/vsro200}"
repo_url="${VSRO_200_REPO_URL:-https://github.com/vsro200/vsro200.git}"

download_url "$hf_base/raw/main/README.md" "$out/README.md"
download_url "https://huggingface.co/api/datasets/vsro200/vsro200" "$out/huggingface-dataset.json"

for manifest in trainval_annot.csv trainval_auto.csv test_seen.csv test_unseen.csv test_ood.csv; do
  download_url "$hf_base/resolve/main/$manifest?download=true" "$out/$manifest"
done

if [[ "${VSRO_200_CLONE_TOOLKIT:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/toolkit"
else
  echo "Skipping the reconstruction and evaluation toolkit. Set VSRO_200_CLONE_TOOLKIT=1 to clone it."
fi

cat <<MSG
VSRo-200 metadata download complete: $out

The release contains metadata, not the referenced YouTube media. The dataset
card declares CC BY-NC 4.0, while the paper says CC BY-NC-SA 4.0. Both are
noncommercial; review the discrepancy and upstream media rights before reuse.
MSG
