#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir slakh2100)"
homepage_url="${SLAKH_HOMEPAGE_URL:-http://www.slakh.com/}"
utils_raw="${SLAKH_UTILS_RAW:-https://raw.githubusercontent.com/ethman/slakh-utils/master}"
full_record_url="${SLAKH_ZENODO_RECORD_URL:-https://zenodo.org/record/4599666}"
tiny_record_url="${SLAKH_TINY_ZENODO_RECORD_URL:-https://zenodo.org/record/4603870}"
utils_repo="${SLAKH_UTILS_REPO:-https://github.com/ethman/slakh-utils.git}"
generation_repo="${SLAKH_GENERATION_REPO:-https://github.com/ethman/slakh_generation_scripts.git}"

download_url "$homepage_url" "$out/slakh-homepage.html"
download_url "$utils_raw/README.md" "$out/slakh-utils-README.md"
download_url "$utils_raw/LICENSE" "$out/slakh-utils-LICENSE"

if [[ "${SLAKH_CHECK_ZENODO:-0}" == "1" ]]; then
  download_url "$full_record_url" "$out/zenodo-slakh2100.html"
  download_url "$tiny_record_url" "$out/zenodo-slakh2100-tiny.html"
else
  echo "Skipping Slakh Zenodo landing pages. Set SLAKH_CHECK_ZENODO=1 to save them."
fi

if [[ "${SLAKH_CLONE_UTILS:-0}" == "1" ]]; then
  clone_or_update "$utils_repo" "$out/slakh-utils"
else
  echo "Skipping slakh-utils clone. Set SLAKH_CLONE_UTILS=1 to clone it."
fi

if [[ "${SLAKH_CLONE_GENERATION:-0}" == "1" ]]; then
  clone_or_update "$generation_repo" "$out/slakh-generation-scripts"
else
  echo "Skipping Slakh generation scripts clone. Set SLAKH_CLONE_GENERATION=1 to clone it."
fi

echo "Slakh2100 docs download complete: $out"
