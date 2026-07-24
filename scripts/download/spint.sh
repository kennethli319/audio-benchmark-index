#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir spint)"
record_id="${SPINT_RECORD_ID:-20763580}"
api_base="${SPINT_API_BASE_URL:-https://zenodo.org/api/records/$record_id}"

download_url "$api_base" "$out/zenodo-record.json"
download_url "$api_base/files/README.md/content" "$out/README.md"
download_url "$api_base/files/Generate_Stimuli.py/content" "$out/Generate_Stimuli.py"
download_url "$api_base/files/SpInt.json/content" "$out/SpInt.json"

if [[ "${SPINT_DOWNLOAD_ARCHIVES:-0}" == "1" ]]; then
  parts="${SPINT_PARTS:-noise masks}"
  for part in $parts; do
    case "$part" in
      noise)
        download_url "$api_base/files/Noise.zip/content" "$out/Noise.zip"
        ;;
      masks)
        download_url "$api_base/files/Masks.zip/content" "$out/Masks.zip"
        ;;
      *)
        echo "Unknown SpInt part: $part (expected noise or masks)" >&2
        exit 2
        ;;
    esac
  done
else
  echo "Skipping SpInt archives. Set SPINT_DOWNLOAD_ARCHIVES=1 to fetch selected parts."
fi

cat <<'EOF'
SpInt metadata download complete.

The release excludes the clean Spanish Matrix Test speech. Obtain that corpus
under its own terms before using Generate_Stimuli.py to reconstruct stimuli.
EOF

echo "SpInt files are in: $out"
