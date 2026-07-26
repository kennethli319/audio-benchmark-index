#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir backgroundmellow_cinematic_trailer_eval)"
repo="https://github.com/anonymous-ismir/BackgroundMellow_ismir"
repo_raw="https://raw.githubusercontent.com/anonymous-ismir/BackgroundMellow_ismir/main"

download_url "$repo_raw/README.md" "$out/README.md"
download_url \
  "https://api.github.com/repos/anonymous-ismir/BackgroundMellow_ismir" \
  "$out/github-repository.json"
download_url \
  "$repo_raw/backgroundMellow/Results/infernce_results/yt_random_test_dataset_storyprompt_to_audio_paths.csv" \
  "$out/yt_random_test_dataset_storyprompt_to_audio_paths.csv"
download_url \
  "$repo_raw/backgroundMellow/backend/Evaluation/Results/final_ablations_results.csv" \
  "$out/final_ablations_results.csv"
download_url "https://arxiv.org/abs/2607.11364" "$out/paper.html"

if [[ "${BACKGROUNDMELLOW_DOWNLOAD_RESULTS:-0}" == "1" ]]; then
  download_url \
    "https://docs.google.com/spreadsheets/d/1QyqbvlgpzJ0clwwLy8J5hq-WthJ6IBAN/export?format=csv" \
    "$out/model-evaluation-results.csv"
fi

if [[ "${BACKGROUNDMELLOW_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo.git" "$out/repository"
fi

if [[ "${BACKGROUNDMELLOW_DOWNLOAD_RESULTS:-0}" != "1" ]] &&
   [[ "${BACKGROUNDMELLOW_CLONE_REPO:-0}" != "1" ]]; then
  cat <<'EOF'
Downloaded BackgroundMellow documentation, repository metadata, lightweight
evaluation mappings, aggregate ablation results, and the paper page.

Set BACKGROUNDMELLOW_DOWNLOAD_RESULTS=1 to export the approximately 7.1 MB
public results spreadsheet. Set BACKGROUNDMELLOW_CLONE_REPO=1 to clone the
approximately 121 MB repository. The release states no data or top-level code
license, and source YouTube trailer rights remain with their owners.
EOF
fi

echo "BackgroundMellow evaluation download complete: $out"
