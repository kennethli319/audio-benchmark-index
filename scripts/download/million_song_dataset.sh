#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir million_song_dataset)"

download_url \
  "http://millionsongdataset.com/" \
  "$out/homepage.html"
download_url \
  "http://millionsongdataset.com/pages/getting-dataset/" \
  "$out/getting-dataset.html"
download_url \
  "http://millionsongdataset.com/tasteprofile/" \
  "$out/taste-profile.html"
download_url \
  "https://raw.githubusercontent.com/tbertinmahieux/MSongsDB/master/LICENSE" \
  "$out/LICENSE"
download_url \
  "http://millionsongdataset.com/sites/default/files/AdditionalFiles/unique_terms.txt" \
  "$out/unique_terms.txt"

if [[ "${MSD_DOWNLOAD_TASTE_PROFILE:-0}" == "1" ]]; then
  download_url \
    "http://labrosa.ee.columbia.edu/~dpwe/tmp/train_triplets.txt.zip" \
    "$out/train_triplets.txt.zip"
else
  echo "Skipping the Taste Profile archive (~500 MB). Set MSD_DOWNLOAD_TASTE_PROFILE=1 to download it."
fi

if [[ "${MSD_DOWNLOAD_10K_SUBSET:-0}" == "1" ]]; then
  download_url \
    "http://labrosa.ee.columbia.edu/~dpwe/tmp/millionsongsubset.tar.gz" \
    "$out/millionsongsubset.tar.gz"
else
  echo "Skipping the 10,000-song feature subset (~1.8 GB). Set MSD_DOWNLOAD_10K_SUBSET=1 to download it."
fi

if [[ "${MSD_CLONE_CODE:-0}" == "1" ]]; then
  clone_or_update \
    "https://github.com/tbertinmahieux/MSongsDB.git" \
    "$out/MSongsDB"
else
  echo "Skipping the code repository. Set MSD_CLONE_CODE=1 to clone it."
fi

echo "Million Song Dataset metadata download complete: $out"
