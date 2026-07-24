#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir voicemos_challenge_2026)"
challenge_url="${VOICEMOS2026_CHALLENGE_URL:-https://sites.google.com/view/voicemos-challenge/voicemos-challenge-2026}"
repo_base_url="${VOICEMOS2026_REPO_BASE_URL:-https://raw.githubusercontent.com/voicemos-challenge/vmc2026-baselines/main}"
repo_api_url="${VOICEMOS2026_REPO_API_URL:-https://api.github.com/repos/voicemos-challenge/vmc2026-baselines}"
registration_url="${VOICEMOS2026_REGISTRATION_URL:-https://forms.gle/L6YdkUf1PJdSSwLU7}"

download_url "$challenge_url" "$out/challenge.html"
download_url "$repo_base_url/README.md" "$out/baseline-README.md"
download_url "$repo_base_url/LICENSE" "$out/baseline-LICENSE"
download_url "$repo_api_url" "$out/github-api.json"

manual_required \
  "VoiceMOS Challenge 2026" \
  "Saved official public challenge and baseline documentation to $out." \
  "The organizers distribute the CodaBench dataset page by email after registration; no public archive URL is listed." \
  "Registration: $registration_url" \
  "Challenge page: $challenge_url" \
  "Dataset reuse and redistribution terms are not publicly specified. Apache-2.0 covers the baseline code only."
