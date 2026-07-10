#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir thchs_30)"
openslr_page="${THCHS30_OPENSLR_PAGE:-https://www.openslr.org/18/}"
base_url="${THCHS30_OPENSLR_BASE_URL:-https://openslr.trmal.net/resources/18}"
parts="${THCHS30_DOWNLOAD_PARTS:-}"

download_url "$openslr_page" "$out/openslr-18.html"

if [[ -z "$parts" ]]; then
  cat <<MSG
Downloaded THCHS-30 OpenSLR page to: $out
Skipping archives. Set THCHS30_DOWNLOAD_PARTS to one or more of:
  data        data_thchs30.tgz, about 6.4 GiB
  test_noise  test-noise.tgz, about 1.9 GiB
  resource    resource.tgz, about 24 MiB
MSG
  exit 0
fi

for part in $parts; do
  case "$part" in
    data) archive="data_thchs30.tgz" ;;
    test_noise|test-noise) archive="test-noise.tgz" ;;
    resource) archive="resource.tgz" ;;
    *)
      echo "Unsupported THCHS-30 part: $part" >&2
      echo "Supported: data test_noise resource" >&2
      exit 2
      ;;
  esac

  download_url "$base_url/$archive" "$out/$archive"
done

echo "THCHS-30 selected archive download complete: $out"
