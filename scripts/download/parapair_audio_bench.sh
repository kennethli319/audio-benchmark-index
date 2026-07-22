#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir parapair_audio_bench)"
raw_base_url="${PARAPAIR_AUDIO_BENCH_RAW_BASE_URL:-https://raw.githubusercontent.com/jsujeon/ParaPairAudioBench/master}"
repo_api_url="${PARAPAIR_AUDIO_BENCH_REPO_API_URL:-https://api.github.com/repos/jsujeon/ParaPairAudioBench}"
repo_url="${PARAPAIR_AUDIO_BENCH_REPO_URL:-https://github.com/jsujeon/ParaPairAudioBench.git}"

download_url "$raw_base_url/README.md" "$out/README.md"
download_url "$repo_api_url" "$out/github-repo.json"
download_url "$repo_api_url/git/trees/master?recursive=1" "$out/github-tree.json"

if [[ "${PARAPAIR_AUDIO_BENCH_CLONE_REPO:-0}" != "1" ]]; then
  echo "Downloaded ParaPairAudioBench docs and repository metadata to: $out"
  echo "Set PARAPAIR_AUDIO_BENCH_CLONE_REPO=1 to clone the pair annotations and builders."
  echo "The repository does not bundle source audio; SVC age/gender data requires manual approval."
  exit 0
fi

clone_or_update "$repo_url" "$out/ParaPairAudioBench"
echo "ParaPairAudioBench metadata/code clone complete: $out/ParaPairAudioBench"
echo "Source audio must be obtained separately under SVC, EARS, Expresso, and LibriTTS terms."
