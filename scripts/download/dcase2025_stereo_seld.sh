#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir dcase2025_stereo_seld)"
dcase_url="${DCASE2025_STEREO_SELD_DCASE_URL:-https://dcase.community/challenge2025/task-stereo-sound-event-localization-and-detection-in-regular-video-content}"
record_url="${DCASE2025_STEREO_SELD_RECORD_URL:-https://zenodo.org/api/records/15559774}"
files_url="${DCASE2025_STEREO_SELD_FILES_URL:-https://zenodo.org/api/records/15559774/files}"
paper_url="${DCASE2025_STEREO_SELD_PAPER_URL:-https://arxiv.org/abs/2507.12042}"
generator_raw_url="${DCASE2025_STEREO_SELD_GENERATOR_RAW_URL:-https://raw.githubusercontent.com/SonyResearch/dcase2025_stereo_seld_data_generator/main}"
baseline_raw_url="${DCASE2025_STEREO_SELD_BASELINE_RAW_URL:-https://raw.githubusercontent.com/partha2409/DCASE2025_seld_baseline/main}"

download_url "$dcase_url" "$out/dcase-2025-task-3.html"
download_url "$record_url" "$out/zenodo-15559774.json"
download_url "$files_url/README.md/content" "$out/README.md"
download_url "$files_url/LICENSE/content" "$out/LICENSE"
download_url "$paper_url" "$out/arxiv-2507.12042.html"
download_url "$generator_raw_url/README.md" "$out/data-generator-README.md"
download_url "$generator_raw_url/LICENSE" "$out/data-generator-LICENSE"
download_url "$baseline_raw_url/README.md" "$out/baseline-README.md"

if [[ "${DCASE2025_STEREO_SELD_DOWNLOAD_METADATA:-0}" == "1" ]]; then
  download_url "$files_url/metadata_dev.zip/content" "$out/metadata_dev.zip"
else
  echo "Skipping development labels. Set DCASE2025_STEREO_SELD_DOWNLOAD_METADATA=1 to download them."
fi

cat <<MSG
DCASE2025 Task 3 Stereo SELD metadata download complete: $out

The complete public audio/video release is approximately 27.6 GB and is not
downloaded by this helper. Review the MIT terms and retrieve selected archives
from the official record:
https://zenodo.org/records/15559774
MSG
