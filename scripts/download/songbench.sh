#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir songbench)"
repo_url="https://github.com/Tencent/SongBench"
raw_url="https://raw.githubusercontent.com/Tencent/SongBench/main"

download_url "$raw_url/README.md" "$out/README.md"
download_url "$raw_url/LICENSE.txt" "$out/LICENSE.txt"
download_url "$raw_url/eval.py" "$out/eval.py"
download_url "$raw_url/model.py" "$out/model.py"
download_url "$raw_url/configs/songbench.yaml" "$out/configs/songbench.yaml"
download_url "$raw_url/requirements.txt" "$out/requirements.txt"
download_url "$raw_url/prompts/test100.jsonl" "$out/prompts/test100.jsonl"
download_url "https://api.github.com/repos/Tencent/SongBench" "$out/github-repo.json"
download_url "https://arxiv.org/abs/2604.25937" "$out/paper.html"

if [[ "${SONGBENCH_DOWNLOAD_CHECKPOINT:-0}" == "1" ]]; then
  download_url \
    "$raw_url/ckpt/songbench.safetensors" \
    "$out/ckpt/songbench.safetensors"
else
  cat <<'EOF'
Downloaded the public SongBench evaluation code, configuration, and 100 test
prompts. The approximately 96.1 MiB evaluator checkpoint is opt-in; set
SONGBENCH_DOWNLOAD_CHECKPOINT=1 to fetch it.

The paper's 11,717 expert-rated training/ID samples, 352-song OOD set, source
audio, annotations, and exact split manifests are not in the public repository.
The custom SongBench terms limit released materials to academic use and prohibit
commercial or production use.
EOF
fi

echo "SongBench public-artifact download complete: $out"
