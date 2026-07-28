#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir msmd)"
repo="https://raw.githubusercontent.com/CPJKU/msmd/master"
coda="https://raw.githubusercontent.com/ValleyC/CODA/main"

download_url "https://api.github.com/repos/CPJKU/msmd" "$out/repository.json"
download_url "$repo/README.md" "$out/README.md"
download_url "$repo/LICENSE" "$out/LICENSE"
download_url "$repo/msmd/splits/README" "$out/splits-README"
download_url "https://zenodo.org/api/records/2597505" "$out/original-record.json"
download_url "https://zenodo.org/api/records/4745838" "$out/score-following-record.json"
download_url "https://api.crossref.org/works/10.5334/tismir.12" \
  "$out/dataset-paper-metadata.json"
download_url "https://export.arxiv.org/api/query?id_list=2607.21899" \
  "$out/recent-paper-metadata.xml"
download_url "$coda/README.md" "$out/CODA-README.md"
download_url "$coda/LICENSE" "$out/CODA-LICENSE"

if [[ "${MSMD_DOWNLOAD_ARCHIVES:-0}" != "1" ]]; then
  cat <<EOF
Skipping large MSMD archives. Set MSMD_DOWNLOAD_ARCHIVES=1 and MSMD_PARTS
to a space-separated selection of original and score_following.
EOF
  echo "MSMD metadata download complete: $out"
  exit 0
fi

parts=" ${MSMD_PARTS:-} "
if [[ "$parts" == "  " ]]; then
  echo "Set MSMD_PARTS to a space-separated selection of original and score_following." >&2
  exit 2
fi

if [[ "$parts" == *" original "* ]]; then
  download_url \
    "https://zenodo.org/api/records/2597505/files/msmd_aug_v1-1_no-audio.zip/content" \
    "$out/msmd_aug_v1-1_no-audio.zip"
fi

if [[ "$parts" == *" score_following "* ]]; then
  download_url \
    "https://zenodo.org/api/records/4745838/files/msmd.zip/content" \
    "$out/msmd-score-following.zip"
fi

echo "MSMD download complete: $out"
