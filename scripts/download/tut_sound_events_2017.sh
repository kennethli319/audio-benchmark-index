#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir tut_sound_events_2017)"
dev_base="${TUT_SOUND_EVENTS_2017_DEV_BASE_URL:-https://zenodo.org/api/records/814831}"
eval_base="${TUT_SOUND_EVENTS_2017_EVAL_BASE_URL:-https://zenodo.org/api/records/1040179}"

download_url "$dev_base" "$out/development-record.json"
download_url "$eval_base" "$out/evaluation-record.json"
download_url "$dev_base/files/TUT-sound-events-2017-development.doc.zip/content" \
  "$out/TUT-sound-events-2017-development.doc.zip"
download_url "$dev_base/files/TUT-sound-events-2017-development.meta.zip/content" \
  "$out/TUT-sound-events-2017-development.meta.zip"
download_url "$eval_base/files/TUT-sound-events-2017-evaluation.doc.zip/content" \
  "$out/TUT-sound-events-2017-evaluation.doc.zip"
download_url "$eval_base/files/TUT-sound-events-2017-evaluation.meta.zip/content" \
  "$out/TUT-sound-events-2017-evaluation.meta.zip"

if [[ "${TUT_SOUND_EVENTS_2017_DOWNLOAD_AUDIO:-0}" == "1" ]]; then
  download_url "$dev_base/files/TUT-sound-events-2017-development.audio.1.zip/content" \
    "$out/TUT-sound-events-2017-development.audio.1.zip"
  download_url "$dev_base/files/TUT-sound-events-2017-development.audio.2.zip/content" \
    "$out/TUT-sound-events-2017-development.audio.2.zip"
  download_url "$eval_base/files/TUT-sound-events-2017-evaluation.audio.zip/content" \
    "$out/TUT-sound-events-2017-evaluation.audio.zip"
else
  cat <<EOF
Skipping the approximately 1.55 GiB development and evaluation audio archives.
Set TUT_SOUND_EVENTS_2017_DOWNLOAD_AUDIO=1 to download them from Zenodo.
EOF
fi

echo "TUT Sound Events 2017 metadata download complete: $out"
