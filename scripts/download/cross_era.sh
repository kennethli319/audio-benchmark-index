#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir cross_era)"

download_url \
  "https://www.audiolabs-erlangen.de/resources/MIR/cross-era" \
  "$out/official-project-page.html"
download_url \
  "https://www.audiolabs-erlangen.de/content/resources/MIR/cross-era/cross-era_annotations.csv" \
  "$out/cross-era_annotations.csv"
download_url \
  "https://www.audiolabs-erlangen.de/content/resources/MIR/cross-era/cross-era_chords-chordino.zip" \
  "$out/cross-era_chords-chordino.zip"
download_url \
  "https://huggingface.co/datasets/StravynDynamics/cross-era-classical-work-years/raw/main/README.md" \
  "$out/work-years-README.md"
download_url \
  "https://huggingface.co/api/datasets/StravynDynamics/cross-era-classical-work-years" \
  "$out/work-years-hf-api.json"
download_url \
  "https://huggingface.co/datasets/StravynDynamics/cross-era-classical-work-years/resolve/main/cross-era_classical_work_years.csv" \
  "$out/cross-era_classical_work_years.csv"

if [[ "${CROSS_ERA_DOWNLOAD_CHROMA:-0}" == "1" ]]; then
  download_url \
    "https://www.audiolabs-erlangen.de/content/resources/MIR/cross-era/cross-era_chroma-nnls.zip" \
    "$out/cross-era_chroma-nnls.zip"
else
  echo "Skipping approximately 244 MB NNLS chroma archive."
  echo "Set CROSS_ERA_DOWNLOAD_CHROMA=1 to download it."
fi

echo "The underlying commercial recordings are not publicly downloadable."
echo "Cross-Era metadata and feature download complete: $out"
