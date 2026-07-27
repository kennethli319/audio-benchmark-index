# Contributing

This repository is meant to stay easy to update.

## Add A Benchmark

1. Add or update an entry in `data/audio_benchmarks.yaml`.
2. Add `scripts/download/<benchmark-id>.sh` when the dataset has a CLI path. If access is gated, add a helper that prints the required manual step and accepts a generated URL/password through environment variables.
3. Prefer official sources: project homepage, paper, GitHub repo, Hugging Face dataset card, OpenSLR page, Zenodo/Figshare record, or the dataset owner's download page.
4. Record the access path precisely: direct archive, Hugging Face ID, form/password workflow, API, or request process.
5. Be conservative about licenses. If the official page does not clearly say a license, write `not_specified` and include a note.
6. Add noteworthy provenance, alias, or incomplete-release findings to `docs/research-audits.md`.
7. Regenerate the public site and verify that generated artifacts are current:

   ```bash
   ruby scripts/build_site.rb
   ruby scripts/build_site.rb --check
   ```

The YAML and generated public site are authoritative. Do not add benchmark rows
to the top-level README; keep it as a concise project landing page.

## Suggested Entry Fields

```yaml
- id: short_id
  name: Benchmark Name
  full_name: Full benchmark title
  qwen_cited_as: Optional paper citation name
  qwen_bucket: audio_understanding
  tasks:
    - asr
  official:
    repo: https://github.com/example/project
    paper: https://arxiv.org/abs/0000.00000
  download:
    primary:
      - https://huggingface.co/datasets/org/dataset
    examples:
      - 'from datasets import load_dataset; ds = load_dataset("org/dataset")'
  license:
    data: cc-by-4.0
    code: MIT
    notes: Any caveats.
  sources:
    - https://huggingface.co/datasets/org/dataset
```

## License Hygiene

- Do not upload benchmark data to this repository.
- Do not summarize a license as permissive unless the source explicitly says so.
- Keep code/repository licenses separate from dataset licenses.
- Note non-commercial, no-derivatives, no-redistribution, and request-only access terms prominently.
- Re-check licenses before using a benchmark for training, commercial work, redistribution, or leaderboard submissions.

## Documentation Layout

- `README.md`: short project overview and navigation.
- `docs/benchmark-catalog.md`: repository-native catalog snapshot.
- `docs/download-guide.md`: representative helper commands and access examples.
- `docs/research-audits.md`: detailed release and provenance findings.
- `scripts/download/README.md`: complete helper inventory.

When moving or adding documentation, keep the structured YAML and public site as
the source of truth. Avoid duplicating benchmark metadata in multiple manually
maintained files unless the document is explicitly labeled as a snapshot.
