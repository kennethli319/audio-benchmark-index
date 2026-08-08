#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir zerospeech_2021_slm)"
dataset_url="${ZEROSPEECH2021_DATASET_URL:-https://download.zerospeech.com/datasets/sLM21.dataset.zip}"
repo_url="${ZEROSPEECH2021_REPO_URL:-https://github.com/zerospeech/zerospeech2021_baseline.git}"

download_url "https://arxiv.org/abs/2011.11588" "$out/paper.html"
download_url "https://raw.githubusercontent.com/zerospeech/zerospeech2021_baseline/master/README.md" "$out/baseline-README.md"
download_url "https://api.github.com/repos/zerospeech/zerospeech2021_baseline" "$out/github-repo.json"
download_url "https://api.github.com/repos/zerospeech/zerospeech2021_baseline/git/trees/master?recursive=1" "$out/github-tree.json"

require_cmd curl
curl -L --fail --head "$dataset_url" > "$out/dataset-headers.txt"

if [[ "${ZEROSPEECH2021_CLONE_BASELINE:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/zerospeech2021_baseline"
else
  echo "Skipping the baseline clone. Set ZEROSPEECH2021_CLONE_BASELINE=1 to clone it."
fi

if [[ "${ZEROSPEECH2021_DOWNLOAD_DATA:-0}" == "1" ]]; then
  download_url "$dataset_url" "$out/sLM21.dataset.zip"
else
  cat <<'MSG'
ZeroSpeech 2021 spoken-language-model benchmark metadata download complete.

The official sLM21 archive is approximately 30.61 GB. Download it explicitly:

  ZEROSPEECH2021_DOWNLOAD_DATA=1 scripts/download/zerospeech_2021_slm.sh

No standalone data license was identified for the archive, and the baseline
repository has no detected license. LibriSpeech, source human-similarity data,
and synthetic-speech service terms remain separately applicable.
MSG
fi
