#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir daps)"
zenodo_api="https://zenodo.org/api/records/4660670"
archive_url="https://zenodo.org/api/records/4660670/files/daps.tar.gz/content"
archive_md5="303c130b7ce2e02b59c7ca5cd595a89c"
evaluation_repo="https://github.com/HMC-MIR/AudioCrossVerification"

download_url \
  "https://ccrma.stanford.edu/~gautham/Site/daps.html" \
  "$out/owner-page.html"
download_url "$zenodo_api" "$out/zenodo-record.json"
download_url \
  "https://raw.githubusercontent.com/HMC-MIR/AudioCrossVerification/main/README.md" \
  "$out/audio-cross-verification-README.md"
download_url \
  "https://api.github.com/repos/HMC-MIR/AudioCrossVerification" \
  "$out/audio-cross-verification-repository.json"

if [[ "${DAPS_CLONE_CROSS_VERIFICATION:-0}" == "1" ]]; then
  clone_or_update "$evaluation_repo" "$out/AudioCrossVerification"
else
  echo "Skipping the optional AudioCrossVerification notebook repository."
  echo "Set DAPS_CLONE_CROSS_VERIFICATION=1 to clone it."
fi

if [[ "${DAPS_DOWNLOAD_ARCHIVE:-0}" == "1" ]]; then
  download_url "$archive_url" "$out/daps.tar.gz"

  if command -v md5sum >/dev/null 2>&1; then
    actual_md5="$(md5sum "$out/daps.tar.gz" | awk '{print $1}')"
  elif command -v md5 >/dev/null 2>&1; then
    actual_md5="$(md5 -q "$out/daps.tar.gz")"
  else
    echo "Missing required checksum command: md5sum or md5" >&2
    exit 127
  fi

  if [[ "$actual_md5" != "$archive_md5" ]]; then
    echo "DAPS archive checksum mismatch." >&2
    echo "Expected MD5: $archive_md5" >&2
    echo "Actual MD5:   $actual_md5" >&2
    exit 1
  fi
  echo "DAPS archive checksum verified."
else
  echo "Skipping the approximately 14.95 GiB DAPS corpus archive."
  echo "Set DAPS_DOWNLOAD_ARCHIVE=1 to download it."
fi

cat <<MSG
DAPS metadata download complete: $out

The Zenodo corpus is CC BY-NC 4.0. The separate cross-verification repository
does not state a code license, and its randomized paper-specific trial
instances are not released as fixed manifests.
MSG
