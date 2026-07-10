#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir wavcaps)"
repo_id="${WAVCAPS_HF_REPO:-cvssp/WavCaps}"

hf_download_dataset "$repo_id" "$out" \
  --include README.md \
  --include 'json_files/*/*.json'

if [[ "${WAVCAPS_DOWNLOAD_ZIPS:-0}" == "1" ]]; then
  sources="${WAVCAPS_ZIP_SOURCES:-SoundBible}"
  for source in $sources; do
    case "$source" in
      AudioSet_SL|BBC_Sound_Effects|FreeSound|SoundBible)
        hf_download_dataset "$repo_id" "$out" --include "Zip_files/$source/*"
        ;;
      all)
        hf_download_dataset "$repo_id" "$out" --include 'Zip_files/*/*'
        ;;
      *)
        echo "Unknown WAVCAPS_ZIP_SOURCES value: $source" >&2
        echo "Use one or more of: AudioSet_SL BBC_Sound_Effects FreeSound SoundBible all" >&2
        exit 2
        ;;
    esac
  done
else
  cat >&2 <<'EOF'
Skipping WavCaps waveform ZIP archives. The Hugging Face repository is hundreds
of GiB and WavCaps audio is academic-use only. Set WAVCAPS_DOWNLOAD_ZIPS=1 and
WAVCAPS_ZIP_SOURCES="SoundBible" or another source name to download archives.
EOF
fi

echo "WavCaps metadata download complete: $out"
