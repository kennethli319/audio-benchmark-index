#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir add_2023)"
challenge_url="${ADD2023_CHALLENGE_URL:-http://addchallenge.cn/add2023}"
download_url_page="${ADD2023_DOWNLOAD_URL:-http://addchallenge.cn/downloadADD2023}"
zenodo_base="${ADD2023_ZENODO_API_BASE:-https://zenodo.org/api/records}"

records="12145773 12151404 12175884 12176326 12176530 12176904 12179632 12179884"
for record in $records; do
  download_url "$zenodo_base/$record" "$out/zenodo-record-$record.json"
done
download_url "$challenge_url" "$out/challenge-page.html"
download_url "$download_url_page" "$out/challenge-download-page.html"
download_url "https://arxiv.org/abs/2305.13774" "$out/overview-paper.html"
download_url "https://arxiv.org/abs/2408.04967" "$out/analysis-paper.html"

if [[ "${ADD2023_DOWNLOAD_ARCHIVES:-0}" != "1" ]]; then
  cat <<EOF
Downloaded the official ADD 2023 pages, papers, and all eight Zenodo record
metadata files to: $out

The complete public release is approximately 65.4 GB and uses CC BY-NC-ND 4.0.
To download selected records, set ADD2023_DOWNLOAD_ARCHIVES=1 and
ADD2023_RECORDS to one or more of:
  track1_1 track1_2_train_dev track1_2_round1 track1_2_round2
  track2_train_dev track2_eval track3_train_dev track3_eval
EOF
  exit 0
fi

selected=" ${ADD2023_RECORDS:-} "
if [[ "$selected" == "  " ]]; then
  echo "ADD2023_RECORDS is required when archive download is enabled." >&2
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

download_record track1_1 12145773
download_record track1_2_train_dev 12151404
download_record track1_2_round1 12175884
download_record track1_2_round2 12176326
download_record track2_train_dev 12176530
download_record track2_eval 12176904
download_record track3_train_dev 12179632
download_record track3_eval 12179884

echo "ADD 2023 requested downloads complete: $out"
