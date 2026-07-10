#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir epic_sounds)"
raw_base="${EPIC_SOUNDS_RAW_BASE_URL:-https://raw.githubusercontent.com/epic-kitchens/epic-sounds-annotations/main}"
repo_url="${EPIC_SOUNDS_ANNOTATIONS_REPO_URL:-https://github.com/epic-kitchens/epic-sounds-annotations.git}"
homepage_url="${EPIC_SOUNDS_HOMEPAGE_URL:-https://epic-kitchens.github.io/epic-sounds/site}"
landing_url="${EPIC_SOUNDS_LANDING_URL:-https://epic-kitchens.github.io/epic-sounds/}"

download_url "$homepage_url" "$out/epic-sounds-homepage.html"
download_url "$landing_url" "$out/epic-sounds-landing.html"
download_url "$raw_base/README.md" "$out/README.md"

for file in \
  EPIC_Sounds_train.csv \
  EPIC_Sounds_validation.csv \
  EPIC_Sounds_recognition_test_timestamps.csv \
  EPIC_Sounds_detection_test_videos.csv \
  sound_events_not_categorised.csv
do
  download_url "$raw_base/$file" "$out/$file"
done

if [[ "${EPIC_SOUNDS_DOWNLOAD_PICKLES:-0}" == "1" ]]; then
  for file in \
    EPIC_Sounds_train.pkl \
    EPIC_Sounds_validation.pkl \
    EPIC_Sounds_recognition_test_timestamps.pkl \
    sound_events_not_categorised.pkl
  do
    download_url "$raw_base/$file" "$out/$file"
  done
else
  echo "Skipping EPIC-SOUNDS pickle annotations. Set EPIC_SOUNDS_DOWNLOAD_PICKLES=1 to download them."
fi

if [[ "${EPIC_SOUNDS_CLONE_ANNOTATIONS:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/epic-sounds-annotations"
else
  echo "Skipping EPIC-SOUNDS annotation repository clone. Set EPIC_SOUNDS_CLONE_ANNOTATIONS=1 to clone it."
fi

cat <<MSG
EPIC-SOUNDS docs and CSV annotations download complete: $out

Raw audio is not redistributed as a standalone public archive. The official
README points users to EPIC-KITCHENS-100 video download scripts and audio
extraction instructions, or to contact the maintainers for HDF5 access.
MSG
