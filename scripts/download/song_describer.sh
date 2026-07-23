#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir song_describer)"
zenodo_base="https://zenodo.org/records/10072001/files"
repo_raw="https://raw.githubusercontent.com/mulab-mir/song-describer-dataset/main"

download_url "https://zenodo.org/api/records/10072001" "$out/zenodo-record.json"
download_url "$zenodo_base/song_describer.csv?download=1" "$out/song_describer.csv"
download_url "$zenodo_base/audio_metadata.tsv?download=1" "$out/audio_metadata.tsv"
download_url "$zenodo_base/audio_licenses.txt?download=1" "$out/audio_licenses.txt"
download_url "$zenodo_base/song_describer_14_04_23.mtg-jamendo.tsv?download=1" \
  "$out/song_describer.mtg-jamendo.tsv"
download_url "$repo_raw/README.md" "$out/README.md"
download_url "$repo_raw/LICENSE" "$out/code-LICENSE"
download_url "$repo_raw/docs/datacard.md" "$out/datacard.md"
download_url "https://arxiv.org/abs/2311.10057" "$out/paper.html"

if [[ "${SONG_DESCRIBER_DOWNLOAD_AUDIO:-0}" == "1" ]]; then
  download_url "$zenodo_base/audio.zip?download=1" "$out/audio.zip"
else
  cat <<'EOF'
Downloaded Song Describer annotations, metadata, per-track audio licenses, and
official documentation.

Set SONG_DESCRIBER_DOWNLOAD_AUDIO=1 to fetch the public approximately 3.09 GiB
audio archive. The dataset is CC BY-SA 4.0, while each MTG-Jamendo track keeps
the Creative Commons license recorded in audio_licenses.txt.
EOF
fi

echo "Song Describer metadata download complete: $out"
