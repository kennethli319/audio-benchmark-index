#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir asvspoof_5)"
zenodo_api="${ASVSPOOF5_ZENODO_API:-https://zenodo.org/api/records/14498691}"
asvspoof_base="${ASVSPOOF5_BASE_URL:-https://www.asvspoof.org}"
repo_raw="${ASVSPOOF5_REPO_RAW:-https://raw.githubusercontent.com/asvspoof-challenge/asvspoof5/main}"

download_url "$zenodo_api" "$out/zenodo-record.json"
download_url "$zenodo_api/files/README.txt/content" "$out/README.txt"
download_url "$zenodo_api/files/LICENSE.txt/content" "$out/LICENSE.txt"
download_url "$asvspoof_base/" "$out/challenge.html"
download_url "$asvspoof_base/file/ASVspoof5___Evaluation_Plan_Phase2.pdf" "$out/evaluation-plan-phase2.pdf"
download_url "https://arxiv.org/abs/2502.08857" "$out/database-paper.html"
download_url "$repo_raw/README.md" "$out/baseline-README.md"

if [[ "${ASVSPOOF5_DOWNLOAD_PROTOCOLS:-0}" != "1" ]]; then
  echo "Downloaded ASVspoof 5 metadata, license, evaluation plan, and documentation to: $out"
  echo "Set ASVSPOOF5_DOWNLOAD_PROTOCOLS=1 to download the approximately 19.7 MiB protocol archive."
  echo "The approximately 142.3 GB audio release must be selected directly from the Zenodo record."
  exit 0
fi

download_url "$zenodo_api/files/ASVspoof5_protocols.tar.gz/content" "$out/ASVspoof5_protocols.tar.gz"
echo "ASVspoof 5 protocol download complete: $out"
