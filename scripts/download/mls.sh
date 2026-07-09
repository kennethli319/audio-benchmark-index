#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir mls)"
openslr_page="${MLS_OPENSLR_PAGE:-https://www.openslr.org/94/}"
base_url="${MLS_BASE_URL:-https://dl.fbaipublicfiles.com/mls}"
langs="${MLS_LANGS:-polish}"
format="${MLS_FORMAT:-opus}"

download_url "$openslr_page" "$out/openslr-94.html"
download_url "$base_url/md5sum.txt" "$out/md5sum.txt"

if [[ "${MLS_DOWNLOAD_ARCHIVES:-0}" != "1" ]]; then
  echo "Downloaded MLS OpenSLR page and checksums to: $out"
  echo "Skipping large archives. Set MLS_DOWNLOAD_ARCHIVES=1 to download selected language archives."
  exit 0
fi

if [[ "$format" != "opus" && "$format" != "flac" ]]; then
  echo "MLS_FORMAT must be either 'opus' or 'flac'." >&2
  exit 2
fi

for lang in $langs; do
  case "$lang" in
    english|german|dutch|french|spanish|italian|portuguese|polish) ;;
    *)
      echo "Unsupported MLS language: $lang" >&2
      echo "Supported: english german dutch french spanish italian portuguese polish" >&2
      exit 2
      ;;
  esac

  if [[ "$format" == "opus" ]]; then
    archive="mls_${lang}_opus.tar.gz"
  else
    archive="mls_${lang}.tar.gz"
  fi
  download_url "$base_url/$archive" "$out/$archive"
done

echo "MLS archive download complete: $out"
