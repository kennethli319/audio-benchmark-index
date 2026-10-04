#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir msi_bench)/metadata-a98fb641-d98a6147"
data_revision="a98fb641d085846733f1d519de942cd534a991cb"
code_revision="d98a61473f7401c170b69ad5e73a674537e07acf"
data_base="https://huggingface.co/datasets/M2cha4l1124/MSI-Bench/resolve/$data_revision"
code_base="https://raw.githubusercontent.com/boson-ai/MSI-Bench/$code_revision"

for file in README.md LICENSE ATTRIBUTION.md docs/SCHEMA.md docs/PACKAGE_README.md CHECKSUMS.sha256; do
  download_url "$data_base/$file" "$out/data/$file"
done
for file in README.md LICENSE; do
  download_url "$code_base/$file" "$out/code/$file"
done

cat <<'NOTE'
Downloaded pinned MSI-Bench documentation, licenses and checksum manifest only.
No audio, case/rubric/probe manifests, executable code, models or API calls.

Review the CC BY 4.0 data license and retain ATTRIBUTION.md, including separate
CC0 / CC BY 3.0 / CC BY 4.0 source notices. The harness is separately MIT.
Obtain the full pinned package manually after reviewing its terms:
https://huggingface.co/datasets/M2cha4l1124/MSI-Bench/tree/a98fb641d085846733f1d519de942cd534a991cb
The package is approximately 4.29 GB, including 4.27 GB of audio. This metadata
folder is not an evaluation-ready dataset; verify full-package checksums later.

Use the official release adapter with --probes, preserving case IDs and turns.
The pinned rubric index has 1152 unique rubric IDs; the schema's 576 is stale.
Report language, audio/transcript condition, probe mode and all denominators.
PRR excludes invalid outputs; absent judge reports can omit unfinished batches.
The evaluator can invoke paid model/judge APIs; this helper does not run it.
NOTE

echo "MSI-Bench documentation download complete: $out"
