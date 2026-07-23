#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir cmi_rewardbench)"
hf_base_url="https://huggingface.co/datasets/HaiwenXia/cmi-pref"
hf_api_url="https://huggingface.co/api/datasets/HaiwenXia/cmi-pref"
repo_raw_url="https://raw.githubusercontent.com/Haiwen-Xia/CMI-RewardBench/main"

download_url "$hf_base_url/raw/main/README.md" "$out/cmi-pref-README.md"
download_url "$hf_api_url" "$out/cmi-pref-api.json"
download_url "$hf_base_url/resolve/main/cmi_test.jsonl" "$out/cmi_test.jsonl"
download_url "$repo_raw_url/README.md" "$out/toolkit-README.md"
download_url "$repo_raw_url/LICENSE" "$out/toolkit-LICENSE"
download_url "$repo_raw_url/config/eval_benchmark.yaml" "$out/eval_benchmark.yaml"
download_url "$repo_raw_url/data/all_test.jsonl" "$out/all_test.jsonl"
download_url "https://arxiv.org/abs/2603.00610" "$out/paper.html"

if [[ "${CMI_REWARDBENCH_DOWNLOAD_HF:-0}" == "1" ]]; then
  hf_download_dataset "HaiwenXia/cmi-pref" "$out/hugging-face"
else
  cat <<'EOF'
Downloaded CMI-RewardBench documentation and lightweight test manifests.

Set CMI_REWARDBENCH_DOWNLOAD_HF=1 to fetch the public, ungated CMI-Pref
snapshot (approximately 15.0 GB). CMI-Pref is CC BY-NC-SA 4.0, but generated
music may retain commercial service/output terms. Composite benchmark subsets
from PAM, MusicEval, and Music Arena retain their own source terms.
EOF
fi

echo "CMI-RewardBench metadata download complete: $out"
