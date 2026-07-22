#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir tau_nigens_sse_2021)"
record_url="${TAU_NIGENS_SSE_2021_RECORD_URL:-https://zenodo.org/api/records/4844825}"
dcase_url="${TAU_NIGENS_SSE_2021_DCASE_URL:-https://dcase.community/challenge2021/task-sound-event-localization-and-detection}"
paper_url="${TAU_NIGENS_SSE_2021_PAPER_URL:-https://arxiv.org/pdf/2106.06999}"
files_url="${TAU_NIGENS_SSE_2021_FILES_URL:-https://zenodo.org/api/records/4844825/files}"

download_url "$record_url" "$out/zenodo-4844825.json"
download_url "$dcase_url" "$out/dcase-2021-task-3.html"
download_url "$paper_url" "$out/2106.06999.pdf"
download_url "$files_url/README.md/content" "$out/README.md"

if [[ "${TAU_NIGENS_SSE_2021_DOWNLOAD_METADATA:-0}" == "1" ]]; then
  download_url "$files_url/metadata_dev.zip/content" "$out/metadata_dev.zip"
else
  echo "Skipping development labels. Set TAU_NIGENS_SSE_2021_DOWNLOAD_METADATA=1 to download them."
fi

cat <<MSG
TAU-NIGENS Spatial Sound Events 2021 metadata download complete: $out

The audio archives total approximately 14.2 GiB and are not downloaded by this
helper. Review the CC BY-NC 4.0 terms and retrieve them from the official record:
https://zenodo.org/records/4844825
MSG
