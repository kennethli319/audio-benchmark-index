#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir voicemos_challenge_2026)"
challenge_url="${VOICEMOS2026_CHALLENGE_URL:-https://sites.google.com/view/voicemos-challenge/voicemos-challenge-2026}"
repo_base_url="${VOICEMOS2026_REPO_BASE_URL:-https://raw.githubusercontent.com/voicemos-challenge/vmc2026-baselines/f9482fbb81d0429e090b491dd7aa7870a4b040f0}"
repo_api_url="${VOICEMOS2026_REPO_API_URL:-https://api.github.com/repos/voicemos-challenge/vmc2026-baselines}"
resources_url="https://sites.google.com/view/voicemos-challenge/resources"
codabench_url="https://www.codabench.org/competitions/16419/"
dev_revision="2595bb3cc0e4456acd7516c060da6df3e64c0f3b"
test_revision="f2eb5ca14f56343dfc2430ad9d244ddc881698bd"

download_url "$challenge_url" "$out/challenge.html"
download_url "$resources_url" "$out/resources.html"
# Explicit metadata allowlist: no Parquets, audio, forms, or model downloads.
for split in dev test; do
  revision="$dev_revision"
  if [[ "$split" == test ]]; then revision="$test_revision"; fi
  dataset="urgent-challenge/vmc2026-track1-$split"
  download_url "https://huggingface.co/datasets/$dataset/raw/$revision/README.md" "$out/track1-$split-$revision-README.md"
  download_url "https://huggingface.co/api/datasets/$dataset/revision/$revision" "$out/track1-$split-$revision-api.json"
done
download_url "$repo_base_url/README.md" "$out/baseline-README.md"
download_url "$repo_base_url/LICENSE" "$out/baseline-LICENSE"
download_url "$repo_api_url" "$out/github-api.json"

manual_required \
  "VoiceMOS Challenge 2026 (partial public access)" \
  "Saved official public documentation and pinned Track 1 metadata to $out." \
  "Track 1 audio and ratings are public under CC BY 4.0; the four Parquets total about 3.41 GB and are not downloaded." \
  "Track 1 dev: https://huggingface.co/datasets/urgent-challenge/vmc2026-track1-dev" \
  "Track 1 test: https://huggingface.co/datasets/urgent-challenge/vmc2026-track1-test" \
  "Public competition page: $codabench_url" \
  "Track 2 and Track 3 SYN public releases remain pending. Their former signed-license request window ended September 30, 2026." \
  "Check current organizer guidance at $resources_url before seeking access. Track 3 natural VCTK links alone are incomplete." \
  "Apache-2.0 covers baseline code only; each non-Track-1 distribution retains its separate terms. No forms are submitted or licenses accepted."
