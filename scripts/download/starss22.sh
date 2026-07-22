#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir starss22)"
dcase_url="${STARSS22_DCASE_URL:-https://dcase.community/challenge2022/task-sound-event-localization-and-detection-evaluated-in-real-spatial-sound-scenes}"
datacite_url="${STARSS22_DATACITE_URL:-https://api.datacite.org/dois/10.5281/zenodo.6600531}"
paper_url="${STARSS22_PAPER_URL:-https://dcase.community/documents/workshop2022/proceedings/DCASE2022Workshop_Politis_51.pdf}"
raw_base_url="${STARSS22_RAW_BASE_URL:-https://raw.githubusercontent.com/sharathadavanne/seld-dcase2022/main}"
repo_url="${STARSS22_REPO_URL:-https://github.com/sharathadavanne/seld-dcase2022.git}"

download_url "$dcase_url" "$out/dcase-2022-task-3.html"
download_url "$datacite_url" "$out/datacite-zenodo-6600531.json"
download_url "$paper_url" "$out/DCASE2022Workshop_Politis_51.pdf"
download_url "$raw_base_url/README.md" "$out/baseline-README.md"

if [[ "${STARSS22_CLONE_BASELINE:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/seld-dcase2022"
else
  echo "Skipping baseline clone. Set STARSS22_CLONE_BASELINE=1 to clone it."
fi

cat <<MSG
STARSS22 metadata download complete: $out

The complete public development/evaluation release is 6.0 GB. This helper does
not download the large audio archives. Review the MIT dataset license and
retrieve the files from the official record:
https://zenodo.org/records/6600531
MSG
