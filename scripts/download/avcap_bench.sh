#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir avcap_bench)"

download_url "https://arxiv.org/abs/2608.06930" "$out/paper.html"
download_url "https://export.arxiv.org/api/query?id_list=2608.06930" "$out/paper-api.xml"
download_url "https://huggingface.co/api/collections/Apryle/avcap" "$out/collection-api.json"
download_url "https://huggingface.co/api/models/Apryle/AVCap-Codes" "$out/benchmark-code-api.json"
download_url "https://huggingface.co/api/datasets/Apryle/AVCap-Dataset" "$out/training-dataset-api.json"

cat <<MSG
AVCap-Bench public metadata download complete: $out

The benchmark files are stored in Apryle/AVCap-Codes and require manual owner
approval on Hugging Face. This helper intentionally does not request access or
download the gated 1,000-video benchmark, the approximately 842.5 GB training
dataset, or the approximately 70.5 GB model. The benchmark/code card exposes no
license field; do not infer Apache 2.0 from the separate dataset or model cards.
MSG
