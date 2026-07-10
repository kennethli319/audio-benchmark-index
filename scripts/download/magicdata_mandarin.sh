#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir magicdata_mandarin)"
openslr_page="${MAGICDATA_OPENSLR_PAGE:-https://www.openslr.org/68/}"
base_url="${MAGICDATA_OPENSLR_BASE_URL:-https://openslr.trmal.net/resources/68}"
parts="${MAGICDATA_PARTS:-dev test}"

download_url "$openslr_page" "$out/openslr-68.html"
download_url "$base_url/metadata.tar.gz" "$out/metadata.tar.gz"

if [[ "${MAGICDATA_DOWNLOAD_ARCHIVES:-0}" != "1" ]]; then
  echo "Downloaded MAGICDATA OpenSLR page and metadata to: $out"
  echo "Skipping large speech archives. Set MAGICDATA_DOWNLOAD_ARCHIVES=1 to download selected parts."
  exit 0
fi

for part in $parts; do
  case "$part" in
    train) archive="train_set.tar.gz" ;;
    dev) archive="dev_set.tar.gz" ;;
    test) archive="test_set.tar.gz" ;;
    *)
      echo "Unsupported MAGICDATA part: $part" >&2
      echo "Supported: train dev test" >&2
      exit 2
      ;;
  esac

  download_url "$base_url/$archive" "$out/$archive"
done

echo "MAGICDATA Mandarin archive download complete: $out"
