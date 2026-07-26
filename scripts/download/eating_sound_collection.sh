#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir eating_sound_collection)"
kaggle_ref="${EATING_SOUND_COLLECTION_KAGGLE_REF:-mashijie/eating-sound-collection}"
kaggle_metadata_url="${EATING_SOUND_COLLECTION_METADATA_URL:-https://www.kaggle.com/api/v1/datasets/view/$kaggle_ref}"
repo_raw_url="${EATING_SOUND_COLLECTION_REPO_RAW_URL:-https://raw.githubusercontent.com/jsjm/EatingSoundClassification/master}"
paper_url="${EATING_SOUND_COLLECTION_PAPER_URL:-https://arxiv.org/abs/2607.15724}"

download_url "$kaggle_metadata_url" "$out/kaggle-metadata.json"
download_url "$repo_raw_url/README.md" "$out/baseline-README.md"
download_url "$repo_raw_url/LICENSE" "$out/baseline-LICENSE"
download_url "$paper_url" "$out/arxiv-2607.15724.html"

if [[ "${EATING_SOUND_COLLECTION_DOWNLOAD_DATA:-0}" != "1" ]]; then
  echo "Downloaded Eating Sound Collection metadata and documentation to: $out"
  echo "Set EATING_SOUND_COLLECTION_DOWNLOAD_DATA=1 to download the approximately 6.27 GiB Kaggle archive."
  echo "Kaggle labels the release PDDL, but its YouTube-derived clips retain unresolved source-media rights."
  exit 0
fi

require_cmd kaggle
mkdir -p "$out/kaggle"
kaggle datasets download --dataset "$kaggle_ref" --path "$out/kaggle"

echo "Eating Sound Collection Kaggle download complete: $out/kaggle"
echo "Review source-video copyright, performer/privacy rights, and YouTube terms before use."
