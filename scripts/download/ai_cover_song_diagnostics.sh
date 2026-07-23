#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir ai_cover_song_diagnostics)"
repo="https://github.com/TiaaL/songecho-cover-metrics"
raw="https://raw.githubusercontent.com/TiaaL/songecho-cover-metrics/main"

download_url "$raw/README.md" "$out/README.md"
download_url "$raw/LICENSE" "$out/LICENSE"
download_url "$raw/data/annotations/evaluation_scores.csv" "$out/evaluation_scores.csv"
download_url "$raw/data/sample_list.csv" "$out/sample_list.csv"
download_url "$raw/features/extracted_features.csv" "$out/extracted_features.csv"

if [[ "${AI_COVER_SONG_DIAGNOSTICS_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo" "$out/repo"
else
  cat <<'EOF'
Downloaded all lightweight public benchmark tables and official documentation.

Set AI_COVER_SONG_DIAGNOSTICS_CLONE_REPO=1 to clone the analysis pipeline.
The repository does not contain raw source songs or generated cover audio;
those files are withheld because of copyright and commercial-API terms.
EOF
fi

echo "AI-Generated Cover Song Diagnostics download complete: $out"
