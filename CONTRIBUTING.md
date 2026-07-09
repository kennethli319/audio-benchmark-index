# Contributing

This repository is meant to stay easy to update.

## Add A Benchmark

1. Add or update an entry in `data/audio_benchmarks.yaml`.
2. Add a row to the table in `README.md` if it belongs in the main visible list.
3. Add `scripts/download/<benchmark-id>.sh` when the dataset has a CLI path. If access is gated, add a helper that prints the required manual step and accepts a generated URL/password through environment variables.
4. Prefer official sources: project homepage, paper, GitHub repo, Hugging Face dataset card, OpenSLR page, Zenodo/Figshare record, or the dataset owner's download page.
5. Record the access path precisely: direct archive, Hugging Face ID, form/password workflow, API, or request process.
6. Be conservative about licenses. If the official page does not clearly say a license, write `not_specified` and include a note.

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
