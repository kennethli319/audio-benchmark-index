# Audio Benchmark Index

A living index of audio benchmarks, starting from the Audio -> Text evaluation
benchmarks cited in the Qwen3.5-Omni technical report, section 5.1.

The goal is simple: for each benchmark, keep a pointer to the official project,
how to get the data, and the upstream license or access terms. This repository
does not mirror datasets or grant rights to use any upstream data.

Seed source: [Qwen3.5-Omni Technical Report](https://arxiv.org/html/2604.15804v1#S5),
Audio -> Text evaluation block.

Last checked: 2026-07-09. Current seed size: 16 distinct benchmarks
or benchmark families, with FLEURS de-duplicated across S2TT and ASR.

## Benchmarks

| Benchmark | Qwen bucket | Download pointer | Upstream license / terms |
| --- | --- | --- | --- |
| [MMAU](https://github.com/Sakshi113/MMAU) | Audio understanding | [MMAU-test-mini](https://huggingface.co/datasets/gamma-lab-umd/MMAU-test-mini), [MMAU-test](https://huggingface.co/datasets/gamma-lab-umd/MMAU-test) | HF cards list `cc-by-nc-4.0` for test-mini and `mit` for test; code repo is Apache-2.0 |
| [MMAR](https://github.com/ddlBoJack/MMAR) | Audio understanding | [BoJack/MMAR](https://huggingface.co/datasets/BoJack/MMAR) | HF card lists `cc-by-nc-4.0`; code repo had no detected license |
| [MMSU](https://github.com/dingdongwang/MMSU) | Audio understanding | [ddwang2000/MMSU](https://huggingface.co/datasets/ddwang2000/MMSU) | HF card lists `mit`; code repo had no detected license |
| [RUL-MuchoMusic](https://github.com/yongyizang/AreYouReallyListening) | Audio understanding | [RUL-MuchoMusic.json](https://raw.githubusercontent.com/yongyizang/AreYouReallyListening/main/RUL-MuchoMusic.json), [RUListening](https://huggingface.co/datasets/yongyizang/RUListening) | RUL repo/HF card list MIT; upstream MuChoMusic dataset is CC BY-SA 4.0 |
| [SongFormBench](https://huggingface.co/datasets/ASLP-lab/SongFormBench) | Audio understanding | `load_dataset("ASLP-lab/SongFormBench")` | HF card and SongFormer repo list CC BY 4.0 |
| [VoiceBench](https://github.com/MatthewCYM/VoiceBench) | End-to-end speech dialogue | [hlt-lab/voicebench](https://huggingface.co/datasets/hlt-lab/voicebench) | Apache-2.0 |
| [URO-Bench-pro](https://github.com/Ruiqi-Yan/URO-Bench) | End-to-end speech dialogue | [Honggao/URO-Bench](https://huggingface.co/datasets/Honggao/URO-Bench) | MIT |
| [SpeechRole](https://github.com/yuhui1038/SpeechRole) | End-to-end speech dialogue | [SpeechRole-Eval](https://huggingface.co/datasets/yuhui1038/SpeechRole-Eval), [SpeechRole-Data](https://huggingface.co/datasets/yuhui1038/SpeechRole-Data) | HF cards list MIT; repo has no separate detected license |
| [WildSpeech-Bench](https://github.com/Tencent/WildSpeech-Bench) | End-to-end speech dialogue | [tencent/WildSpeech-Bench](https://huggingface.co/datasets/tencent/WildSpeech-Bench) | License.txt says CC BY 4.0 except third-party datasets with their own terms |
| [FLEURS](https://huggingface.co/datasets/google/fleurs) | S2TT and ASR | `load_dataset("google/fleurs", "en_us")` or another locale | CC BY 4.0 |
| [Common Voice](https://github.com/common-voice/cv-dataset) | ASR | [Mozilla Data Collective Common Voice](https://mozilladatacollective.com/organization/cmfh0j9o10006ns07jq45h7xk) | Common Voice datasets are CC0-1.0; metadata repo is MPL-2.0 |
| [LibriSpeech](https://www.openslr.org/12) | ASR | OpenSLR SLR12 tarballs or [openslr/librispeech_asr](https://huggingface.co/datasets/openslr/librispeech_asr) | CC BY 4.0 |
| [WenetSpeech](https://github.com/wenet-e2e/WenetSpeech) | ASR | Apply for password on the [official site](https://wenet-e2e.github.io/WenetSpeech/), then use repo scripts | Non-commercial use under CC BY 4.0; original audio copyrights remain with owners |
| [KeSpeech](https://github.com/tzyll/KeSpeech) | ASR | Baidu Pan link in repo, password `b6fy` | Custom terms: non-commercial, no adaptations, no third-party distribution |
| [Opencpop-test](https://github.com/wenet-e2e/opencpop) | ASR / singing voice | Apply via the [official download page](https://wenet-e2e.github.io/opencpop/download/) and use the test split | CC BY-NC-ND 4.0 |
| [MIR-1K vocal](http://mirlab.org/dataset/public/) | ASR / singing voice | [Figshare mirror](https://figshare.com/articles/dataset/MIR-1K_rar/5802891); official MIR Lab archive currently returns 404 | Official page does not state a license; Figshare mirror lists CC BY 4.0 |

## Download Examples

Hugging Face datasets:

```python
from datasets import load_dataset

mmau_mini = load_dataset("gamma-lab-umd/MMAU-test-mini")
mmar = load_dataset("BoJack/MMAR")
mmsu = load_dataset("ddwang2000/MMSU")
fleurs_en = load_dataset("google/fleurs", "en_us")
```

Hugging Face CLI:

```bash
huggingface-cli download --repo-type dataset BoJack/MMAR --local-dir data/MMAR
huggingface-cli download --repo-type dataset Honggao/URO-Bench URO-Bench-data.zip --local-dir data/URO-Bench
```

OpenSLR:

```bash
wget -P data/LibriSpeech https://www.openslr.org/resources/12/test-clean.tar.gz
```

Form/password gated datasets:

- WenetSpeech: read the license, request the password on the official site, put it in `SAFEBOX/password`, then run `bash utils/download_wenetspeech.sh DOWNLOAD_DIR UNTAR_DIR`.
- Opencpop: fill out the official Google Form and follow the email instructions.
- KeSpeech: use the Baidu Pan link in the repo with password `b6fy`; downloading means accepting the custom dataset license.

## Data File

The editable source of truth is [data/audio_benchmarks.yaml](data/audio_benchmarks.yaml).
Use it for scripts, sorting, or future additions.

## Download Scripts

Per-benchmark CLI helpers live in [scripts/download](scripts/download).
They download into `data/raw/<benchmark-id>/` by default, which is ignored by git.
For example:

```bash
scripts/download/mmar.sh
FLEURS_CONFIG=ja_jp scripts/download/fleurs.sh
LIBRISPEECH_PARTS="test-clean train-clean-100" scripts/download/librispeech.sh
```

Some datasets require manual upstream access first. Their helper scripts print
the required form, password, or generated URL step instead of pretending there is
a public one-command download.

## License Notes

The license of this repository covers only this index. Each benchmark keeps its
own license and access conditions. Before training, redistribution, commercial
use, or benchmark publication, re-check the upstream license page and cite the
benchmark authors.
