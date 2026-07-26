#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir nonspeech7k)"
record_base="https://zenodo.org/api/records/6967442"

download_url "$record_base" "$out/zenodo-record.json"
download_url \
  "$record_base/files/metadata%20of%20train%20set%20.csv/content" \
  "$out/metadata-train.csv"
download_url \
  "$record_base/files/metadata%20of%20test%20set.csv/content" \
  "$out/metadata-test.csv"
download_url \
  "$record_base/files/youtube%20ID%20vs%20link%20.TXT/content" \
  "$out/youtube-provenance.txt"

if [[ "${NONSPEECH7K_DOWNLOAD_AUDIO:-0}" != "1" ]]; then
  echo "Nonspeech7k metadata download complete: $out"
  echo "Set NONSPEECH7K_ACK_NONCOMMERCIAL=1 and NONSPEECH7K_DOWNLOAD_AUDIO=1"
  echo "to download the approximately 2.54 GB train and test archives."
  exit 0
fi

if [[ "${NONSPEECH7K_ACK_NONCOMMERCIAL:-0}" != "1" ]]; then
  manual_required \
    "Nonspeech7k audio" \
    "The Zenodo description limits the dataset to non-commercial academic" \
    "research under CC BY-NC-SA 4.0, despite a conflicting CC BY 4.0" \
    "structured field. Review the record, then set" \
    "NONSPEECH7K_ACK_NONCOMMERCIAL=1 with NONSPEECH7K_DOWNLOAD_AUDIO=1."
fi

download_url \
  "$record_base/files/train.zip/content" \
  "$out/train.zip"
download_url \
  "$record_base/files/test.zip/content" \
  "$out/test.zip"

echo "Nonspeech7k audio download complete: $out"
