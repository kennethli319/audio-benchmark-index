#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir slurp)"
repo_url="${SLURP_REPO_URL:-https://github.com/pswietojanski/slurp.git}"
zenodo_base="${SLURP_ZENODO_BASE:-https://zenodo.org/api/records/4274930/files}"
audio_parts="${SLURP_AUDIO_PARTS:-real synth}"

clone_or_update "$repo_url" "$out/repo"
download_url "$zenodo_base/LICENSE.txt/content" "$out/LICENSE.txt"

if [[ "${SLURP_DOWNLOAD_AUDIO:-0}" != "1" ]]; then
  echo "Downloaded SLURP annotations repo and Zenodo license metadata to: $out"
  echo "Skipping audio archives. Set SLURP_DOWNLOAD_AUDIO=1 to download selected parts."
  echo "Options: SLURP_AUDIO_PARTS=\"real synth\""
  exit 0
fi

for part in $audio_parts; do
  case "$part" in
    real)
      filename="slurp_real.tar.gz"
      ;;
    synth)
      filename="slurp_synth.tar.gz"
      ;;
    *)
      echo "Unsupported SLURP audio part: $part" >&2
      echo "Use SLURP_AUDIO_PARTS with any of: real synth." >&2
      exit 2
      ;;
  esac

  download_url "$zenodo_base/$filename/content" "$out/$filename"
done

echo "SLURP download complete: $out"
