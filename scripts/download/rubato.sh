#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir rubato)"
record_api="https://zenodo.org/api/records/21407832"

download_url "$record_api" "$out/zenodo-record.json"
download_url "$record_api/files/metadata_versions.csv/content" "$out/metadata_versions.csv"

if [[ "${RUBATO_DOWNLOAD_ARCHIVE:-0}" == "1" ]]; then
  download_url "$record_api/files/rubato.zip/content" "$out/rubato.zip"
else
  cat <<'EOF'
Downloaded the official Zenodo record and lightweight version metadata only.

Set RUBATO_DOWNLOAD_ARCHIVE=1 to fetch the approximately 6.26 GB archive.
Although Zenodo labels the deposition CC BY 3.0, metadata_versions.csv records
mixed per-recording terms, including non-commercial and NoDerivatives variants.
Review the license field for every recording you plan to use or redistribute.
EOF
fi

echo "RUBATO metadata download complete: $out"
