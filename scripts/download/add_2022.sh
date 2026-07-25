#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir add_2022)"
challenge_url="${ADD2022_CHALLENGE_URL:-http://addchallenge.cn/downloadADD2022}"
paper_url="${ADD2022_PAPER_URL:-https://doi.org/10.1109/ICASSP43922.2022.9746939}"
zenodo_base="${ADD2022_ZENODO_API_BASE:-https://zenodo.org/api/records}"

records="12188127 12188083 10843991 12187997 12188035 12188055"
for record in $records; do
  download_url "$zenodo_base/$record" "$out/zenodo-record-$record.json"
done
download_url "$challenge_url" "$out/challenge-download-page.html"
download_url "$paper_url" "$out/challenge-paper.html"

if [[ "${ADD2022_DOWNLOAD_ARCHIVES:-0}" != "1" ]]; then
  cat <<EOF
Downloaded the official ADD 2022 page, paper page, and all six Zenodo record
metadata files to: $out

The complete release is approximately 49.5 GB and uses CC BY-NC-ND 4.0.
To download selected records, set ADD2022_DOWNLOAD_ARCHIVES=1 and
ADD2022_RECORDS to one or more of:
  train_dev adaptation track1 track2 track3_round1 track3_round2
EOF
  exit 0
fi

selected=" ${ADD2022_RECORDS:-} "
if [[ "$selected" == "  " ]]; then
  echo "ADD2022_RECORDS is required when archive download is enabled." >&2
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

download_record train_dev 12188127
download_record adaptation 12188083
download_record track1 10843991
download_record track2 12187997
download_record track3_round1 12188035
download_record track3_round2 12188055

echo "ADD 2022 requested downloads complete: $out"
