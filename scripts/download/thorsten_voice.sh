#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir thorsten_voice)"
zenodo_api="https://zenodo.org/api/records/5525342"
archive_url="https://zenodo.org/api/records/5525342/files/thorsten-neutral_v03.tgz/content"
repo_raw="https://raw.githubusercontent.com/thorstenMueller/Thorsten-Voice/master"

download_url "$zenodo_api" "$out/zenodo-record.json"
download_url "$repo_raw/README.md" "$out/project-README.md"
download_url "$repo_raw/LICENSE" "$out/project-LICENSE"
download_url \
  "https://api.github.com/repos/thorstenMueller/Thorsten-Voice" \
  "$out/github-repository.json"

if [[ "${THORSTEN_VOICE_DOWNLOAD_ARCHIVE:-0}" == "1" ]]; then
  download_url "$archive_url" "$out/thorsten-neutral_v03.tgz"
else
  echo "Skipping the approximately 2.74 GB Thorsten-Voice v3.0 archive."
  echo "Set THORSTEN_VOICE_DOWNLOAD_ARCHIVE=1 to download it."
fi

cat <<MSG
Thorsten-Voice metadata download complete: $out

The exact Zenodo release declares CC BY 4.0, while the official project
repository declares CC0-1.0. Apply the Zenodo archive's attribution terms
unless the owner clarifies that the broader CC0 statement supersedes them.
MSG
