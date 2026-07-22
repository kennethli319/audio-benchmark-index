#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir libriwasn)"
zenodo_api_url="${LIBRIWASN_ZENODO_API_URL:-https://zenodo.org/api/records/10952434}"
repo_raw_url="${LIBRIWASN_REPO_RAW_URL:-https://raw.githubusercontent.com/fgnt/libriwasn/main}"
repo_api_url="${LIBRIWASN_REPO_API_URL:-https://api.github.com/repos/fgnt/libriwasn}"
paper_url="${LIBRIWASN_PAPER_URL:-https://arxiv.org/abs/2308.10682}"

download_url "$zenodo_api_url" "$out/zenodo-record.json"
download_url "$zenodo_api_url/files/readme.txt/content" "$out/readme.txt"
download_url "$zenodo_api_url/files/ccby4.txt/content" "$out/ccby4.txt"
download_url "$repo_raw_url/README.md" "$out/repository-README.md"
download_url "$repo_raw_url/LICENSE" "$out/repository-LICENSE"
download_url "$repo_api_url" "$out/github-api.json"
download_url "$paper_url" "$out/arxiv-2308.10682.html"

if [[ "${LIBRIWASN_DOWNLOAD_ARCHIVES:-0}" == "1" ]]; then
  parts="${LIBRIWASN_PARTS:-LibriWASN_200_0S.zip}"
  for part in $parts; do
    case "$part" in
      LibriWASN_200_0S.zip|LibriWASN_200_0L.zip|LibriWASN_200_OV10.zip|LibriWASN_200_OV20.zip|LibriWASN_200_OV30.zip|LibriWASN_200_OV40.zip|LibriWASN_800_0S.zip|LibriWASN_800_0L.zip|LibriWASN_800_OV10.zip|LibriWASN_800_OV20.zip|LibriWASN_800_OV30.zip|LibriWASN_800_OV40.zip)
        download_url "$zenodo_api_url/files/$part/content" "$out/$part"
        ;;
      *)
        echo "Unknown LIBRIWASN_PARTS item: $part" >&2
        exit 2
        ;;
    esac
  done
else
  echo "Skipping the approximately 55.8 GB audio release. Set LIBRIWASN_DOWNLOAD_ARCHIVES=1 and choose LIBRIWASN_PARTS to fetch selected ZIPs."
fi

cat <<MSG
LibriWASN documentation download complete: $out

The Zenodo data is CC BY 4.0 and the official tools are MIT. The recordings
replay LibriSpeech/LibriCSS material; preserve provenance and review upstream
terms before redistributing derived data.
MSG
