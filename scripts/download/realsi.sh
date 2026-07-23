#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir realsi)"
repo_url="${REALSI_REPO_URL:-https://github.com/byteresearchcla/RealSI}"
raw_url="${REALSI_RAW_URL:-https://raw.githubusercontent.com/byteresearchcla/RealSI/main}"

download_url "$raw_url/README.md" "$out/README.md"
download_url "$raw_url/LICENSE" "$out/LICENSE"
download_url "https://api.github.com/repos/byteresearchcla/RealSI" "$out/github-repository.json"
download_url \
  "https://api.github.com/repos/byteresearchcla/RealSI/git/trees/main?recursive=1" \
  "$out/github-tree.json"

slugs=(tech health edu fin law env ent sci sport art)
for direction in en2zh zh2en; do
  for index in "${!slugs[@]}"; do
    number="$(printf '%02d' "$((index + 1))")"
    name="${direction}-${number}-${slugs[$index]}.json"
    download_url \
      "$raw_url/data/$direction/json/$name" \
      "$out/annotations/$direction/$name"
  done
done

if [[ "${REALSI_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url.git" "$out/repo"
else
  echo "Skipping the repository clone and its approximately 351 MiB WAV payload. Set REALSI_CLONE_REPO=1 to include it."
fi

cat <<MSG
RealSI metadata and annotation download complete: $out

The repository declares CC BY 4.0, but its authors disclaim ownership of the
source videos. Review recording copyright, platform terms, and the official
README before using or redistributing audio.
MSG
