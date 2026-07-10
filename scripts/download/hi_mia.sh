#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir hi_mia)"
openslr_page="${HIMIA_OPENSLR_PAGE:-https://www.openslr.org/85/}"
base_url="${HIMIA_OPENSLR_BASE_URL:-https://openslr.trmal.net/resources/85}"

download_openslr_file() {
  local file="$1"
  download_url "$base_url/$file" "$out/$file"
}

download_url "$openslr_page" "$out/openslr-85.html"
download_openslr_file filename_mapping.tar.gz

download_part() {
  local part="$1"
  case "$part" in
    train)
      download_openslr_file train.tar.gz
      ;;
    dev)
      download_openslr_file dev.tar.gz
      ;;
    test)
      download_openslr_file test.tar.gz
      ;;
    test_v2)
      download_openslr_file test_v2.tar.gz
      ;;
    *)
      echo "Unknown HI-MIA part: $part" >&2
      echo "Known parts: train dev test test_v2" >&2
      exit 2
      ;;
  esac
}

if [[ "${HIMIA_DOWNLOAD_ARCHIVES:-0}" != "1" ]]; then
  cat <<'MSG'
Downloaded HI-MIA OpenSLR page and filename mapping.
Skipping large speech archives: train is about 36 GiB, dev about 5.1 GiB,
test about 4.7 GiB, and test_v2 about 4.7 GiB.
Set HIMIA_DOWNLOAD_ARCHIVES=1 and HIMIA_PARTS, for example:
  HIMIA_DOWNLOAD_ARCHIVES=1 HIMIA_PARTS="dev test_v2" scripts/download/hi_mia.sh
MSG
  exit 0
fi

parts="${HIMIA_PARTS:-dev test_v2}"
if [[ "$parts" == "all" ]]; then
  parts="train dev test test_v2"
fi

for part in $parts; do
  download_part "$part"
done

echo "HI-MIA requested downloads complete: $out"
