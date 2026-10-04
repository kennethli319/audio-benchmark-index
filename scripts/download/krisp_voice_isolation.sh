#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir krisp_voice_isolation)"
raw_revision="626bac8ca07fb9b4846d4f62d27c321753160b36"
processed_revision="8759715197e39e0356125e3f3197a9854c38fa60"
space_revision="faab89e2654b7fbe0d2a4a706f46477f7a5f7d14"

# Explicit small-file allowlist only: no audio, models, or provider requests.
for kind in raw processed; do
  if [[ "$kind" == raw ]]; then
    name="VoiceIsolation-Benchmark-Dataset"
    revision="$raw_revision"
  else
    name="VoiceIsolation-Benchmark-Dataset-Processed"
    revision="$processed_revision"
  fi
  base="https://huggingface.co/datasets/Krisp-AI/$name/raw/$revision"
  download_url "https://huggingface.co/api/datasets/Krisp-AI/$name/revision/$revision" "$out/$kind/dataset-info.json"
  download_url "$base/README.md" "$out/$kind/README.md"
  for scenario in call_center phone_calls work; do
    download_url "$base/$scenario/metadata.jsonl" "$out/$kind/$scenario/metadata.jsonl"
  done
done
space="https://huggingface.co/spaces/Krisp-AI/VoiceIsolation-Benchmark/raw/$space_revision"
download_url "https://huggingface.co/api/spaces/Krisp-AI/VoiceIsolation-Benchmark/revision/$space_revision" "$out/space-info.json"
download_url "$space/README.md" "$out/space-README.md"
download_url "$space/index.html" "$out/methodology.html"

cat <<'NOTICE'
Saved pinned public metadata, annotations, and static methodology HTML only.
No audio, model weights, credentials, inference, paid services, or terms acceptance.
The HTML is source documentation; this helper does not execute its snippets.

Review terms and retrieve audio manually from:
https://huggingface.co/datasets/Krisp-AI/VoiceIsolation-Benchmark-Dataset
https://huggingface.co/datasets/Krisp-AI/VoiceIsolation-Benchmark-Dataset-Processed
Raw audio is about 1.30 GB; four processed variants together are about 3.24 GB.
Both dataset cards declare CC BY-NC 4.0. The Space declares CC BY-NC-ND 4.0;
no separate software license or complete evaluation harness was located.
Model/SDK and ASR-service rights remain separate.

Pair the 265 IDs across raw and processed versions. Four processed metadata
paths for work sample 228 include an erroneous standard/ prefix: the tree has
work/vi_2_5_{default,balanced,lite,hd}/228.wav. Document local repairs explicitly.
Scenario speakers overlap. Phone calls are described as a preservation test,
but still contain some mix/secondary annotations. Do not drop those intervals.
Use the pinned normalization and corpus WER protocol; the per-file empty-ref
example is unsuitable for measuring secondary-only insertions. Public scoring
snippets do not establish exact replay of the advertised engine results.
NOTICE

echo "Krisp Voice Isolation metadata download complete: $out"
