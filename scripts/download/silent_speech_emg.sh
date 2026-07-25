#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir silent_speech_emg)"
record_api="https://zenodo.org/api/records/4064408"
archive_url="https://zenodo.org/api/records/4064409/files/emg_data.tar.gz/content"
archive="$out/emg_data.tar.gz"
archive_md5="7f97d2182b896652999b1b2d0c69fd7b"

download_url "$record_api" "$out/zenodo-record.json"
download_url \
  "https://raw.githubusercontent.com/dgaddy/silent_speech/main/README.md" \
  "$out/README.md"
download_url \
  "https://raw.githubusercontent.com/dgaddy/silent_speech/main/LICENSE" \
  "$out/LICENSE"
download_url \
  "https://aclanthology.org/2020.emnlp-main.445/" \
  "$out/digital-voicing-paper.html"
download_url \
  "https://aclanthology.org/2021.acl-short.23/" \
  "$out/improved-model-paper.html"
download_url "https://arxiv.org/abs/2607.18629" "$out/cs-ets-paper.html"

if [[ "${SILENT_SPEECH_EMG_DOWNLOAD_ARCHIVE:-0}" != "1" ]]; then
  cat <<'EOF'
Downloaded Silent Speech EMG documentation and metadata only.

Set SILENT_SPEECH_EMG_DOWNLOAD_ARCHIVE=1 to download the approximately 3.92 GB
Zenodo corpus archive. The archive contains biometric facial EMG and voice
recordings; review attribution, privacy, and research-ethics obligations.
EOF
  echo "Silent Speech EMG metadata download complete: $out"
  exit 0
fi

download_url "$archive_url" "$archive"
if command -v md5sum >/dev/null 2>&1; then
  actual_md5="$(md5sum "$archive" | awk '{print $1}')"
elif command -v md5 >/dev/null 2>&1; then
  actual_md5="$(md5 -q "$archive")"
else
  echo "Missing required checksum command: md5sum or md5" >&2
  exit 127
fi
if [[ "$actual_md5" != "$archive_md5" ]]; then
  echo "Checksum mismatch for $archive" >&2
  echo "Expected MD5: $archive_md5" >&2
  echo "Actual MD5:   $actual_md5" >&2
  exit 1
fi

echo "Silent Speech EMG archive download complete and checksum verified: $archive"
