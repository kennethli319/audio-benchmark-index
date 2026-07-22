#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir tau_nigens_sse_2020)"
record_url="${TAU_NIGENS_SSE_2020_RECORD_URL:-https://zenodo.org/api/records/4064792}"
dcase_url="${TAU_NIGENS_SSE_2020_DCASE_URL:-https://dcase.community/challenge2020/task-sound-event-localization-and-detection}"
paper_url="${TAU_NIGENS_SSE_2020_PAPER_URL:-https://arxiv.org/pdf/2006.01919}"
files_url="${TAU_NIGENS_SSE_2020_FILES_URL:-https://zenodo.org/api/records/4064792/files}"

download_url "$record_url" "$out/zenodo-4064792.json"
download_url "$dcase_url" "$out/dcase-2020-task-3.html"
download_url "$paper_url" "$out/2006.01919.pdf"
download_url "$files_url/README.md/content" "$out/README.md"

if [[ "${TAU_NIGENS_SSE_2020_DOWNLOAD_METADATA:-0}" == "1" ]]; then
  download_url "$files_url/metadata_dev.zip/content" "$out/metadata_dev.zip"
  download_url "$files_url/metadata_eval.zip/content" "$out/metadata_eval.zip"
else
  echo "Skipping label archives. Set TAU_NIGENS_SSE_2020_DOWNLOAD_METADATA=1 to download them."
fi

cat <<MSG
TAU-NIGENS Spatial Sound Events 2020 metadata download complete: $out

The audio archives total approximately 14.0 GB and are not downloaded by this
helper. Review the CC BY-NC 4.0 terms and retrieve them from the official record:
https://zenodo.org/records/4064792
MSG
