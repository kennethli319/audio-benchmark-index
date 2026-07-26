#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir emopia)"
archive="$out/EMOPIA_1.0.zip"
archive_md5="8f760ddcc014d144f1e2c5451bf003ac"

download_url \
  "https://raw.githubusercontent.com/annahung31/EMOPIA/main/README.md" \
  "$out/README.md"
download_url \
  "https://raw.githubusercontent.com/annahung31/EMOPIA/main/LICENSE" \
  "$out/LICENSE"
download_url \
  "https://api.github.com/repos/annahung31/EMOPIA" \
  "$out/github-repository.json"
download_url \
  "https://zenodo.org/api/records/5090631" \
  "$out/zenodo-record.json"

if [[ "${EMOPIA_DOWNLOAD_DATA:-0}" != "1" ]]; then
  echo "EMOPIA metadata download complete: $out"
  echo "Set EMOPIA_DOWNLOAD_DATA=1 to download the approximately 5.5 MB MIDI archive."
  exit 0
fi

download_url \
  "https://zenodo.org/api/records/5090631/files/EMOPIA_1.0.zip/content" \
  "$archive"

if command -v md5sum >/dev/null 2>&1; then
  actual_md5="$(md5sum "$archive" | awk '{print $1}')"
elif command -v md5 >/dev/null 2>&1; then
  actual_md5="$(md5 -q "$archive")"
else
  echo "Missing required checksum command: md5sum or md5" >&2
  exit 127
fi

if [[ "$actual_md5" != "$archive_md5" ]]; then
  echo "EMOPIA archive checksum mismatch." >&2
  echo "Expected MD5: $archive_md5" >&2
  echo "Actual MD5:   $actual_md5" >&2
  exit 1
fi

echo "EMOPIA archive download complete and checksum verified: $archive"
