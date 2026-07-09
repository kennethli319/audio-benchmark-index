#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir mtedx)"
openslr_page="${MTEDX_OPENSLR_PAGE:-https://www.openslr.org/100}"
base_url="${MTEDX_OPENSLR_BASE_URL:-https://openslr.trmal.net/resources/100}"
parts="${MTEDX_PARTS:-mtedx_iwslt2021.tgz}"

download_url "$openslr_page" "$out/openslr-100.html"
download_url "$base_url/MTEDx-french-talks-gender-annotation.csv" "$out/MTEDx-french-talks-gender-annotation.csv"

if [[ "${MTEDX_DOWNLOAD_ARCHIVES:-0}" != "1" ]]; then
  echo "Downloaded mTEDx OpenSLR page and small annotation CSV to: $out"
  echo "Skipping multi-GiB archives. Set MTEDX_DOWNLOAD_ARCHIVES=1 to download selected archives."
  exit 0
fi

for part in $parts; do
  case "$part" in
    mtedx_*.tgz) ;;
    *)
      echo "Unsupported mTEDx archive name: $part" >&2
      echo "Use OpenSLR archive names such as mtedx_iwslt2021.tgz or mtedx_es-en.tgz." >&2
      exit 2
      ;;
  esac

  download_url "$base_url/$part" "$out/$part"
done

echo "mTEDx archive download complete: $out"
