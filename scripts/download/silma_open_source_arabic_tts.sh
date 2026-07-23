#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir silma_open_source_arabic_tts)"
space="silma-ai/opensource-arabic-tts-benchmark"
base="https://huggingface.co/spaces/$space"

download_url "$base/raw/main/README.md" "$out/README.md"
download_url "$base/raw/main/app.py" "$out/app.py"
download_url "https://huggingface.co/api/spaces/$space" "$out/space-api.json"

for variety in msa egy ksa; do
  download_url \
    "$base/raw/main/results/$variety/Ar_${variety}_TTS_benchmark.csv" \
    "$out/Ar_${variety}_TTS_benchmark.csv"
done

if [[ "${SILMA_ARABIC_TTS_CLONE_SPACE:-0}" == "1" ]]; then
  git clone --depth 1 "$base" "$out/space"
else
  cat <<'EOF'
Downloaded official documentation, prompt CSVs, and Space API metadata only.

Set SILMA_ARABIC_TTS_CLONE_SPACE=1 to clone the approximately 29.6 MB Space,
including generated comparison audio. Space metadata declares Apache-2.0, but
prompt provenance and evaluated-model output terms are not separately stated.
EOF
fi

echo "SILMA Open-source Arabic TTS Benchmark metadata download complete: $out"
