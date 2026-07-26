#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir movie_gen_audio_bench)"
repo_raw="https://raw.githubusercontent.com/facebookresearch/MovieGenBench/main"

download_url "$repo_raw/README.md" "$out/README.md"
download_url "$repo_raw/LICENSE" "$out/LICENSE"
download_url \
  "$repo_raw/benchmark/MovieGenAudioBenchSfx.jsonl" \
  "$out/MovieGenAudioBenchSfx.jsonl"
download_url \
  "$repo_raw/benchmark/MovieGenAudioBenchSfxMusic.jsonl" \
  "$out/MovieGenAudioBenchSfxMusic.jsonl"
download_url "https://arxiv.org/abs/2410.13720" "$out/movie-gen-paper.html"
download_url "https://arxiv.org/abs/2607.06405" "$out/flowley-paper.html"

if [[ "${MOVIE_GEN_AUDIO_DOWNLOAD_SFX:-0}" == "1" ]]; then
  download_url \
    "https://d14whct5a0wtwm.cloudfront.net/moviegen/MovieGenAudioBenchSfx.tar.gz" \
    "$out/MovieGenAudioBenchSfx.tar.gz"
fi

if [[ "${MOVIE_GEN_AUDIO_DOWNLOAD_SFX_MUSIC:-0}" == "1" ]]; then
  download_url \
    "https://d14whct5a0wtwm.cloudfront.net/moviegen/MovieGenAudioBenchSfxMusic.tar.gz" \
    "$out/MovieGenAudioBenchSfxMusic.tar.gz"
fi

if [[ "${MOVIE_GEN_AUDIO_DOWNLOAD_SFX:-0}" != "1" ]] &&
   [[ "${MOVIE_GEN_AUDIO_DOWNLOAD_SFX_MUSIC:-0}" != "1" ]]; then
  cat <<'EOF'
Downloaded Movie Gen Audio Bench documentation, CC BY-NC 4.0 license, and both
lightweight prompt manifests.

Set MOVIE_GEN_AUDIO_DOWNLOAD_SFX=1 for the approximately 8.05 GiB sound-effects
archive or MOVIE_GEN_AUDIO_DOWNLOAD_SFX_MUSIC=1 for the approximately 8.08 GiB
joint sound-effects-and-music archive. Commercial use is prohibited.
EOF
fi

echo "Movie Gen Audio Bench download complete: $out"
