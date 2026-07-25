#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir androids_corpus)"
raw_base="${ANDROIDS_CORPUS_RAW_BASE_URL:-https://raw.githubusercontent.com/androidscorpus/data/main}"
repo_api_url="${ANDROIDS_CORPUS_REPO_API_URL:-https://api.github.com/repos/androidscorpus/data}"

download_url "$raw_base/README.md" "$out/README.md"
download_url "$repo_api_url" "$out/github-repo.json"
download_url \
  "https://www.isca-archive.org/interspeech_2023/tao23_interspeech.html" \
  "$out/paper.html"

if [[ "${ANDROIDS_CORPUS_DOWNLOAD_DATA:-0}" != "1" ]]; then
  echo "Downloaded Androids Corpus documentation to: $out"
  echo "The 3.69 GB archive is academic-only and may not be redistributed."
  echo "Set ANDROIDS_CORPUS_ACK_TERMS=1 and ANDROIDS_CORPUS_DOWNLOAD_DATA=1 to download it."
  exit 0
fi

if [[ "${ANDROIDS_CORPUS_ACK_TERMS:-0}" != "1" ]]; then
  echo "Refusing download: first read the official README and set ANDROIDS_CORPUS_ACK_TERMS=1." >&2
  exit 2
fi

archive_url="${ANDROIDS_CORPUS_ARCHIVE_URL:-https://www.dropbox.com/s/2rurxlh70ihfki4/Androids-Corpus.zip?dl=1}"
download_url "$archive_url" "$out/Androids-Corpus.zip"
echo "Androids Corpus download complete: $out/Androids-Corpus.zip"
