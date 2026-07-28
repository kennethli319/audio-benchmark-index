#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir libriheavy)"
repo_raw="${LIBRIHEAVY_REPO_RAW:-https://raw.githubusercontent.com/k2-fsa/libriheavy/master}"
hf_base="${LIBRIHEAVY_HF_BASE:-https://huggingface.co/datasets/pkufool/libriheavy}"
parts="${LIBRIHEAVY_PARTS:-dev test_clean test_other}"

download_url "$repo_raw/README.md" "$out/README.md"
download_url "$repo_raw/LICENSE" "$out/LICENSE"
download_url "$repo_raw/pipeline.md" "$out/pipeline.md"
download_url "$hf_base/raw/main/README.md" "$out/huggingface_README.md"
download_url "https://huggingface.co/api/datasets/pkufool/libriheavy" "$out/huggingface_api.json"

if [[ "${LIBRIHEAVY_DOWNLOAD_MANIFESTS:-0}" == "1" ]]; then
  for part in $parts; do
    case "$part" in
      dev|small|medium|large|test_clean|test_other|test_clean_large|test_other_large) ;;
      *)
        echo "Unsupported LibriHeavy manifest part: $part" >&2
        echo "Supported: dev small medium large test_clean test_other test_clean_large test_other_large" >&2
        exit 2
        ;;
    esac

    download_url \
      "$hf_base/resolve/main/libriheavy_cuts_${part}.jsonl.gz?download=true" \
      "$out/libriheavy_cuts_${part}.jsonl.gz"
  done
else
  echo "Skipping LibriHeavy manifests. Set LIBRIHEAVY_DOWNLOAD_MANIFESTS=1 to fetch selected metadata."
fi

echo "LibriHeavy audio is obtained separately through the Libri-Light data-preparation release."
echo "LibriHeavy download helper complete: $out"
