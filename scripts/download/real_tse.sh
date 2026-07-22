#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir real_tse)"
challenge_url="${REAL_TSE_CHALLENGE_URL:-https://real-tse.github.io/challenge/}"
repo_base_url="${REAL_TSE_REPO_BASE_URL:-https://raw.githubusercontent.com/REAL-TSE/REAL-TSE-Challenge/main}"
repo_api_url="${REAL_TSE_REPO_API_URL:-https://api.github.com/repos/REAL-TSE/REAL-TSE-Challenge}"
paper_url="${REAL_TSE_PAPER_URL:-https://arxiv.org/abs/2607.15198}"

download_url "$challenge_url" "$out/challenge.html"
download_url "$repo_base_url/README.md" "$out/repository-README.md"
download_url "$repo_base_url/LICENSE" "$out/repository-LICENSE"
download_url "$repo_api_url" "$out/github-api.json"
download_url "$paper_url" "$out/arxiv-2607.15198.html"

manual_required \
  "REAL-TSE Challenge" \
  "Saved official public documentation and repository metadata to $out." \
  "The password-protected DEV, EVAL-1, and EVAL-2 data were distributed by email only to registered teams." \
  "Registration closed on May 31, 2026, and the organizers provide no public dataset download URL." \
  "Challenge page: $challenge_url" \
  "The repository MIT license covers code, not the challenge audio; review the challenge and source-corpus terms."
