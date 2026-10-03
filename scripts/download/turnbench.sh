#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

split="${TURNBENCH_DOWNLOAD_SPLIT:-}"
case "$split" in
  ""|dev|test) ;;
  *) echo "TURNBENCH_DOWNLOAD_SPLIT must be dev or test." >&2; exit 2 ;;
esac

if [[ -n "$split" && "${TURNBENCH_ACK_ACCESS:-0}" != "1" ]]; then
  manual_required "TurnBench" \
    "Review and accept the official dataset terms and authenticate separately first:" \
    "https://huggingface.co/datasets/mundo-ai/turn-benchmark-$split" \
    "Then run: TURNBENCH_ACK_ACCESS=1 TURNBENCH_DOWNLOAD_SPLIT=$split scripts/download/turnbench.sh"
fi

out="$(dataset_dir turnbench)"
repo_raw="https://raw.githubusercontent.com/SesameAILabs/turnbench/main"
download_url "$repo_raw/README.md" "$out/README.md"
download_url "$repo_raw/LICENSE" "$out/CODE_LICENSE"
download_url "$repo_raw/docs/SUBMISSION_FORMAT.md" "$out/SUBMISSION_FORMAT.md"
download_url "$repo_raw/turnbench/README.md" "$out/SCORING.md"
download_url "https://api.github.com/repos/SesameAILabs/turnbench/commits/main" "$out/repository-revision.json"
for part in dev test; do
  download_url "https://huggingface.co/api/datasets/mundo-ai/turn-benchmark-$part" "$out/$part-metadata.json"
  download_url "$repo_raw/turnbench/splits/$part.txt" "$out/$part-ids.txt"
done

cat <<EOF_INFO
TurnBench public documentation and metadata saved to: $out

Audio requires accepting the official Hugging Face dataset terms and a
separately authenticated session. Dataset cards describe a custom license:
non-commercial use, no voice cloning, attribution, and license-preserving
redistribution. Read each full dataset LICENSE before use; CODE_LICENSE
covers the software only. This helper does not accept terms or log in.

Choose one split explicitly after obtaining access (downloads multiple GB):
  TURNBENCH_ACK_ACCESS=1 TURNBENCH_DOWNLOAD_SPLIT=dev scripts/download/turnbench.sh
  TURNBENCH_ACK_ACCESS=1 TURNBENCH_DOWNLOAD_SPLIT=test scripts/download/turnbench.sh

Use FLAC speaker channels for predictions, not Opus previews. Test labels
remain withheld; local scoring uses dev. Record the scorer revision and
include lookahead in event timestamps. Official protocol and submission:
  https://turnbench.sesame.com/
EOF_INFO

if [[ -n "$split" ]]; then
  hf_download_dataset "mundo-ai/turn-benchmark-$split" "$out/$split"
fi
