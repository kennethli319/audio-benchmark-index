#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir slue)"
raw_base="${SLUE_RAW_BASE_URL:-https://raw.githubusercontent.com/asappresearch/slue-toolkit/main}"
repo_url="${SLUE_REPO_URL:-https://github.com/asappresearch/slue-toolkit.git}"

download_url "https://asappresearch.github.io/slue-toolkit/" "$out/homepage.html"
download_url "$raw_base/README.md" "$out/README.md"
download_url "$raw_base/LICENSE" "$out/LICENSE"
download_url "https://papers-slue.awsdev.asapp.com/slue-voxpopuli_LICENSE" "$out/slue-voxpopuli_LICENSE"
download_url "https://papers-slue.awsdev.asapp.com/slue-voxceleb_LICENSE" "$out/slue-voxceleb_LICENSE"

if [[ "${SLUE_CLONE_TOOLKIT:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/slue-toolkit"
else
  echo "Skipping SLUE toolkit clone. Set SLUE_CLONE_TOOLKIT=1 to clone/update it."
fi

if [[ "${SLUE_DOWNLOAD_HF:-0}" != "1" ]]; then
  cat <<'MSG'
Skipping SLUE Hugging Face dataset snapshots. Set SLUE_DOWNLOAD_HF=1 to download them.
Options:
  SLUE_DATASETS="slue slue-phase-2"
MSG
  echo "SLUE metadata/license download complete: $out"
  exit 0
fi

for dataset in ${SLUE_DATASETS:-slue slue-phase-2}; do
  case "$dataset" in
    slue|slue-phase-2)
      hf_download_dataset "asapp/$dataset" "$out/$dataset"
      ;;
    *)
      echo "Unsupported SLUE dataset: $dataset" >&2
      echo "Use SLUE_DATASETS with any of: slue slue-phase-2." >&2
      exit 2
      ;;
  esac
done

echo "SLUE download complete: $out"
