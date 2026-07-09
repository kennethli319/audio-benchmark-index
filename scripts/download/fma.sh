#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir fma)"
repo_raw="${FMA_REPO_RAW:-https://raw.githubusercontent.com/mdeff/fma/master}"
base_url="${FMA_BASE_URL:-https://os.unil.cloud.switch.ch/fma}"
audio_parts="${FMA_AUDIO_PARTS:-small}"

download_url "$repo_raw/README.md" "$out/README.md"
download_url "$repo_raw/LICENSE.txt" "$out/LICENSE.txt"

if [[ "${FMA_DOWNLOAD_METADATA:-0}" == "1" ]]; then
  download_url "$base_url/fma_metadata.zip" "$out/fma_metadata.zip"
else
  echo "Skipping FMA metadata archive (342 MiB). Set FMA_DOWNLOAD_METADATA=1 to download it."
fi

if [[ "${FMA_DOWNLOAD_AUDIO:-0}" != "1" ]]; then
  echo "Skipping FMA audio archives. Set FMA_DOWNLOAD_AUDIO=1 and FMA_AUDIO_PARTS=\"small medium large full\" to download selected archives."
  echo "FMA default audio part is: small"
  echo "FMA official sizes: small 7.2 GiB, medium 22 GiB, large 93 GiB, full 879 GiB."
  exit 0
fi

for part in $audio_parts; do
  case "$part" in
    small|medium|large|full)
      download_url "$base_url/fma_$part.zip" "$out/fma_$part.zip"
      ;;
    *)
      echo "Unsupported FMA audio part: $part" >&2
      echo "Use FMA_AUDIO_PARTS with any of: small medium large full." >&2
      exit 2
      ;;
  esac
done

echo "FMA download complete: $out"
