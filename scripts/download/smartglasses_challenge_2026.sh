#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir smartglasses_challenge_2026)"
challenge_url="${SMARTGLASSES_CHALLENGE_URL:-https://aslp-lab.github.io/SmartGlasses/}"
repo_base_url="${SMARTGLASSES_REPO_BASE_URL:-https://raw.githubusercontent.com/ASLP-lab/Smart-Glass-Challenge/main}"
repo_api_url="${SMARTGLASSES_REPO_API_URL:-https://api.github.com/repos/ASLP-lab/Smart-Glass-Challenge}"
paper_url="${SMARTGLASSES_PAPER_URL:-https://arxiv.org/abs/2607.17867}"

download_url "$challenge_url" "$out/challenge.html"
download_url "$repo_base_url/README.md" "$out/repository-README.md"
download_url "$repo_api_url" "$out/github-api.json"
download_url "$paper_url" "$out/arxiv-2607.17867.html"

manual_required \
  "SmartGlasses Challenge 2026" \
  "Saved official public documentation and evaluation-toolkit metadata to $out." \
  "The four-channel dialogue and meeting corpus was distributed by email only after registration and agreement to the challenge rules." \
  "Registration is closed, and the organizers currently provide no public corpus download URL or standalone dataset license." \
  "Challenge page: $challenge_url" \
  "The public evaluation repository also has no LICENSE file; contact the organizers before reuse or redistribution."
