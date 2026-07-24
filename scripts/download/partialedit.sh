#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir partialedit)"
zenodo_base_url="${PARTIALEDIT_ZENODO_BASE_URL:-https://zenodo.org/api/records/15519188}"

download_url "https://yzyouzhang.com/PartialEdit/index.html" "$out/project.html"
download_url "$zenodo_base_url" "$out/zenodo-record-15519188.json"
download_url "https://arxiv.org/abs/2506.02958" "$out/paper.html"
download_url "https://arxiv.org/abs/2607.17079" "$out/salmonn-2-paper.html"

if [[ "${PARTIALEDIT_DOWNLOAD_METADATA:-0}" == "1" ]]; then
  download_url \
    "$zenodo_base_url/files/PartialEdit_E1E2.csv/content" \
    "$out/PartialEdit_E1E2.csv"
  download_url \
    "$zenodo_base_url/files/modified_txt.tar.gz/content" \
    "$out/modified_txt.tar.gz"
else
  echo "Skipping PartialEdit protocol/text metadata. Set PARTIALEDIT_DOWNLOAD_METADATA=1 to download it."
fi

if [[ "${PARTIALEDIT_DOWNLOAD_AUDIO:-0}" == "1" ]]; then
  parts="${PARTIALEDIT_PARTS:-E1}"
  for part in $parts; do
    case "$part" in
      E1|E1-Codec|E2|E2-Codec)
        download_url \
          "$zenodo_base_url/files/$part.tar.gz/content" \
          "$out/$part.tar.gz"
        ;;
      *)
        echo "Unknown PARTIALEDIT_PARTS value: $part" >&2
        echo "Choose from: E1 E1-Codec E2 E2-Codec" >&2
        exit 2
        ;;
    esac
  done
else
  echo "Skipping PartialEdit audio archives. Set PARTIALEDIT_DOWNLOAD_AUDIO=1 and select PARTIALEDIT_PARTS to download them."
fi

echo "PartialEdit metadata download complete: $out"
