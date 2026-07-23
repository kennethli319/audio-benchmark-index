#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir audio_agent_bench_suite)"
org="arcada-labs"
repos=(
  conversation-bench
  product-bench
  grocery-bench
  appointment-bench
  event-bench
  assistant-bench
)

download_url "https://huggingface.co/datasets/$org/audio-agent-bench-suite/raw/main/README.md" "$out/README.md"
download_url "https://huggingface.co/api/datasets/$org/audio-agent-bench-suite" "$out/suite-api.json"

for repo in "${repos[@]}"; do
  download_url "https://huggingface.co/datasets/$org/$repo/raw/main/README.md" "$out/${repo}-README.md"
  download_url "https://huggingface.co/api/datasets/$org/$repo" "$out/${repo}-api.json"
done

if [[ "${AUDIO_AGENT_BENCH_DOWNLOAD_HF:-0}" == "1" ]]; then
  for repo in "${repos[@]}"; do
    hf_download_dataset "$org/$repo" "$out/hf/$repo"
  done
else
  cat <<'EOF'
Downloaded official cards and API metadata only.

Set AUDIO_AGENT_BENCH_DOWNLOAD_HF=1 to fetch all six public component
snapshots (about 209 MB of current repository storage). The suite card declares
CC BY 4.0 while the component cards declare MIT; confirm the intended terms.
EOF
fi

echo "Audio Agent Bench Suite metadata download complete: $out"
