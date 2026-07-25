#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir fake_or_real)"
base="https://bil.eecs.yorku.ca"

download_url "$base/datasets/" "$out/official_dataset_page.html"

if [[ "${FAKE_OR_REAL_DOWNLOAD_ARCHIVES:-0}" != "1" ]]; then
  cat <<EOF
Downloaded the official Fake-or-Real dataset page to: $out

The owner page does not state a dataset license or reuse terms. Review all
component-source rights and obtain permission as needed before use.

The four archives total approximately 16.0 GiB. To download selected variants,
set FAKE_OR_REAL_DOWNLOAD_ARCHIVES=1 and FAKE_OR_REAL_VERSIONS to one or more
of: original norm 2sec rerec
EOF
  exit 0
fi

versions="${FAKE_OR_REAL_VERSIONS:-}"
if [[ -z "$versions" ]]; then
  echo "FAKE_OR_REAL_VERSIONS is required when archive download is enabled." >&2
  echo "Choose one or more of: original norm 2sec rerec" >&2
  exit 2
fi

for version in $versions; do
  case "$version" in
    original|norm|2sec|rerec)
      download_url "$base/share/for-$version.tar.gz" "$out/for-$version.tar.gz"
      ;;
    *)
      echo "Unknown Fake-or-Real version: $version" >&2
      echo "Choose one or more of: original norm 2sec rerec" >&2
      exit 2
      ;;
  esac
done
