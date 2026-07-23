#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir speech_edit_bench)"
hf_repo="${SPEECH_EDIT_BENCH_HF_REPO:-DiscreteSpeech/SpeechEditBench}"
repo_url="${SPEECH_EDIT_BENCH_REPO_URL:-https://github.com/daxintan-cuhk/SpeechEditBench.git}"
raw_base_url="${SPEECH_EDIT_BENCH_RAW_BASE_URL:-https://raw.githubusercontent.com/daxintan-cuhk/SpeechEditBench/master}"
repo_api_url="${SPEECH_EDIT_BENCH_REPO_API_URL:-https://api.github.com/repos/daxintan-cuhk/SpeechEditBench}"

download_url "$raw_base_url/README.md" "$out/README.md"
download_url "$raw_base_url/LICENSE" "$out/LICENSE"
download_url "$raw_base_url/release_manifests/v1.1/dataset_manifest.json" "$out/dataset_manifest.json"
download_url "$repo_api_url" "$out/github-repo.json"
download_url "https://huggingface.co/datasets/$hf_repo/raw/main/README.md" "$out/hf_README.md"
download_url "https://huggingface.co/api/datasets/$hf_repo" "$out/hf-dataset.json"

for task in acoustic compositional content emotion paralinguistic prosody speaker style; do
  download_url \
    "$raw_base_url/data/${task}_editing/samples.jsonl" \
    "$out/samples/${task}_editing.jsonl"
done

if [[ "${SPEECH_EDIT_BENCH_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/SpeechEditBench"
else
  echo "Skipping evaluation repo clone. Set SPEECH_EDIT_BENCH_CLONE_REPO=1 to clone/update it."
fi

if [[ "${SPEECH_EDIT_BENCH_DOWNLOAD_HF:-0}" != "1" ]]; then
  cat <<'EOF'
Downloaded SpeechEditBench documentation and sample metadata only.
The public Hugging Face release uses approximately 3.75 GB of storage and
contains source speech from corpora with mixed upstream terms.

Set SPEECH_EDIT_BENCH_DOWNLOAD_HF=1 to download the v1.1 snapshot. Review the
source_dataset field and the paper's license appendix before reuse,
redistribution, or commercial use.
EOF
  echo "SpeechEditBench metadata download complete: $out"
  exit 0
fi

hf_download_dataset "$hf_repo" "$out/hf"
echo "SpeechEditBench requested download complete: $out"
