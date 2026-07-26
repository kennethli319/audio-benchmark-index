#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir emoprefer)"
official_root="https://raw.githubusercontent.com/zeroQiaoba/AffectGPT/master/EmoPrefer"
audit_root="https://raw.githubusercontent.com/jiabingyang01/EmoPrefer-Audit/main"
annotations=(
  preference_emoprefer.csv
  preference_emoprefer_reverse.csv
  preference_emoprefer_with_modelnames.csv
  preference_emopreferv2.csv
  preference_emopreferv2_reverse.csv
  preference_emopreferv2_with_modelnames.csv
)

download_url "$official_root/README.md" "$out/README.md"
download_url "$official_root/LICENSE" "$out/LICENSE"
download_url "https://api.github.com/repos/zeroQiaoba/AffectGPT" "$out/official-repo.json"
download_url "https://huggingface.co/api/datasets/MERChallenge/MER2025" "$out/mer2025-api.json"
download_url \
  "https://zeroqiaoba.github.io/MER-Challenge/" \
  "$out/mer2026-challenge.html"
download_url \
  "https://huggingface.co/api/datasets/MERChallenge/MER2026" \
  "$out/mer2026-api.json"

for annotation in "${annotations[@]}"; do
  download_url \
    "$official_root/dataset/$annotation" \
    "$out/annotations/$annotation"
done

download_url "$audit_root/README.md" "$out/audit-README.md"
download_url "$audit_root/data/README.md" "$out/audit-data-README.md"
download_url "$audit_root/LICENSE" "$out/audit-LICENSE"
download_url \
  "https://api.github.com/repos/jiabingyang01/EmoPrefer-Audit" \
  "$out/audit-repo.json"

cat <<'EOF'
Downloaded the public EmoPrefer annotations and official/audit documentation.

The paired source audio/video is not included. The original release points to
the gated MER2025 page. MER2026 Track 3 also packages EmoPrefer-V1/V2 media and
challenge tables behind manual approval:
https://huggingface.co/datasets/MERChallenge/MER2025
https://huggingface.co/datasets/MERChallenge/MER2026

Both gates impose academic/non-commercial and no-redistribution conditions.
The MER2026 form also prohibits mirroring, modification, and redistribution of
derived files without prior written permission.

Do not commit downloaded media, access tokens, or private evaluation rows.
EOF

echo "EmoPrefer metadata and annotation download complete: $out"
