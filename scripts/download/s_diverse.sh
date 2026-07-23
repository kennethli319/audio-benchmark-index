#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir s_diverse)"
raw_base_url="${S_DIVERSE_RAW_BASE_URL:-https://raw.githubusercontent.com/ferugit/s-diverse/master}"
repo_url="${S_DIVERSE_REPO_URL:-https://github.com/ferugit/s-diverse.git}"

download_url "$raw_base_url/README.md" "$out/README.md"
download_url "$raw_base_url/data/s-diverse.tsv" "$out/s-diverse.tsv"
download_url "$raw_base_url/src/download_audio.py" "$out/download_audio.py"
download_url \
  "https://api.github.com/repos/ferugit/s-diverse" \
  "$out/github-repository.json"

if [[ "${S_DIVERSE_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/s-diverse"
else
  echo "Skipping repository clone. Set S_DIVERSE_CLONE_REPO=1 to clone/update it."
fi

cat <<'EOF'
Downloaded S-DiverSe annotations, documentation, and reconstruction code only.
Audio is not redistributed. The TSV links to public videos and contains health
condition metadata and potentially identifiable speech/transcripts. Review
consent, privacy, ethics, source rights, and platform terms before use.
EOF
echo "S-DiverSe metadata download complete: $out"
