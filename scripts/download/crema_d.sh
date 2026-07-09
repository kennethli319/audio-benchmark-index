#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir crema_d)"
raw_base="${CREMAD_RAW_BASE_URL:-https://raw.githubusercontent.com/CheyneyComputerScience/CREMA-D/master}"
repo_url="${CREMAD_REPO_URL:-https://gitlab.com/cs-cooper-lab/crema-d-mirror.git}"

download_raw() {
  local path="$1"
  download_url "$raw_base/$path" "$out/$path"
}

download_raw README.md
download_raw LICENSE.txt
download_raw SentenceFilenames.csv
download_raw VideoDemographics.csv
download_raw finishedEmoResponses.csv
download_raw finishedResponses.csv
download_raw finishedResponsesWithRepeatWithPractice.csv
download_raw processedResults/tabulatedVotes.csv
download_raw processedResults/summaryTable.csv

if [[ "${CREMAD_DOWNLOAD_MEDIA:-0}" != "1" ]]; then
  echo "Downloaded CREMA-D metadata to: $out"
  echo "Skipping full Git LFS media clone (~7.55 GiB). Fill out the upstream form, install Git LFS, then set CREMAD_DOWNLOAD_MEDIA=1 to clone media."
  echo "Upstream form: https://docs.google.com/forms/d/e/1FAIpQLSdvOR994_Hsx7OkBU3oCzluXcmxw2P1nr-zBxcPgVBNLdD9Eg/viewform?usp=sf_link"
  exit 0
fi

require_cmd git
if ! git lfs version >/dev/null 2>&1; then
  echo "CREMA-D media is stored in Git LFS. Install Git LFS before using CREMAD_DOWNLOAD_MEDIA=1." >&2
  exit 127
fi

clone_or_update "$repo_url" "$out/CREMA-D"
echo "CREMA-D download complete: $out"
