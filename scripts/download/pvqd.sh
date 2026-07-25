#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir pvqd)"
dataset_id="${PVQD_DATASET_ID:-9dz247gnyb}"
version="${PVQD_VERSION:-4}"
api_url="https://data.mendeley.com/public-api/datasets/$dataset_id"

download_url \
  "https://data.mendeley.com/datasets/$dataset_id/$version" \
  "$out/dataset.html"
download_url \
  "https://api.datacite.org/dois/10.17632/$dataset_id.$version" \
  "$out/datacite.json"
download_url "$api_url" "$out/mendeley-api.json"

if [[ "${PVQD_DOWNLOAD_ANNOTATIONS:-0}" != "1" &&
      "${PVQD_DOWNLOAD_ALL:-0}" != "1" ]]; then
  cat <<'EOF'
Downloaded PVQD's official page, DataCite record, and live file manifest only.

Set PVQD_DOWNLOAD_ANNOTATIONS=1 to download the approximately 0.6 MiB PDF/XLSX
documentation and ratings. Set PVQD_DOWNLOAD_ALL=1 to download the complete
approximately 514.5 MiB release, including identifiable clinical voice audio.
EOF
  echo "PVQD metadata download complete: $out"
  exit 0
fi

require_cmd jq
if [[ "${PVQD_DOWNLOAD_ALL:-0}" == "1" ]]; then
  filter='true'
  destination="$out/release"
else
  filter='(.filename | test("\\.(pdf|xlsx)$"; "i"))'
  destination="$out/annotations"
fi

while IFS=$'\t' read -r filename url; do
  [[ -n "$filename" && -n "$url" ]] || continue
  download_url "$url" "$destination/$filename"
done < <(jq -r ".files[] | select($filter) |
  [.filename, .content_details.download_url] | @tsv" "$out/mendeley-api.json")

echo "PVQD selected files download complete: $destination"
