#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir av_gc_aad)"
zenodo_api="${AV_GC_AAD_ZENODO_API:-https://zenodo.org/api/records/11058711}"

download_url "$zenodo_api" "$out/zenodo-record.json"
download_url "$zenodo_api/files/README.txt/content" "$out/README.txt"
download_url "https://arxiv.org/abs/2607.18614" "$out/crf-evaluation-paper.html"
download_url "https://arxiv.org/abs/2412.01401" "$out/baseline-paper.html"

if [[ "${AV_GC_AAD_DOWNLOAD_DATA:-0}" != "1" ]]; then
  cat <<EOF
Downloaded AV-GC-AAD metadata and documentation only: $out

The 13 participant MAT files total approximately 2.04 GB. To download selected
participants, set AV_GC_AAD_DOWNLOAD_DATA=1 and AV_GC_AAD_SUBJECTS to one or
more IDs from 01 03 04 07 08 09 10 11 12 13 14 15 16.
EOF
  exit 0
fi

if [[ -z "${AV_GC_AAD_SUBJECTS:-}" ]]; then
  echo "AV_GC_AAD_SUBJECTS is required when AV_GC_AAD_DOWNLOAD_DATA=1." >&2
  exit 2
fi

for subject in $AV_GC_AAD_SUBJECTS; do
  case "$subject" in
    01|03|04|07|08|09|10|11|12|13|14|15|16) ;;
    *)
      echo "Unknown public AV-GC-AAD subject ID: $subject" >&2
      exit 2
      ;;
  esac
  filename="2024-AV-GC-AAD-sub${subject}_preprocessed.mat"
  download_url "$zenodo_api/files/$filename/content" "$out/$filename"
done

echo "AV-GC-AAD requested participant downloads complete: $out"
