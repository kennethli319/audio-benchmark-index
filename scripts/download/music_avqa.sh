#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir music_avqa)"
raw_base="${MUSIC_AVQA_RAW_BASE_URL:-https://raw.githubusercontent.com/GeWu-Lab/MUSIC-AVQA/main}"
repo_url="${MUSIC_AVQA_REPO_URL:-https://github.com/GeWu-Lab/MUSIC-AVQA.git}"
homepage_url="${MUSIC_AVQA_HOMEPAGE_URL:-https://gewu-lab.github.io/MUSIC-AVQA/}"

download_url "$homepage_url" "$out/music-avqa-homepage.html"
download_url "$raw_base/README.md" "$out/README.md"
download_url "$raw_base/LICENSE" "$out/LICENSE"

for split in \
  avqa-train.json \
  avqa-val.json \
  avqa-test.json \
  avqa-train_real.json \
  avqa-val_real.json \
  avqa-test_real.json \
  avqa-train_fake.json \
  avqa-val_fake.json \
  avqa-test_fake.json
do
  download_url "$raw_base/data/json/$split" "$out/data/json/$split"
done

if [[ "${MUSIC_AVQA_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/MUSIC-AVQA"
else
  echo "Skipping MUSIC-AVQA repository clone. Set MUSIC_AVQA_CLONE_REPO=1 to clone code and feature scripts."
fi

cat <<MSG
MUSIC-AVQA docs and JSON annotations download complete: $out

Raw videos and large feature files are hosted on Google Drive/Baidu Drive from
the official project page and README. This helper does not download those
large/manual files automatically.
MSG
