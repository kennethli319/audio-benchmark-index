#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir wavefake)"
repo_url="${WAVEFAKE_REPO_URL:-https://github.com/RUB-SysSec/WaveFake}"
record_api="${WAVEFAKE_ZENODO_API_URL:-https://zenodo.org/api/records/5642694}"

download_url "https://arxiv.org/abs/2111.02813" "$out/paper.html"
download_url "$repo_url/raw/main/README.md" "$out/repository-README.md"
download_url "$repo_url/raw/main/LICENSE" "$out/toolkit-LICENSE"
download_url "https://api.github.com/repos/RUB-SysSec/WaveFake" "$out/repository-api.json"
download_url "$record_api" "$out/zenodo-record.json"
download_url "$record_api/files/LICENSE/content" "$out/dataset-LICENSE"
download_url "$record_api/files/datasheet.pdf/content" "$out/datasheet.pdf"

if [[ "${WAVEFAKE_CLONE_TOOLKIT:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/toolkit"
fi

if [[ "${WAVEFAKE_DOWNLOAD_ARCHIVE:-0}" == "1" ]]; then
  download_url \
    "$record_api/files/generated_audio.zip/content" \
    "$out/generated_audio.zip"
fi

if [[ "${WAVEFAKE_DOWNLOAD_ARCHIVE:-0}" != "1" ]]; then
  cat <<EOF
Downloaded WaveFake paper, first-party documentation, licenses, datasheet, and
repository/Zenodo metadata to:
$out

The public generated-audio ZIP is 28,918,626,084 bytes. Set
WAVEFAKE_DOWNLOAD_ARCHIVE=1 to download it. Set WAVEFAKE_CLONE_TOOLKIT=1 to
clone the evaluation repository. LJSpeech and JSUT bona fide audio are not
included; obtain them separately from their official sources.
EOF
  exit 0
fi

echo "WaveFake requested downloads complete: $out"
