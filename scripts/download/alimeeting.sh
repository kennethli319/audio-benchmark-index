#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir alimeeting)"
openslr_page_url="${ALIMEETING_OPENSLR_PAGE_URL:-https://www.openslr.org/119/}"
openslr_resource_base="${ALIMEETING_OPENSLR_RESOURCE_BASE:-https://www.openslr.org/resources/119}"
archive_base="${ALIMEETING_ARCHIVE_BASE_URL:-https://speech-lab-share-data.oss-cn-shanghai.aliyuncs.com/AliMeeting/openlr}"

download_url "$openslr_page_url" "$out/openslr_119.html"
download_url "$openslr_resource_base/about.html" "$out/about.html"
download_url "$openslr_resource_base/info.txt" "$out/info.txt"

if [[ "${ALIMEETING_DOWNLOAD_ARCHIVES:-0}" == "1" ]]; then
  for part in ${ALIMEETING_PARTS:-Eval_Ali.tar.gz Test_Ali.tar.gz}; do
    download_url "$archive_base/$part" "$out/$part"
  done
else
  cat <<'MSG'
Skipping AliMeeting corpus archives. They are large: Train_Ali_far is about
73.24 GiB, Train_Ali_near is about 22.85 GiB, Eval_Ali is about 3.42 GiB,
and Test_Ali is about 8.90 GiB. Set ALIMEETING_DOWNLOAD_ARCHIVES=1 and
ALIMEETING_PARTS, for example:
  ALIMEETING_DOWNLOAD_ARCHIVES=1 ALIMEETING_PARTS="Eval_Ali.tar.gz Test_Ali.tar.gz" scripts/download/alimeeting.sh
MSG
fi

echo "AliMeeting metadata download complete: $out"
