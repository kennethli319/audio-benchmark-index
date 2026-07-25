#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir uiq)"
raw_base="${UIQ_GITHUB_RAW_BASE:-https://raw.githubusercontent.com/JudeJiwoo/Omni-Embed-Audio/main/data/UIQ}"

download_url "$raw_base/README.md" "$out/README.md"
download_url "$raw_base/LICENSE" "$out/LICENSE"

for dataset in audiocaps clotho mecat; do
  case "$dataset" in
    audiocaps)
      prefix="audiocaps_test"
      ;;
    clotho)
      prefix="clotho_evaluation"
      ;;
    mecat)
      prefix="mecat"
      ;;
  esac

  for query_type in question imperative paraphrase tagging negative; do
    download_url \
      "$raw_base/$dataset/${prefix}_${query_type}_queries.jsonl" \
      "$out/$dataset/${prefix}_${query_type}_queries.jsonl"
  done
done

cat >&2 <<'EOF'
UIQ query download complete.
The release contains text queries only. Obtain AudioCaps, Clotho, and MECAT
audio separately under each source dataset's terms.
EOF
echo "UIQ download complete: $out"
