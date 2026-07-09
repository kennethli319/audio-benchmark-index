#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir dns_challenge)"
raw_base="${DNS_CHALLENGE_RAW_BASE:-https://raw.githubusercontent.com/microsoft/DNS-Challenge/master}"

download_repo_file() {
  local file="$1"
  download_url "$raw_base/$file" "$out/$file"
}

download_repo_file README.md
download_repo_file LICENSE
download_repo_file LICENSE-CODE
download_repo_file download-dns5-dev-testset.sh
download_repo_file download-dns5-blind-testset.sh
download_repo_file download-dns-challenge-5-noise-ir.sh
download_repo_file download-dns-challenge-5-headset-training.sh
download_repo_file download-dns-challenge-5-speakerphone-training.sh

if [[ "${DNS_CHALLENGE_CLONE_REPO:-0}" == "1" ]]; then
  clone_or_update "https://github.com/microsoft/DNS-Challenge.git" "$out/DNS-Challenge"
fi

if [[ "${DNS_CHALLENGE_DOWNLOAD_DEV_TESTSET:-0}" == "1" ]]; then
  dev_url="${DNS_CHALLENGE_DEV_TESTSET_URL:-https://dnschallengepublic.blob.core.windows.net/dns5archive/V5_dev_testset.zip}"
  echo "Downloading DNS5 dev testset. The archive is about 2.9 GiB."
  download_url "$dev_url" "$out/V5_dev_testset.zip"
fi

if [[ "${DNS_CHALLENGE_DOWNLOAD_BLIND_TESTSET:-0}" == "1" ]]; then
  blind_url="${DNS_CHALLENGE_BLIND_TESTSET_URL:-https://dnschallengepublic.blob.core.windows.net/dns5archive/V5_BlindTestSet.zip}"
  echo "Downloading DNS5 blind testset archive."
  download_url "$blind_url" "$out/V5_BlindTestSet.zip"
fi

if [[ "${DNS_CHALLENGE_DOWNLOAD_TRAINING:-0}" == "1" ]]; then
  cat <<'MSG' >&2
DNS Challenge training resources are very large: the DNS5 README estimates
about 550 GiB archived and about 1 TB unpacked. Use the official downloader
scripts saved in this directory after reviewing them and the upstream terms.
MSG
  exit 2
fi

cat <<MSG
DNS Challenge metadata/scripts saved to: $out
Large archives were skipped. Useful opt-ins:
  DNS_CHALLENGE_DOWNLOAD_DEV_TESTSET=1 scripts/download/dns_challenge.sh
  DNS_CHALLENGE_DOWNLOAD_BLIND_TESTSET=1 scripts/download/dns_challenge.sh
  DNS_CHALLENGE_CLONE_REPO=1 scripts/download/dns_challenge.sh
MSG
