#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir vaani_noise_event)"
revision="be488e2ac12fd62bef46b9f83e3a5feded575333"
code_revision="32cff11da797b966f74ab4ee21f9b7b38fba85de"
api="https://huggingface.co/api/datasets/ARTPARK-IISc/Vaani-Noise-Event-Dataset"
code_base="https://raw.githubusercontent.com/nagshubhadip/noise-event-detection-and-removal/$code_revision"

# Public metadata only. The raw dataset card and all media remain gated.
download_url "$api/revision/$revision" "$out/dataset-info.json"
download_url "$api/tree/$revision?recursive=true&expand=false" "$out/file-tree.json"
download_url "$code_base/README.md" "$out/baseline-README.md"
for track in 17825 17835; do
  download_url "https://www.codabench.org/api/competitions/$track/" "$out/codabench-$track.json"
done

cat <<'NOTICE'
Saved public VAANI Noise Event / IndoML 2026 metadata and baseline documentation.
No audio, Parquets, archives, weights, executable code, or gated files downloaded.

Training access: review the conditions and contact-disclosure requirement at
https://huggingface.co/datasets/ARTPARK-IISc/Vaani-Noise-Event-Dataset
The card declares CC BY 4.0; 182 training Parquets total about 17.73 GB.

Evaluation access: review the competition terms and use Get Started -> Files:
https://www.codabench.org/competitions/17825/
https://www.codabench.org/competitions/17835/
Registration closed September 9, 2026; access/submission requires approval.
Competition data has competition-only, no-redistribution and no-commercial-use
terms without organizer permission. Do not assume the training card licenses
these files. Baseline code has no specified license. Resolve applicable terms
with the owners before reuse; this helper cannot accept terms or authenticate.

Track 1 keeps its test across phases. Track 2 Phase 2 changes inputs; retain
phase identity. Codabench's 11-hour test description differs from the card's
10-hour holdout. Ground truth is private. Training subsets are not the test.
Combined: Track 1 Event F1 + Dice; Track 2 synthetic SI-SDR + 100*dWER fraction.
The displayed dWER percentage must not be multiplied by 100 again.
Metadata files are saved once; use a fresh DATASET_DOWNLOAD_DIR to recheck
live competition terms and phase metadata on a future date.
NOTICE

echo "VAANI metadata download complete: $out"
