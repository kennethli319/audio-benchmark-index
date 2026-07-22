#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir ava_active_speaker)"
repo_raw="${AVA_ACTIVE_SPEAKER_RAW_BASE_URL:-https://raw.githubusercontent.com/cvdfoundation/ava-dataset/master}"
annotation_base="${AVA_ACTIVE_SPEAKER_ANNOTATION_BASE_URL:-https://s3.amazonaws.com/ava-dataset/annotations}"

download_url "$repo_raw/README.md" "$out/README.md"
download_url "https://research.google.com/ava/" "$out/ava-homepage.html"
download_url "https://research.google.com/ava/download.html" "$out/ava-download.html"
download_url "https://arxiv.org/abs/1901.01342" "$out/arxiv-1901.01342.html"
download_url "$annotation_base/ava_speech_file_names_v1.txt" "$out/ava_speech_file_names_v1.txt"

if [[ "${AVA_ACTIVE_SPEAKER_DOWNLOAD_LABELS:-0}" == "1" ]]; then
  download_url "$annotation_base/ava_activespeaker_train_v1.0.tar.bz2" "$out/ava_activespeaker_train_v1.0.tar.bz2"
  download_url "$annotation_base/ava_activespeaker_val_v1.0.tar.bz2" "$out/ava_activespeaker_val_v1.0.tar.bz2"
else
  echo "Skipping the approximately 23 MB label archives. Set AVA_ACTIVE_SPEAKER_DOWNLOAD_LABELS=1 to fetch them."
fi

cat <<MSG
AVA Active Speaker metadata download complete: $out

The source AVA movie clips are much larger and are not fetched by this helper.
Review Google's CC BY 4.0 dataset notice, preserve attribution, and check the
underlying media terms before downloading or redistributing videos.
MSG
