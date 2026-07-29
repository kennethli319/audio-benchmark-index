#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir preference_asr)"
repo="${PREFERENCE_ASR_REPO:-nithinraok/preference-asr-bench}"
branch="${PREFERENCE_ASR_BRANCH:-master}"
raw_base="https://raw.githubusercontent.com/$repo/$branch"
api_base="https://api.github.com/repos/$repo"

download_url "https://arxiv.org/abs/2606.29534" "$out/preference-asr-paper.html"
download_url "$raw_base/README.md" "$out/README.md"
download_url "$raw_base/LICENSE" "$out/LICENSE"
download_url "$raw_base/data/preference_asr_testset.jsonl" "$out/preference_asr_testset.jsonl"
download_url "$api_base" "$out/github-repository.json"
download_url "$api_base/git/trees/$branch?recursive=1" "$out/github-tree.json"

if [[ "${PREFERENCE_ASR_CLONE_REPO:-0}" != "1" ]]; then
  echo "Downloaded Preference-ASR documentation and the public manifest to: $out"
  echo "Source audio is not redistributed; obtain it under each upstream corpus's terms."
  echo "Set PREFERENCE_ASR_CLONE_REPO=1 to clone the normalizer and audio downloader."
  exit 0
fi

clone_repo "https://github.com/$repo.git" "$out/repository"
echo "Preference-ASR toolkit clone complete: $out/repository"
