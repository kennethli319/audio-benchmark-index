#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir musiccaps)"
hf_repo="${MUSICCAPS_HF_REPO:-google/MusicCaps}"
card_url="${MUSICCAPS_CARD_URL:-https://huggingface.co/datasets/google/MusicCaps/raw/main/README.md}"
csv_url="${MUSICCAPS_CSV_URL:-https://huggingface.co/datasets/google/MusicCaps/resolve/main/musiccaps-public.csv}"

download_url "$card_url" "$out/README.md"
download_url "$csv_url" "$out/musiccaps-public.csv"

if [[ "${MUSICCAPS_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset "$hf_repo" "$out/hf"
fi

cat >&2 <<'EOF'
MusicCaps annotation metadata download complete.
Raw audio is not downloaded here. MusicCaps provides YouTube IDs and segment
timestamps for AudioSet-derived clips, so media access depends on upstream
YouTube availability and terms.
EOF
echo "MusicCaps metadata download complete: $out"
