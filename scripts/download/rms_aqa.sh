#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

split="${RMS_AQA_DOWNLOAD_SPLIT:-}"
case "$split" in
  ""|dev|train) ;;
  *) echo "RMS_AQA_DOWNLOAD_SPLIT must be dev or train; test is not released." >&2; exit 2 ;;
esac
if [[ -n "$split" && "${RMS_AQA_ACK_ACCESS:-0}" != "1" ]]; then
  manual_required "RMS-AQA" \
    "Review owner conditions, obtain approval, and authenticate separately first:" \
    "https://huggingface.co/datasets/PeacefulData/RMS-AQA" \
    "Then use RMS_AQA_ACK_ACCESS=1 RMS_AQA_DOWNLOAD_SPLIT=$split."
fi

out="$(dataset_dir rms_aqa)"
data_revision="4aa667fe3b516823328d3312638b4b6221344c14"
code_revision="0dc3819590274976cf35caf95adab0c715d72bb4"
download_url "https://huggingface.co/api/datasets/PeacefulData/RMS-AQA/revision/$data_revision" "$out/dataset-metadata.json"
download_url "https://huggingface.co/api/datasets/PeacefulData/RMS-AQA/tree/$data_revision?recursive=true&limit=1000" "$out/dataset-tree.json"
download_url "https://api.github.com/repos/rmsaqachallenge/rmsaqa-code/git/trees/$code_revision?recursive=1" "$out/code-tree.json"
download_url "https://raw.githubusercontent.com/rmsaqachallenge/rmsaqa-code/$code_revision/README.md" "$out/CODE_README.md"

cat <<'EOF'
Saved RMS-AQA public metadata and baseline documentation; no audio by default.
Dataset and code licenses are unspecified. Review the owner's gated conditions
and upstream sound/RIR/model terms before reuse. The Hub requests contact and
affiliation details for approval; this helper neither accepts terms nor logs in.

After separate access approval and authentication, select ONE split explicitly:
  RMS_AQA_ACK_ACCESS=1 RMS_AQA_DOWNLOAD_SPLIT=dev scripts/download/rms_aqa.sh
  RMS_AQA_ACK_ACCESS=1 RMS_AQA_DOWNLOAD_SPLIT=train scripts/download/rms_aqa.sh
Dev archives total about 11.8 GB; train about 163.2 GB. Extraction needs more space.
The hidden test set is planned for November 24, 2026; it is not in this snapshot.

At inference, Stage 2 uses the generated Stage-1 response. Grounded accuracy
requires both answers correct; report Stage-1, raw Stage-2 and category scores.
Keep the scorer's category IDs/names and record failures. Public baseline code
requires backbone assets and a trained checkpoint, neither supplied here.
EOF

if [[ -n "$split" ]]; then
  require_cmd python3
  python3 - "$data_revision" "$split" "$out/$split" <<'PY'
import sys
try:
    from huggingface_hub import snapshot_download
except ImportError:
    raise SystemExit("Install huggingface_hub separately before requesting a split.")
revision, split, destination = sys.argv[1:]
snapshot_download(
    repo_id="PeacefulData/RMS-AQA",
    repo_type="dataset",
    revision=revision,
    allow_patterns=[f"{split}_QA/*.tar.zst", f"{split}_audio/*.tar.zst"],
    local_dir=destination,
)
PY
fi
