# Audio Benchmark Index

A living, source-aware index of speech, audio, music, and multimodal audio benchmarks.

**[Browse the public searchable index](https://kennethli319.github.io/audio-benchmark-index/)**

The project tracks official sources, realistic access paths, upstream licenses, and practical
download guidance. It covers benchmark families across speech recognition and translation,
speech generation, audio understanding, dialogue, audiovisual reasoning, sound events,
enhancement and separation, speaker and emotion tasks, music, spatial audio, and more.

## What is included

- A searchable GitHub Pages catalog generated from structured YAML.
- Official project, paper, repository, dataset, and archive links.
- Access labels for public, gated, form-based, password-protected, metadata-only, and unreleased artifacts.
- Separate dataset and code license notes, including upstream-media caveats.
- Safe-first helper scripts that keep large or restricted downloads behind explicit opt-ins.
- Research audits documenting incomplete releases, aliases, and protocols that should not be counted twice.

The repository does **not** mirror benchmark datasets or grant rights to use upstream data.

## Quick start

Browse or query the structured catalog directly:

```bash
git clone https://github.com/kennethli319/audio-benchmark-index.git
cd audio-benchmark-index
ruby -e 'require "yaml"; require "date"; data = YAML.safe_load(File.read("data/audio_benchmarks.yaml"), permitted_classes: [Date], aliases: false); puts data.fetch("benchmarks").size'
```

Run a download helper with its safe defaults:

```bash
scripts/download/mmar.sh
scripts/download/fleurs.sh
scripts/download/esc_50.sh
```

Helpers write to `data/raw/<benchmark-id>/`, which is ignored by Git. Large downloads and
restricted access require benchmark-specific environment variables or manual steps.

## Repository map

| Path | Purpose |
| --- | --- |
| [`data/audio_benchmarks.yaml`](data/audio_benchmarks.yaml) | Editable source of truth |
| [`scripts/download/`](scripts/download/) | Per-benchmark safe download helpers |
| [`scripts/download/README.md`](scripts/download/README.md) | Complete helper and access reference |
| [`site/index.template.html`](site/index.template.html) | Searchable website template |
| [`docs/`](docs/) | Generated site plus project documentation |
| [`CONTRIBUTING.md`](CONTRIBUTING.md) | Adding and reviewing benchmark entries |

## Documentation

- [Benchmark catalog snapshot](docs/benchmark-catalog.md)
- [Download guide and examples](docs/download-guide.md)
- [Research and release audits](docs/research-audits.md)
- [Contribution workflow](CONTRIBUTING.md)

## Build the website

```bash
ruby scripts/build_site.rb
ruby scripts/build_site.rb --check
```

Edit the YAML or site template, then regenerate the checked-in files under `docs/`.
Do not hand-edit `docs/index.html` or `docs/site-manifest.json`.

## Current snapshot

Last checked: **2026-07-28**. The index contains **387 distinct benchmarks or benchmark families**,
with FLEURS de-duplicated across speech-to-text translation and ASR.

The initial seed came from the Audio-to-Text evaluation benchmarks in section 5.1 of the
Qwen3.5-Omni technical report. The scope has since expanded across the broader audio evaluation landscape.

## License

The repository license covers this index and its code, not upstream datasets or media.
Re-check each benchmark’s current terms before training, redistribution, commercial use,
or publishing benchmark results.
