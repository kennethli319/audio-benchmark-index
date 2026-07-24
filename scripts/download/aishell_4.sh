#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir aishell_4)"
openslr_page="${AISHELL4_OPENSLR_PAGE:-https://www.openslr.org/111/}"
archive_base="${AISHELL4_OPENSLR_BASE_URL:-https://openslr.trmal.net/resources/111}"
repo_raw="${AISHELL4_REPO_RAW_BASE:-https://raw.githubusercontent.com/felixfuyihui/AISHELL-4/master}"

download_url "$openslr_page" "$out/openslr-111.html"
download_url "$repo_raw/README.md" "$out/README.md"
download_url "$repo_raw/LICENSE" "$out/LICENSE"

if [[ "${AISHELL4_DOWNLOAD_ARCHIVES:-0}" != "1" ]]; then
  cat <<'MSG'
Downloaded AISHELL-4 metadata and baseline documentation.
Skipping the approximately 51.2 GB corpus archives. To fetch selected parts:
  AISHELL4_DOWNLOAD_ARCHIVES=1 AISHELL4_PARTS="test.tar.gz" scripts/download/aishell_4.sh
Use AISHELL4_PARTS=all to request every training and test archive.
MSG
  exit 0
fi

parts="${AISHELL4_PARTS:-test.tar.gz}"
if [[ "$parts" == "all" ]]; then
  parts="train_L.tar.gz train_M.tar.gz train_S.tar.gz test.tar.gz"
fi

for part in $parts; do
  case "$part" in
    train_L.tar.gz|train_M.tar.gz|train_S.tar.gz|test.tar.gz) ;;
    *)
      echo "Unknown AISHELL-4 archive: $part" >&2
      exit 2
      ;;
  esac
  download_url "$archive_base/$part" "$out/$part"
done

echo "AISHELL-4 requested downloads complete: $out"
