#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir lat_bench)"
repo_url="${LAT_BENCH_REPO_URL:-https://github.com/alanshaoTT/LAT-Audio-Repo.git}"
raw_base="${LAT_BENCH_RAW_BASE_URL:-https://raw.githubusercontent.com/alanshaoTT/LAT-Audio-Repo/main}"
hf_raw="${LAT_BENCH_HF_RAW_BASE_URL:-https://huggingface.co/datasets/mcshao/LAT-Bench/resolve/main}"

download_url "$raw_base/README.md" "$out/project-README.md"
download_url "$raw_base/LICENSE" "$out/repository-LICENSE"
download_url "https://api.github.com/repos/alanshaoTT/LAT-Audio-Repo" "$out/github-repository.json"
download_url "https://huggingface.co/datasets/mcshao/LAT-Bench/raw/main/README.md" "$out/dataset-README.md"
download_url "https://huggingface.co/api/datasets/mcshao/LAT-Bench" "$out/huggingface-dataset.json"

for path in \
  meta/bench-CN-meta.jsonl \
  meta/bench-EN-meta.jsonl \
  task/bench-CN-DAC.jsonl \
  task/bench-CN-TAC.jsonl \
  task/bench-CN-TAG.jsonl \
  task/bench-EN-DAC.jsonl \
  task/bench-EN-TAC.jsonl \
  task/bench-EN-TAG.jsonl
do
  download_url "$hf_raw/$path" "$out/$path"
done

if [[ "${LAT_BENCH_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/LAT-Audio-Repo"
else
  echo "Skipping evaluation repo clone. Set LAT_BENCH_CLONE_REPO=1 to clone/update it."
fi

cat <<'EOF'
Downloaded LAT-Bench documentation, metadata, and task annotations.
The release references source audio by URL and does not bundle the recordings;
this helper intentionally does not retrieve external media.
EOF
echo "LAT-Bench metadata download complete: $out"
