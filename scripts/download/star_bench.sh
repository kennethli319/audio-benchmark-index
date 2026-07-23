#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir star_bench)"
hf_repo="${STAR_BENCH_HF_REPO:-internlm/STAR-Bench}"
repo_url="${STAR_BENCH_REPO_URL:-https://github.com/InternLM/StarBench.git}"
raw_base_url="${STAR_BENCH_RAW_BASE_URL:-https://raw.githubusercontent.com/InternLM/StarBench/main}"
repo_api_url="${STAR_BENCH_REPO_API_URL:-https://api.github.com/repos/InternLM/StarBench}"

download_url "$raw_base_url/README.md" "$out/repository-README.md"
download_url "$raw_base_url/LICENSE" "$out/repository-LICENSE"
download_url "$repo_api_url" "$out/github-repo.json"
download_url "https://huggingface.co/datasets/$hf_repo/raw/main/README.md" "$out/hf-README.md"
download_url "https://huggingface.co/api/datasets/$hf_repo" "$out/hf-dataset.json"

for file in \
  foundation_perception \
  holistic_reasoning_spatial \
  holistic_reasoning_temporal
do
  download_url \
    "https://huggingface.co/datasets/$hf_repo/resolve/main/meta_info/${file}.json" \
    "$out/meta_info/${file}.json"
done

if [[ "${STAR_BENCH_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/StarBench"
else
  echo "Skipping evaluation repo clone. Set STAR_BENCH_CLONE_REPO=1 to clone/update it."
fi

if [[ "${STAR_BENCH_DOWNLOAD_HF:-0}" != "1" ]]; then
  cat <<'EOF'
Downloaded STAR-Bench v1.0 documentation and question metadata only.
The public audio archive is approximately 2.74 GB and is licensed CC BY-NC 4.0.

Set STAR_BENCH_DOWNLOAD_HF=1 to download the full Hugging Face snapshot.
Review upstream source-audio terms and the repository's conflicting code-license
signals before reuse or redistribution.
EOF
  echo "STAR-Bench metadata download complete: $out"
  exit 0
fi

hf_download_dataset "$hf_repo" "$out/hf"
echo "STAR-Bench requested download complete: $out"
