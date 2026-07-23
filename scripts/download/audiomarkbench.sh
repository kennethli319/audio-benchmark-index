#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir audiomarkbench)"
repo_url="https://github.com/mileskuo42/AudioMarkBench"
raw_url="https://raw.githubusercontent.com/mileskuo42/AudioMarkBench/main"
api_url="https://api.github.com/repos/mileskuo42/AudioMarkBench"
drive_url="https://drive.google.com/drive/folders/1037mBf4LoGq0CDxe6hYx5fNNv56AY_9e"

download_url "$raw_url/README.md" "$out/README.md"
download_url "$raw_url/LICENSE" "$out/LICENSE"
download_url "$api_url" "$out/github-api.json"
download_url "$api_url/git/trees/main?recursive=1" "$out/github-tree.json"
download_url "https://arxiv.org/abs/2406.06979" "$out/paper.html"

if [[ "${AUDIOMARKBENCH_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/repository"
fi

cat <<EOF
Downloaded AudioMarkBench documentation and repository metadata.

The released original, watermarked, and perturbed audio is a manual Google
Drive download:
$drive_url

Set AUDIOMARKBENCH_CLONE_REPO=1 to clone the approximately 3.1 MB evaluation
repository. The repository code is MPL-2.0. The audio has no separately stated
license and derives from Common Voice and LibriSpeech, so review the applicable
source-release terms before downloading, using, or redistributing it.
EOF

echo "AudioMarkBench metadata download complete: $out"
