#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir mswc)"
mirror="${MSWC_MIRROR:-https://mswc.mlcommons-storage.org}"
langs="${MSWC_LANGS:-ta}"
parts="${MSWC_PARTS:-splits alignments}"

download_url "https://huggingface.co/datasets/MLCommons/ml_spoken_words/raw/main/README.md" "$out/hf_README.md"
download_url "https://raw.githubusercontent.com/harvard-edge/multilingual_kws/main/README.md" "$out/multilingual_kws_README.md"
download_url "https://datasets-benchmarks-proceedings.neurips.cc/paper/2021/hash/fe131d7f5a6b38b23cc967316c13dae2-Abstract-round2.html" "$out/neurips_2021_abstract.html"

if [[ "${MSWC_DOWNLOAD_ARCHIVES:-0}" != "1" ]]; then
  echo "Saved MSWC docs: $out"
  echo "Skipping language archives. Set MSWC_DOWNLOAD_ARCHIVES=1 to download selected parts."
  echo 'Example: MSWC_DOWNLOAD_ARCHIVES=1 MSWC_LANGS="ta vi" MSWC_PARTS="splits alignments" scripts/download/mswc.sh'
  exit 0
fi

case "$mirror" in
  https://mswc.mlcommons-storage.org|https://mlc-datasets.oss-cn-guangzhou.aliyuncs.com|https://storage.cloud.google.com/public-datasets-mswc)
    ;;
  *)
    echo "Unsupported MSWC_MIRROR: $mirror" >&2
    echo "Use the official Cloudflare, Alibaba, or Google mirror from the MLCommons page." >&2
    exit 2
    ;;
esac

for part in $parts; do
  case "$part" in
    audio|splits|alignments)
      ;;
    *)
      echo "Unsupported MSWC_PARTS entry: $part" >&2
      echo "Use one or more of: audio splits alignments" >&2
      exit 2
      ;;
  esac

  for lang in $langs; do
    download_url "$mirror/$part/$lang.tar.gz" "$out/$part/$lang.tar.gz"
  done
done

echo "MSWC selected archive download complete: $out"
