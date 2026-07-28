#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir codecfake)"
repo_url="${CODECFAKE_REPO_URL:-https://github.com/xieyuankun/Codecfake}"
paper_url="${CODECFAKE_PAPER_URL:-https://arxiv.org/abs/2405.04880}"
zenodo_base="${CODECFAKE_ZENODO_API_BASE:-https://zenodo.org/api/records}"

download_url "$repo_url" "$out/repository.html"
download_url "$repo_url/raw/main/README.md" "$out/README.md"
download_url "$paper_url" "$out/paper.html"

records="13838106 13841652 13853860 13841216 13838823 11125029"
for record in $records; do
  download_url "$zenodo_base/$record" "$out/zenodo-record-$record.json"
done

if [[ "${CODECFAKE_DOWNLOAD_ARCHIVES:-0}" != "1" ]]; then
  cat <<EOF
Downloaded official Codecfake documentation and all six Zenodo metadata
records to: $out

The public CC BY-NC-ND 4.0 release is approximately 172.7 GB. To download
selected records, set CODECFAKE_DOWNLOAD_ARCHIVES=1 and CODECFAKE_RECORDS to
one or more of:
  train_1 train_2 train_3 dev test_seen_alm test_unseen
EOF
  exit 0
fi

selected=" ${CODECFAKE_RECORDS:-} "
if [[ "$selected" == "  " ]]; then
  echo "CODECFAKE_RECORDS is required when archive download is enabled." >&2
  exit 2
fi

download_record() {
  local name="$1"
  local record="$2"
  local key

  [[ "$selected" == *" $name "* ]] || return 0
  while IFS= read -r key; do
    download_url "$zenodo_base/$record/files/$key/content" "$out/$name/$key"
  done < <(
    python3 -c \
      'import json,sys; print("\n".join(f["key"] for f in json.load(open(sys.argv[1]))["files"]))' \
      "$out/zenodo-record-$record.json"
  )
}

download_record train_1 13838106
download_record train_2 13841652
download_record train_3 13853860
download_record dev 13841216
download_record test_seen_alm 13838823
download_record test_unseen 11125029

echo "Codecfake requested downloads complete: $out"
