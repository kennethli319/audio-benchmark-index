# Audio Benchmark Index

A living index of audio benchmarks, starting from the Audio -> Text evaluation
benchmarks cited in the Qwen3.5-Omni technical report, section 5.1.

The goal is simple: for each benchmark, keep a pointer to the official project,
how to get the data, and the upstream license or access terms. This repository
does not mirror datasets or grant rights to use any upstream data.

Seed source: [Qwen3.5-Omni Technical Report](https://arxiv.org/html/2604.15804v1#S5),
Audio -> Text evaluation block.

Last checked: 2026-07-09. Current index size: 32 distinct benchmarks
or benchmark families, with FLEURS de-duplicated across S2TT and ASR.

## Benchmarks

| Benchmark | Qwen bucket | Download pointer | Upstream license / terms |
| --- | --- | --- | --- |
| [MMAU](https://github.com/Sakshi113/MMAU) | Audio understanding | [MMAU-test-mini](https://huggingface.co/datasets/gamma-lab-umd/MMAU-test-mini), [MMAU-test](https://huggingface.co/datasets/gamma-lab-umd/MMAU-test) | HF cards list `cc-by-nc-4.0` for test-mini and `mit` for test; code repo is Apache-2.0 |
| [MMAR](https://github.com/ddlBoJack/MMAR) | Audio understanding | [BoJack/MMAR](https://huggingface.co/datasets/BoJack/MMAR) | HF card lists `cc-by-nc-4.0`; code repo had no detected license |
| [MMSU](https://github.com/dingdongwang/MMSU) | Audio understanding | [ddwang2000/MMSU](https://huggingface.co/datasets/ddwang2000/MMSU) | HF card lists `mit`; code repo had no detected license |
| [RUL-MuchoMusic](https://github.com/yongyizang/AreYouReallyListening) | Audio understanding | [RUL-MuchoMusic.json](https://raw.githubusercontent.com/yongyizang/AreYouReallyListening/main/RUL-MuchoMusic.json), [RUListening](https://huggingface.co/datasets/yongyizang/RUListening) | RUL repo/HF card list MIT; upstream MuChoMusic dataset is CC BY-SA 4.0 |
| [SongFormBench](https://huggingface.co/datasets/ASLP-lab/SongFormBench) | Audio understanding | `load_dataset("ASLP-lab/SongFormBench")` | HF card and SongFormer repo list CC BY 4.0 |
| [MagnaTagATune](https://mirg.city.ac.uk/codeapps/the-magnatagatune-dataset) | Music tagging | Official MIRG-hosted metadata, annotations, comparisons, optional Echo Nest features, and optional MP3 split archives | CC BY-NC-SA 3.0 for data; GPLv3 for scripts; Magnatune audio excerpts are non-commercial research redistribution |
| [VoiceBench](https://github.com/MatthewCYM/VoiceBench) | End-to-end speech dialogue | [hlt-lab/voicebench](https://huggingface.co/datasets/hlt-lab/voicebench) | Apache-2.0 |
| [URO-Bench-pro](https://github.com/Ruiqi-Yan/URO-Bench) | End-to-end speech dialogue | [Honggao/URO-Bench](https://huggingface.co/datasets/Honggao/URO-Bench) | MIT |
| [SpeechRole](https://github.com/yuhui1038/SpeechRole) | End-to-end speech dialogue | [SpeechRole-Eval](https://huggingface.co/datasets/yuhui1038/SpeechRole-Eval), [SpeechRole-Data](https://huggingface.co/datasets/yuhui1038/SpeechRole-Data) | HF cards list MIT; repo has no separate detected license |
| [WildSpeech-Bench](https://github.com/Tencent/WildSpeech-Bench) | End-to-end speech dialogue | [tencent/WildSpeech-Bench](https://huggingface.co/datasets/tencent/WildSpeech-Bench) | License.txt says CC BY 4.0 except third-party datasets with their own terms |
| [FLEURS](https://huggingface.co/datasets/google/fleurs) | S2TT and ASR | `load_dataset("google/fleurs", "en_us")` or another locale | CC BY 4.0 |
| [VoxPopuli](https://github.com/facebookresearch/voxpopuli) | ASR and S2TT | [facebook/voxpopuli](https://huggingface.co/datasets/facebook/voxpopuli); select a language/config and split before downloading the large HF repository | Data is CC0-1.0; code and pretrained models are CC BY-NC 4.0; raw data also points to European Parliament legal notice |
| [GigaSpeech](https://github.com/SpeechColab/GigaSpeech) | ASR | [speechcolab/gigaspeech](https://huggingface.co/datasets/speechcolab/gigaspeech) after access approval; default helper config is `dev` | HF terms restrict data to non-commercial research and educational use; code repo is Apache-2.0 |
| [Common Voice](https://github.com/common-voice/cv-dataset) | ASR | [Mozilla Data Collective Common Voice](https://mozilladatacollective.com/organization/cmfh0j9o10006ns07jq45h7xk) | Common Voice datasets are CC0-1.0; metadata repo is MPL-2.0 |
| [LibriSpeech](https://www.openslr.org/12) | ASR | OpenSLR SLR12 tarballs or [openslr/librispeech_asr](https://huggingface.co/datasets/openslr/librispeech_asr) | CC BY 4.0 |
| [WenetSpeech](https://github.com/wenet-e2e/WenetSpeech) | ASR | Apply for password on the [official site](https://wenet-e2e.github.io/WenetSpeech/), then use repo scripts | Non-commercial use under CC BY 4.0; original audio copyrights remain with owners |
| [KeSpeech](https://github.com/tzyll/KeSpeech) | ASR | Baidu Pan link in repo, password `b6fy` | Custom terms: non-commercial, no adaptations, no third-party distribution |
| [Opencpop-test](https://github.com/wenet-e2e/opencpop) | ASR / singing voice | Apply via the [official download page](https://wenet-e2e.github.io/opencpop/download/) and use the test split | CC BY-NC-ND 4.0 |
| [MIR-1K vocal](http://mirlab.org/dataset/public/) | ASR / singing voice | [Figshare mirror](https://figshare.com/articles/dataset/MIR-1K_rar/5802891); official MIR Lab archive currently returns 404 | Official page does not state a license; Figshare mirror lists CC BY 4.0 |
| [ESC-50](https://github.com/karolpiczak/ESC-50) | Environmental sound classification | [GitHub archive](https://github.com/karolpiczak/ESC-50/archive/refs/heads/master.zip) or `git clone https://github.com/karolpiczak/ESC-50.git` | ESC-50 is CC BY-NC 3.0; ESC-10 subset clips are CC BY |
| [UrbanSound8K](https://urbansounddataset.weebly.com/urbansound8k.html) | Environmental sound classification | [Zenodo archive](https://zenodo.org/records/1203745) or the official browser/Python download page | Zenodo lists CC BY-NC 4.0; official site says free for non-commercial use under Creative Commons BY-NC 3.0 |
| [AudioSet](https://research.google.com/audioset/) | Audio event classification | Official [CSV metadata](https://research.google.com/audioset/download.html) and optional precomputed features archive | Dataset annotations/features are CC BY 4.0; ontology is CC BY-SA 4.0; original YouTube media terms still apply |
| [FSD50K](https://fsannotator.upf.edu/fsd/release/FSD50K/) | Audio event classification | [Zenodo record](https://zenodo.org/records/4060432); helper downloads docs/labels/metadata by default and audio only with opt-in | Mixed Creative Commons: per-clip Freesound licenses include CC0, CC-BY, CC-BY-NC, and CC Sampling+; curated dataset is CC BY with upstream caveats |
| [VoxCeleb](https://www.robots.ox.ac.uk/~vgg/data/voxceleb/) | Speaker recognition | [OpenSLR SLR49 metadata/trial lists](https://www.openslr.org/49/); official VGG pages currently say original audio/URL files are no longer available there | VGG metadata is CC BY-SA 4.0; OpenSLR SLR49 lists its small metadata resource as not copyrighted; original YouTube media rights still apply |
| [Speech Commands](https://www.tensorflow.org/datasets/catalog/speech_commands) | Keyword spotting | Official TensorFlow archives: [v0.02](https://storage.googleapis.com/download.tensorflow.org/data/speech_commands_v0.02.tar.gz), [v0.01](https://storage.googleapis.com/download.tensorflow.org/data/speech_commands_v0.01.tar.gz), or [google/speech_commands](https://huggingface.co/datasets/google/speech_commands) | CC BY 4.0; HF card asks users not to try to identify speakers |
| [RAVDESS](https://zenodo.org/records/1188976) | Speech emotion recognition | [Zenodo record](https://zenodo.org/records/1188976); helper saves metadata by default and downloads audio-only speech/song ZIPs with opt-in | CC BY-NC-SA 4.0; commercial licenses are separate |
| [IEMOCAP](https://sail.usc.edu/iemocap/) | Speech emotion recognition | Official [release page](https://sail.usc.edu/iemocap/iemocap_release.htm) after reading the [USC/SAIL data release form](https://sail.usc.edu/iemocap/Data_Release_Form_IEMOCAP.pdf) and submitting the request form | Custom USC/SAIL data release terms; access is manual/form-gated |
| [MUSAN](https://www.openslr.org/17/) | Speech/music/noise classification | [OpenSLR SLR17](https://www.openslr.org/17/) corpus archive; helper downloads the OpenSLR page by default and requires opt-in for the 11 GiB archive | CC BY 4.0 |
| [AMI](https://groups.inf.ed.ac.uk/ami/corpus/) | Meeting ASR | Official [annotation ZIPs](https://groups.inf.ed.ac.uk/ami/download/), optional [OpenSLR SLR16](https://www.openslr.org/16/) acoustic archives, or [edinburghcstr/ami](https://huggingface.co/datasets/edinburghcstr/ami) | Official AMI pages list CC BY 4.0; OpenSLR mirror still shows an older modified CC BY-NC-SA v2.0 notice |
| [CHiME-6](https://www.chimechallenge.org/datasets/chime6) | Meeting ASR / diarization | [OpenSLR SLR150](https://www.openslr.org/150/) transcriptions/floorplans by default; large train/dev/eval audio archives are opt-in | CC BY-SA 4.0 |
| [Clotho](https://zenodo.org/records/4783391) | Audio captioning | [Zenodo v2.1 record](https://zenodo.org/records/4783391); captions/metadata are small, audio archives are about 7.1 GiB | Mixed terms: audio clips keep per-file Freesound licenses; captions use the Tampere University license, mainly non-commercial with attribution |
| [AudioCaps](https://audiocaps.github.io/) | Audio captioning | Official [CSV metadata](https://github.com/cdjkim/audiocaps/tree/master/dataset) and [AudioCaps 2.0 CSV metadata](https://github.com/cdjkim/audiocaps/tree/master/dataset2.0); raw audio/video requires the upstream form | README says code and dataset are free for academic purposes only; repo license is MIT, but raw clips inherit AudioSet/YouTube availability and terms |

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

VoxPopuli:

```bash
VOXPOPULI_CONFIG=en VOXPOPULI_SPLITS="test validation" scripts/download/voxpopuli.sh
```

Gated Hugging Face ASR:

```bash
GIGASPEECH_ACK_ACCESS=1 GIGASPEECH_CONFIG=dev scripts/download/gigaspeech.sh
GIGASPEECH_ACK_ACCESS=1 GIGASPEECH_CONFIG=xs scripts/download/gigaspeech.sh
```

Direct archives:

```bash
scripts/download/esc_50.sh
URBANSOUND8K_DOWNLOAD_AUDIO=1 scripts/download/urbansound8k.sh
```

Audio event metadata:

```bash
scripts/download/audioset.sh
AUDIOSET_DOWNLOAD_FEATURES=1 AUDIOSET_REGION=us scripts/download/audioset.sh
scripts/download/fsd50k.sh
FSD50K_DOWNLOAD_AUDIO=1 scripts/download/fsd50k.sh
```

Speaker recognition metadata:

```bash
scripts/download/voxceleb.sh
VOXCELEB_OPENSLR_BASE_URL=https://openslr.elda.org/resources/49 scripts/download/voxceleb.sh
```

Keyword spotting:

```bash
SPEECH_COMMANDS_VERSION=v0.02 scripts/download/speech_commands.sh
SPEECH_COMMANDS_VERSION=v0.01 scripts/download/speech_commands.sh
```

Speech emotion recognition:

```bash
scripts/download/ravdess.sh
RAVDESS_DOWNLOAD_AUDIO=1 scripts/download/ravdess.sh
```

Speech/music/noise classification:

```bash
scripts/download/musan.sh
MUSAN_DOWNLOAD_ARCHIVE=1 scripts/download/musan.sh
```

Meeting ASR:

```bash
scripts/download/ami.sh
AMI_DOWNLOAD_OPENSLR_AUDIO=1 AMI_OPENSLR_PARTS="headset.tar.gz" scripts/download/ami.sh
scripts/download/chime_6.sh
CHIME6_DOWNLOAD_AUDIO=1 CHIME6_PARTS="CHiME6_dev.tar.gz CHiME6_eval.tar.gz" scripts/download/chime_6.sh
```

Audio captioning:

```bash
scripts/download/clotho.sh
CLOTHO_DOWNLOAD_AUDIO=1 scripts/download/clotho.sh
scripts/download/audiocaps.sh
AUDIOCAPS_VERSION=2.0 scripts/download/audiocaps.sh
```

Music tagging:

```bash
scripts/download/magnatagatune.sh
MAGNATAGATUNE_DOWNLOAD_FEATURES=1 scripts/download/magnatagatune.sh
MAGNATAGATUNE_DOWNLOAD_AUDIO=1 scripts/download/magnatagatune.sh
```

Form/password gated datasets:

- WenetSpeech: read the license, request the password on the official site, put it in `SAFEBOX/password`, then run `bash utils/download_wenetspeech.sh DOWNLOAD_DIR UNTAR_DIR`.
- GigaSpeech: fill out the official form, accept the Hugging Face terms, log in locally, then run `GIGASPEECH_ACK_ACCESS=1 GIGASPEECH_CONFIG=dev scripts/download/gigaspeech.sh`.
- Opencpop: fill out the official Google Form and follow the email instructions.
- KeSpeech: use the Baidu Pan link in the repo with password `b6fy`; downloading means accepting the custom dataset license.
- IEMOCAP: read the USC/SAIL data release form and submit the official electronic release request; follow the access instructions sent by SAIL.

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
VOXPOPULI_CONFIG=en VOXPOPULI_SPLITS="test validation" scripts/download/voxpopuli.sh
GIGASPEECH_ACK_ACCESS=1 GIGASPEECH_CONFIG=dev scripts/download/gigaspeech.sh
scripts/download/esc_50.sh
URBANSOUND8K_DOWNLOAD_AUDIO=1 scripts/download/urbansound8k.sh
scripts/download/audioset.sh
scripts/download/fsd50k.sh
scripts/download/voxceleb.sh
scripts/download/speech_commands.sh
scripts/download/ravdess.sh
scripts/download/iemocap.sh
scripts/download/musan.sh
scripts/download/ami.sh
scripts/download/chime_6.sh
scripts/download/clotho.sh
scripts/download/audiocaps.sh
scripts/download/magnatagatune.sh
```

Some datasets require manual upstream access first. Their helper scripts print
the required form, password, or generated URL step instead of pretending there is
a public one-command download.

## License Notes

The license of this repository covers only this index. Each benchmark keeps its
own license and access conditions. Before training, redistribution, commercial
use, or benchmark publication, re-check the upstream license page and cite the
benchmark authors.
