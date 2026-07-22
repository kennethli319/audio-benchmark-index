#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir realdesed)"
zenodo_record="${REALDESED_ZENODO_RECORD:-20056072}"
zenodo_api_url="${REALDESED_ZENODO_API_URL:-https://zenodo.org/api/records/$zenodo_record}"
zenodo_files_url="${REALDESED_ZENODO_FILES_URL:-$zenodo_api_url/files}"
raw_base_url="${REALDESED_RAW_BASE_URL:-https://raw.githubusercontent.com/fschmid56/RealDESED/main}"
repo_api_url="${REALDESED_REPO_API_URL:-https://api.github.com/repos/fschmid56/RealDESED}"

download_url "$zenodo_api_url" "$out/zenodo-record-$zenodo_record.json"
download_url "$raw_base_url/README.md" "$out/README.md"
download_url "$raw_base_url/LICENSE" "$out/LICENSE"
download_url "$repo_api_url" "$out/github-repo.json"

if [[ "${REALDESED_DOWNLOAD_AUDIO:-0}" != "1" ]]; then
  echo "Downloaded RealDESED docs and repository metadata to: $out"
  echo "Set REALDESED_DOWNLOAD_AUDIO=1 to download selected multi-GB archives."
  echo "Use REALDESED_PARTS='validation test' (default) or REALDESED_PARTS=all."
  exit 0
fi

parts="${REALDESED_PARTS:-validation test}"
if [[ "$parts" == "all" ]]; then
  parts="train validation test"
fi

for part in $parts; do
  case "$part" in
    train|validation|test)
      download_url "$zenodo_files_url/$part.zip/content" "$out/$part.zip"
      ;;
    *)
      echo "Unknown RealDESED part: $part (expected train, validation, test, or all)" >&2
      exit 2
      ;;
  esac
done

echo "RealDESED archive download complete: $out"
echo "Review metadata.csv for each recording's CC0 or CC BY terms before reuse."
