#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir mmae)"
metadata="$out/metadata-2026-10-03"
site_revision="ed28e4637e26cd309f294355c77b06c124408918"
baseline_revision="dd8ab692edf5725fee4de5758d00a57c7d4b26ef"
hf_revision="9c5de09799dcabe124f62bc8dd4e5f936709608f"
hf_repo="${MMAE_HF_REPO:-BoJack/MMAE}"
repo_url="${MMAE_REPO_URL:-https://github.com/ddlBoJack/MMAE.git}"
raw_base_url="${MMAE_RAW_BASE_URL:-https://raw.githubusercontent.com/ddlBoJack/MMAE/65c06372aa3f4bfd5a6131be0078de10377200a0}"
repo_api_url="${MMAE_REPO_API_URL:-https://api.github.com/repos/ddlBoJack/MMAE}"

download_url "$raw_base_url/README.md" "$metadata/README.md"
download_url "$raw_base_url/LICENSE" "$metadata/LICENSE"
download_url "$repo_api_url" "$metadata/github-repo.json"
download_url "https://huggingface.co/datasets/$hf_repo/raw/$hf_revision/README.md" "$metadata/hf_README.md"
download_url "https://huggingface.co/api/datasets/$hf_repo/revision/$hf_revision" "$metadata/hf-dataset.json"

# Explicit documentation-only allowlist; no challenge data, weights or SDK.
site_base="https://raw.githubusercontent.com/Audio-Editing-Challenge/audio-editing-challenge.github.io/$site_revision"
for file in index.md pages/leaderboard.md pages/track1.md pages/track2.md pages/faqs.md; do
  download_url "$site_base/$file" "$metadata/challenge/$file"
done
download_url "https://raw.githubusercontent.com/Audio-Editing-Challenge/Audio-Editing-Challenge-Baseline/$baseline_revision/README.md" "$metadata/challenge/baseline_README.md"

cat <<'NOTICE'
ICASSP 2027 challenge: the new 500-example-per-track test sets, submission SDK
and leaderboard are announced for November 10, 2026, and are not released yet.
The public MMAE data below is the existing development resource for the challenge.
October 3 rules extend registration to October 8 and the Agent Track model
release cutoff to before November 1. Consult the current rules before entering:
https://audio-editing-challenge.github.io/
The two baseline score rows use different cohorts (1003 versus 2000 samples).
The MMAE evaluator is MIT; the separate challenge baseline has no declared
software license. Data/source-audio rights remain unspecified.
NOTICE

if [[ "${MMAE_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "$repo_url" "$out/MMAE"
else
  echo "Skipping evaluation repo clone. Set MMAE_CLONE_REPO=1 to clone/update it."
fi

if [[ "${MMAE_DOWNLOAD_HF:-0}" != "1" ]]; then
  cat <<'EOF'
Downloaded MMAE documentation and repository metadata only.
The audited public Hugging Face snapshot totals 5,547,121,285 bytes (about 5.55 GB),
including 2,185 WAVs; the full snapshot is opt-in. Hub usedStorage is not its
transfer size. The opt-in fetches the current main snapshot, which may change.

Set MMAE_DOWNLOAD_HF=1 to download the snapshot. The dataset card does not
declare a data license or identify source-audio licenses; review the underlying
media rights before reuse, redistribution, or commercial use.
EOF
  echo "MMAE metadata download complete: $out"
  exit 0
fi

hf_download_dataset "$hf_repo" "$out/hf"
echo "MMAE requested download complete: $out"
