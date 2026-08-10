#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir audio_hallucination)"
repo_raw="${AUDIO_HALLUCINATION_REPO_RAW_URL:-https://raw.githubusercontent.com/kuan2jiu99/audio-hallucination/dd129013b0bac37de90501e5a71a4fd9594460f6}"

download_url "$repo_raw/icassp2025/README.md" "$out/README.md"
download_url "$repo_raw/icassp2025/evaluation.py" "$out/evaluation.py"

download_url "https://huggingface.co/api/datasets/kuanhuggingface/Audio-Hallucination_Object-Existence_AudioCaps-ESC50-VocalSound" "$out/object-existence-api.json"
download_url "https://huggingface.co/api/datasets/kuanhuggingface/Audio-Hallucination_Temporal-Order_CompA-Order" "$out/temporal-order-api.json"
download_url "https://huggingface.co/api/datasets/kuanhuggingface/Audio-Hallucination_Object-Attribute_CompA-Attribute" "$out/object-attribute-api.json"
download_url "https://huggingface.co/api/datasets/kuanhuggingface/BEAF-Audio" "$out/object-existence-audio-api.json"

download_url "https://huggingface.co/datasets/kuanhuggingface/Audio-Hallucination_Object-Existence_AudioCaps-ESC50-VocalSound/resolve/2fa8961577b921e9b6858c058d8161ab4e4382ea/data/test-00000-of-00001-628ec76c82b0f88c.parquet" "$out/object-existence.parquet"
download_url "https://huggingface.co/datasets/kuanhuggingface/Audio-Hallucination_Temporal-Order_CompA-Order/resolve/9869210a345b41519f291fe6b8a86ef64b81736e/data/test-00000-of-00001-635f97f686110060.parquet" "$out/temporal-order.parquet"
download_url "https://huggingface.co/datasets/kuanhuggingface/Audio-Hallucination_Object-Attribute_CompA-Attribute/resolve/21e5246803063963dd282a196de8ae8d43804673/data/test-00000-of-00001-117a75e7762fb59c.parquet" "$out/object-attribute.parquet"

if [[ "${AUDIO_HALLUCINATION_DOWNLOAD_EXISTENCE_AUDIO:-0}" == "1" ]]; then
  download_url "https://huggingface.co/datasets/kuanhuggingface/BEAF-Audio/resolve/4b7a985d41c7b4b6a0898b2126772f5129ac2015/BEAF_Audio.tar" "$out/BEAF_Audio.tar"
else
  echo "Skipping BEAF_Audio.tar (~2.29 GB). Set AUDIO_HALLUCINATION_DOWNLOAD_EXISTENCE_AUDIO=1 to download it."
fi

cat <<MSG
Audio Hallucination annotations and metadata downloaded to: $out

Temporal-order and object-attribute rows reference CompA audio, which is not
redistributed by this helper. Review the official benchmark README and CompA
release terms before obtaining those assets. No benchmark data license is stated.
MSG
