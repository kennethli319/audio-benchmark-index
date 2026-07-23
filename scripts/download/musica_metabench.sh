#!/usr/bin/env bash

set -euo pipefail
source "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/lib/common.sh"

out="$(dataset_dir musica_metabench)"
repo="${MUSICA_METABENCH_REPO:-tomsouri/MusICA-MetaBench-preprint}"
repo_url="https://github.com/$repo"
raw_url="https://raw.githubusercontent.com/$repo/main"

download_url "$raw_url/README.md" "$out/README.md"
download_url "$raw_url/benchmarks/README.md" "$out/benchmarks-README.md"
download_url "$raw_url/LICENSE" "$out/LICENSE-CODE"
download_url "$raw_url/LICENSE-DATA-CHORALEBRICKS" "$out/LICENSE-DATA-CHORALEBRICKS"
download_url "$raw_url/LICENSE-DATA-CHORALSYNTH" "$out/LICENSE-DATA-CHORALSYNTH"
download_url "$raw_url/meta-questions.tsv" "$out/meta-questions.tsv"
download_url "$raw_url/ontology.yaml" "$out/ontology.yaml"
download_url \
  "$raw_url/benchmark-generation-config.yaml" \
  "$out/benchmark-generation-config.yaml"
download_url \
  "$raw_url/benchmarks/qs_per_subcat_20/seed_52.tsv" \
  "$out/chorale-bricks-seed-52.tsv"
download_url \
  "$raw_url/benchmarks/choralsynth.size20.seed_52.tsv" \
  "$out/choralsynth-seed-52.tsv"
download_url "https://api.github.com/repos/$repo" "$out/github-repository.json"
download_url "https://export.arxiv.org/api/query?id_list=2607.06015" "$out/paper-arxiv.xml"

if [[ "${MUSICA_METABENCH_CLONE_REPO:-0}" == "1" ]]; then
  git_clone_or_update "$repo_url" "$out/repository"
else
  cat <<'EOF'
Downloaded MusICA-MetaBench documentation and two 300-item benchmark TSVs.

Set MUSICA_METABENCH_CLONE_REPO=1 to clone the approximately 49 MB repository
with generation/evaluation code and result artifacts. Source audio and scores
are obtained separately from ChoraleBricks or ChoralSynth under their terms.
EOF
fi

echo "MusICA-MetaBench metadata download complete: $out"
