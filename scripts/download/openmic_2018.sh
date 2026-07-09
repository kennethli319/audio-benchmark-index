#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir openmic_2018)"
record_url="${OPENMIC_RECORD_URL:-https://zenodo.org/api/records/1432913}"
repo_raw="${OPENMIC_REPO_RAW:-https://raw.githubusercontent.com/cosmir/openmic-2018/master}"
archive_url="${OPENMIC_ARCHIVE_URL:-https://zenodo.org/api/records/1432913/files/openmic-2018-v1.0.0.tgz/content}"

download_url "$record_url" "$out/zenodo-record.json"
download_url "$repo_raw/README.md" "$out/README.md"

if [[ "${OPENMIC_DOWNLOAD_ARCHIVE:-0}" != "1" ]]; then
  echo "Skipping OpenMIC-2018 full archive (about 2.6 GiB). Set OPENMIC_DOWNLOAD_ARCHIVE=1 to download it."
  exit 0
fi

download_url "$archive_url" "$out/openmic-2018-v1.0.0.tgz"

echo "OpenMIC-2018 download complete: $out"
