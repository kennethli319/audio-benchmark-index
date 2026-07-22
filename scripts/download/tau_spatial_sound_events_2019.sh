#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir tau_spatial_sound_events_2019)"
development_record_url="${TAU_SSE_2019_DEVELOPMENT_RECORD_URL:-https://zenodo.org/api/records/2599196}"
evaluation_record_url="${TAU_SSE_2019_EVALUATION_RECORD_URL:-https://zenodo.org/api/records/3377088}"
dcase_url="${TAU_SSE_2019_DCASE_URL:-https://dcase.community/challenge2019/task-sound-event-localization-and-detection}"
paper_url="${TAU_SSE_2019_PAPER_URL:-https://arxiv.org/pdf/1905.08546}"
development_files_url="${TAU_SSE_2019_DEVELOPMENT_FILES_URL:-https://zenodo.org/api/records/2599196/files}"
evaluation_files_url="${TAU_SSE_2019_EVALUATION_FILES_URL:-https://zenodo.org/api/records/3377088/files}"
repo_readme_url="${TAU_SSE_2019_REPO_README_URL:-https://raw.githubusercontent.com/sharathadavanne/seld-dcase2019/master/README.md}"
repo_license_url="${TAU_SSE_2019_REPO_LICENSE_URL:-https://raw.githubusercontent.com/sharathadavanne/seld-dcase2019/master/LICENSE.md}"

download_url "$development_record_url" "$out/zenodo-2599196.json"
download_url "$evaluation_record_url" "$out/zenodo-3377088.json"
download_url "$dcase_url" "$out/dcase-2019-task-3.html"
download_url "$paper_url" "$out/1905.08546.pdf"
download_url "$development_files_url/README.md/content" "$out/development-README.md"
download_url "$development_files_url/LICENSE/content" "$out/development-LICENSE"
download_url "$evaluation_files_url/README.md/content" "$out/evaluation-README.md"
download_url "$evaluation_files_url/LICENSE.md/content" "$out/evaluation-LICENSE.md"
download_url "$repo_readme_url" "$out/baseline-README.md"
download_url "$repo_license_url" "$out/baseline-LICENSE.md"

if [[ "${TAU_SSE_2019_DOWNLOAD_METADATA:-0}" == "1" ]]; then
  download_url "$development_files_url/metadata_dev.zip/content" "$out/metadata_dev.zip"
  download_url "$evaluation_files_url/metadata_eval.zip/content" "$out/metadata_eval.zip"
else
  echo "Skipping label archives. Set TAU_SSE_2019_DOWNLOAD_METADATA=1 to download them."
fi

cat <<MSG
TAU Spatial Sound Events 2019 metadata download complete: $out

The audio archives total approximately 10.1 GB and are not downloaded by this
helper. Review the custom experimental/non-commercial terms and retrieve audio
from the official Zenodo records 2599196 and 3377088.
MSG
