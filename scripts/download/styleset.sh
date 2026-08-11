#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir styleset)"
hf_repo="${STYLESET_HF_REPO:-dcml0714/StyleSet}"

download_url "https://huggingface.co/datasets/$hf_repo/raw/main/README.md" "$out/README.md"
download_url "https://huggingface.co/api/datasets/$hf_repo" "$out/huggingface-api.json"
download_url "https://huggingface.co/api/datasets/$hf_repo/tree/main?recursive=true&expand=true" "$out/huggingface-tree.json"
download_url "https://export.arxiv.org/api/query?id_list=2506.05984" "$out/paper-metadata.atom"

if [[ "${STYLESET_DOWNLOAD_DATA:-0}" != "1" ]]; then
  echo "Downloaded StyleSet documentation and live metadata to: $out"
  echo "Set STYLESET_DOWNLOAD_DATA=1 and select STYLESET_TRACKS to fetch declared test Parquet files."
  exit 0
fi

tracks="${STYLESET_TRACKS:-}"
if [[ -z "$tracks" ]]; then
  echo "Set STYLESET_TRACKS to one or both of: role_playing voice_instruction_following" >&2
  exit 2
fi

includes=()
for track in $tracks; do
  case "$track" in
    role_playing|voice_instruction_following)
      includes+=(--include "$track/test-*.parquet")
      ;;
    *)
      echo "Unknown StyleSet track: $track (expected role_playing or voice_instruction_following)" >&2
      exit 2
      ;;
  esac
done

hf_download_dataset "$hf_repo" "$out/huggingface" "${includes[@]}"
echo "Downloaded selected StyleSet declared test tracks to: $out/huggingface"
echo "The Hub's undeclared train-named Parquet files were not downloaded."
