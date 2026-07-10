#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir golos)"
openslr_page="${GOLOS_OPENSLR_PAGE:-https://www.openslr.org/114/}"
openslr_base="${GOLOS_OPENSLR_BASE_URL:-https://openslr.trmal.net/resources/114}"
raw_base="${GOLOS_RAW_BASE_URL:-https://raw.githubusercontent.com/sberdevices/golos/master}"

download_url "$openslr_page" "$out/openslr_114.html"
download_url "$raw_base/README.md" "$out/README.md"
download_url "$raw_base/md5sum.txt" "$out/md5sum.txt"
download_url "$raw_base/license/en_us.pdf" "$out/license_en_us.pdf"
download_url "$raw_base/license/ru.pdf" "$out/license_ru.pdf"

if [[ "${GOLOS_DOWNLOAD_OPUS:-0}" == "1" ]]; then
  download_url "$openslr_base/golos_opus.tar.gz" "$out/golos_opus.tar.gz"
fi

if [[ "${GOLOS_DOWNLOAD_MODEL:-0}" == "1" ]]; then
  download_url "$openslr_base/QuartzNet15x5_golos.nemo.gz" "$out/QuartzNet15x5_golos.nemo.gz"
fi

if [[ "${GOLOS_DOWNLOAD_LMS:-0}" == "1" ]]; then
  download_url "$openslr_base/kenlms.tar.gz" "$out/kenlms.tar.gz"
fi

echo "Downloaded Golos metadata/license files to: $out"
echo "Large downloads are opt-in:"
echo "  GOLOS_DOWNLOAD_OPUS=1 $0        # about 18 GiB"
echo "  GOLOS_DOWNLOAD_MODEL=1 $0       # about 71 MiB"
echo "  GOLOS_DOWNLOAD_LMS=1 $0         # about 4.7 GiB"
