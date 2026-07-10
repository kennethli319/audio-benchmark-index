#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir libri_light)"
repo_raw="${LIBRI_LIGHT_REPO_RAW:-https://raw.githubusercontent.com/facebookresearch/libri-light/main}"
base_url="${LIBRI_LIGHT_BASE_URL:-https://dl.fbaipublicfiles.com/librilight/data}"
parts="${LIBRI_LIGHT_PARTS:-small}"

download_url "$repo_raw/README.md" "$out/README.md"
download_url "$repo_raw/LICENSE" "$out/LICENSE"
download_url "$repo_raw/data_preparation/README.md" "$out/data_preparation_README.md"
download_url "$repo_raw/eval/README.md" "$out/eval_README.md"

if [[ "${LIBRI_LIGHT_DOWNLOAD_FINETUNE:-0}" == "1" ]]; then
  download_url "$base_url/librispeech_finetuning.tgz" "$out/librispeech_finetuning.tgz"
fi

if [[ "${LIBRI_LIGHT_DOWNLOAD_ABX:-0}" == "1" ]]; then
  download_url "$base_url/ABX_data.tgz" "$out/ABX_data.tgz"
fi

if [[ "${LIBRI_LIGHT_DOWNLOAD_UNLABELED:-0}" == "1" ]]; then
  for part in $parts; do
    case "$part" in
      small|medium|large|duplicate) ;;
      *)
        echo "Unsupported Libri-Light part: $part" >&2
        echo "Supported: small medium large duplicate" >&2
        exit 2
        ;;
    esac

    download_url "$base_url/$part.tar" "$out/$part.tar"
  done
else
  echo "Skipping Libri-Light data archives. Set LIBRI_LIGHT_DOWNLOAD_FINETUNE=1, LIBRI_LIGHT_DOWNLOAD_ABX=1, or LIBRI_LIGHT_DOWNLOAD_UNLABELED=1 to download selected data."
fi

echo "Libri-Light download helper complete: $out"
