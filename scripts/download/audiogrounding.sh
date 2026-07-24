#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir audiogrounding)"
zenodo_record="${AUDIOGROUNDING_ZENODO_RECORD:-7269161}"
zenodo_api="https://zenodo.org/api/records/$zenodo_record"
repo_raw="${AUDIOGROUNDING_REPO_RAW_URL:-https://raw.githubusercontent.com/wsntxxn/TextToAudioGrounding/master}"

download_url "$zenodo_api" "$out/zenodo-record.json"
download_url "$repo_raw/README.md" "$out/repository-README.md"
download_url "$repo_raw/LICENSE" "$out/repository-LICENSE"
download_url \
  "https://api.github.com/repos/wsntxxn/TextToAudioGrounding" \
  "$out/github-repository.json"
download_url \
  "https://arxiv.org/abs/2607.10387" \
  "$out/recent-evaluation.html"

for split in train val test; do
  download_url \
    "$zenodo_api/files/$split.json/content" \
    "$out/$split.json"
done

if [[ "${AUDIOGROUNDING_DOWNLOAD_AUDIO:-0}" == "1" ]]; then
  download_url "$zenodo_api/files/audio.zip/content" "$out/audio.zip"
else
  cat <<'EOF'
Skipping the approximately 2.33 GiB audio archive.
Set AUDIOGROUNDING_DOWNLOAD_AUDIO=1 to download it.
EOF
fi

echo "AudioGrounding metadata and annotation download complete: $out"
