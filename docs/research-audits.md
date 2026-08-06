# Research and release audits

Detailed provenance and release-status notes collected while maintaining the Audio Benchmark Index.
These notes explain why a paper, protocol, or dataset was added, mapped to an existing family,
recorded as unreleased, or excluded from the downloadable index.

The structured source of truth remains [`data/audio_benchmarks.yaml`](../data/audio_benchmarks.yaml).
For the current browsable catalog, use the [public index](https://kennethli319.github.io/audio-benchmark-index/).

The August 2026 HyPASE paper is recorded as LALM post-training evaluation
provenance for the existing IEMOCAP, MELD, RAVDESS, and SAVEE families rather
than as a new benchmark. Section 4.1 compares Qwen2-Audio-7B-Instruct PEFT on
four-class IEMOCAP leave-one-session-out validation and the standard seven-class
MELD split; section 4.4 transfers the MELD-trained model to IEMOCAP, RAVDESS,
and SAVEE without target-domain adaptation. Although section 6 says code,
pretrained weights, and training logs are publicly available, the linked
[owner repository](https://github.com/LilSicko/HyPase) currently contains only
a one-line README and no license, implementation, weights, logs, manifests,
prompts, predictions, or scores. Existing access terms therefore remain
authoritative: IEMOCAP is form-gated, RAVDESS is CC BY-NC-SA 4.0, MELD's
GPL-3.0 release contains Friends-derived media, and SAVEE is registration-gated
for research use without a standard public data license. No duplicate family or
helper is added.

The July 2026 context-aware-preface paper is recorded as an audio-inclusive
field-evaluation audit rather than a benchmark family. Its Japanese
shopping-mall study compares no-filler, fixed-filler, and contextual-preface
robot responses across 174 interactions and 644 response instances, with 30
questionnaires per condition. It reports latency, intent-readiness timing,
dialogue-breakdown, and subjective measures, but releases no participant
audio, transcripts, system logs, annotations, questionnaires, split
manifests, evaluator code, or trained checkpoint. The paper says the study had
ethics approval, on-site notice and opt-out, and anonymized collection; those
safeguards do not create public access or reuse rights. The index therefore
adds no family or helper.

The July 2026 TaoMate paper is recorded as recent evaluation provenance for
the existing VABench protocol, not as a new benchmark family. It evaluates
60-second Mandarin and English prompt sequences with four VABench dimensions
and paper-specific temporal-stability metrics. The public Apache 2.0 repository
and approximately 38.2 GB model release make inference reproducible, but the
claimed 20-case prompt JSON currently contains only one 12-segment Mandarin
case. The complete bilingual manifest, generated outputs, per-case metrics,
and evaluation records are not released. This partial prompt example therefore
does not justify a duplicate family or helper, and the benchmark count remains
unchanged.

The July 2026 FdAudio paper is recorded as evaluation provenance for the
existing AudioCaps family rather than as a new benchmark. It post-trains on a
random 80,000-item sample from AudioCaps plus WavCaps and evaluates 957
currently available AudioCaps test clips with distribution, diversity,
text-alignment, latency, and listening-test measures. The public repository
releases the test-caption list and whole-set evaluation code, but not the exact
training sample, generated test audio, per-item metrics, or listening-test
records. Its MIT code and CC BY-NC-SA 4.0 model weights do not override the
academic-use and upstream-media terms of AudioCaps or WavCaps, so the benchmark
count and helper set remain unchanged.

The July 2026 polar-projection study is recorded as evaluation provenance for
the existing public VoiceBank-DEMAND family rather than as a new benchmark.
It evaluates six speech enhancers with Whisper-large-v3 and diagnoses two of
them with magnitude/phase sweeps using both Whisper and wav2vec 2.0. In
addition to the standard four-SNR test set, the paper creates four harsher
conditions for a combined 1,648-utterance evaluation. The authors do not
release the added mixtures, source/noise selection and random-onset manifest,
projection implementation, exact sweep configuration, predictions, or
bootstrap records. The index therefore records the reproducibility gap and
maps the work to VoiceBank-DEMAND without adding a family or helper.

The July 2026 FinnAffect follow-up is recorded as a release-status audit
rather than a new downloadable benchmark family. It evaluates continuous
valence and arousal on the 2,000-utterance Gold Standard subset of a
12,000-utterance spontaneous Finnish corpus, with speaker-grouped training and
validation folds over the remaining singly annotated samples. Although the
paper calls FinnAffect newly released, the Language Bank of Finland owner
record still says it “will be available,” marks both availability and licence
as under negotiation, and exposes no corpus files. The linked experiment
repository supplies older code and derived features but explicitly replaces
withheld raw audio with dummy noise and has no detected license. The index
therefore records the approximately 160 GB corpus, protocol, and discrepancy
without inventing a download path or counting the family.

The July 2026 Earnings25 release adds a public financial-domain ASR
benchmark with two complementary English test tracks. Testset-full supplies
498 hours of complete 2025 Q4 earnings calls from approximately 500 S&P 500
companies; testset-segmented supplies 46 hours in 290 industry-balanced,
five-to-ten-minute segments sampled from more than 2,000 U.S. calls across
2025. Both include aligned transcripts and structured speaker, role,
industry, company, and call metadata. The single Zenodo archive is about
12.0 GB, so its helper defaults to lightweight paper and record metadata and
requires explicit opt-in plus source-terms acknowledgement for the archive.
CC BY 4.0 covers the transcripts, annotations, metadata, splits, and
alignments, while the redistributed earnings-call audio remains subject to
applicable original content-provider terms.

The July 2026 MoLGE paper is recorded as existing Omnilingual ASR Corpus,
FLEURS, and Common Voice coverage rather than a new benchmark family. Its
paper links a Hugging Face derivative whose 2,342 hours of Omnilingual ASR
speech were segmented with MMS-FA into roughly 30-second chunks. The linked
repository was recreated on July 28 and, when checked minutes later, contained
only `.gitattributes`: it had no card, audio, manifest, or license. The index
therefore marks that derivative as announced and metadata-only until the
paper-specific files become verifiably available, while retaining Meta's
canonical public corpus as the usable family.

The July 2026 Qwen-Audio-3.0-TTS report adds evaluation provenance for the
existing public Seed-TTS Eval and CV3-Eval families. Its separate
Qwen-Audio-TTS-Eval suite comprises 1,375 bilingual text-normalization cases,
200 long-form cases, 894 real-world degraded-prompt cases, and 440
instruction-following cases, but the report provides no repository, dataset
card, item manifest, audio archive, evaluation code, or data license. The
paper's seven-language CV3 extension and its 20-dialect subjective prompts,
outputs, and ratings are likewise unreleased. They are therefore recorded as
protocols rather than counted as public benchmark families; the independent
Artificial Analysis arena result is a service evaluation, not downloadable
benchmark data.

The July 2026 MiMo-Audio release adds a public speech adaptation of Scale
AI's MultiChallenge. It filters the 266-example text benchmark to remove
non-spoken formats and uses a commercial TTS system with a 250-voice pool,
then evaluates speech-to-text dialogue with textual history and
speech-to-speech dialogue with fully spoken history. Xiaomi releases the
speech archive through its official evaluation set, but does not state the
surviving row count or identify the TTS provider. The helper therefore
downloads only documentation and evaluator code by default and keeps the
approximately 1.55 GB archive behind explicit opt-in.

The July 2026 BackgroundMellow release adds a public long-form cinematic
soundscape-generation evaluation family. Its paper curates roughly 100 public
YouTube trailers into 1,000 clips and evaluates 40 story prompts for
sound-event coverage and temporal alignment. The official repository releases
evaluation code, prompt/source mappings, cue manifests, comparison outputs,
and ablation results, while a public spreadsheet exposes row-level experiment
records. Source trailer media is not released as a clean archive, and neither
the repository nor spreadsheet states a license, so the helper defaults to
lightweight documentation and mappings and keeps the results export and
repository clone opt-in.

The July 2026 *Validating the Single Item Kawaii Measure* release adds a
public subjective voice/paralinguistic evaluation family. Its author-linked
workbook contains nine Japanese-participant studies with 1,228 total
participant records from 967 unique participants, covering voice-assistant and
video-game-character voice/body perceptions. The release contains ratings
and analysis rather than bundled audio. Because the workbook states no data
license, its helper downloads only the paper by default and requires explicit
license acknowledgment before exporting participant-level data.

The July 2026 TellTale paper is traced as follow-up evaluation provenance for
the existing BAH ambivalence/hesitancy family rather than counted as a new
benchmark. It uses participant-grouped five-fold cross-validation over the
1,427 labelled videos and reports Macro-F1 plus positive-class average
precision on the organizer-held test set of 152 videos from 30 unseen
participants. The final system uses only BAH transcripts despite the
dataset's audio-visual modalities. BAH remains faculty-request-gated under
its proprietary research-only EULA, the challenge labels remain private, and
the paper links no code, adapters, predictions, or score records, so the
existing manual-required helper and index count are unchanged.

The July 2026 conversational-Mandarin vowel study is recorded as a corpus
coverage audit rather than a benchmark family. Sections 2.1-2.3 derive a
5,828-token, 87-word-type analysis set from the cited Taiwan Mandarin
Spontaneous Corpus and compare generalized additive models with a permutation
baseline. The paper links no owner-controlled corpus release, selected-row
manifest, derived formants, sense labels, analysis code, or artifact license.
The count and download helpers therefore remain unchanged.

The July 2026 EmoEUS paper is recorded as an evaluation-coverage audit rather
than a new benchmark family. Section 3.1 evaluates the existing IEMOCAP and
MELD families with accuracy and weighted F1, using leave-one-session-out on
IEMOCAP and MELD's predefined train/validation/test splits. IEMOCAP remains
request/form-gated under its custom research terms, while MELD is publicly
downloadable but includes third-party television media. The paper links no
new dataset, code, predictions, or split manifest, so the count and download
helpers are unchanged.

The July 2026 paper *Estimating the Reliability of Dynamic Time Warping
Alignments Using Circumstantial Evidence* is recorded as an
evaluation-coverage audit rather than a new benchmark family. Sections 3-5
construct 19 controlled matching/non-matching scenarios from five Chopin
mazurkas. The official repository releases the generator and evaluator, but
it expects a hard-coded local `Chopin_Mazurkas` audio tree and provides no
recordings, beat annotations, paper-run selection/tampering manifest,
generated features, ground truth, or results. The paper describes random
recording selection while the current generator sorts filenames and takes the
first N, so the exact reported suite is not independently reconstructible and
no download helper is added.

The July 2026 arXiv posting of *Segmental DTW: A Parallelizable Alternative
to Dynamic Time Warping* is recorded as an evaluation-coverage audit rather
than a new benchmark family. Sections 3-4 develop on 1,953 unique performance
pairs from one Chopin mazurka and test on 7,630 pairs from four others. The
official MIT repository releases the implementation notebooks and exact
train/test filename lists, but its data-preparation notebook requires a local
`Chopin_Mazurkas` tree and does not release or link the source recordings,
beat annotations, precomputed features, generated query lists, alignments, or
complete scores. No download helper is added for those absent artifacts.

The July 2026 arXiv posting of *A Study of Parallelizable Alternatives to
Dynamic Time Warping for Aligning Long Sequences* is recorded as an
evaluation-coverage audit rather than a new benchmark family. Sections IV-VI
use five Chopin mazurkas for beat-aligned audio-to-audio evaluation, with
1,953 development pairs, 7,630 test pairs, and seven synthetic-noise
conditions. The official MIT repositories release CPU/GPU implementations,
notebooks, filename lists, small implementation-test features, and aggregate
results, but require a local `Chopin_Mazurkas` tree and do not release or link
the source recordings, beat annotations, exact noise realizations, or
complete outputs. No download helper is added for those absent artifacts.

The July 2026 SonicAGI system paper is now traced as follow-up provenance for
the existing [REAL-TSE Challenge](https://real-tse.github.io/challenge/).
It confirms the online sub-100 ms and full-context offline target-speaker
extraction protocols and reports second and fifth place respectively. It does
not release models, training code, outputs, or challenge audio; DEV, EVAL-1,
and EVAL-2 remain password-protected, evaluation-only artifacts distributed
to teams that registered before the May 31 closure.

The July 2026 MERL submission report is also traced to REAL-TSE rather than
counted as a new benchmark. It reports first place in offline Track 2 and uses
the restricted development set to show that DNSMOS and English/Chinese
speaker-similarity scores can be adversarially optimized without changing
token error rate or target-speaker timing F1. Version 1 releases no model,
processed training data, outputs, attack implementation, or score records;
its CC BY 4.0 paper license and the toolkit's MIT license do not license the
password-protected challenge audio.

The July 2026 EII-SCL paper is mapped to the existing IEMOCAP and MELD
families rather than counted as a new benchmark. Section 3 uses IEMOCAP's
standard leave-one-session-out protocol and MELD's predefined splits for
multimodal conversational emotion recognition, then adds paper-specific
emotional-inertia and ambiguous-pair analyses. Version 1 provides no project
page, code, extracted features, checkpoints, predictions, or scores. IEMOCAP
therefore remains owner-requested under signed research terms, while MELD is
public under its stated GPL-3.0 terms with separate rights review still needed
for Friends-derived media.

The May 2026 SEABAD dataset paper and July 2026 DrongoNet follow-up are now
traced to the public author-owned
[Zenodo release](https://zenodo.org/records/18290494). SEABAD supplies 50,000
balanced three-second clips, fixed 40,000/5,000/5,000
train/validation/test splits, and provenance for 1,677 Southeast Asian bird
species plus six negative-audio sources. Its compilation is CC BY 4.0, but
component recordings retain source-specific Creative Commons and dataset
terms; the helper therefore keeps the approximately 3.87 GiB archive behind
explicit source-terms acknowledgment.

The July 2026 TriA paper is audited across sections 3-4. Its official
repository releases the annotation pipeline but still marks the claimed
2,130-hour, 431-class TriA dataset and TriA-GK subsets as an incomplete TODO,
so the index records those artifacts as unreleased and provides no inferred
data link. The paper's Kitchen20 and Nonspeech7k source benchmarks are now
indexed from their official public releases. Kitchen20 supplies a fixed
five-fold evaluation from its 1,070-clip, nine-fold Apache-2.0 repository.
Nonspeech7k supplies 6,289 training and 725 test clips through the authors'
Zenodo record; because its structured CC BY 4.0 field conflicts with an
explicit CC BY-NC-SA 4.0 noncommercial statement, the index applies the
stricter terms pending clarification. DESED is already covered.

The June 2026 ATCCaps paper is recorded as an announced-but-unreleased ATC
speech dataset and evaluation audit. Sections 3-5 describe 202.94 hours,
170,385 utterances, 922 normalized call signs, and protocols for ASR,
call-sign matching, and call-sign-aware audio-text retrieval. Version 1 links
no official project, repository, dataset card, archive, access instructions,
or artifact license; searches of GitHub and Hugging Face on 2026-07-26 found
no matching release. The index therefore does not count ATCCaps as a public
benchmark family or provide a speculative download helper. Its source audio
derives from ATCO2, whose upstream terms would remain applicable to any future
release.

The July 2026 GRAFT paper is recorded as an incomplete release audit rather
than a downloadable benchmark family. Section 4.1 describes 2,500 difficult
words across English, German, French, Spanish, and Italian, each paired with
an openly licensed Lingua Libre pronunciation, while sections 5-6 report
objective pronunciation metrics and an English listener study and claim that
the benchmark, code, and checkpoints are released. However, the sole official
GitHub repository currently contains only the static sample page and 52
demonstration WAV files. It provides no benchmark word list, carrier phrases,
source identifiers, per-item licenses, evaluation manifest, scoring code, or
checkpoints, and the repository itself has no license. The index therefore
does not infer a download route or helper and will recheck for the promised
artifacts.

The July 2026 MIDI-RAE-JEPA paper also uses POP909 as its 909-song
symbolic-music source family. The official public repository provides MIDI
arrangements with melody, bridge, and piano tracks plus aligned beat, chord,
key, and tempo-derived annotations, while original commercial-song audio is
not redistributed. The repository is MIT-licensed, but the paper and README
do not separately resolve rights in the transcribed arrangements or underlying
popular compositions, so those rights require independent review. The helper
saves lightweight official metadata and the song index by default; the
approximately 47 MB repository clone is opt-in. MIDI-RAE-JEPA's crop manifest,
embeddings, trained probes, and score records remain unreleased.

The July 2026 MIDI-RAE-JEPA paper adds EMOPIA as a symbolic-music
emotion-recognition family. Section 3.1.3 evaluates linear probes on 1,071
preprocessed piano clips for four-quadrant emotion, arousal, and valence.
The official v1.0 Zenodo release contains 1,087 labelled MIDI clips and is
public and ungated; copyrighted source audio is represented only by YouTube
IDs and timestamps. Zenodo declares CC BY 4.0, but the official repository
README declares CC BY-NC-SA 4.0 and prohibits commercial use, so the index
conservatively applies the stricter terms pending clarification. The helper
saves lightweight metadata by default and makes the checksum-verified 5.5 MB
archive opt-in. MIDI-RAE-JEPA code, crop manifests, embeddings, trained probes,
and score records remain unreleased.

The July 2026 interactive symbolic-music-analysis paper adds Dilemmadata, a
public benchmark that harmonizes AugmentedNet and more than 40 Distant
Listening subcorpora into note-level pitch arrays. Sections 4.1-4.2 evaluate
held-out AugmentedNet and DLC subsets for blind Roman-numeral and structural
analysis, plus partial-label completion with five sampled masks per context
ratio. The public v1.0 repository provides processed TSVs, split structure,
column specifications, and processing scripts. Its metadata declares CC
BY-NC-SA 4.0, upstream corpus terms remain independent, and the repository has
no software LICENSE. The helper saves lightweight official metadata by default
and makes the approximately 84 MB repository clone opt-in; paper-specific mask
manifests and random seeds remain unreleased.

The July 2026 MeloBottleneck paper adds a public symbolic melody-skeleton
evaluation suite. Its official supplementary repository includes synthetic
out-of-distribution Main O2B splits, a 619-sequence TAVERN variation-to-theme
set, and a 20-sequence Jiugong ornament-to-gongche set, plus preprocessing
code, split metadata, symbolic artifacts, and result records. The helper saves
official documentation and repository metadata by default and makes the 4.76
MB code/data archive opt-in. The repository has no LICENSE file, so neither
the released artifacts nor their TAVERN, Jiugong, and folk-corpus derivatives
should be assumed reusable beyond applicable upstream terms.

The July 2026 UD-ASD paper adds coverage of the public DCASE 2022 Task 2
anomalous-sound-detection family. Its section 3.1 evaluates the official
seven-machine development release under domain shift, while the owner task
page and three Zenodo records also publish additional-training and evaluation
audio. The approximately 11.58 GiB release is CC BY 4.0; its MIT baseline is
public, but UD-ASD-specific code, checkpoints, predictions, and score records
are unreleased. The helper therefore fetches lightweight official metadata by
default and makes archive groups explicit opt-ins.

The July 2026 Quran-recitation autoresearch paper is recorded as an
unreleased evaluation audit rather than a downloadable benchmark family. It
describes 258 production Telegram-bot recordings spanning 45 surahs and a
verse-detection, transcript-splitting, and non-recitation-abstention protocol,
then claims that de-identified transcripts, labels, splits, harness code,
logs, git histories, and hashes are public. However, arXiv v1 still prints
literal `[ADD DATASET URL]` and `[ADD REPOSITORY URL]` placeholders and
provides no resolvable dataset card, artifact license, or paper-specific
repository. The index therefore adds no inferred download route or helper and
will recheck a later version for owner-controlled release URLs.

The July 2026 SpInt paper is recorded as a protocol and release audit over the
existing SpInt family. Twenty-six native Spanish listeners each rated 198
randomized stimuli spanning eleven SNRs and unprocessed, FullSubNet+, and
SGMSE+ conditions, producing 5,148 listener-response rows used to compare
seven objective intelligibility metrics. Zenodo publicly releases CC BY 4.0
metadata, responses, noise, complex masks, and reconstruction code, but not
the clean Spanish Matrix Test speech. The fixed stimuli therefore require
separately licensed owner-provided speech and must not be described as a
standalone public audio corpus.

The July 2026 arXiv posting of the 2023 Natural Backdoor Attacks paper adds
coverage of the public Eating Sound Collection. Its owner Kaggle release
contains 11,141 clips across 20 foods, hand-cut from 246 YouTube videos, and
the paper evaluates a duration-filtered 20-class subset alongside the already
indexed Speech Commands v2. Kaggle labels the collection PDDL and the baseline
repository is MIT, but no per-video licenses or per-clip provenance are
published; source-video copyright, performer/privacy rights, and YouTube terms
therefore remain unresolved. The helper fetches only metadata and documentation
by default and makes the approximately 6.27 GiB archive an authenticated,
explicit opt-in. The paper-specific poisoned mixtures, trigger files, split
manifest, seeds, predictions, and scores are not released.

The July 2026 BADGE-Greedy-DPP paper is recorded as an unreleased bioacoustic
evaluation rather than a downloadable family. It evaluates ten-run
frame-level active learning on approximately 205 annotated hours from a
preliminary HyenaSET corpus, covering 19 spotted hyenas and ten call types,
but releases no data, annotations, fixed splits, code, seeds, predictions, or
scores. The cited HyenaSET bioRxiv identifier also returned HTTP 404 through
its DOI resolver on 2026-07-25, so the index does not invent a dataset link or
license and will recheck for an owner-controlled release.

The ICASSP 2026 LongSpeech paper is recorded as an announced-but-unreleased
benchmark rather than a downloadable family. It describes more than 100,000
approximately ten-minute segments spanning ASR, speech translation,
summarization, language detection, speaker counting, content separation,
spoken QA, and temporal localization, but version 1 only says the benchmark
"will be made publicly available." It provides no owner project, repository,
dataset card, archive, item/source manifest, construction code, annotations,
or fixed evaluation files. The named source corpora have mixed terms and do
not reconstruct the paper's custom movie-dialogue, synthetic-content, split,
or task-annotation pipeline, so no download link or benchmark-family count is
invented.

The July 2026 Local Information Disclosure paper adds coverage of the
[VoicePrivacy Challenge 2024](https://www.voiceprivacychallenge.org/vp2024/)
family. Its public GPL-3.0 recipe defines the LibriSpeech enrol/trial privacy
protocol and IEMOCAP utility evaluation, but official data/model downloads
require challenge registration and a password, and IEMOCAP has a separate
owner request. The paper's selected anonymized outputs, similarity matrices,
calibration artifacts, and LID implementation are not publicly released.

The July 2026 PINT invariant-speech-tokenization paper is recorded as a
coverage audit over the existing LibriSpeech, VCTK, RAVDESS, and TIMIT
families. It reports LibriSpeech WER/CER and ABX, VCTK speaker and
parallel-invariance probes, RAVDESS emotion leakage, TIMIT-fitted baseline
tokenizers, and an underspecified 10,000-item noise evaluation. The model URL
given in the paper currently returns HTTP 404, and version 1 releases no code,
checkpoints, exact VCTK speaker holdout, noise-item manifest, trained probes,
predictions, or artifact license. Source-family access therefore does not
reproduce the paper-specific protocol, and no duplicate family or invented
download route is added.

The July 2026 discrete-audio-token speaker-verification paper is recorded as
existing VoxCeleb coverage. It trains most systems on VoxCeleb1 development
and evaluates the standard Vox1-O/E/H trial lists, with a larger-scale
VoxCeleb2 training experiment evaluated on Vox1-O. MUSAN and OpenSLR room
impulse responses provide public augmentation sources, but the VoxCeleb owner
no longer distributes its original audio or URL/timestamp metadata. Version 2
links no official code, configurations, checkpoints, predictions, or scores,
so the index retains the existing source-family helpers rather than inventing
a model-specific release.

The July 2026 arXiv posting of the ICASSP 2023 Audio Cross Verification paper
is now traced to the public DAPS source family. DAPS provides 15 aligned
studio-produced and consumer-device versions of roughly 4.5 hours each from
20 speakers under CC BY-NC 4.0. The paper constructs 15
insertion/deletion/replacement tampering evaluations from 100 clean
recordings, but its random ten-second trials have no released fixed manifest,
seed, generated-query archive, or checksums. The official notebooks provide
construction logic but state no code license, so the index does not present
the derived trials as a separately downloadable benchmark release.

The July 2026 controllable-verbatim-ASR paper also evaluates German
read-speech word-boundary timing on the public 23-hour Thorsten-Voice 2021.02
neutral corpus. The paper cites the exact Zenodo release and reports boundary
MAE plus F1 at 50/100/200 ms collars, but does not publish a separate row
manifest or split recipe. The Zenodo record declares CC BY 4.0 while the
official project repository declares CC0-1.0, so the index conservatively
retains the exact archive's attribution requirement pending clarification.
The same paper uses four hours of English disfluent FluencyBank speech for
word-boundary timing. FluencyBank research data is password protected through
TalkBank consortium membership, and the paper publishes no contributing
corpus, speaker, or file manifest, so the index records the family and access
path without claiming that the paper-specific selection is reproducible.

The July 2026 controllable-verbatim-ASR paper contributes the public Nyra
Verbatim Speech Benchmark family. Its official evaluator scores paired
verbatim/intended transcripts with separate WER/CER and typed filler,
vocal-sound, cutoff, and repetition metrics. The released English set contains
4,957 DisfluencySpeech-derived utterances and declares Apache-2.0; the authors'
German companion set contains 202 utterances but declares no license. Both
Hugging Face datasets are ungated. The evaluator README says MIT, although its
repository currently has no LICENSE file, so that code grant should be
confirmed before relying on it.

The July 2026 HARP neural-codec paper is recorded as existing-family coverage,
not a new benchmark. Its objective evaluation uses the already indexed
MUSDB18-HQ test, FSD50K eval, and LibriTTS test-clean splits. The official MIT
repository, model checkpoint, and selected audio demo are public, but the
paper-specific 500-tone harmonic diagnostic and 12-item MUSHRA study do not
release their exact manifests, generated waveforms, evaluation code, or
participant-level ratings. Upstream dataset terms still apply.

The July 2026 Q-TriM paper's three audio-visual QA evaluations are now traced
to owner-controlled sources. MUSIC-AVQA was already indexed; the newly indexed
MUSIC-AVQA-R release expands the original 9,129 test questions to 211,572
manually screened paraphrases for head/tail and question-robustness evaluation.
The newly indexed MUSIC-AVQA-v2.0 adds biased/balanced QA splits and 1,230
manually collected musical-performance videos. MUSIC-AVQA-R states no data or
code license; MUSIC-AVQA-v2.0 packages its repository under GPL-3.0 but limits
its YouTube-derived videos to research use. Neither re-licenses upstream media.

The July 2026 IBR waveform paper is recorded as an explicit scope exclusion.
Although it is categorized under arXiv eess.AS and converts its inputs to
spectrograms, its released signals are power-system voltage and current
measurements rather than acoustic audio. Its public code and approximately
267 MB of NPZ data are therefore not counted as an audio benchmark; the
repository also states no data or code license.

The July 2026 nonlinear bias-compensated adaptive-filter paper is likewise
recorded as a scope exclusion. Its real-world evaluations predict monthly
sunspot counts and capacitor voltage sampled from a physical Chua circuit.
Despite its eess.AS cross-listing and signal-processing terminology, neither
evaluation contains acoustic audio, so no benchmark family or download helper
is added.

The July 2026 adaptive-momentum distributed active-noise-control paper is
recorded as an unreleased simulation audit. Section 4 evaluates a six-node ANC
window with measured primary and secondary acoustic paths, synthetic
100-1,000 Hz broadband noise, and abrupt or fluctuating communication delays.
The paper releases no chamber impulse responses, noise realization or seed,
simulation code, per-run results, dataset page, or project repository. Those
measured paths are essential to reproduce the evaluation, so the index does
not invent a downloadable benchmark family or helper.

Seed source: [Qwen3.5-Omni Technical Report](https://arxiv.org/html/2604.15804v1#S5),
Audio -> Text evaluation block. The Qwen report remains useful provenance, but
the repository is no longer limited to that paper's benchmark list.

Qwen3-TTS sections 4.1-4.2 are fully inventoried in the source YAML. Its named
public evaluation sets map to Common Voice, FLEURS, LibriSpeech `test-clean`,
Seed-TTS Eval, TTS Multilingual Test Set, CV3-Eval, and InstructTTSEval. The
target-speaker evaluation in section 4.2.5 reuses a 10-language subset of the
public TTS Multilingual Test Set, although the exact text rows are not
identified. The section 4.2.6 long-speech set is not a public benchmark: the
report describes an internal set of 100 Chinese and English texts (200-2,000
words) and provides no text manifest, generated audio, or download link.

Qwen3.5-Omni section 5.2 is also inventoried in the source YAML. Its public
speech-generation sets map to Seed-TTS Eval, TTS Multilingual Test Set, and
CV3-Eval. The FLEURS-derived multilingual set used for nine additional
languages and part of the custom-voice evaluation is explicitly internal and
has no released row mapping or download; the public FLEURS corpus is indexed
separately and must not be treated as that derived evaluation set.

Qwen3.5-Omni section 5.1's Audio-to-Text evaluation is fully inventoried in
the source YAML across audio understanding, end-to-end dialogue, S2TT, and
ASR. The audit records Table 5's exact dataset variants and protocols,
including the SongForm-HX-8Class prompt, URO-Bench pro track, FLEURS top-59
S2TT/top-60 ASR sets, Common Voice 15 languages, and vocal-only MIR-1K.

Qwen3.5-Omni section 5.1.4's complete audiovisual-to-text evaluation is
inventoried in the source YAML: DailyOmni, WorldSense, AVUT, AV-SpeakerBench,
audio-enabled Video-MME, Qualcomm IVD, Omni-Cloze, and OmniGAIA. Protocol notes
preserve the report's audio-enabled Video-MME setting and its OmniGAIA
prompt/judge configuration.

The July 2026 BoN-TTS paper is recorded as an existing-family,
unreleased-derived-evaluation audit. It generates ten F5-TTS candidates for
1,127 LibriSpeech-PC `test-clean` cross-sentence samples and compares
wav2vec 2.0, Distil-Whisper, and cross-family selection under three ASR
evaluator families, with SIM-o and UTMOS checks. LibriSpeech is public and
already indexed, but the exact row/prompt manifest, generated candidates,
transcripts, and per-item scores are not released. Although the paper says
that code and evaluation scripts are available at the cited
[BoN-TTS repository](https://github.com/yu1012/BoN-TTS), GitHub currently
reports an empty, zero-size repository with no commits or license. The index
therefore adds no duplicate benchmark family or download helper and marks the
derived protocol for a later release recheck.

The July 2026 diffusion-augmentation AAD paper is recorded as an existing
private-corpus and unreleased-output audit. It evaluates locus-of-attention
classification on 2,420 trials from 31 hearing-impaired listeners retained
after EEG preprocessing, then augments training with up to 90,000 generated
one-second samples. The original 34-listener experiment is documented in the
[primary source](https://doi.org/10.3389/fnins.2021.636060), but neither the
real corpus, exact split manifest, synthetic EEG, checkpoints, nor predictions
are released. The manuscript only promises a GitHub repository after its
publication decision and gives no URL, so the index adds no benchmark family
or inferred helper.

The July 2026 TTSYoruba paper is recorded as a public-system but unreleased-data
audit. Its Section 6 evaluation has 50 listeners, 500 naturalness and
intelligibility ratings, four Yoruba-name categories, and 100 matched
geminated-versus-caron/circumflex observations. The aggregate protocol and
scores are public, as are the deployed [TTSYoruba](https://ttsyoruba.com/)
service and a [CC BY-NC 4.0 rule document](https://doi.org/10.5281/zenodo.21500364),
but the exact stimuli, row-level ratings, listener records, 651-unit diphone
inventory, and implementation are not released as benchmark artifacts. The
index therefore adds no dataset entry or inferred download helper.

The June 2026 MuseBench paper is recorded as an announced audiovisual-arts
protocol rather than a downloadable benchmark family. Its official
[project page](https://musebench.github.io/) describes 4,016 single- and
multi-select questions over narrator-removed evidence clips, while the
[official repository](https://github.com/musebench/musebench-code) releases
MIT-licensed construction, adapter, and metric code. The repository requires
users to supply `benchmark.json` and the clips, however, and neither those
files nor a working dataset-card link is currently public. Paper and code
licenses therefore must not be treated as licensing the absent benchmark data
or source-platform media.

The July 2026 traceback-translator paper adds the official
[ADD 2022](http://addchallenge.cn/downloadADD2022) challenge family. Its
Mandarin continual-learning evaluation complements the already indexed
ASVspoof 2019, Fake-or-Real, and In-the-Wild families, although the paper does
not identify the exact ADD track or split combination. All six public Zenodo
records are CC BY-NC-ND 4.0 and total approximately 49.5 GB; the helper saves
official metadata by default and requires explicit archive and record choices.

The July 2026 Re-Sonance paper adds CDSD provenance to the index. Sections 3.4
and 4 evaluate Mandarin dysarthric speech conversion on the Chinese Dysarthria
Speech Database, using ten speakers for a twenty-listener subjective study,
thirty speakers for WER/MER/WIL by severity, and 200 clips for latency. CDSD's
owner page describes 133 hours from 44 speakers, but access requires a signed
license agreement and approval; the paper-specific row selections, generated
speech, listener records, and latency manifest are not released.

The July 2026 efficient audio-visual event-recognition paper is mapped to the
existing AVE family rather than counted as a new benchmark. Sections 4-5 use
AVE's predefined train, validation, and test subsets, split each approximately
10-second video into ten one-second segments, and evaluate frozen VideoMAE/AST
features with teacher, distilled-student, and INT8-student models. The paper
does not release its preprocessing manifests, cached features, checkpoints,
predictions, or per-item scores. AVE remains a manual Google Drive download
with no standalone dataset license, and source-video rights still apply.

The July 2026 FlowSonic paper is recorded as two unreleased, paper-specific
music-editing protocols rather than a benchmark family. Section 4.1 describes
separate 40-clip timbre-transfer and genre-transfer sets manually selected
from public YouTube recordings, resampled to 16 kHz, and standardized to
10 seconds. The official repository publishes implementation code, aggregate
logs, and one example WAV, but no 80-item manifest, source URLs, source or
target prompts, curated evaluation audio, generated comparison corpus, or
listener records. Public YouTube availability does not release the authors'
exact selection or clear uploader and media rights, and the repository states
no license, so the index adds neither a dataset link nor a helper.

The July 2026 layer-wise decision-fusion paper is inventoried across sections
3-5. Its in-domain evaluation maps to the existing ASVspoof 2019 Logical Access
family, while its cross-dataset evaluation adds the public, ungated
[In-the-Wild](https://deepfake-total.com/in_the_wild) family: 37.9 hours of
bona fide and deepfake English speech from 58 public figures. The owner page
says Apache-2.0 but its official Hugging Face card says CC BY-SA 4.0, so the
index records the conflict rather than choosing one license.

The July 2026 CHARM paper is inventoried across sections 4.1 and 4.3. Its
English audio-text sarcasm evaluation maps to the public
[MUStARD](https://github.com/soujanyaporia/MUStARD) family: 690
sitcom-derived audiovisual utterances with labels, dialogue context, and fixed
fold indices. The repository and dataset card say MIT, but those labels must
not be assumed to relicense the underlying television excerpts. Its Chinese
evaluation maps to the newly indexed public
[CMMA](https://github.com/annoymity2022/Chinese-Dataset) family: 3,000
multi-party conversations and 21,795 utterances with sentiment, emotion,
sarcasm, humor, speaker, topic, and cross-task annotations. CMMA's custom
CC BY-NC 4.0-style agreement permits attributed noncommercial use, but it
preserves the original copyright of the television conversations with their
source owners; the approximately 12.66 GB audiovisual archive remains a
manual Google Drive download.

The July 2026 LALM audio-judge reliability paper is recorded as a
claimed-public-supplement audit. It evaluates 152 production full-duplex
conversations and 57 defect-injected clips, but says the production audio will
not be released and the adversarial WAVs await a later clearance review. Its
cited Hugging Face supplement is currently authentication-required and exposes
no public card or file inventory, so the index does not add a benchmark family
or infer a download helper from the paper's release claim.

The July 2026 L2 auto-marker shortcut-reliance paper adds the official
Speak & Improve Corpus 2025 family. Its four open-speaking task types provide
fixed train, development, and evaluation partitions for proficiency scoring,
ASR, disfluency detection, and spoken grammatical-error correction. Cambridge
distributes the roughly 315-hour corpus after registration under a custom
non-commercial license that prohibits redistribution and requires prior
approval for corpus-derived releases; the helper therefore prints only the
official manual access path.

The July 2026 TFCL paper adds a public acoustic-front-end robustness family
derived from ASVspoof 2019 Logical Access. Its ungated Hugging Face release
contains approximately 38.5 GB of paired VAD-processed train/development audio
and six-stage AFE evaluation audio covering echo, AEC, additive noise, noise
suppression, AGC, and VAD. The helper fetches only official documentation and
metadata by default; audio, the 1.27 GB checkpoint, and the MIT-licensed code
are separate opt-ins. The dataset card says only `license: other`, so the index
does not infer reuse rights and preserves all ASVspoof/RIR/noise-source terms.

The June 2026 LA-RAG paper is recorded as an existing-family and unreleased
derived-protocol audit. Its two 24-hour synthetic Home-IoT and Industrial-IoT
benchmarks and its CASTELLA-QA question rows are not released. The public
CASTELLA annotations remain indexed separately, but they do not reproduce the
paper's derived questions, negative sampling, IoT streams, predictions, or
scores; no download link is inferred for those artifacts.

The July 2026 Audio-Visual Flamingo report is inventoried across sections 3-4.
Its audio, ASR, and omni-modal evaluations map to eleven existing families,
including MMAR, MMSU, MMAU, WorldSense, DailyOmni, MMOU, and the report's ASR
corpora. One named source cannot currently be added safely: the citation maps
TEDLIUM to TED-LIUM Release 3, but the official OpenSLR SLR51 page and archive
now return not found. The index records that upstream outage without
substituting an unofficial mirror or publishing a dead download helper.

The July 2026 Light-MER paper's nine-family multimodal emotion evaluation is
also inventoried. Its public MER2023, MER2024, CH-SIMS, CH-SIMS v2, CMU-MOSI,
and CMU-MOSEI families are now indexed. MER2023 provides multi-label,
corrupted-modality, and semi-supervised multimodal emotion tracks through a
request-gated Hugging Face release. The roughly 140 GB, password-protected
repository is academic-only and prohibits redistribution or modification
without written consent; its baseline repository states no code license.
MER2024 extends the family with 5,030 labeled and 115,595 unlabeled clips plus
semi-supervised, corrupted-modality, and open-vocabulary tracks. Its roughly
218.4 GB Hugging Face release is likewise request-gated and non-commercial.
CH-SIMS v2 releases 4,402 supervised multimodal/unimodal sentiment segments
and 10,161 unlabeled segments through official Drive folders. The helper saves
primary-source metadata and keeps the repository clone opt-in; the official
sources state no data or code license.
CMU-MOSI contains 2,199 English opinion segments from 93 YouTube review videos;
the official CMU SDK releases labels and anonymized processed features, while
MultiBench provides an additional word-aligned processed package. Raw source
videos are not redistributed. The helper saves primary-source documentation
and keeps toolkit clones opt-in. Both repositories are MIT-licensed, but the
official sources do not expressly license the MOSI data or source media, so
dataset terms remain unspecified. CMU-MOSEI covers more than 65 hours from
more than 1,000 speakers across 250 topics, with sentiment and six
non-exclusive emotion scores. Its official SDK and MultiBench releases expose
processed features and labels, while data and source-media terms likewise
remain unspecified.

The July 2026 GigaChat Audio report is inventoried across sections 3.6 and
4.1. Its AudioGrounding and TimeGround-1M evaluations map to existing public
families. The AMI source corpus is public, but the paper's 150 automatically
generated phrase-localization questions are not released. Likewise, the
public but gated DCASE 2025 AudioQA family does not identify the paper's
144 selected start-time questions without a row manifest or filtering script.
The audit records those as unreleased paper-specific protocols rather than
new downloadable benchmarks.

The July 2026 ECHOv2 paper's ASD Benchmark is public and reproducible at the
protocol layer. Its MIT evaluation repository unifies DCASE 2020-2025 Task 2
under frozen-embedding and lightweight-adaptation protocols while retaining
each year's official split and AUC/pAUC logic. Source recordings remain
separate official DCASE downloads with year-specific terms; the helper does
not fetch the repository's convenience Drive copy because no separate
redistribution terms are stated for it.

The July 2026 WanSong v1.0 report is recorded as a mixed
existing-coverage/internal-protocol audit rather than a benchmark addition.
Section 4.1 randomly samples 2,000 clips from the public Seed-TTS family but
does not publish the row selection, and its 200-clip Wan-song reconstruction
set is internal. Section 4.2's WanSong Bench, 90s-bench, generated comparison
audio, internal 80,000-song musicality evaluator, and score records are also
unreleased. SongEval maps to the existing public family; its availability does
not make the report's 200 four-minute multilingual cases public. The rendered
v3 report leaves its SongEval, SongBench, MuQ, and AudioBox citations
unresolved, so the index does not infer additional dataset links from those
names.

The July 2026 Auto-AEG paper's AEGBench is recorded as an announced
open-vocabulary audio-event-grounding protocol rather than a downloadable
family. The paper reports 3,427 human-verified items and 9,790 temporal queries,
but its linked Hugging Face repository currently contains only
`.gitattributes` and reports zero bytes of dataset storage. Appendix K promises
CC BY 4.0 data and MIT code upon acceptance while preserving source-audio
terms; those promises do not license absent artifacts. Recheck the release
before adding a benchmark entry or helper. The official repository was
rechecked on 2026-07-25 and remained unchanged at revision
`b4e9fa95ad99d701b6e788c2aa51d7642ed61a75`.

The April 2026 “All That Glitters Is Not Audio” paper is recorded as an
existing-coverage audit rather than a new benchmark family. It evaluates the
already indexed MMAU, MMAR, and MMAU-Pro releases under full-audio, no-audio,
text-backbone, and segmented partial-audio conditions to measure text priors
and audio reliance. Version 1 publishes no official repository, derived item
labels, score records, or evaluation code, so the index does not imply that
its model-dependent item categories form a downloadable dataset. The paper's
CC BY 4.0 license applies to the article, not absent evaluation artifacts or
the three benchmarks' upstream data.

The July 2026 Qwen-Audio-VAE report is inventoried across sections 4.1-4.5.
Its three public reconstruction benchmarks—LibriSpeech for speech, AudioCaps
for general sound, and Song Describer for music—were already indexed. The
audit also records AudioCaps test-set use for downstream text-to-audio
evaluation and does not misclassify the report's LAION-Audio-630K training
corpus as a new benchmark.

The July 2026 DONDO report is recorded as a model-release audit, not a new
benchmark family. It reports WER for 21 monolingual and five regional
multilingual ASR models across 27 African language varieties, but identifies
the underlying data only as predominantly religious-text read speech and
provides no named evaluation corpus, split sizes, row manifests, or stable
dataset download. The public KhayaAI Hugging Face repositories contain
Apache-2.0 model checkpoints; that does not release or license the unnamed
training and test audio.

The July 2026 multimodal deepfake-news paper adds FakeAVCeleb as a
request-gated audio-visual benchmark family. The official release describes
500 real and 19,500 fake celebrity videos with cloned speech, lip-synced
audio/video manipulations, and fine-grained labels, but provides the data only
after a request and author approval. The repository licenses its code under
MIT but states no separate data license, and explicitly marks the YouTube
source videos as not rights-cleared with zero agreeing subjects. The helper
therefore prints only the official request path and never infers an archive
URL.

The July 2026 Quality-Aware Multimodal Fusion paper adds Aff-Wild2 as a
request-gated audiovisual valence-arousal and emotion benchmark. The owner
requires a signed role-specific EULA and an institutional-email request; the
helper prints those steps and never fetches granted data. The paper reports 594
videos while the current owner page describes 564, so the index preserves the
revision conflict rather than merging the counts. Its AFEW-VA and YouTube Faces
identity probes use visual backbone features and are recorded only as
visual-only provenance.

The July 2026 VibeVoice-ASR-BitNet report is inventoried across sections 3.1
and 3.3. Its 15 WER/CER rows map to seven existing families: MLC-SLM Eval,
AISHELL-4, AMI, AliMeeting, FLEURS, LibriSpeech, and VoxPopuli. The audit also
preserves a naming conflict: the report expands MLC as “Multilingual
LibriSpeech Corpus,” while the official challenge calls MLC-SLM the
Multilingual Conversational Speech Language Model Challenge. The public
MLC-SLM release contains annotations but no currently documented public audio
URL, so the index does not imply full reproducibility.

The July 2026 AV-JEPA paper is recorded as an existing-coverage audit over
AudioSet and VGGSound. Sections 3.1-3.3 report audio-visual classification,
AudioSet mean average precision, and zero-shot audio↔video retrieval. The
retrieval study balances each evaluation set to five clips per class (2,015
AudioSet clips and 1,545 VGGSound clips), but version 1 releases no item IDs,
construction code, checkpoint, predictions, or score records. The index
therefore points to the existing official metadata releases without presenting
the paper-specific subsets as downloadable benchmarks; original YouTube media
availability and owner terms still apply.

The July 2026 *Audio-Native Speech Recognition with a Frozen
Discrete-Diffusion Language Model* paper is recorded as an existing-coverage
audit over LibriSpeech, FLEURS, and VoxPopuli. Sections 4-5 train on
LibriSpeech train-clean-100, six FLEURS languages, and VoxPopuli parliamentary
speech, then report paper-specific English, Hindi, and Mandarin samples. The
reported LibriSpeech “full evaluation” contains only 100 test-clean utterances,
not the complete 2,620-item split. Version 1 releases no row identifiers,
mixture or preprocessing manifests, code, adapters, checkpoints, predictions,
or score records, so no duplicate family or model-specific helper is added.
The three existing public-family access paths and source-specific terms remain
authoritative.

The July 2026 professional voice-actor attribution paper adds the public JVS
corpus as a speaker-identification and style-robustness control. JVS provides
about 30 hours of studio speech from 100 professional Japanese speakers,
including shared and speaker-specific readings, whispers, and falsetto. Its
audio is a manual 3.5 GB Google Drive download under custom research,
noncommercial, and personal-use terms with redistribution prohibited; tags
are CC BY-SA 4.0. The paper's separately collected 63-hour actor corpus,
biometric embeddings, paired trials, identity mapping, and generated clones
remain withheld or verification-only and are not presented as JVS data.

The July 2026 CS-ETS paper adds the public
[Silent Speech EMG](https://doi.org/10.5281/zenodo.4064408) family. Its
approximately 19 hours of paired silent/vocalized facial EMG and audio support
open-vocabulary EMG-to-speech synthesis and direct silent-speech recognition.
The helper downloads official metadata and documentation by default and keeps
the approximately 3.92 GB archive checksum-verified and opt-in. Zenodo declares
the data CC BY 4.0 and the official code is MIT; biometric-signal, voice,
privacy, and research-ethics considerations still warrant review. CS-ETS does
not release its exact derived row split or ten-listener MOS records.

The July 2026 FillGauss paper is recorded as an unreleased-protocol audit.
It describes FillImpact as more than 5,000 impact recordings from 88 objects
with paired 3D representations and fine-grained container, striker, strike
position, and fill-state conditions. Version 1 publishes no owner repository,
dataset card, archive, row manifest, code, generated outputs, listener records,
or data license. The index therefore does not advertise FillImpact as a
downloadable family and will recheck it after an official release appears.

The July 2026 X3-OPD paper is also inventoried across sections 5.1-5.4. MMSU,
MMAU, MMAR, WorldSense, and DailyOmni map to existing public families. Its
uncited “BIG Bench Audio” aggregate remains unmapped: the paper describes
acoustic QA, multi-event reasoning, temporal grounding, and paralinguistic
inference but provides no item count, split, repository, dataset card, or
download. That description does not match the four spoken BIG-Bench Hard tasks
in the separately indexed public Artificial Analysis Big Bench Audio release,
so the index does not conflate the two names.

The July 2026 ZipL-Dialog paper adds the public CoVoMix2 Dialogue test-set
family. Its official repository releases 1,000 DailyDialog-derived transcript
files and a manifest identifying two LibriSpeech `test-clean` acoustic prompts
per item; the prompt audio remains in LibriSpeech rather than being
redistributed. The repository states no license, so DailyDialog's
CC BY-NC-SA 4.0 and LibriSpeech's CC BY 4.0 terms remain relevant without
establishing rights for CoVoMix2's selection or annotations. ZipL-Dialog's
separate OpenDialog test selection is unreleased, and its LibriSpeech-PC
ablation maps to the existing LibriSpeech family.

The July 2026 Sonic Stage paper is recorded as an unreleased systems and
user-study protocol rather than a benchmark family. Its technical evaluation
uses 16 short dialogue clips from named film, television, theater, and talk
show productions; six clips support a 12-participant blind/low-vision study.
The paper reports aggregate trajectory, description, recall, presence, and
engagement results, but publishes no clip manifest or source URLs, generated
spatial audio, annotations, recall questions, participant rows, code, or
artifact license. The index therefore adds no download helper and does not
invent a public path for third-party source media.

The July 2026 ReMo token-compression paper is fully inventoried in the source
YAML. All six evaluation families were already indexed: WorldSense, DailyOmni,
Video-MME, OmniVideoBench, the video-SALMONN 2 caption benchmark, and
VGGSound. The audit preserves the paper's under-one-minute filtering of
long-video question-answer pairs and its 50-seed VGGSound retrieval analysis
rather than presenting those derived selections as separately released
benchmarks.

The July 2026 RPPNet symbolic-melody paper is recorded as a partial-source
coverage audit rather than a new downloadable family. Its 274,300-item
MelodyNet variant is smaller than the original paper's 444,102-piece assembly,
but RPPNet publishes no item manifest, filtering recipe, random seed, or
18:1:1 split files. The public MelodyGLM page links or bundles selected source
corpora and publishes processing code; it does not release the complete
assembled MelodyNet corpus. RPPNet's Apache-2.0 repository also omits the
paper's generated MIDI comparison set, selected human references, and listener
ratings, so the index does not invent an aggregate download or data license.

The June 2026 STEB expressive speech-to-speech translation benchmark is
release-audited but not counted as a public family. Its evaluation code and
prompts are public, while the official Hugging Face dataset repository still
contains only a placeholder README. The paper's 32.6-hour Chinese-English
normal/NV evaluation data therefore remains announced but unreleased; no
download helper or invented data link is provided.

The July 2026 Sound Scene Story Benchmark (S3Bench) for narrative
text-to-audio instruction following is also release-audited but not counted as
a downloadable family. The paper defines 1,200 multi-event and overlapping
temporal prompts. Its public project page provides selected prompt/output demos
and aggregate results, but not the complete prompt manifest or evaluation
assets; the linked GitHub repository is not public, and no data or demo license
is stated.

The June 2026 CASU paper is likewise recorded as an audited protocol rather
than a downloadable family. It describes semi-synthetic scenes combining
speech, discrete events, and background ambience for scene description and
four context-aware reasoning tasks, but version 1 provides no project,
repository, dataset card, item manifest, archive, code, or download link. Its
promised Appendix A.1 statistics and appendix examples are also absent from the
arXiv HTML and source package, so the index does not infer a benchmark size or
license absent evaluation assets.

The June 2026 AOR-Bench paper is also recorded as an unreleased audio-safety
protocol rather than a public benchmark family. It reports 3,000
pseudo-harmful samples across six scenario categories after varying speaker
gender, emotion, and rate, but version 1 provides no official project,
repository, dataset card, item manifest, audio archive, evaluation code, or
download link. The paper's arXiv license does not establish reuse terms for
the absent benchmark or redistribution rights for its generated Sora-2 and
CosyVoice outputs.

Qwen-Music sections 4.1-4.2 are also inventoried in the source YAML. Its
bilingual text-to-music, two cover-song reference, and bilingual rendering
sets are internal and unreleased. The public exception is the
[Song Describer Dataset](https://zenodo.org/records/10072001): section 4.2.2
uses all 546 tracks in its validated subset for codec-reconstruction
evaluation. The index does not infer download links for Qwen's internal sets.

The January 2026 SYAUDIO paper is recorded as an audited protocol rather than
a downloadable family. It describes 4,319 audio questions for testing
audio-language-model sycophancy across perception, reasoning, mathematics, and
ethics, including 1,319 GSM8K and 1,000 MMLU moral questions converted to
speech. The paper provides no official project, repository, dataset card,
archive, item manifest, generated audio, evaluation code, or data-license
statement. Public upstream MMAU, MMAR, GSM8K, and MMLU resources do not release
SYAUDIO's selected rows, speech, prompts, or acoustic perturbations.

The June 2026 OpenMIC instrument-grounding paper is likewise recorded as an
announced but unreleased protocol sequence. It defines five evaluations:
9,332 binary instrument-presence questions, a 590-item genre-prior-reduced
subset, 1,051 related-instrument discrimination items, 1,028 concatenated
30-second multi-label items, and 3,579 concatenated temporal-localization
items. The public [OpenMIC-2018](https://zenodo.org/records/1432913) corpus is
already indexed, but the paper only says its derived metadata, prompts, and
evaluation code *will* be released. No official project, repository, dataset
card, archive, item manifest, or separate license is currently supplied, so
the index does not claim that the five derived evaluations are downloadable.

The June 2026 DDPO-VC paper is recorded as an existing-coverage audit, not a
new benchmark family. Its ADReSS evaluation maps to the indexed, membership-
restricted DementiaBank challenge release, while its random FHS Gold 92 split
and examiner-filtering timestamps are not public. The official repository
currently contains only a README and MIT license and says code will be released
later; its demo's ten selected ADReSS examples are qualitative model outputs,
not a reusable evaluation package or a new clinical-data download path.

The July 2026 speech-based cognitive-impairment paper is also recorded as an
existing-coverage audit. It uses the indexed ADReSS20 and ADReSSo21 releases in
both a merged train/test setting and a cross-dataset generalization setting,
retaining only full enhanced audio and generating transcripts through a common
ASR pipeline. Although the paper calls the benchmarks publicly available, the
official DementiaBank release remains password protected and limited to
approved members under non-commercial, confidentiality, no-sharing, and
no-LLM-incorporation rules; the paper supplies no alternate public download.

The July 2026 AHEAD paper is likewise recorded as an existing-source-family
audit rather than a new audio benchmark. Its only audio-domain row, “MS,” is a
700-task, 44-annotator music-genre label-aggregation evaluation derived from
the indexed GTZAN collection. The paper and its primary 2013 source identify
the underlying corpus, but no official release supplies the 700-item mapping,
2,945 noisy crowd labels, annotator records, code, or experiment package.
Downloading public GTZAN audio therefore does not reproduce MS, and the index
does not invent a download path for the derived matrix.

The July 2026 black-box dynamic-range-control paper is likewise recorded as an
existing-coverage audit. It randomly selects 25 thirty-second mono excerpts
from the indexed MedleyDB family, then applies 30 compression and 30 expansion
profiles for 750 processed samples per task. The paper does not publish the
source track IDs or timestamps, processed audio, manifest, implementation,
predictions, or scores. Its source package only comments that code will follow
acceptance, so the derived evaluation is not treated as a downloadable family.

The July 2026 Kenyan-language Nemotron 3.5 adaptation report is recorded as
an internal-protocol audit, not a new benchmark family. Its Kikuyu, Dholuo,
and Kalenjin true-streaming evaluations use versioned project manifests drawn
from African Next Voices data; the paper says they were repeatedly consulted
during development and are not pristine external benchmarks. The Dholuo
manifest contains 5,480 rows (12.16 hours), but the manifests, reports, source
audio, checkpoints, and private preservation mirrors are not released.
PazaBench is mentioned only as a public comparison target and was not actually
run, so the audit maps that name to the existing PazaBench entry without
inventing a result or download path.

The July 2026 CCBR paper adds recent provenance for the indexed Million Song
Dataset family. Its music-recommendation evaluation preprocesses MSD to 31,046
items and 166,188 users, uses an unseen-user split and 80 tag descriptors, and
generates cached item descriptions from separately obtained audio. The official
MSD release provides features, metadata, tags, and Taste Profile play counts
but no listenable audio; CCBR does not release its exact item mapping, user
split, descriptions, prompts, or audio, so those remain a derived protocol
rather than a claimed public download.

The July 2026 Faster IndexTTS-2 paper is likewise recorded as an
existing-coverage audit rather than a new benchmark family. It evaluates the
indexed Seed-TTS objective set under precision, streaming, and batching
configurations, but reports 1,088 English and 2,020 Chinese samples while the
official Seed-TTS repository states 1,000 Common Voice and 2,000 DiDiSpeech-2
samples. Because the paper publishes no item manifest, split mapping, or
alternate evaluation download, the index preserves both counts and does not
infer that the extra cases are part of the public release.

The July 2026 OPOD paper is likewise recorded as an existing-coverage audit.
Its audio-relevant evaluation consists only of the indexed MMAU, AVQA, and
OmniBench families; the other nine columns are text or visual benchmarks.
The paper reports accuracy and averages all twelve columns, but publishes no
official repository, derived evaluation manifest, predictions, or score
records. No duplicate family or paper-specific helper is added, and AVQA's
non-commercial copying and redistribution restrictions remain in force.

The July 2026 honey-bee colony-strength paper is also recorded as an
existing-coverage audit. It evaluates the indexed public UrBAN family using
nested random segment-level evaluation and five hive-independent folds, with
linearly interpolated frame-of-bees targets, MAE, and Pearson correlation.
UrBAN remains a public CC BY 4.0 corpus delivered through a large manual
FRDR/Globus transfer, but the paper does not release its exact folds, derived
per-segment targets, models, predictions, or score records. Those artifacts
are not presented as a separate downloadable benchmark.

The July 2026 compact Hindi TTS paper is likewise recorded as an
existing-coverage audit. Its independent benchmark selects 50 Hindi sentences
from the indexed FLEURS `hi_in` test split and compares IndicF5, a released
190M student, and MMS-TTS-hin using WER/CER, speaker similarity, UTMOS, and
real-time factor. The public model repository releases the exact sentence
list, evaluation scripts, and per-sentence scores and timings, but not the
generated evaluation audio. This released selection maps to FLEURS rather than
creating a duplicate family; repository artifacts are MIT while the selected
FLEURS material retains CC BY 4.0 attribution obligations.

The July 2026 OmniReasoner paper is also recorded as an existing-coverage
audit. Its main evaluation uses the indexed OmniVideoBench, LVOmniBench,
Daily-Omni, WorldSense, and Video-MME audio-video families; VideoHolmes is a
visual-only control outside this index's scope. Its audio-removal ablation on
OmniVideoBench, LVOmniBench, and WorldSense creates no new public split or
score package. OmniReasoner does not re-license these benchmarks, so their
gated, non-commercial, conflicting-license, or custom academic-use terms
continue to apply.

The July 2026 PolySim paper is also recorded as an existing-coverage audit.
Its six-dataset cross-modal retrieval evaluation contains two audio-text
families, AudioCaps and Clotho, both already indexed; MS-COCO, Flickr30K,
MSR-VTT, and VATEX are image- or video-text datasets outside this audio
index's scope. PolySim reports bidirectional retrieval and quantization
experiments but releases no new benchmark data, so no duplicate family or
paper-specific helper is added. AudioCaps still depends on externally hosted
YouTube audio, and both corpora retain their original terms.

The July 2026 LH-AVLN paper is recorded as an unreleased-protocol audit. It
defines ordered and unordered long-horizon navigation missions with two to
four category, description, or image goals, alternating spatialized target
sounds, and RGB-D/pose/binaural observations, and reports a 550-episode
validation split built on SoundSpaces 2.0 and Matterport3D. ArXiv version 2
provides no official project, repository, episode manifest, goal cues, rendered
audio, simulator configuration, or evaluation code, so LH-AVLN is not counted
as a downloadable benchmark family and no download link is inferred.

The July 2026 Caption Studio paper is recorded as a system audit rather than a
benchmark family. It specifies WER, NIST-style diarization error rate, and
measured/derived/unavailable transparency labels, but explicitly says its
scoring harness has only been checked against hand-worked examples—not a large,
diverse, production-representative audio corpus. Version 1 releases no official
repository, dataset, evaluation manifest, predictions, or score records.
LibriSpeech, DIHARD, and NIST Rich Transcription appear as methodological
references, not reported Caption Studio evaluation sets, so no duplicate
families or paper-specific helper are added.

The July 2026 diagnostic cover-song evaluation paper is recorded as a
partial-release protocol rather than a downloadable benchmark family. Its
official MIT repository publishes the 30-row expert-score table, anonymized
sample map, extracted MIR features, and analysis pipeline for five songs
crossed with six generation systems. It explicitly omits all source and
generated audio because of song copyright and commercial API terms, and its
audio-example directory is only a placeholder. The public artifacts therefore
support analysis of the reported scores but cannot reproduce listening or
feature extraction; the paper also relies on a single expert annotator.

The April 2026 CAST paper is recorded as an audited speech-generation protocol,
not a downloadable family. It defines 113 contrastive context pairs (226
textual items) for testing whether TTS systems realize discourse-conditioned
word-level stress, plus a separate approximately 10,000-sample synthetic
training corpus. Although the paper says the benchmark, framework, pipeline,
and corpus are released, v1 provides no project, repository, dataset card,
archive, item file, code link, or data-license statement. The paper's CC BY
4.0 license does not license absent benchmark or corpus files.

The July 2026 RW-Voice-EQ paper has also been audited across sections 2 and
4-7 as a public-leaderboard, private-data protocol. Its public
[voice-system](https://huggingface.co/spaces/HumeAI/rw-voice-eq) and
[ASR](https://huggingface.co/spaces/HumeAI/asr-leaderboard) leaderboards expose
Apache-2.0 application code and aggregate results, but the Space source tree
contains no benchmark data and loads tables and optional samples from a
separately configured dataset. The separate ASR Space publishes its normalizer,
model metadata, and application code, but no audio, item manifest, or human
reference transcripts. The paper explicitly describes its roughly 17-hour ASR
evaluation as four private sets and does not release the fixed TTS prompts,
speech-to-speech scenarios, speech-understanding clips and labels, source-item
manifests, generations, human ratings, or standalone data terms.

The July 2026 SongSQA paper is also audited as a mixed public/internal
evaluation. Its public Lyra-SA component maps to the indexed, application-based
Tencent Music release, but the paper's separate 2,035-recording expert-rated
dataset is explicitly proprietary. The five random 8:1:1 evaluation splits are
not published, and the paper's demo streams only selected segments from its
five-song subjective study rather than a reusable benchmark package.

The July 2026 CaReCoS paper is recorded as an audited medical-acoustic
spectrogram reasoning protocol rather than a downloadable family. It derives
explicit and inferred question-answer pairs from seven named public cardiac,
respiratory, and cough datasets, but v1 provides no official project,
repository, dataset card, item manifest, generated spectrograms, questions,
answers, split definitions, or benchmark license. The public source corpora do
not themselves release CaReCoS's derived evaluation package.

The June 2026 SpeechDx paper is recorded as an audited clinical-speech
evaluation protocol rather than a downloadable family. It defines 27
classification and regression tasks over 12 named clinical speech datasets,
plus zero-shot cross-condition transfer. Version 1 provides no official
project, repository, unified manifest, processed clips, custom
speaker-disjoint splits, task mappings, evaluation code, or benchmark license.
The source corpora retain separate clinical-data access, consent, privacy, and
reuse terms, and independently obtaining them would not reproduce SpeechDx's
paper-specific evaluation package.

The May 2026 PROCESS-2 paper adds a controlled-access clinical-speech
benchmark family. Its official Hugging Face release contains approximately 21
hours from 400 UK participants (200 healthy controls, 150 with mild cognitive
impairment, and 50 with dementia), with semantic and phonemic fluency plus
Cookie Theft picture-description recordings, manually verified transcripts,
metadata, and predefined 80/20 splits. Access is manually approved under a
research-only data-use agreement that prohibits re-identification,
redistribution, public hosting, biometric identification training, and
commercial or clinical deployment without separate permission. The public
Apache-2.0 analysis repository and Zenodo software snapshot do not license the
participant data.

The July 2026 room-acoustics protocol study
[arXiv:2607.15243](https://arxiv.org/abs/2607.15243) is also recorded as an
audit rather than a benchmark family. It cleanly separates row-random
condition interpolation from receiver-grouped spatial prediction and audits
whether model inputs would exist at an unmeasured position. Its two-hall
impulse-response campaign and derived ISO 3382-1 parameter tables are
request-only, while scripts, split definitions, seeds, and per-fold results
are promised for a public repository only after acceptance. Version 1 links
no such repository and states no data or artifact license, so the index adds
neither a download helper nor an inferred release URL.

The June 2026 BCoughBench paper is likewise recorded as an audited respiratory
health protocol rather than a downloadable family. It evaluates nine
classification and three age-regression tasks over five named cough corpora,
each under smartphone audio and five EBEN-simulated body-coupled sensor
conditions. Version 1 releases no official benchmark manifest, subject splits,
transformed cough audio, code, or license for the derived evaluation package.
The public CC BY 4.0 Cough-COPD(CC) Zenodo archive and any independently
available source corpora or EBEN checkpoints do not reproduce BCoughBench's
exact selections and simulated evaluation artifacts.

The June 2026 Preference-ASR paper is also recorded as an audited protocol,
not a downloadable family. It describes 3,210 English preference-aware ASR
triples plus 335 standard items across normalization, entities, disfluencies,
and case. The official
[companion repository](https://github.com/nithinraok/preference-asr-bench)
contains evaluation and source-corpus reconstruction code but no benchmark
JSONL or audio, while its linked
[Hugging Face dataset](https://huggingface.co/datasets/nvidia/preference-asr-bench)
currently returns HTTP 401 to unauthenticated requests. The repository states
CC BY-SA 4.0 for author-created annotations and Apache-2.0 for code, but the
seven source corpora retain mixed open, gated, and research-only terms.

The July 2026 MeetingToM paper is likewise recorded as an announced protocol,
not a downloadable family. It describes 1,800 synchronized audiovisual AMI
meeting clips for mental-state, referential, and consensus reasoning, but its
official [GitHub repository](https://github.com/oliviaziyi/MeetingToM) still
promises benchmark files and evaluation code "Coming Soon," and its official
[Hugging Face repository](https://huggingface.co/datasets/OliviaWang1101/MeetingToM)
contains only a README. AMI's public source corpus does not make MeetingToM's
unreleased annotations, splits, or derived clips public.

The July 2026 VIP-MINGLE paper is also recorded as an announced multimodal
conversation corpus rather than a downloadable family. It describes roughly
59 hours of paired in-person and Zoom sessions from 32 groups, with raw
audio/video, diarized speech, transcripts, psychometrics, facial features, and
time-resolved ratings. Its official
[Zenodo record](https://doi.org/10.5281/zenodo.20670131) currently contains
only a README and explicitly says the full dataset will be released upon
publication. The record's CC BY-NC-ND 4.0 tag therefore applies only to the
placeholder release currently available, not absent media or code.

The July 2026 SceneBind paper is recorded as an audited protocol rather than a
downloadable family. It reports a human-verified 1,066-clip Binaural benchmark
and a 97-clip Sphere360 hard benchmark for semantic-spatial retrieval and
grounding, but the official [project page](https://scenebind.github.io/) exposes
only selected qualitative examples. Its author-controlled
[GitHub repository](https://github.com/scenebind/scenebind.github.io) contains
the static site and supplementary assets, including 103 selected audio clips
and 103 selected images, but no benchmark archive, item or split manifest,
dataset card, license, evaluation code, or training-set release. Those examples
are not treated as the reported benchmarks, despite the paper describing its
training split as released.

The July 2026 structured-audio-caption evaluation paper is also recorded as an
announced protocol rather than a downloadable family. It selects 499 public
AudioCards clips, uses ten released semantic fields, and adds five unreleased
targets for loudness, pitch, active onset, active offset, and ten-band spectral
profiles, then validates field-specific metrics with controlled perturbations.
Version 1 says the augmented dataset will be released but provides no project,
repository, dataset card, selected-item manifest, computed targets,
perturbation artifacts, evaluation code, or standalone data license. The
official arXiv source package and GitHub/Hugging Face release searches were
rechecked on July 26 and still expose no matching artifact. The
public AudioCards family remains indexed separately and must not be treated as
the unreleased augmented subset.

The CVPR 2026 SVHalluc paper is likewise recorded as an announced benchmark,
not a downloadable family. It derives 2,405 balanced, human-verified
video-question pairs from YouCook2 validation clips across three semantic and
three temporal speech-vision hallucination tasks. The official
[project page](https://chenshuang-zhang.github.io/projects/svhalluc/) says its
code and dataset “will be released here,” but currently provides no repository,
dataset card, archive, selected YouCook2 segment IDs, questions, answers,
prompts, verification records, or evaluation implementation. YouCook2 access
alone does not reproduce the derived protocol, so the index adds no download
helper or benchmark-family count.

The July 2026 Audio-Zero paper is recorded as a coverage audit over the
already indexed TREA, MMAU Test-mini, and MMAR benchmarks. Its paper-specific
post-training data are not a separate public release: Appendix A.1 describes
sampling and filtering 2,000 Audio-Alpaca contrast pairs but provides no
selected-row manifest, filtering thresholds, checksums, code link, or derived
archive. The public Audio-Alpaca parent family therefore remains the only
downloadable source and must not be presented as reproducing that subset.

The July 2026 spectrogram-front-end comparison adds the public
PhysioNet/CinC 2016 Heart Sound benchmark for normal-versus-abnormal
phonocardiogram classification. The current public file tree contains six
training directories and 3,240 recordings, while older challenge prose still
describes 3,126 recordings across five databases; the index preserves that
revision difference. The original subject-disjoint challenge test set remains
private, and the recent paper does not release its derived five-second clips,
recording split, notebook, checkpoints, or predictions.

The July 2026 AAD-CRF paper is recorded as a coverage audit over its AVGC, KUL,
and USTC EEG-audio evaluation protocols rather than as three downloadable
families. The official
[experiment repository](https://github.com/YusanX/AAD-CRF) releases loaders,
configurations, and training code, but bundles no EEG/audio data, links no
official dataset download pages, and states no code license. Because these are
human-subject corpora and their access, consent, privacy, and reuse terms were
not verified from an official data repository, the index does not infer
download routes or licenses from local filename placeholders.

The July 2026 StellarTTS paper is recorded as existing Seed-TTS Eval coverage
rather than a new benchmark family. Section IV evaluates the public Mandarin
`test-zh` and `test-hard` configurations for objective intelligibility,
speaker similarity, latency, subjective quality, and duration-control
robustness. The official StellarTTS page provides selected listening samples
but no generated benchmark archive, item-level scores, comparison manifest,
listener records, evaluation repository, or artifact license; those
paper-specific materials remain unreleased.

The July 2026 *Sidewalk Moments* paper is recorded as a request-only
multimodal protocol rather than a public benchmark family. Its CityWalk Corpus
segments 61 public first-person YouTube walks into more than 50,000 ten-second
clips and evaluates video, temporally averaged image, audio, and text
representations against replay-heat engagement. The paper publicly releases
neither its video list nor clip boundaries, replay labels, ImageBind audio
embeddings, splits, human annotations, or code; its Data and Code Availability
statements instead direct requests to the corresponding author. Public source
videos do not provide a redistribution license for those derived artifacts,
so no dataset link or download helper is inferred.

The July 2026 Harness TTS paper is likewise recorded as two internal,
unreleased evaluation protocols rather than downloadable benchmark families.
Its routing evaluation contains 630 LLM-generated cases over a simulated
42-tool registry, while its synthesis evaluation uses 135 generated utterance
cases and a private 25-clip single-speaker prompt library. Version 2 and its
official arXiv source package provide no cases, registry, prompt audio,
generated speech, teacher labels, judge records, scores, code, artifact
license, or author-controlled repository. A similarly named third-party
GitHub repository explicitly describes an independent reproduction and is not
treated as the paper's official release.

The July 2026 Chengdu Mandarin forced-alignment paper is recorded as an
unreleased protocol rather than a downloadable family. It evaluates
text-dependent alignment and transcript-free phonetic segmentation against 50
minutes of expert word- and phone-level boundaries selected from a 17.7-hour,
15-speaker corpus. Although version 1 says that its Chengdu-MFA and Chengdu-FC
models and reviewed 2,876-character G2P dictionary are released, the paper and
source package provide no project, repository, model card, archive, code URL,
artifact license, corpus files, selected-item manifest, or manual annotations.

The July 2026 Instruct-FD paper is likewise recorded as an unreleased
full-duplex spoken-dialogue protocol rather than a downloadable family. It
reports 912 English test cases across 29 scenarios for instructed listening,
backchanneling, interruption, continuation, and acknowledgment behavior.
Version 1 provides schemas and prompt examples but no official project,
repository, dataset card, scenario files, selected persona rows, synthesized
audio, timestamp manifests, test-case JSON, orchestrator, judge implementation,
human annotations, or data license. The linked
[Nemotron-Personas-USA](https://huggingface.co/datasets/nvidia/Nemotron-Personas-USA)
corpus is only an upstream input to some synthetic conversations and is not an
Instruct-FD release.

The July 2026 StemFX paper is recorded as a mixing-style representation
protocol over the existing FMA and MUSDB18 families rather than a new benchmark
dataset. It trains on source-separated, randomly effect-augmented FMA and
evaluates retrieval and style transfer on balanced ten-second MUSDB18 windows.
The official [StemFX repository](https://github.com/barry-mir/stemfx) releases
MIT-licensed model code, weights, and evaluation entry points, but expects
locally prepared derived directories and does not publish the exact selected
windows, paired FX audio, effect seeds or chains, listener responses, or score
records. The existing FMA and MUSDB18 access paths and their upstream license
constraints therefore remain authoritative.

The July 2026 Andha-Dhun paper is recorded as an announced Hindi
audio-description dataset and evaluation protocol rather than a downloadable
family. It reports 5,870 timestamped descriptions synchronized to eight
full-length movies, then uses short video-description pairs for zero-shot
generation evaluation and a four-movie bilingual subset for translation and
cultural-adaptation analysis. The official
[repository](https://github.com/katha-ai/AndhaDhun-HindiAD) currently contains
only a 93-byte README saying “Coming soon!”, with no transcripts, media
manifest, splits, annotations, evaluation artifacts, code, or license. The
paper's CC BY-NC-ND 4.0 terms do not license absent files or the underlying
movie, AudioVault, public-platform, and IMDb-derived materials.

The July 2026 artifact-specific speech-deepfake paper is recorded once as a
coverage audit rather than a new benchmark family. Section 4.1 uses ASVspoof
2015 only for selected calibration attacks, then draws training or held-out
evaluation speech from ASVspoof 2019, ASVspoof 5, and SpoofCeleb; section 5
reports results on those same corpus families. All four are already indexed
with their official access and license constraints. The paper's artifact
transformations create an internal training protocol, not a separately
released evaluation dataset.

The July 2026 large-audio-language-model SASV paper is likewise recorded as
existing ASVspoof 5 coverage rather than a new benchmark family. Sections 4
and 4.2 follow the Track 2 open condition but evaluate a paper-specific
stratified sample of 20,000 enrollment-trial pairs, use one enrollment
utterance instead of the official three, and augment training with VoxCeleb.
The approximately 1.8 million constructed training pairs, 90,000 filtered
reasoning pairs, sampled evaluation IDs, predictions, scores, code, and
checkpoints are not released. The indexed public
[ASVspoof 5](https://zenodo.org/records/14498691) archive remains the official
dataset source, but it cannot reproduce those unpublished selections.

The July 2026 speech-to-speech assistant safeguards paper is also recorded as
an unreleased protocol rather than a benchmark family. Its automotive case
study crosses three vendor systems, three guardrail configurations, and
malicious versus non-malicious speech, repeating each of the 18 setups 300
times to measure response latency and guardrail execution. The malicious input
is synthetic speech containing the benign trigger word “whale,” and detection
accuracy is explicitly outside the study. Version 1 and its official arXiv
source package provide no prompt or audio manifest, per-run measurements,
outputs, code, project page, repository, or dataset release; the article's CC
BY-NC-ND 4.0 license must not be treated as licensing absent experiment
artifacts or vendor API outputs.

The July 2026 TF-MossFormer paper is also recorded as existing coverage rather
than a new family. Sections 3.1-3.3 evaluate only the indexed WSJ0-2Mix
benchmark: 8 kHz two-speaker mixtures with 20,000 training, 5,000 validation,
and 3,000 speaker-disjoint test examples scored with SI-SDRi and SDRi. The
paper introduces a separation model, not a new public mixture manifest, and it
does not change the underlying LDC WSJ0 access and redistribution constraints.

The July 2026 audit of protocol-level shortcuts in audio-language-model judges
uses four established speech corpora. RAVDESS, FLEURS, and VoxCeleb were
already indexed; this sweep adds the missing public
[BVCC](https://zenodo.org/records/6572573) family used for its naturalness
probe. The paper's balanced RAVDESS selection, four-language FLEURS selection,
60 BVCC test pairs, and 100 VoxCeleb1 triplets remain unreleased derived
protocols, so the index does not imply that their item manifests or evaluation
code are public.

The July 2026 codec-internal latent-watermarking paper is likewise recorded as
an audited model protocol, not a downloadable benchmark family. Sections
4.1-4.7 use an unspecified 1,000-sample slice of gated Emilia-English to measure
32-bit recovery and speech quality under signal-processing and neural-codec
attacks, but v1 provides no item manifest, split recipe, checkpoints, attack
implementation, score records, project page, or code repository. The official
[Emilia repository](https://huggingface.co/datasets/amphion/Emilia-Dataset)
also has a material terms conflict: its metadata tag says CC BY 4.0 while its
gated access agreement says the original Emilia data is CC BY-NC. Neither
designation releases or identifies the paper's evaluation subset.

The July 2026 EmoAgent-R1 report is recorded as an existing-coverage audit of
MER-UniBench rather than a new downloadable family. Its complete audio-visual
emotion matrix maps to the already indexed MOSI, MOSEI, CH-SIMS, CH-SIMS v2,
MER2023, MER2024, MELD, IEMOCAP, and OV-MERD families. Version 1 publishes no
separate MER-UniBench manifest, evaluation code, predictions, training corpus,
or checkpoints; component access remains mixed public, gated, and restricted,
with source-specific terms still applying.

The July 2026 BirdCLEF working-paper sweep adds the official
[BirdCLEF++ 2026](https://www.imageclef.org/BirdCLEF2026) family. The primary
paper reports 522.1 hours of focal recordings and Pantanal soundscapes, with
1.03 labeled soundscape hours and 234 target species for multi-label
five-second-window prediction. Data access remains behind Kaggle account login
and competition-rule acceptance. The official LifeCLEF page does not state a
standalone data license, and Xeno-canto-derived focal recordings may retain
recording-specific terms, so the helper saves provenance only and prints the
manual access path.

The July 2026 SSTMark paper is also recorded as existing-family coverage rather
than a new benchmark. Sections 5.1-5.4 reuse the indexed AudioMarkBench no-box
perturbation categories and use LibriSpeech `train-clean-100` prompts to
generate speech, including 1,000 clean samples for detector-threshold
calibration. The authors add stronger attack settings, but version 1 exposes no
official project page, code or data repository, prompt-row manifest, generated
speech, watermarked or attacked variants, predictions, or per-item scores.
AudioMarkBench's MPL-2.0 covers its public evaluation code, not SSTMark's absent
artifacts; its released audio also retains mixed upstream terms.

The July 2026 TalTech BeTraC system paper adds the public
[Synth-DoPaCo](https://huggingface.co/datasets/BeTraC/betrac-2026) family for
long-form audio-to-SOAP evaluation. Its ungated CC BY 4.0 release contains
7,200 training and 400 development conversations with audio, transcripts,
metadata, and reference notes. The challenge's 875-item blind test set mixes
600 synthetic, 272 acted, and three realistic recordings and remains withheld;
the index does not imply public access or license coverage for those test
recordings.

The public [MCIF](https://huggingface.co/datasets/FBK-MT/MCIF) release adds a
multimodal, crosslingual instruction-following family built from ACL 2023
scientific talks. It evaluates 13 recognition, translation, question-answering,
and summarization tasks across speech, video, and text, with fixed or varied
instructions and English, German, Italian, and Chinese outputs. Lightweight
manifests and references are fetched by default; the shared 7.58 GiB media
snapshot is opt-in.

The July 2026 EGTA paper is mapped to that existing MCIF family rather than
counted as a new benchmark. Its MCIF-dev protocol selects 21 talks and 919
segments for English-to-Mandarin and English-to-German simultaneous speech
translation with terminology and latency diagnostics. The paper also evaluates
ACL60/60-dev, a five-talk, 468-segment external set with tagged terminology.
Version 1 releases neither the exact MCIF-dev selection and streaming files nor
an ACL60/60-dev dataset page, manifest, references, terminology tags, code,
outputs, or scores. ACL60/60-dev therefore remains an unreleased paper-specific
protocol, and the arXiv license does not supply data terms for it.

The July 2026 AIS-aligned passive-acoustic labelling paper is recorded as an
audited data-construction protocol rather than a downloadable family. It
describes aligning approximately 950,000 hydrophone windows with 6.9 million
AIS reports to create range-aware no-, single-, and two-contact classes, but
v1 provides no source archive, station/date manifest, AIS source, Parquet
product, SQL/code release, repository, DOI, access instructions, or data
license. Its deterministic method does not make the inputs or resulting data
public, and the paper explicitly treats AIS-derived labels as weak contextual
indicators rather than acoustic ground truth.

The July 2026 RIME paper is recorded as an audited agentic music
post-production protocol rather than a downloadable family. Its evaluation
uses approximately 3,000 input, edited-audio, and instruction triples derived
from 297 MTG-Jamendo tracks, plus 300 artifact-removal triples. The paper and
its arXiv source package provide no official project, repository, dataset card,
archive, source-track manifest, recipes, prompts, processed audio, evaluation
records, code link, or derived-data license. Public access to the indexed
MTG-Jamendo source corpus therefore does not reproduce or release RIME.

The March 2026 DEAF paper is also recorded as an audited protocol rather than a
downloadable family. It describes 2,756 acoustic-semantic conflict stimuli for
emotion, background sound, and speaker identity, but v2 provides no official
project, repository, dataset card, archive, or download URL. Public source
components such as DEMAND do not make DEAF's derived stimuli, prompts, labels,
or evaluation code public.

The May 2026 ChildVox paper is recorded as an audited suite rather than a
downloadable family. It combines more than 20 child-centered physiological
sound, vocalization, speech-quality, diarization, and ASR tasks, and reports a
64,641-item ChildVox-Balanced collection across 14 subtasks. Version 1 provides
no project page, repository, dataset card, archive, unified manifests,
preprocessing code, or benchmark license; it also mixes public upstream
corpora with two private in-house datasets. The authors promise future code and
checkpoints under a Responsible AI License, but that statement is not a public
release of ChildVox or ChildVox-Balanced.

The July 2026 NegEval-Audio paper is recorded as an audited protocol rather
than a downloadable family. It derives negation-aware retrieval and
multiple-choice tasks from AudioCaps and Clotho and reports a 96.7% human
agreement audit over 460 automatically verified negative concepts. It also
constructs 1,000 controlled ESC-50 target-distractor mixtures for a text-side
diagnostic. Version 1 provides no official project, repository, dataset card,
item files, concepts, queries, MCQs, prompts, human judgments, mixture recipes,
derived audio, evaluation code, or score records. The public source datasets
do not make or license NegEval-Audio's derived artifacts.

The July 2026 sound-symbolism paper is likewise recorded as an audited
speech-perception protocol rather than a downloadable family. It tests two
spoken bouba/kiki stimuli across 25 prompt languages, 536 human-recorded
pseudowords, audio-to-shape matching, and a 90-shape visual control. Its sole
cited anonymous code interface currently requires authentication and exposes
no verifiable files, revision, prompts, item manifest, model outputs, scores,
or standalone artifact license. Some source-study stimuli are public or
available from their corresponding author for academic research, but that
does not release the paper's exact evaluation package.

The July 2026 *Production-Oriented Framework for Evaluation of SFX
Generation* paper is likewise recorded as an audited protocol rather than a
new downloadable family. It adapts five systems on ESC-50 folds 1-3, validates
on fold 4, and generates 4,000 variants per system from the 400 fold-5
references. Its official
[project page](https://melodiedesbos.github.io/A-PRODUCTION-ORIENTED-FRAMEWORK-FOR-EVALUATION-OF-SFX-GENERATION/)
streams selected demonstrations and aggregate results, but provides no
repository, complete generated-output set, trial manifest, listener ratings,
evaluation code, or artifact license. Public CC BY-NC 3.0 ESC-50 data
therefore makes the source protocol reproducible only in part; it does not
constitute a released derived benchmark.

The July 2026 *Multimodal Speaker Verification as a Threat to Speaker
Anonymization* paper is also recorded as an audited protocol. It evaluates
speaker-disjoint Fisher English trials using up to five original or
Stream-Voice-Anon-anonymized utterances and acoustic, linguistic, and prosodic
representations. Its official
[repository](https://github.com/Ashigarg123/multimodal-speaker-verification)
currently contains only a README promising code and pretrained models; it does
not release the custom speaker splits, trial lists, anonymized derivatives, or
evaluation implementation. Licensed access to Fisher English therefore does
not reproduce the paper's protocol.

The July 2026 *Do Speech Tokens Leak Voiceprints?* paper is recorded as a
coverage audit over the already indexed VoxCeleb family. It trains and tests
SpInv on standard speaker-disjoint VoxCeleb1 and VoxCeleb2 partitions to
measure voiceprint leakage from Moshi, Higgs3, Kimi-Audio, and Qwen3-Omni
frontends. Version 1 provides no project page, repository, attack checkpoints,
extracted frontend representations, per-item predictions, or score files.
VoxCeleb's surviving public metadata and trial lists therefore cover the
source family but not the new attack implementation, so no duplicate family
or download helper is added. The original YouTube media is no longer available
from the owner pages and retains separate rights, privacy, and platform terms.

The July 2026 *From Read Speech to Spoken Digits* paper is recorded as a
coverage audit over the already indexed AudioMNIST, Speech Commands, and
LibriSpeech families. It evaluates isolated digits and constructed ten-digit
sequences against informed ASR and digit-specific attackers under three
obfuscation methods, but the cited
[PPCA repository](https://github.com/ol-MEGA/ppca) currently provides only
general speech-privacy and SpeechBrain recipes. It does not release the
paper-specific sequence manifests, concatenated audio, oracle boundaries,
trained informed models, digit-recognition evaluation code, or per-item
scores. Public access to the three source corpora therefore does not reproduce
the derived protocol, and no duplicate family or download helper is added.

The July 2026 *Efficient Text-to-Audio Generation via Pruning* paper is
recorded as recent evaluation provenance for the existing AudioCaps family.
Sections 4-6 fine-tune pruned AudioLDM-M-Full variants on the training split
and generate from the 964-caption test split, reporting FAD, KL divergence,
runtime, storage, and PANNs event-capture analyses. The official
[implementation](https://github.com/Arshdeep-Singh-Boparai/PruningAudioLDM)
is MIT-licensed and its large
[checkpoint record](https://zenodo.org/records/21376822) is CC BY 4.0, but
neither release contains the generated test audio, exact run manifests,
per-item metrics, or score records. AudioCaps' academic-use condition and
upstream YouTube availability remain authoritative, so no new benchmark
family or download helper is added.

The July 2026 *Rethinking Speech Foundation Model Fine-tuning: Better SFT or
Better Match?* paper is recorded as an existing-coverage audit of three
official SUPERB tasks: Fluent Speech Commands intent classification, IEMOCAP
emotion recognition, and VoxCeleb1 speaker identification. Sections 3-4 vary
nine pretrained checkpoints, eight fine-tuning configurations, and multiple
random seeds while keeping the official SUPERB task pipelines fixed. The
public Apache-2.0 S3PRL toolkit documents the component protocols, but the
paper releases no experiment-specific configs, checkpoints, paired
predictions, or score matrix. Component access and terms remain authoritative:
Fluent Speech Commands is manual academic access under CC BY-NC-ND 4.0,
IEMOCAP requires an owner request and signed research terms, and the VoxCeleb
owner page no longer distributes the original audio. No duplicate family or
download helper is added.

The July 2026 *SpeechGuard* paper is likewise recorded as a coverage audit
over the already indexed Speech Commands v2 and AudioMNIST families. Section 5
poisons one percent of training examples with random-noise,
environmental-noise, or 6 kHz ultrasonic triggers, then evaluates online
detection and time-frequency-mask purification. Version 1 provides no project
repository, selected-row or random-seed manifest, trigger files, poisoned
audio, trained victim/autoencoder models, entropy thresholds, predictions, or
score records. Public source corpora therefore do not reproduce its stochastic
defense protocol, and the index adds no duplicate family or download helper.

The July 2026 *Self-supervised Speech Comparison for L2 Phone, Rhythm, and
Intonation Scoring* paper maps to the official
[UME-ERJ](https://doi.org/10.32130/src.UME-ERJ) and
[UME-JRF](https://doi.org/10.32130/src.UME-JRF) source families. Their rated
English and Japanese sentence and word subsets support phone, holistic
pronunciation, rhythm, intonation, and difficult-sound scoring for L2 learners.
NII/SRC provides both corpora only after a usage pledge and review and permits
research use only. The paper's TIMIT and LibriSpeech dependencies map to
existing entries.

The July 2026 *Towards Array-Invariant Speech Enhancement via Geometry-Aware
Dynamic Convolution* paper evaluates RealMAN with fixed four-second segments
and tests zero-shot array generalization on the six-microphone real-recorded
CHiME-4 test set. RealMAN was already indexed; CHiME-4 is now recorded as a
separate licensed family. Its public challenge pages document the data layout
and Apache-2.0 baseline, while the audio and six-channel annotations are
distributed through [LDC2017S24](https://catalog.ldc.upenn.edu/LDC2017S24)
under LDC/WSJ0 terms. The helper saves documentation only and never fetches
licensed recordings.

The July 2026 *NABEATs* paper is recorded as a complete existing-coverage
audit. Its downstream tasks use FSD50K, UrbanSound8K, Speech Commands V2,
CREMA-D, NSynth, and Surge Pitch; robustness conditions use WHAM! 48 kHz,
CHiME-3, and MUSDB18; and section 5 evaluates nine DCASE 2025 Task 2 machine
types with supplementary noise samples. All map to existing families. The
paper does not release its random -5 to 10 dB mixture manifests, seeds,
reference-noise pairings, checkpoints, predictions, or score records, so those
derived evaluations remain unreleased and no duplicate family or helper is
added. Each source dataset's own open, non-commercial, mixed per-file, or LDC
terms still apply.

The July 2026 *Towards a reproducible cross-venue method for quantifying crowd
noise in stadiums* paper is recorded as a proposed-protocol audit. It defines
Class 1 instrumentation, far-field placement, fast-integrated A-weighted
levels, and single- versus multi-anchor stadium crowd-level metrics. Section
5.2.2 explicitly states that no test cases are shared and that a sports-venue
crowd-noise database remains future work. Its PSV Eindhoven–RKC Waalwijk goal
measurement is an explanatory figure rather than a released test set, so the
index adds no benchmark family, download link, or helper.

The July 2026 *CAPS* hearables paper is recorded as a coverage audit over the
already indexed VCTK, LibriSpeech, and MagnaTagATune families. Its main speech
evaluation instead uses a newly captured 20-participant corpus with simultaneous
air- and bone-conduction microphones at three ADC bit depths, plus Freesound and
LibriSpeech noise. Version 1 provides no corpus archive, participant-disjoint
split manifests, repository, code, model outputs, listener ratings, consent
documentation, or data license. The public source families therefore do not
reproduce the synchronized hearables evaluation, so no new benchmark entry,
download link, or helper is added.

The July 2026 *X-Translator* paper is likewise recorded as a mixed
existing-coverage and unreleased-selection audit. Its short-form evaluation
uses the indexed OpenSTBench protocol; the long-form, multi-speaker, and
multilingual experiments draw from WenetSpeech, VoxConverse, FLEURS,
TEDLIUM-3, and unspecified public Bilibili interviews. The official
[repository](https://github.com/zhaoyx239/X-Translator) currently releases
the demo and backend adapters but explicitly lists evaluation code as future
work. It provides no sampled recording or sentence-ID manifests, interview
URLs, generated speech, runtime logs, predictions, or scores. OpenSLR resource
51, historically associated with TEDLIUM Release 3, currently reports
“Resource not found,” so the index does not invent a replacement download
link or claim that the paper-specific selections are public.

The July 2026 *Audio Diarization* paper is likewise recorded as existing
coverage rather than a new benchmark family. Its known-class experiment uses
the indexed DESED evaluation subset, while DMix-known and DMix-unknown mix six
known or six unseen ESC-50 classes into eligible DESED clips. Version 1
provides no official project, repository, dataset card, mixture manifest,
random seed, generated audio, energy-threshold labels, evaluation code, or
per-item scores. The public DESED and ESC-50 source corpora therefore do not
reproduce the two derived DMix evaluations, and their respective upstream
terms still apply.

The July 2026 *A Production-Oriented Framework for Evaluation of SFX
Generation* paper is also recorded as existing ESC-50 coverage plus a partial
demo release. Its shared audio-to-audio variation protocol trains on official
folds 1-3, validates on fold 4, and generates ten variants for each of eight
fold-5 references per class, or 4,000 outputs per model. The official
[project repository](https://github.com/melodiedesbos/A-PRODUCTION-ORIENTED-FRAMEWORK-FOR-EVALUATION-OF-SFX-GENERATION)
publishes 72 illustrative WAV files and result figures, but no complete
generated corpus, reference/output manifest, evaluation code, randomized
listening-test selection, listener responses, or per-item scores. ESC-50
therefore remains the indexed public family; the demo-only artifacts do not
justify a duplicate family or helper. The repository states no license for
its demo audio, while upstream ESC-50 remains CC BY-NC 3.0.

The July 2026 AMECxSV paper led to a new TidyVoice family entry. Its main
experiment uses a speaker-disjoint held-out split derived from the public
TidyVoiceX development protocol, rather than the challenge's hidden evaluation
set. The official Mozilla Data Collective release contains 321,711 utterances
(457 hours) from 4,474 multilingual speakers across 40 languages and requires
an account/API key. Although its page labels the data CC0-1.0, it expressly
permits only speaker verification and forbids speaker identification or
identity recovery; the index and helper preserve that restriction.

The July 2026 voice-concept bottleneck paper adds public clinical-voice
coverage through the Perceptual Voice Qualities Database (PVQD). Section 3.1
uses an 80:20 speaker split and VAD-derived vowel and sentence segments, while
the official release provides 296 whole-speaker WAV files plus CAPE-V, GRBAS,
and demographic spreadsheets. The index therefore links the public PVQD
family without claiming that the paper's derived split or segments are
released. Its Androids Corpus and TORGO sources are also indexed. The TORGO
entry preserves the paper's headMic-only, leave-one-speaker-out protocol
without claiming that this derived split is separately released.

The July 2026 AV-SyncBench paper is recorded as an announced audiovisual
synchronization protocol, not a downloadable family. It describes 3,269
in-the-wild videos and 38,390 temporal and semantic challenge samples, but the
official [GitHub repository](https://github.com/fgt7t6g/AV-SyncBench) says the
evaluation code and dataset will be released soon, while the official
[Hugging Face repository](https://huggingface.co/datasets/coming245/AV-SyncBench)
still contains only README metadata and zero bytes of dataset storage as of
July 25. Its MIT card tag therefore does not establish reuse rights for the
unreleased benchmark or source videos.

The July 2026 MultiRef-Compass release is now indexed as a public benchmark
family. Its official Hugging Face repository provides 350 prompts, image
references, and board-4 input videos, while its MIT toolkit implements 14
metrics spanning basic quality, reference fidelity, audio-visual consistency,
and instruction following. The current public dataset has no reference-audio
column or audio files, however, so the paper's explicit audio-reference
conditions remain only partially reproducible.

The July 2026 PC-Mix paper is recorded as an audited partial-component audio
spoofing benchmark rather than a downloadable family. It describes 126,586
mixed-audio recordings (140.65 hours) with speech and environmental-sound
authenticity labels and five evaluation conditions, but its sole official
[anonymous repository](https://anonymous.4open.science/r/PC-Mix-3AFE/)
currently redirects to an API response of HTTP 401 `not_connected`. No files,
manifest, license, or alternative official release can be verified, so the
paper's claim of a public code/data release is not treated as a usable download.
The mixed source corpora and generated components would also retain their own
terms if the release becomes available.

The July 2026 ECoM Reasoning paper is likewise recorded as an audited spoken
math protocol rather than a downloadable family. Section 4.1 evaluates the
complete STITCH synthesized-speech set derived from AddSub, SingleEq,
MultiArith, and SVAMP, plus a Llama Questions subset through UltraEval-Audio.
The official [ECoM code release](https://github.com/FunAudioLLM/FunResearch/tree/main/ECoM-Reasoning)
contains data-construction utilities and placeholder manifests that require
user-supplied JSONL paths; it does not release the exact synthesized audio,
selected items, or evaluation manifests. The parent repository is Apache-2.0,
but that code license does not license the absent evaluation data or its
upstream datasets.

Version 2 of the July 2026 full-song generation report is also recorded as an audited
protocol rather than a downloadable family. Section 3.2 reports a 500-case
test set balanced across eight genres and five languages, evaluated with
SongBench, SongEval, AudioBox-Aesthetic, and CMI-Reward, while section 3.1 uses
separate 200-song codec-ablation sets and a 100-song expert listening study.
Version 2 clarifies that prompts, lyrics, codec tokens, song lengths, seeds,
and sampling recipes are fixed across its four controlled ablation variants,
but does not publish those inputs.
The official [project page](https://hifi-song-generation.github.io/) streams
selected qualitative and comparison examples but does not release the complete
prompts, held-out songs, codec inputs, per-item outputs, scores, ratings, or a
data license. Public SongEval and CMI-RewardBench releases are indexed
separately and must not be mistaken for the report's unreleased evaluation
sets.

The July 2026 human-versus-ASR diverse-speech study is recorded as a coverage
audit of the existing JASMIN-CGN family. It selects 120 human-machine-dialogue
utterances—40 each for Dutch children, Dutch older adults, and Flemish
teenagers or older adults—and separately reports three ASR systems on the full
group test sets. The paper does not publish the selected utterance identifiers,
normalization or selection scripts, listener transcriptions, ASR hypotheses,
or evaluation code. JASMIN-CGN's official signed-license access path remains
indexed, but access to that corpus does not reconstruct this listening-study
protocol, so no duplicate family or download helper is added.

ChronosAudio is recorded as an audited long-audio protocol rather than a
downloadable family. The paper describes 36,000 English test instances over
6,000 synthetic clips and more than 200 hours, with dictation, localization,
transcription, multispeaker, comprehension, and summary tasks spanning 30
seconds to 20 minutes. Its only official code/data link is an anonymous
[4open.science repository](https://anonymous.4open.science/r/ChronosAudio-D49A)
that currently returns HTTP 401 `not_connected`, so no files, exact manifest,
or benchmark-data license can be verified. The paper is CC BY 4.0 and attributes
its source text to SQuAD/Wikipedia under CC BY-SA 4.0, but those statements do
not establish rights for the unavailable annotations or generated audio.

The July 2026 RaagBase paper is recorded as an audited symbolic-music
classification protocol rather than a downloadable family. It describes a
single CSV of 116 manually transcribed Hindustani compositions across Bhairav,
Poorvi, and Todi, represented as note sequences and frequency features for
graph clustering. Its sole claimed
[4open.science release](https://anonymous.4open.science/r/RaagBase-5427/)
currently returns HTTP 401 `not_connected`, so no files, schema, code, or
dataset-specific license can be verified. The paper's CC BY 4.0 license does
not license the unavailable CSV or establish rights for its notation
transcriptions, and no download helper is added.

The July 2026 SCoPE paper is recorded as a coverage audit of IEMOCAP and MELD
rather than a new benchmark family. Sections 4-5 use the conventional
six-class IEMOCAP task and seven-class MELD task with pre-extracted multimodal
features attributed to the SDT baseline, then derive same-speaker emotion-shift
labels and report Accuracy and weighted F1 over ten runs. The paper provides no
project page, code repository, exact feature or split package, shift-label
file, checkpoints, predictions, or score records. Existing access and license
caveats remain authoritative: IEMOCAP is request-gated, while MELD declares
GPL-3.0 but contains Friends-derived media requiring separate rights review.
No duplicate family or download helper is added.

The July 2026 *Cumsum-Composable Phase Transport for Low-Cost Streaming
Keyword Spotting* paper is recorded as a coverage audit over the already
indexed Speech Commands v2 family. Sections 3-4 use one-second 16 kHz clips in
the conventional 12-class setup, subsample the unknown class, synthesize
silence from the corpus background-noise clips, and report single-seed
clip-classification accuracy. Although the architecture has an exact online
form, the paper does not evaluate continuous-stream trigger metrics and
publishes no official code, configuration, split manifest, checkpoints,
predictions, or score records. The public CC BY 4.0 Speech Commands release and
its existing helper therefore remain authoritative; no duplicate family or
paper-specific helper is added.

The July 2026 *Scalable Keyword Spotting via Modular Network Expansion* paper
is likewise recorded as an existing-family audit rather than a new benchmark.
Sections 4.1-4.4 run five paired-command expansion tasks over the official
Speech Commands v2 splits, using Common Voice v17 test audio only as negatives
to calibrate per-keyword thresholds at 1% false accept rate. False reject rate
is then measured on Speech Commands positives over eight seeds. The paper
releases no official code, exact Common Voice negative manifest, processed
features, configurations, checkpoints, predictions, or score records. The
public Speech Commands and Common Voice access paths and licenses therefore
remain authoritative, and no duplicate family or paper-specific helper is
added.

The July 2026 hybrid-feature ASV paper is likewise recorded as an
existing-coverage audit over Speech Commands rather than a new benchmark
family. It randomly selects 30 speakers and 100 utterances per speaker,
concatenates five-utterance sequences, and tests 3,600 speaker/model trials per
setup under clean conditions and NOISEX-92 babble and Volvo noise at five SNR
levels. The paper releases no selected-file list, random seed, concatenation
manifest, noisy derivatives, trial keys, code, or scores. Speech Commands
remains publicly available under CC BY 4.0, while the cited primary NOISEX-92
paper does not establish a current official public archive or redistribution
terms; the index therefore adds neither an invented noise download nor a
paper-specific helper.

The July 2026 *Explainable-by-Design Audio Deepfake Detection via Wiener-Hopf
Linear Prediction* paper adds recent evaluation provenance for ASVspoof 2019,
FakeOrReal, and DiffSSD. The public, ungated
[DiffSSD](https://huggingface.co/datasets/purdueviperlab/diffssd) release has
70,000 English synthetic utterances from ten TTS systems plus a 94,226-row
real/synthetic train-validation-test manifest. The approximately 16.9 GiB
synthetic-audio archive is opt-in, while real LJ Speech and LibriSpeech files
must be obtained separately. DiffSSD applies CC BY-NC-ND 4.0 only to its
synthetic voices and incorporates the source-corpus, text-generation, and TTS
system terms. The paper publishes no implementation or perturbation artifacts.
The [Fake-or-Real](https://bil.eecs.yorku.ca/datasets/) owner page publicly
serves more than 195,000 real and synthetic utterances in original, normalized,
two-second, and rerecorded variants. Its four archives total approximately
16.0 GiB and remain explicit helper opt-ins. The page states no
dataset-specific license or reuse terms, so users must review and obtain any
needed permissions for its CMU Arctic, LJ Speech, VoxForge, generated-voice,
and lab-recording components.

The July 2026 dataset-aware audio-deepfake paper led to public Codecfake
coverage. Section 4.1 follows the claimed 2025 Speech Deepfake Arena protocol
across eleven named source datasets, but version 1 provides no bibliographic
entry or official release for that arena as a standalone benchmark. Codecfake
itself is independently verifiable from its owner repository and six Zenodo
records: the paper defines 1,058,216 distinct English/Mandarin real and
codec-resynthesized samples, C1-C7 seen/unseen-codec conditions, and A1-A3
audio-language-model tests. The approximately 172.7 GB public release is
CC BY-NC-ND 4.0 and remains opt-in. The paper's ungated
[Hugging Face model repository](https://huggingface.co/RuiRuihigh/hyperion-mt-deepfake-detector)
publishes a checkpoint and inference/runtime code but no exact
multi-dataset selection manifests, trial protocol, predictions, or per-item
scores, and states no license. The index therefore adds Codecfake as a source
family, not a duplicate Speech Deepfake Arena family.

The July 2026 Music-JEPA paper adds evaluation provenance for MAESTRO and
public ASAP coverage. Sections 4.1 and 4.4 train on MAESTRO v3.0.0 and probe
frozen representations for ASAP beat tracking using four-second clips with
70 ms and 100 ms tolerances. The public
[ASAP repository](https://github.com/fosfrancesco/asap-dataset) provides
MusicXML and MIDI scores, performance MIDI, alignment metadata, and beat,
downbeat, time-signature, and key-signature annotations under CC BY-NC-SA 4.0.
It reports 1,067 MIDI performances and 519 audio-aligned performances, but
does not redistribute audio; users must obtain MAESTRO v2.0.0 separately and
run the supplied initialization script. Music-JEPA's paper-specific probe
configuration, derived clip manifest, filtered MAESTRO composer subset,
pseudo key labels, code, and checkpoints remain unreleased. ASAP is therefore
counted as one public benchmark family, while those derived protocols and
announced model artifacts are not counted separately.

The July 2026 *Automatic Audio Equalization with Semantic Embeddings* paper
adds evaluation provenance for VCTK, EARS, MedleyDB, and DSD100, and exposes
DEMAND as one missing public source family. Section 4.3 creates four
paper-specific 1,000-example tests; its noisy-speech condition mixes DEMAND
noise at -5 to 30 dB SNR, but the exact utterance selection, random filters,
gains, derived audio, and listening-test package are not released. The
owner-authored [DEMAND Zenodo record](https://doi.org/10.5281/zenodo.1227121)
publishes 16-channel real-world environmental recordings at 16 kHz and 48 kHz.
Its prose says 15 recordings while the current file inventory exposes 18
named scenes, so the index preserves that discrepancy. The record's prose
explicitly applies CC BY-SA 3.0 to the audio and documentation even though its
structured license field says CC BY 4.0; the helper therefore treats the
specific share-alike statement as controlling, downloads only metadata and
the technical description by default, and requires an explicit scene and
sample rate for audio.
