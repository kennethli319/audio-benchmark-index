#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir cv3_eval)"
raw_base_url="${CV3_EVAL_RAW_BASE_URL:-https://raw.githubusercontent.com/FunAudioLLM/CV3-Eval/main}"
repo_url="${CV3_EVAL_REPO_URL:-https://github.com/FunAudioLLM/CV3-Eval.git}"

download_url "$raw_base_url/readme.md" "$out/readme.md"
download_url "$raw_base_url/LICENSE" "$out/LICENSE"

if [[ "${CV3_EVAL_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/CV3-Eval"
else
  cat <<'EOF'
Downloaded CV3-Eval documentation only. The official repository is roughly
760 MiB and includes evaluation audio plus bundled scoring utilities/models.

Set CV3_EVAL_CLONE_REPO=1 to clone it. Although the repository is Apache-2.0,
its README identifies Common Voice, FLEURS, EmoBox, and web-crawled reference
audio; verify component provenance and rights before redistribution.
EOF
fi

echo "CV3-Eval metadata download complete: $out"
