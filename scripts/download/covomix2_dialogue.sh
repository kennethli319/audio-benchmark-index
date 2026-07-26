#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir covomix2_dialogue)"
repo_url="https://github.com/vivian556123/covomix2-dialogue-testset"
raw_base="https://raw.githubusercontent.com/vivian556123/covomix2-dialogue-testset/main"

download_url "https://arxiv.org/abs/2506.00885" "$out/paper.html"
download_url \
  "https://api.github.com/repos/vivian556123/covomix2-dialogue-testset" \
  "$out/github-repository.json"
download_url "$raw_base/dailydialog-dialogue.json" "$out/dailydialog-dialogue.json"
download_url "https://www.openslr.org/12" "$out/librispeech-openslr.html"

if [[ "${COVOMIX2_DIALOGUE_CLONE_REPO:-0}" != "1" ]]; then
  cat <<'EOF'
Downloaded the CoVoMix2 paper, 1,000-row dialogue/prompt manifest, repository
metadata, and LibriSpeech owner page.

Set COVOMIX2_DIALOGUE_CLONE_REPO=1 to clone the small test-set repository with
all 1,000 transcript files. Prompt audio is not included; obtain LibriSpeech
test-clean separately and preserve DailyDialog and LibriSpeech terms.
EOF
  echo "CoVoMix2 Dialogue metadata download complete: $out"
  exit 0
fi

clone_or_update "$repo_url" "$out/repository"
echo "CoVoMix2 Dialogue repository clone complete: $out/repository"
