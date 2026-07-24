#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir forestir)"
repo_url="https://github.com/TIPColin/ForestIR"
raw_url="${FORESTIR_GITHUB_RAW_URL:-https://raw.githubusercontent.com/TIPColin/ForestIR/main}"
api_url="${FORESTIR_GITHUB_API_URL:-https://api.github.com/repos/TIPColin/ForestIR}"

download_url "$raw_url/README.md" "$out/README.md"
download_url "$raw_url/LICENSE" "$out/LICENSE"
download_url "$api_url" "$out/github-api.json"
download_url "https://arxiv.org/abs/2607.06299" "$out/arxiv-2607.06299.html"

if [[ "${FORESTIR_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/repo"
else
  cat <<'EOF'
Downloaded ForestIR documentation, license, repository metadata, and paper only.

Set FORESTIR_CLONE_REPO=1 to clone the public simulator and bundled inputs
(GitHub currently reports approximately 31 MB). The processed site recordings
needed for the paper's full validation are request-only and are not fetched.
Review the provenance and terms of bundled bird and environmental recordings.
EOF
fi

echo "ForestIR metadata download complete: $out"
