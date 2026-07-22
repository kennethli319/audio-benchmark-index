#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir omniretriever_bench)"
hf_base="${OMNIRETRIEVER_BENCH_HF_BASE_URL:-https://huggingface.co/datasets/YunzeLiu/OmniRetriever-Bench}"
repo_raw="${OMNIRETRIEVER_BENCH_REPO_RAW_URL:-https://raw.githubusercontent.com/yunzeliu/Omni-Retriever/main}"

download_url "$hf_base/raw/main/README.md" "$out/README.md"
download_url "$hf_base/resolve/main/OmniRetriever-Bench.csv" "$out/OmniRetriever-Bench.csv"
download_url "$repo_raw/README.md" "$out/evaluator_README.md"
download_url "https://arxiv.org/html/2605.26641" "$out/paper.html"

cat <<'EOF'
Downloaded OmniRetriever-Bench documentation and the sub-1 MB annotation CSV.
The release does not redistribute media: rows contain TikTok source URLs and
clip intervals. Review the custom research-use/biometric restriction described
in the dataset card and paper, plus source-platform and uploader terms, before
obtaining or using the underlying clips.
EOF

echo "OmniRetriever-Bench metadata download complete: $out"
