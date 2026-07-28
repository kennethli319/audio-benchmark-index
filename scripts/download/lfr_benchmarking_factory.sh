#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir lfr_benchmarking_factory)"
repo="https://github.com/LAAC-LSCP/benchmarking-dataset-factory"
raw="https://raw.githubusercontent.com/LAAC-LSCP/benchmarking-dataset-factory/main"

download_url "https://arxiv.org/abs/2607.03201" "$out/paper.html"
download_url "$repo" "$out/project.html"
download_url "https://api.github.com/repos/LAAC-LSCP/benchmarking-dataset-factory" \
  "$out/github-repository.json"
download_url "$raw/README.md" "$out/README.md"
download_url "$raw/LICENSE" "$out/LICENSE"
download_url "$raw/outputs/manually_annotated_metadata.json" \
  "$out/manually_annotated_metadata.json"

if [[ "${LFR_FACTORY_CLONE_TOOLKIT:-0}" == "1" ]]; then
  clone_or_update "$repo.git" "$out/toolkit"
fi

cat <<EOF
LFR Benchmarking Dataset Factory metadata download complete: $out

This helper does not fetch child recordings, annotations, or derived benchmark
clips. The full cross-corpus benchmark depends on source-specific access,
participant-consent, ethics, and reuse conditions. Follow the official
DataLad instructions only after obtaining access to the required corpora.
EOF
