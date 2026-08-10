# Research and release audits

Detailed provenance and release-status notes collected while maintaining the Audio Benchmark Index.
These notes explain why a paper, protocol, or dataset was added, mapped to an existing family,
recorded as unreleased, or excluded from the downloadable index.

The August 2026 [*MoCA: Implicit Social Context
Analysis*](https://arxiv.org/abs/2608.05825) release is recorded as a public
but out-of-scope audio false-positive after reviewing Sections 3-6 and
Appendices B-D. MoCA has 3,108 cases, including 878 video-text instances whose
owner-hosted Hugging Face release includes matching audio files. However, the
reported evaluation uniformly samples video frames and converts speech to
captions; Section 6.1 and Appendix B explicitly say the results are transcript-
conditioned and do not evaluate direct acoustic perception. The released code
likewise describes its CoDAR implementation as an intentionally minimal
reference scaffold rather than the full model-backed pipeline used for the
paper. The public repository is MIT-licensed and its repository and dataset
card declare CC BY-NC 4.0 for data, but underlying cases come from existing
datasets and supplementary real-world sources, so upstream media rights still
require review. MoCA is therefore not counted as an audio/speech-LLM benchmark
and receives no download helper; reassess only if a direct-waveform evaluation
protocol is released.

GlobeAudio is now indexed as a released multilingual, multicultural LALM
evaluation after reviewing Sections 2.3-2.5, 3.2, and 4.2-4.3 of the June 2026
paper and the owner-linked Hugging Face release. Its 5,637 native-speaker-
authored four-option questions cover English, Russian, Chinese, Thai, Bengali,
and Singlish clips sampled from naturally occurring online speech. Exact-label
accuracy is complemented by transcript-only, blind, and translated-question
ablations, directly testing whether pretrained and instruction-tuned audio
models use acoustic, prosodic, linguistic, and cultural evidence rather than
question-side shortcuts. The ungated Hub snapshot contains 29 Parquet shards
totaling 12,542,951,445 bytes; its card-level 1,554,418,131-byte statistic
reflects only the Bengali configuration and should not be read as the full
download size. The card declares CC BY-NC 4.0, but its embedded audio is clipped
from YouTube and the release does not enumerate source-video URLs or establish
that all upstream media rights were relicensed. A safe helper fetches the card
and live metadata by default and requires explicit opt-in for the large files.

The June 2026 [*Constraining to Generalize: Subspace Tuning for Few-shot
Generalization of Audio-Language Models*](https://arxiv.org/abs/2606.18560)
paper is recorded as an existing-family pretraining-transfer audit after
reviewing Section 4 and Appendices A-C and E. Its base-to-new protocol splits
the class vocabulary of eleven audio classification datasets into disjoint
halves, adapts pretrained Pengi embeddings with 16 shots per base class, and
reports base accuracy, unseen-class accuracy, their harmonic mean, and two
forms of zero-shot embedding drift over three seeds. A second protocol trains
on NS-Instruments, RAVDESS, or ESC50-Actions and transfers without further
adaptation to Beijing Opera, CREMA-D, or UrbanSound8K; Appendix C repeats most
of the suite with MS-CLAP. This directly tests whether few-shot post-training
preserves representations learned during audio-text pretraining. The paper
provides total/base class counts and prompt templates, but not the frozen
class assignments, support-example manifests, seed values, SubT code or
configuration, checkpoints, predictions, or item scores. Exact-title and
arXiv-ID GitHub searches and arXiv-ID Hugging Face model and dataset searches
found no owner release on August 10. CC BY 4.0 covers the article, not those
absent artifacts; Appendix E lists heterogeneous upstream terms, including
non-commercial restrictions, without relicensing them. No counted family or
download helper is added.

MMAG is now indexed as a released mixed-audio generation and controllability
benchmark after reviewing Sections 3-5 and Appendices A-D of the August 2026
paper and the owner-linked Hugging Face release. Its 3,974-item main set tests
text-conditioned generation of scenes combining speech, music, and sound;
691 items additionally supply 2-5-second voice prompts, and 1,828 items supply
timestamped captions for speech and foreground events. The protocol combines
distributional and perceptual audio metrics, WER, speaker similarity, UTMOS,
CLAP, AnyAudio-Judge rubric scores, and separate speech/event segment F1. This
directly evaluates fine-grained control and audio-language judging for
post-trained mixed-audio generators and agentic audio systems. The public,
ungated Hub snapshot releases the three exact manifests, target audio, and
voice prompts, but the paper's metric pipeline, generated baseline outputs,
rubrics, predictions, and item scores remain unreleased; the GitHub repository
still lists the evaluation pipeline as a TODO. The dataset card labels the
snapshot CC BY 4.0 while also saying it is for non-commercial research, and
the AudioCaps, VGGSound, and MECAT-derived source media retain their own terms.
A safe helper downloads only documentation, live metadata, and the three small
manifests by default; the approximately 1.06 GB audio snapshot is opt-in.

SAKURA is now indexed as a released audio-LLM reasoning benchmark after a
primary-source review of Sections 2-4 of its Interspeech 2025 paper and the
official repository. Its Gender, Language, Emotion, and Animal tracks each pair
500 audio clips with one single-hop perception question and one multi-hop
reasoning question, for 4,000 questions across eight sub-tracks. This paired
design tests whether a model can reason from an acoustic attribute it can
already perceive, making it directly relevant to audio-language pretraining
and reasoning post-training. The public repository releases WAVs, CSV/JSON
annotations, answers, GPT-4o judge prompts, and accuracy code; four owner-linked
Hugging Face repositories provide the tracks separately. The July 2026 ORCA
connector paper reuses SAKURA and adds a paper-specific 10 dB white-Gaussian-
noise evaluation, but releases no separate noisy manifest or outputs, so that
derived robustness run is provenance rather than a new family. Neither SAKURA's
repository nor its Hugging Face cards states a license. Common Voice 17.0,
CREMA-D, MELD, ESC-50, and the Sasmaz/Tek animal-sound sources retain separate
terms. A safe helper retrieves documentation and metadata by default, while
each audio track and the roughly 220 MiB repository clone require explicit
opt-in.

The July 2026 [*A Geometric Perspective on Composable Emotion Steering in
Text-to-Speech Models*](https://arxiv.org/abs/2607.00946) paper is recorded as
an unreleased derived evaluation audit after reviewing Sections 2-4. It probes
CosyVoice2's speech-language-model and conditional-flow-matching stages on ESD,
CREMA-D, and RAVDESS with within- and held-out-speaker linear classification and
local intrinsic dimensionality, then compares SLM-only, flow-matching-only, and
joint mixed-emotion steering on CREMA-D and IEMOCAP. Emotion2Vec similarity and
target probabilities, proportional-ranking correlation, dominant-emotion hit
rate, WavLM speaker similarity, and Whisper-large-v3 WER directly evaluate
post-training and inference-time controllability while checking speaker and
content preservation. The paper releases only aggregate figures and tables: it
links no project or artifact repository, and exact-title GitHub plus Hugging
Face model and dataset searches found no owner release on August 9. Frozen
source selections and speaker splits, mixed-emotion annotation targets, probe
and LID code, steering vectors and settings, generated audio, predictions, and
item scores remain unavailable. The arXiv perpetual non-exclusive license
covers the article, not these absent derived artifacts; ESD, CREMA-D, RAVDESS,
and IEMOCAP retain their own terms. No counted family or helper is added.

The August 2026 [*Do Audio Language Models Use Paralinguistic
Evidence?*](https://arxiv.org/abs/2608.06718) paper is recorded as an
unreleased post-training judge audit after reviewing Sections 3-5 and
Appendices B-E. Its `single-turn-emotions` task contains 189 transcript-fixed
counterfactual emotion pairs (378 pointwise instances), while
`positional-emotion` contains 500 conversation pairs (1,000 pointwise
instances) whose negative-affect onset and cause differ despite controlled
transcripts. Pointwise and pairwise judgments are decomposed into perception,
oracle response mapping, and integrated audio judgment, producing an eight-
state diagnostic and a bootstrapped protocol-gap measure. This directly tests
whether audio-LLM evaluators and potential reward signals use affect, prosody,
and temporal-causal cues instead of lexical shortcuts. The paper releases no
audio, item manifests, labels, evaluator, outputs, item scores, or human-rating
files; exact-title GitHub and Hugging Face searches found no owner release, and
generation code is only promised after acceptance. The article's CC BY 4.0
license does not cover absent audit assets, generated speech, or CAVA, OD3,
and OD3-component source data. No counted family or download helper is added.

The August 2026 [*SemBridge*](https://arxiv.org/abs/2608.07462) paper is
recorded as an existing-family and incomplete-release audit of pretraining a
continuous-latent autoregressive speech model through a discrete semantic-token
interface. Sections 3-4 and Supplementary Sections 1-5 evaluate target-space
alignment and intermediate-LM-state anchoring on the already indexed public
Seed-TTS Eval and CV3-Eval families, using CER or WER, WavLM speaker similarity,
UTMOS, and reconstruction metrics. The singing-transfer experiment follows
the GMO-SVS and SoulX-Singer-Eval protocol with CER or WER, similarity, F0
frame error, SingMOS-Pro, and Sheet-SSQA. The official demo page publicly hosts
selected speech and singing samples, but the paper-promised ASLP-lab model
repository returns HTTP 404. No SemBridge evaluation runner, frozen
configurations, complete generated outputs, predictions, or item-level scores
are released. The arXiv non-exclusive distribution license covers only the
article; the unlicensed demo repository and all upstream benchmark families
retain separate terms. No benchmark count or download helper changes.

The July 2026 *Safeguards for Speech2Speech LLM-Assistants* release was
rechecked on August 9 after reviewing its Evaluation Setup and Evaluation
Results. Its 5,400-run protocol crosses three realtime speech models, three
guardrail modes, and benign or trigger-word inputs to measure answer latency
and whether safeguards execute before speech output. ArXiv still exposes only
version 1 and a source package containing the article and rendered figures;
official-release searches found no prompt/audio manifest, per-run records,
outputs, or implementation. The article's CC BY-NC-ND 4.0 terms do not license
absent evaluation artifacts or vendor API outputs. The protocol remains an
unreleased audit with no counted benchmark family or helper.

The August 2026 *InteracVid* paper is recorded as a public-metadata but
unreleased-evaluation audit of interactive audio-video post-training. Sections
3-5 define interaction-structured supervision pairing preceding audio-visual
context and a live-chat or reconstructed query with the real spoken and visual
response. The central benchmark holds out 100 genuine live-chat interactions
by source channel and compares pretrained and fine-tuned planners and audio-
video generators using a fixed VLM judge for relevance, appropriateness, and
expressiveness; speech CER; audio, video, and synchronization metrics; and a
blinded ten-rater study. This directly tests whether multimodal post-training
improves context-grounded spoken interaction rather than descriptive generation
alone. The official ungated Hugging Face release contains nine Parquet shards
with more than 454,000 rows of query, caption, source type, YouTube ID, start
time, and duration metadata, but it redistributes no audio-video and exposes no
split, channel, or held-out-membership field. The official MIT repository
releases the curation pipeline, not the frozen 100-case manifest, evaluation
runner, generated outputs, judgments, human-rating rows, or per-item scores.
The article's CC BY 4.0 and repository's MIT license do not establish rights for
the metadata, upstream YouTube media, or absent evaluation artifacts. No counted
family or download helper is added.

The July 2026 *AuEmoChat* paper's NCSSD-EmCap evaluation release was rechecked
on August 8. Section 5.1 describes an approximately 384-hour expressive
conversational speech set with 18,580 dialogues, 245,984 utterances, 25
speakers, an 8:1:1 split, and objective naturalness, emotion, intelligibility,
fidelity, speaker-similarity, and classification measures. This is relevant to
post-training evaluation of emotional dialogue speech generation. However, the
paper-announced `anonymous-css/AuEmoChat` repository still returns HTTP 404,
and the cited Chain-Talker repository still has only README.md and LICENSE in
its complete two-file tree at revision
`197b096f2d547bbc99a8c42a6d51df2be5940299`, last pushed May 20, 2025.
Exact-name Hugging Face dataset searches found no NCSSD-EmCap or AuEmoChat
release. The derived audio, emotion captions, fixed splits, evaluation outputs,
and code remain unavailable. Chain-Talker's Apache-2.0 license does not license
those absent artifacts or override DailyTalk, NCSSD, and MultiDialog terms. No
benchmark family, count increase, or helper is added.

The June 2026 *BayLing-Duplex* paper is recorded as an existing-family and
unreleased-derived-protocol audit of native full-duplex speech-LLM
post-training after reviewing Sections 3 and 4.1-4.4. The model adapts
GLM-4-Voice with 400,000 synthetic turn-taking and interruption SFT dialogues,
then uses timing-perturbed DPO negatives to improve when the assistant starts
and stops speaking. Evaluation uses 300 Llama Questions, 2,032 CosyVoice-
synthesized WebQuestions, a 199-item InstructS2S-Eval selection from
Alpaca-Eval, and 199 derived two-question interruption cases. It reports
spoken-QA substring accuracy after Whisper transcription, turn-taking success
within three seconds, interruption success within two seconds, stop delay, and
GPT-4o speech-response scores. The owner GitHub repository and ungated Hugging
Face checkpoint release the model and inference runtime, but their complete
trees contain no training dialogues or DPO pairs, frozen evaluation manifests,
synthesized QA inputs, pairing/timing files, evaluator and judge prompts,
generated outputs, baseline predictions, or per-item scores. The custom
GLM-4-Voice license permits academic research and requires commercial
registration; it does not license absent evaluation artifacts or override
Alpaca-Eval, Llama Questions, WebQuestions, CosyVoice, or vendor terms. No
benchmark family, count increase, or helper is added.

The July 2026 *Hierarchical Acoustic-Semantic Modeling* paper is recorded as a
pretraining-transfer and full-duplex post-training evaluation audit after
reviewing Sections 3.1 and 4.1-4.6 and Appendices 7-11. Lychee-FD analyzes
gradient conflict between acoustic-token and semantic objectives while adapting
a half-duplex speech foundation model, then evaluates whether hierarchical
semantic, acoustic, and control heads retain spoken knowledge and improve
interruption, backchannel, pause, and turn-taking behavior. Table 1 uses LlamaQ,
WebQ, and TriviaQA in speech-to-text and speech-to-speech modes; Table 2 uses
FD-Bench and the already indexed Full-Duplex-Bench v1/v1.5 family; Section 4.6
also reports WER and UTMOS on generated LlamaQ speech. The owner GitHub repository
and ungated Hugging Face checkpoint are Apache-2.0 and public, but their complete
non-truncated tree contains no frozen QA audio/manifests, benchmark runner,
prompts, FD-Bench cases, baseline outputs, generated evaluation audio, or
per-item scores. Those omissions keep the paper's aggregate tables only
partially reproducible. Apache-2.0 covers the released code and model, not
absent evaluation assets or external benchmarks; the separately required
Step-Audio-2 Token2Wav component retains its upstream terms. No benchmark
family, count increase, or model-download helper is added. An August 9 recheck
found the same complete 2,024-entry GitHub tree at commit
`259a068317e21393fd27b1e8c85cb79faa4e5eae`; the only benchmark-named owner
files are duplicate SVG renderings of the aggregate table, not evaluation
inputs or code. The Hugging Face model snapshot was likewise unchanged.

The February 2026 *GSRM* paper is recorded as an internal reward-benchmark and
online-RLHF evaluation audit after reviewing Sections 2 and 6-7 and Appendices
3-4. It trains a Qwen2.5-Omni-7B generative speech reward model on ConvTTS, an
internal set of 6,579 two-channel synthetic dialogues with approximately
31,000 human ratings, and tests both its in-domain split and the internal
490-dialogue FDX-Conv out-of-domain set. The naturalness protocol scores six
fine-grained attributes plus human-likeness and reports Pearson and Spearman
correlation and MSE against averaged human ratings. The paper then uses GSRM
as the verifier for online GRPO on 9,200 prompts and compares the resulting
full-duplex speech LLM with its SFT base on 50 held-out volunteer-recorded
prompts; five raters per pair judge tone, pacing, intonation, and naturalness,
with the RLHF model winning 82% of overall-naturalness comparisons. This is
directly relevant to speech-LLM reward modeling, judging, and post-training,
but the models, code, data splits, manifests, prompts, outputs, ratings, and
per-item scores are unreleased. The paper supplies no code or data URL, and
exact-title GitHub plus Hugging Face model/dataset searches found no owner
release on August 8. The arXiv non-exclusive article license does not cover
those internal assets or human recordings, so no counted family or helper is
added.

The June 2026 *AudioDER* paper is recorded as a post-training-data and
existing-benchmark coverage audit after reviewing Sections 3-4 and Table 3.
It constructs approximately 191,000 sound, speech, and music examples with
audio, multiple-choice questions, captions, and Qwen3-30B chain-of-thought
rationales, then fully fine-tunes Qwen2-Audio-7B-Instruct for two epochs. The
evaluation uses only the already indexed MMAU-mini, MMSU, and MMAR families;
the paper reports an MMAU-mini overall increase from 59.60 to 66.70 and final
MMSU and MMAR accuracies of 56.49 and 50.10. The paper-linked GitHub URL now
redirects to an anonymous repository containing only a README and three
images, with no code, manifests, checkpoint, outputs, or license. Its linked
Hugging Face dataset returns HTTP 401 and exposes no public card or file tree.
The paper and README also differ on whether captions and questions were
integrated from source annotations or generated with Qwen3-30B. AudioDER is a
post-training corpus, not a new benchmark; source-family terms and generated-
annotation rights remain separately unresolved. No family, count increase, or
download helper is added pending an accessible, licensed release snapshot.

The July 2026 *MMAC: A Massive Multi-dimensional Benchmark for Audio
Captioning* paper is recorded as an announced-but-unreleased AudioLLM
evaluation audit after reviewing Sections 2-3. MMAC defines 5,638 clips (13.04
hours) from more than 20 sources across content, background, persona,
paralinguistic, dynamic, and implication capabilities, further divided into 15
dimensions. Models answer the common prompt “Describe this audio in detail,”
and Qwen3.6-27B judges coverage, precision over mentioned information, and
accuracy with omissions scored zero; dimensions are aggregated within each
capability before an equal six-category macro-average. This directly evaluates
whether audio-LLM pretraining and post-training support reliable fine-grained
free-form captioning, including speech content, speaker traits, delivery,
temporal change, and implied meaning. Version 2 still says the authors “will
release” the benchmark and evaluation code, but links no owner repository or
dataset, and no audio, labels, source/split manifests, judge implementation,
baseline outputs, or per-item scores were identified. The public
[ZWHTXY/MMAC-Bench](https://huggingface.co/datasets/ZWHTXY/MMAC-Bench) is an
unrelated ACL 2026 cultural-grounding benchmark and is explicitly recorded as
an alias collision, not a release of this audio-captioning MMAC. The article's
arXiv distribution license does not cover absent benchmark artifacts or
third-party source audio. No benchmark family, count increase, or helper is
added.

The May 2026 *VoxParadox* paper now contributes a public adversarial
paralinguistic speech-QA family. Section 3 defines 2,000 verified English MCQs,
200 each for age, gender, emotion, intonation, speaker identity, speaker count,
pitch, volume, speaking rate, and vocal range. Every item deliberately makes
the transcript assert a label that conflicts with the acoustic ground truth;
ground-truth accuracy measures listening, while adversarial-label agreement
measures lexical shortcutting. This directly evaluates post-training for
acoustic grounding: the primary paper releases PCLM and DPO adaptations, and
the July 2026 IAAN paper reuses the benchmark to test training-free audio-
encoder neuron intervention, selecting hyperparameters on 190 external LISTEN
clips rather than the VoxParadox test set. The ungated
[Hub release](https://huggingface.co/datasets/IHP-Lab/VoxParadox) supplies all
2,000 WAVs, manifests, labels, and the scorer; the
[repository](https://github.com/ihp-lab/VoxParadox) supplies evaluation and
probing code plus links to released PCLM/DPO checkpoints. The custom USC
Research License allows educational, research, and non-profit use but requires
a separate commercial license. The card additionally warns that commercial
reuse of ElevenLabs-, GPT-4o-, and Azure-synthesized audio remains subject to
vendor terms. A safe helper fetches documentation, terms, manifests, and the
scorer by default; the approximately 1.34 GB Hub snapshot and larger code
clone require separate opt-ins.

The July 2026 *Teffic-Audio* technical report is recorded as data-mixture and
existing-family evaluation provenance after reviewing Sections 3-4 and Tables
1-3. Its pretrained Conformer detector is adapted with a disclosed mixture of
public bona-fide and spoofed speech spanning TTS, voice conversion, neural
vocoder reconstruction, and neural-codec resynthesis. Attack/source-balanced
sampling and eight waveform augmentation types are evaluated across the already
indexed Speech DF Arena's 14 test sets using dataset-level, pooled, and average
EER, accuracy, and F1. This directly informs speech-representation transfer,
data-mixture quality, and cross-domain robustness, but defines no new benchmark
family. The [owner page](https://tefficlabs.com/teffic-audio) is public, and the
existing arena toolkit and leaderboard expose the evaluation protocol and
submitted scores. However, Table 3 labels Teffic-Audio proprietary, and no
weights, training or evaluation code, exact item manifest, sampling stream,
seeds, predictions, or per-item scores are released. “Open-source data” is not
a unified license grant: every training and evaluation component retains its
upstream terms, while the article license does not cover the absent artifacts
or proprietary model. No count increase or duplicate helper is added.

The April 2025 Kimi-Audio technical report now has a release audit for its
speech-conversation evaluation in Sections 6.1 and 6.2.4 and Table 7. The
owner-published Kimi-Audio-GenTest release contains 191 Chinese spoken prompts:
12 speed, 51 accent, 60 explicit-emotion, 48 empathy or implicit-emotion, 10
storytelling, and 10 tongue-twister cases. Models generate spoken responses,
which the paper compares using 1-5 human ratings for speed, accent, emotion,
empathy, and style control. This directly evaluates post-trained audio LLM
instruction following, paralinguistic controllability, and spoken-dialogue
quality. The prompt WAVs and metadata are public and ungated, while the full
audio snapshot is opt-in in the helper. The paper's baseline outputs,
individual ratings, annotator details, and full subjective protocol are not in
the dataset, so Table 7 is only partially reproducible. The dataset card
declares MIT but does not separately document prompt-audio provenance or
recording rights; the eval toolkit's MIT license covers software only.

Common-Sense Facts Audio is now indexed as a public, ungated pretraining
evaluation after reviewing Sections 3-4 and Appendix A of *Interleaved Speech
Language Models Latently Work In Text* and the owner releases. The protocol
pairs incomplete spoken prompts with correct and same-category counterfactual
spoken facts, scoring whether a speech LM assigns higher likelihood to the
correct completion. Prompt word timings also support layerwise current- and
next-word transcription Recall@k probes. Controlled Llama 3.2 ablations vary
text-LM versus random initialization and speech-only, balanced speech-text, or
three interleaving mixtures, directly testing whether speech-text interleaving
makes text-pretrained factual knowledge accessible from speech. The public Hub
provides a 52,788,867-byte Parquet with text, three audio renderings, and prompt
timings for 281 examples. This is one fewer than the paper's 282 examples
across 13 categories, and the omitted item is not identified. The project marks
code as coming soon and releases no evaluated-model predictions or per-item
scores. The Hub card declares only the generic “other” license tag without
custom terms; the article license does not license the curated facts,
counterfactuals, timings, or generated audio. The helper therefore fetches
lightweight official metadata by default and keeps the Parquet behind an
explicit opt-in.
A focused August 10 recheck found arXiv still at version 1 and the owner Hub
dataset still fixed at revision
`f0038948b4053b8c83e6b67133112742f72890bb` from June 25. The project page,
last modified June 23, still renders its GitHub control as a non-linking “Code
coming soon” placeholder. The Hub tree remains limited to the card,
`.gitattributes`, and the single Parquet file, so no evaluation runner,
checkpoints, predictions, per-item scores, or explanation of the 281-versus-282
row discrepancy has appeared.

SpeechJBB is now indexed as a public, ungated multilingual spoken-safety
benchmark after reviewing Sections 3-6 and Appendices A-E of the June 2026
paper and the owner releases. It renders 100 harmful and 100 benign
JailbreakBench prompts with XTTS across English, German, Spanish, French, and
Italian: five monolingual settings and ten code-switched pairs produce 1,500
clean harmful and 1,500 clean benign files. Three additional 1,500-file tracks
insert phonologically plausible pseudo-words around safety-critical terms at
10%, 30%, or 50%. The protocol classifies audio-LLM responses as refusal,
deflection, or jailbroken with GPT-4.1, and also tests a multilingual
normalization and intent-verification defense. This directly evaluates
post-training safety alignment and over-refusal under multilingual spoken
inputs. The ungated Hub publishes all 7,500 core WAVs plus 4,118 Speech-MGSM,
FLEURS ASR, and FLEURS-SLU control WAVs, reporting 6.82 GB total. The GitHub
repository publishes evaluation code, condition-specific prompt CSVs, and
nine-model outputs for clean malicious, all three obfuscation, defense, MGSM,
FLEURS ASR, and FLEURS-SLU conditions. A focused August 9 audit of its
2,193-entry tree at revision `421e189c9f4f7469a05b94c1c7cec71659e81b06`
corrects the earlier description of these artifacts as only selected-model
records. Clean benign outputs and judgments remain limited to Qwen2.5-Omni,
Qwen3-Omni, and Voxtral, and there is no unified manifest joining Hub audio
paths to prompt text beyond filename row indices. The Hub card's loader
examples also retain a stale namespace and train split. Most importantly, the
card labels the aggregate dataset only as “other” and publishes no custom
terms; the repository has no license file. The paper's CC BY 4.0 and its
Appendix E source-license inventory do not by themselves license the derived
prompts, synthetic audio, or code. The helper therefore fetches only
lightweight official metadata by default and keeps the audio snapshot and
repository clone behind separate opt-ins.

The August 2026 *Hear, Invoke, and Understand* paper is recorded as an
announced-but-unreleased HIU-Bench audit after reviewing Sections 5.1-5.2 and
6.1-6.3. The held-out benchmark directly evaluates post-trained audio agents:
its 1,395 samples span 56 tasks, with 960 samples from 24 in-distribution tasks
and 435 from 32 out-of-distribution tasks. The splits use independent audio,
share only two tools, and have disjoint annotated workflow sets. Evaluation
combines answer quality, tool interaction, and format correctness with weights
of 0.70, 0.25, and 0.05; the OOD interaction rubric gives partial credit for
valid alternative workflows. This tests whether trajectory SFT and multi-turn
RL produce generalizable acoustic skill selection and multi-step tool
coordination, rather than merely improving fixed-input audio question
answering. HIU-Corpus's 65,492 trajectories and 507.6 hours are training data,
not a separate benchmark. Version 1 promises code, models, and datasets only
upon publication and supplies no artifact URL. GitHub and Hugging Face checks
on August 7 found no owner release; the sole similar GitHub result is an
unrelated agent-safety project. The audio, task manifests, skill/tool
definitions, gold workflows, rubrics, predictions, and per-item scores remain
unreleased with no stated artifact license. The article's arXiv license does
not license those absent materials, so HIU-Bench is not counted as a public
family and receives no download helper.
A focused August 9 recheck found arXiv version 1 unchanged. Exact-title and
benchmark-name GitHub searches returned only paper-list mirrors or the
unrelated `hiua-bench` project, and exact-name Hugging Face dataset and model
searches remained empty. The paper conclusion still promises release only
upon publication and supplies no owner-controlled artifact URL, so the full
HIU-Bench evaluation package remains unreleased.

The June 2026 *AudioProcessBench* paper is recorded as an announced-but-
unreleased derived benchmark for audio reasoning critics and process reward
models. Sections 3-4 and Appendices A-H define 3,872 reasoning traces and
23,497 steps derived from the already indexed MMAR, MMSU, and MMAU-Pro
families. Six audio/omni models generate the traces; DeepSeek V3.2 segments
them, Gemini 3.1 Pro and Qwen3.5 Omni Plus independently label them, and human
review spot-checks or adjudicates results by model-agreement tier. The 9,693
erroneous steps are divided among existence, semantic, temporal, acoustic-
attribute, cross-modal-binding, and reasoning errors. Evaluation covers binary
step correctness and first-error location, error-type-conditioned detection,
and Best-of-N or score-aggregated majority-vote answer selection. This directly
targets post-training evaluation because it measures audio-capable critics and
prospective process reward models rather than final answers alone. The paper
provides prompts in figures and says the benchmark and derived annotations
will be released under CC BY-NC 4.0, but provides no artifact URL. Exact-name
GitHub repository and Hugging Face dataset searches found no release on August
7. Frozen manifests, traces, labels, review records, evaluation code,
predictions, and per-item scores therefore remain unavailable. Upstream terms
still apply to source audio and benchmark components. No public family is
counted and no download helper is added.
A focused August 9 recheck found only arXiv version 1, zero exact-name GitHub
repository results, and no exact-name Hugging Face dataset or model results.
Appendix A's release statement still uses future tense and supplies no artifact
URL, so the announced CC BY-NC 4.0 remains a license intention rather than a
verifiable released package.

The July 2026 *Audio-Cogito* revision is recorded as a public-training-release
and existing-benchmark evaluation audit of chain-of-thought SFT for audio
LLMs. Sections 2-3 construct a claimed 545,000 examples from ten sound,
speech, and music sources using Qwen3-Omni-Instruct for QA generation,
Qwen3-Omni-Thinking for self-distilled reasoning traces, and a two-stage
consistency and LLM-judge filter. Evaluation exclusively uses the already
indexed MMAR family and the Interspeech 2026 Audio Reasoning Challenge
protocol: answer accuracy, GPT-4o judgments against five Gemini-generated
instance rubric items, and Correct Reasoning Score, with five judging runs
and the middle three averaged. The public, ungated Hugging Face repository
contains one 1,001,617,560-byte JSONL file with messages, reasoning, answers,
and upstream audio path identifiers, but no audio media. The owner GitHub
repository contains only a README and two pipeline figures; Cogito-Pipe code,
the seed pool, prompts, verification implementation, model adapter or
checkpoint, predictions, and per-item evaluation scores are not released.
The dataset card declares CC BY-NC 4.0 for the aggregate annotation file, not
the omitted upstream audio or absent artifacts; the GitHub repository has no
detected license. Because this is training data without an independent test
split or evaluation protocol, no new family or download helper is added.

The July 2026 *Latent-IM* paper is recorded as an existing-corpora and
unreleased-derived-protocol audit of interaction-management control for speech
LLMs. Sections 3-7 and Appendices A-C and G map MapTask, FindTask, and CReST
follower turns into five conversational moves—acknowledge, check, explain,
query, and reply—and evaluate next-move selection, oracle realization,
end-to-end response control, and turn-boundary prediction with Qwen2.5-Omni,
Qwen3-Omni, and Phi-4 Multimodal. Appendix C reports 2,705, 156, and 319 test
turns respectively, from dialogue-grouped 20% holdouts; notably, the CReST
test set contains only three dialogues. A Qwen2.5-72B move classifier is
validated against three blinded MTurk labels on 500 generated responses,
reaching 73.9% majority agreement with human Fleiss' kappa of 0.682. This is
directly relevant to post-training and inference-time control because it tests
whether frozen speech LLM representations can select and causally realize
dialogue actions and determine when to yield the floor. The article provides
no artifact URL, and exact-name GitHub and Hugging Face searches found no
owner release on August 7. Frozen row manifests, mapping and preprocessing
code, controller and steering code, generations, predictions, and individual
human ratings therefore remain unavailable. CC BY 4.0 covers the paper, not
the absent artifacts or upstream corpora. No new public family is counted and
no download helper is added.

The July 2026 M3-DuplexBench paper is recorded as an unreleased derived
protocol for directly in-scope full-duplex speech-LLM evaluation. Sections
III-V define 7,214 turn shifts, 4,624 pauses, 1,779 backchannels, and 2,635
barge-ins across English and Japanese casual conversation and multi-turn QA.
Its distinguishing protocol compares the same event with no history,
user-only history, and teacher-forced user-plus-system history, measuring
takeover and stop latency alongside GPT-5 nano judgments of relevance,
contextual consistency, and QA accuracy. English and Japanese task audio is
derived from TopiOCQA using Gemma 4 31B rewriting or translation,
CosyVoice2-based synthesis, and timing sampled from Candor and a Magic Data
Japanese duplex corpus. The paper provides no artifact URL. Exact-name GitHub
repository and Hugging Face dataset/model searches found no owner release on
August 7, so the event manifests, split definitions, derived audio,
translations, evaluator, judge prompts, outputs, and per-event scores remain
unavailable. The article uses arXiv's perpetual non-exclusive license and
states no benchmark-artifact license; all source corpora and generated
components retain their own terms. M3-DuplexBench is therefore not counted as
a public family, and no download helper is added.

EmphAssess is now indexed as a public, ungated emphasis-transfer benchmark
after reviewing the primary paper's Sections 3-6 and 8 and Meta's archived
owner repository. Its 3,652 synthetic English inputs render 913 annotated
transcripts in four Expresso voices. Evaluated speech-to-speech systems
resynthesize or translate each input; WhisperX transcribes and force-aligns
the output, EmphaClass detects emphasized words, and SimAlign maps the source
target to paraphrased or translated output before word-level precision,
recall, and F1 scoring. This directly evaluates whether pretrained speech
representations and speech-generation interfaces preserve meaning-bearing
prosody, and it supplies primary provenance for SpeechCombine's later
speech-LLM understanding and controlled-generation adaptations. The English
dataset (226,646,154 bytes), English classifier (3,571,288,236 bytes), and code
are public. The Spanish topline audio and classifier, internal classifier-
training recordings, and Appendix A multilingual tests are not released. The
owner applies CC BY-NC 4.0 to the dataset and classifier; separately licensed
dependencies and synthetic-voice/upstream rights remain applicable. The
helper downloads lightweight official metadata by default and keeps the data,
classifier, and repository clone behind independent opt-ins.

The July 2026 *SpeechCombine* paper is recorded as an existing-family and
public-derived-artifact audit of speech-LLM pretraining transfer. Sections
4.1-4.6 and Appendices B-C evaluate whether one round of prosody-aware
continuous pretraining plus weight combination transfers text-LLM instruction
following into spoken QA and reasoning, emotion and emphasis understanding,
and controlled emotion and emphasis generation. VoiceBench and URO-Bench map
to existing indexed families. The paper also adapts the separately indexed
EmphAssess family by retaining speaker ex04 for emphasis detection and
converting the same labels into CosyVoice-rendered generation instructions;
those understanding and generation variants are paper-specific protocols, not
separate benchmark families. The owner GitHub repository releases evaluation
code,
and its linked, ungated Hugging Face model repository packages the paper's
MMSU and OpenBookQA selections, a 679.7 MB URO-Bench archive, and a 191.8 MB
EmphAssess-derived archive plus evaluator. It does not package the cited SDQA
selection or release complete model outputs, predictions, and per-item scores.
The Hugging Face card declares CC BY-NC 4.0 for its aggregate release, but
that label should not be treated as overriding upstream benchmark, generated-
speech, or model terms. The GitHub repository has no root license, while CC BY
4.0 covers the article only. No duplicate family or helper is added.

EchoMind is now indexed as a public, ungated empathetic speech-language-model
benchmark after reviewing the primary paper's Sections 3.1-3.3 and Appendices
A.1, A.3, and B.2-B.4. Its 1,137 English scripts are rendered as 3,356
synthetic target, neutral, and alternative-expression inputs spanning 39 vocal
attributes; a parallel 491-script subset supplies 1,453 human-recorded inputs.
The linked tasks progress from ASR and vocal-cue MCQs through integrated
reasoning MCQs to open-ended empathetic response generation. Conversation
outputs are scored with reference text metrics, four GPT-4o ratings, speech
quality metrics, emotion alignment, and Gemini-based Vocal Empathy Score, with
sampled human validation. This directly evaluates whether speech-LLM
post-training turns paralinguistic perception into contextually appropriate
dialogue behavior, as later used by ParaBridge and SASLM. The owner Hugging
Face repository is ungated and exposes 8,238 files using about 7.4 GB,
including input and reference-response audio, MCQs, and script metadata; the
GitHub repository provides inference and evaluation code but no root license.
The dataset card declares CC BY-NC-SA 4.0. That label should not be assumed to
override AudioCaps background-audio rights, TTS-service terms, cloned-source
voice rights, or participant consent constraints. The helper downloads only
official documentation and API metadata by default and requires explicit
opt-in for the full snapshot.

The April 2026 SASLM paper is recorded as an existing-family and unreleased-
evaluation-artifact audit of self-reward post-training for expressive speech
language models. Sections 4.1-4.3 and Appendices C.3 and D evaluate EchoMind in
two roles: its standard four-dimension empathetic-response protocol checks
semantic retention, while a paper-specific generation protocol scores WER,
pitch variance, emotion2vec alignment, Audiobox-Aesthetics, and four
Gemini-2.5-Flash ratings. MMAU-v05.15.25 sound, music, and speech accuracy is a
second retention check. Both source families are already indexed. The paper
does not state the exact EchoMind generation-panel size, and releases no frozen
row manifest, complete baseline/model audio, predictions, metric inputs,
per-item scores, or Gemini judge records. Its human appendix likewise reports
aggregate Win/Tie/Loss plots from three annotators without the sample count,
item selection, individual ratings, or agreement statistics. The owner project
page provides selected demos. A public, ungated SASLM-3B checkpoint is about
11.55 GB and declares Apache-2.0, while public expressive-SFT archives have no
dataset cards or license metadata and the two self-reward dataset repositories
contain only `.gitattributes` configuration files, not preference rows or LFS
pointers. The GitHub repository remains a one-file TODO and
has no LICENSE despite displaying an MIT badge. These model and training-data
releases do not make the absent evaluation records public and are not new
benchmarks. No counted family or helper is added.
A focused August 9 recheck found the GitHub tree unchanged at
`2988c23bbde51ef77d81821a6e6de6c004af7ae4`, with only its 1,495-byte README.
The official Hugging Face collection remains at its June 2 update, and both
self-reward repositories still expose exactly one 2,504-byte `.gitattributes`
file. This corrects the earlier description of those files as LFS attributes:
they configure filename patterns but are not LFS pointers and do not establish
that any preference archive was uploaded. Evaluation code, frozen rows,
generated outputs, judge records, and human-rating records therefore remain
unreleased.

The June 2026 *ParaBridge* paper is recorded as an existing-coverage and
unreleased-artifact audit of paralinguistic speech-LLM post-training. Sections
4.1-4.5 and Appendices A-C, E, and K-L evaluate whether on-policy
self-distillation makes scaffold-free models act on safety- and empathy-relevant
acoustic cues. VoxSafeBench Tier-2 measures cue-grounded warnings and refusals
across child voice, emotion, impaired capacity, background child presence,
symbolic sounds, and unsafe ambient conditions; EchoMind scores context fit,
naturalness, colloquialism, and speech grounding. Capability-retention rows map
to the existing MMAU-Pro, VoiceBench, and MMSU families, while GPQA is a
text-only control. VoxSafeBench is now independently indexed from its primary
paper, owner code repository, and auto-gated Hugging Face release; EchoMind is
now independently indexed from its primary paper, owner repository, and
ungated Hugging Face release. The three
1,000-query ParaBridge training pools are post-training data rather than new
benchmarks. Version 1 gives no project or repository URL and says LoRA adapters
and evaluation code will be released. Exact-name GitHub and Hugging Face
searches found no owner-verifiable release; an unlinked Hugging Face account
publishes a full checkpoint with an empty Apache-2.0 card but no paper citation
or ownership evidence. Appendix K's upstream license summary does not license
the absent ParaBridge pools, manifests, outputs, judge records, or code. No
counted ParaBridge family or helper is added.

VoxSafeBench is now indexed as a public, auto-gated speech-LLM social-alignment
benchmark after reviewing the primary paper's Sections 2-5 and Appendices A,
D, and F-H. Its 22 bilingual task families separate content-centric Tier 1
from audio-conditioned Tier 2 across safety, fairness, and privacy, including
spoken jailbreaks, agentic risks, cue-grounded warnings/refusals, overlapping
instruction injection, minimal-pair acoustic bias, and privacy-aware response
behavior. The owner repository releases inference runners, judge prompts, and
evaluation code under Apache-2.0. The linked Hugging Face dataset is auto-gated
and exposes 17 packaged JSONL/audio splits; its API reports about 23.6 GiB of
storage across 39,804 files. Inferential privacy instead delegates to the
separate HearSay benchmark and is not a packaged VoxSafeBench split. The helper
therefore downloads only public documentation, code/license, project, and Hub
metadata by default and requires accepted terms, authentication,
acknowledgement, and explicit opt-in for the full snapshot. The dataset card
declares Apache-2.0, but the paper describes adapted and off-the-shelf sources,
so the aggregate label should not be treated as overriding upstream rights.
The paper's responsible-use guidance identifies the intended use as alignment
auditing, red-teaming, and mitigation and warns against re-identification or
voice profiling. EchoMind is now independently indexed; SASLM's use of it for
expressive self-reward post-training is audited above.

RedVox is now indexed as a manually gated multilingual speech-LLM safety and
fairness benchmark after a focused release-status recheck. Sections 3-4 and
Appendix B define open-ended safety, stereotype-fairness, and response-
relatedness evaluation across English, French, Italian, Spanish, and German,
with spoken harmful requests, matched text-only inputs, and non-speech audio
controls using silence, ambient noise, and babble. The planned public subset
contains 3,414 entries from 26 consenting voices; the full 6,118-entry,
52-participant collection remains private. The owner Hub changed from an empty
placeholder to a manually gated release on August 5: its public API exposes
five language configurations, 856 WAVs, five metadata JSONL files, and about
414.5 MB of storage. The safe helper fetches only the paper, live API metadata,
and public file listings unless the user has owner approval, authenticates,
acknowledges the terms, and explicitly opts into the snapshot. The card labels
the license only as `other`, while README and dataset-info content return HTTP
401 before approval, so exact custom terms must be reviewed during access; the
paper's CC BY 4.0 does not license recordings or override MUSAN terms. The
paper-linked code repository still returns HTTP 404, so no public evaluator or
Apache-2.0 code release is claimed.
A focused August 9 release recheck found the paper-linked GitHub API endpoint
still returning HTTP 404. The manually gated Hugging Face repository remains
at revision `74e32447ca6bee2d88ab7f3be3532eb5273648be`, last modified August 5,
with its license tagged only as `other`. Thus the benchmark inputs remain
manual-access assets, while the promised Apache-2.0 evaluator, prompts, model
outputs, judgments, and per-item scores are still not publicly verifiable.

The June 2026 *HybridCodec* paper is recorded as an existing-family and
announced-release audit of a codec used directly as a speech-language-model
interface. Sections 3.2-5 train HybridCodec and its unified autoregressive and
non-autoregressive HybridLM on LibriTTS, then evaluate test-clean resynthesis,
full-set greedy ASR, and zero-shot TTS on one uniformly sampled 1,000-utterance
subset. The protocol compares discrete and hybrid representations from 50 down
to 6.25 Hz with UTMOS, decoder WER, character error rate, and WavLM speaker
similarity. This directly tests whether a low-rate discrete stream plus a
one-pass continuous residual preserves semantic and acoustic information at an
LLM interface. LibriTTS is already indexed and public under CC BY 4.0, but it
does not identify the paper's 1,000 TTS items or provide its generated audio,
predictions, or per-item scores. Version 1 says code and models will be released
within SpeechBrain yet links only its general homepage; the current SpeechBrain
develop tree has no HybridCodec-named path, and exact arXiv-ID GitHub plus
HybridCodec Hugging Face searches found no release on August 7. The paper's
arXiv license and LibriTTS terms do not license the absent recipes, weights, or
outputs. No duplicate family or helper is added; the existing LibriTTS helper
remains the public source-data path.
A focused August 9 recheck found that arXiv still exposes only version 1 and
that SpeechBrain's develop branch remains at its June 15 head
`e5cb1f65b940634215650aa1171e0440d0808123`; its complete tree still contains
no HybridCodec- or HybridLM-named path. Exact arXiv-ID and broader HybridCodec
speech GitHub repository searches, together with Hugging Face model and dataset
searches, still return no matching release. The promised recipe, weights,
sampled manifest, and evaluation outputs therefore remain unavailable.

The structured source of truth remains [`data/audio_benchmarks.yaml`](../data/audio_benchmarks.yaml).
For the current browsable catalog, use the [public index](https://kennethli319.github.io/audio-benchmark-index/).

The May 2026 *The WER Trap* paper is recorded as an existing-family and
unreleased-artifact audit of speech tokenizers as LLM interfaces. Sections
5-6 and Appendices B-C define a dual-probing protocol: WenetSpeech Test_Net
and Test_Meeting CER plus frozen-Llama-3.1-8B multiple-choice audio reasoning
measure semantic preservation, while an oracle-duration flow-matching decoder
measures acoustic preservation for the identical ultra-low-rate tokens. The
paper reports reconstruction statistics over 495 Mandarin utterances and uses
the label AVQA while citing MMAU, but releases neither exact item manifest nor
enough provenance to establish a separate frozen AVQA family. It also provides
no owner repository, tokenizer or probe code, checkpoints, reconstructed
audio, predictions, or item-level scores. WenetSpeech and MMAU remain mapped
to their existing entries; the paper-specific protocol is not counted as a
public benchmark and receives no helper. The arXiv license covers the article,
not upstream data or the absent derived artifacts, whose license is unstated.

The July 2026 *Prosody-driven Jailbreaks in Audio LLMs* paper is recorded as
an internal, unreleased safety-benchmark audit. Sections 3.1-3.5 and 4.1-4.10
define PJ-Break and AdvAudio-Prosody: 100 English harmful seed instructions
rendered under six matched-text delivery presets, with a 95-seed post-QC panel
scored by audio-level and fixed best-of-six seed-level jailbreak success. Five
presets retain one Azure voice, while Commanding changes voice and is reported
as confounded; the protocol also includes a three-judge ensemble calibrated on
200 human-labeled responses, RealSpeech-20 and over-the-air pilots, and a
500-utterance benign emotional control. This directly audits audio-LLM
post-training safety because it tests whether prosody changes refusal behavior
without lexical rewriting. Section 7 explicitly says the dataset and code are
withheld to avoid lowering the barrier to harmful audio jailbreaks. Prompts,
audio, QC manifests, model responses, judgments, human recordings, code, and
trial logs are therefore not public, and no helper or public benchmark family
is added. CC BY 4.0 covers the article, not those absent artifacts; AdvBench
and HarmBench source terms and unspecified speech/output rights remain
applicable.

The August 2026 *Vorch-Omni* report is recorded as an unreleased human-
evaluation protocol audit for instruction-conditioned audio-video generation
and manipulation. Sections 5.2-5.3 and Appendix A.5 compare anonymized
Vorch-Omni and Wan 2.7 outputs across text-to-audio-video and reference-
conditioned tracks using expert Good/Same/Bad judgments for prompt adherence,
reference fidelity, motion and visual quality, audio quality, and audio-visual
synchronization. This directly audits multimodal post-training: the model is a
multi-task-fine-tuned LTX-2.3 audio-video backbone, and the protocol tests
instruction following, voice/reference control, editing, and synchronization.
The paper inconsistently reports 537 paired groups during benchmark
construction but 527 groups in the judgment paragraph and conclusion; no
manifest is available to resolve the difference. The official, unlicensed
project repository exposes selected qualitative reference media and outputs,
but not the benchmark prompts and conditions, complete paired outputs, 11,361
dimension-level judgments, evaluator code, randomization seeds, model code,
checkpoint, or training-corpus manifest. CC BY 4.0 covers the article, not
those separate or absent artifacts. No public family or helper is added.

The August 2026 GROW paper is recorded as an existing-family and unreleased-
output audit of on-policy reward optimization for speech generation. Sections
3-4 and Tables 1-5 evaluate a Qwen3-backed autoregressive-diffusion TTS model
on the 1,127-item LibriSpeech-PC test-clean protocol and Seed-TTS EN/ZH with
WER, WavLM speaker similarity, and UTMOS. The comparison covers pretrained
DiTAR, a paper-implemented DiTAR-GRPO baseline, rollout budgets, reward-
weighting rules, classifier-free guidance, reference anchoring, and single-
versus multi-objective rewards. This directly audits speech-LLM post-training:
the ASR and speaker models act both as rollout rewards and final WER/SIM
evaluators, while UTMOS is held out as a non-human quality check. The public
source families remain indexed, but GROW again reports 1,088 English and 2,020
Chinese Seed-TTS cases where the official release states 1,000 and 2,000, and
publishes no mapping for the extra rows. Its linked GitHub repository existed
as an empty, unlicensed placeholder on August 7 despite the paper promising
complete code, a DiTAR reproduction, and all checkpoints. Exact LibriSpeech-PC
rows, generated audio, predictions, and item-level scores are also absent, so
no new benchmark family or helper is added. The arXiv license covers only the
article; LibriSpeech remains CC BY 4.0, and Seed-TTS Eval's unspecified license
and Common Voice/DiDiSpeech-2 component terms remain controlling.

HyPoradise is now indexed as a public generative speech-recognition correction
benchmark family after reviewing the NeurIPS 2023 paper's Sections 3-5, the
ICLR 2024 Robust HyPoradise extension, and the 2026 *Voice Memory* evaluation.
V0 publishes five-best hypotheses and references for 316,881 training and
17,383 test utterances across ten conditions from nine source families and
defines zero-shot, few-shot, full-fine-tuning, and LoRA tracks scored by WER
against 1-best and oracle reranking. Robust HyPoradise adds about 113,000 pairs
over five noisy-speech families. Voice Memory directly connects these releases
to current LLM post-training and agentic evaluation by adding act-or-abstain,
Recoverable Information Ratio, and Harmful Edit Rate protocols. The benchmark
data are public and ungated, but contain derived text and some serialized
features rather than redistributed source audio; audio remains subject to each
upstream corpus's access and license. V0 and the GigaSpeech subset declare MIT,
Robust HyPoradise and RobustGER declare Apache 2.0, and the separate auto-gated
Voice Memory artifacts declare CC BY-NC-SA 4.0. The lightweight helper keeps
the approximately 384 MB v0, 40.8 MB GigaSpeech subset, and 115 MB Robust
snapshots behind independent opt-ins.

The August 2026 *How to Recognize New Words* paper is recorded as an
existing-family and unreleased-derived-protocol audit of speech-LLM context
robustness. Sections 3-5 select rare-word utterances from Earnings-21,
LibriSpeech test-clean/test-other, and English YODAS, then test Qwen3-ASR,
Qwen3-Omni, and VibeVoice-ASR with relevant context present or absent and 0,
10, 100, or 250 distractor terms. It reports biased, unbiased, and overall WER,
plus a Qwen3-Omni filtering experiment and prompt-order sensitivity. This is
directly relevant to post-training because Qwen3-ASR learns context use during
SFT and the evaluation exposes distractor-induced degradation of 39%-570% in
speech-LLM biased WER. Earnings-21 and LibriSpeech map to existing public
families; YODAS is only an upstream public corpus. The exact utterance/video
manifests, rare-word and sampled-distractor lists, seeds, prompts, order trials,
code, checkpoints, predictions, and scores are not released. Exact-title
GitHub and Hugging Face searches found no paper artifact release. The paper's
arXiv license does not license those absent derivatives; Earnings-21 expressly
licenses only transcripts and associated text under CC BY-SA 4.0, LibriSpeech
is CC BY 4.0, and YODAS source-video/platform terms still apply. No duplicate
family or helper is added.

The August 2026 *PromptShield Home* paper is recorded as an
announced-but-unavailable ambient multimodal prompt-injection and smart-home
agent safety benchmark audit. Sections 2-6 define 19 scripted scenarios: 17
audio-video action cases and two still-image occupancy queries. The action set
contains 14 no-action and three action-required cases spanning addressee
ambiguity, screen/audio injection, health false triggers, mixed occupancy, and
legitimate commands. Models choose execute, block, or ask the user, and the
protocol separates unsafe-execution rate from safe-completion rate so an
always-block policy's 82.4% aggregate accuracy is not mistaken for useful
safety. It compares an idealized detector proxy with Qwen3-VL-30B vision and
vision-plus-ASR inputs, Qwen2.5-Omni-7B native audio-video input, and voting,
role-specialist, and cross-model arbitration variants. This is directly
relevant to post-training alignment, source attribution, refusal calibration,
and audio-enabled agent safety. The paper reports that the scenario manifest
and model outputs are released, but gives no artifact URL; the arXiv source
bundle contains only manuscript assets, and exact-name GitHub and Hugging Face
searches found no release on the verification date. Raw media is expressly
withheld because it exposes laboratory interiors and team voices and is only
described as potentially available on reasonable request. CC BY 4.0 covers the
paper, not the absent manifest, outputs, prompts, code, or request-only media.
The benchmark is therefore not counted as a public family and has no helper.
A focused August 9 release recheck found only arXiv version 1 and no matching
GitHub repository or Hugging Face dataset/model under the benchmark name,
exact paper title, or arXiv identifier. The ACM DOI printed in the paper also
returned HTTP 404, so it does not yet expose a publisher supplement or artifact
pointer. The public-family count and helper inventory remain unchanged.

SongBench is now indexed as a partially released full-song evaluator family
after a primary-source audit of paper sections 2-4 and Tencent's official
repository. The paper defines seven expert-rated dimensions--vocal,
instrumental, melody, structure, arrangement, mixing, and musicality--over a
core 11,717-song, 683.5-hour corpus, with a 95:5 train/ID split and a separate
352-song OOD test set. At least three music-specialized annotators rate each
song on a 1-10 scale, and predictor agreement is reported with MAE, Pearson,
Spearman, and Kendall correlations at utterance and system levels. This is
directly relevant to reward and post-training evaluation for long-form song
generation. The public release contains the MuQ-based evaluator code, its
approximately 96.1 MiB checkpoint, and 100 bilingual lyric/style prompts, but
not the expert-rated corpus, audio, annotations, or split manifests. The 100
released prompts also must not be conflated with the paper's 44-pair/352-song
OOD set. Qwen-Audio-3.0-Gen-Preview Table 7 reuses SongBench on an unspecified
small evaluation set; those inputs, outputs, and item manifest are absent. The
repository's custom terms resemble MIT but restrict use to academic purposes
and prohibit all commercial or production use, while absent commercial-model
outputs and 1,000 copyrighted reference songs retain their own rights. The
helper is lightweight by default and makes only the public checkpoint opt-in.

The August 2026 *FormBharo* paper is recorded as an announced-but-unreleased
spoken-agent benchmark audit. Sections 3-5 and appendices A-C define
FormVoiceAgentBench: 380 human-recorded Hindi utterances, 3,760 deduplicated
unit tests, and 960 simulated multi-turn calls through a branching 12-field
maternal-health enrollment form. Its unit tracks evaluate transcription,
structured extraction, reply generation, and end-call tool decisions, while
integration tests measure complete-form accuracy after speech and extraction
errors propagate through rule-based validation and dialogue control. This is
directly relevant to post-training evaluation of spoken interaction, tool use,
robustness, and end-to-end task completion. The paper says code and data will
be released at an owner GitHub path, but that path and its parent repository
returned 404 on the verification date. A focused August 9 recheck found a new
ungated `SAHAI-artpark/FormVoiceAgentBench` Hugging Face repository created on
August 7. Its organization name matches the paper's SAHAI/ARTPARK affiliation,
but neither the paper nor the repository links the two, the organization is
unverified, and the repository has no card. Its complete tree at revision
`a813930bb443ead374d505bd257704a8f012f956` contains only `.gitattributes`,
with no benchmark files or license; exact-name GitHub search still finds no
release. The audio, transcripts, profiles,
manifests, scorer, outputs, and per-item records therefore remain unavailable.
The paper has arXiv's perpetual non-exclusive license, which does not license
those absent artifacts; paid recording and the exclusion of real caller data
do not establish benchmark reuse terms. No public family or helper is added.

The August 2026 *Spoken Function Calling* paper's claimed SFC-Bench release was
rechecked on August 9. Sections 4-5 define 7,078 synthetic spoken function-
calling examples across four levels: single- or multi-intent requests in
single- or multi-turn form. The fixed split contains 4,499 training, 1,986 in-
distribution test, and 593 out-of-distribution test examples over 300 functions;
Table 1 further gives the complete per-level split counts. Function-name
accuracy, parameter-value F1, and exact overall accuracy measure performance.
Missing multi-turn parameters are labeled `NAN`, making the protocol directly
relevant to audio-LLM tool use, hallucination, structured instruction following,
and GRPO post-training. The paper says code and data are available in the
official QwenAudio FunResearch repository, but the claimed `SpokenFC` path still
returns HTTP 404, its path-specific commit history is empty, and the complete
non-truncated main-branch tree remains at commit
`a3708fd41d5dd2a2665c5f281cbfc9242b7642e1` with no matching artifacts. Exact-
name Hugging Face dataset and model searches also return no results; a similarly
named 2014 GitHub project concerns space-filling curves and is unrelated. The
benchmark audio, function definitions, queries, labels, manifests, evaluation
code, predictions, and scores therefore remain unavailable. Apache 2.0 covers
the parent repository code, not absent SFC-Bench data or IndexTTS-2-generated
audio, and the paper's arXiv license grants no data reuse rights. No public
family or download helper is added.
A focused August 10 recheck again found HTTP 404 at the claimed path, an empty
path-specific commit history, and the same complete owner-repository tree at
`a3708fd41d5dd2a2665c5f281cbfc9242b7642e1`; the repository's latest push
remains August 3. ArXiv still exposes only version 1, and exact-name Hugging
Face dataset and model searches remain empty.

MuChin is now indexed as a released music-language benchmark family after a
primary-source audit of the IJCAI 2024 paper, official repositories, and Hugging
Face releases. The public, ungated V1 pairs 1,000 songs with amateur and
professional Chinese descriptions, section and rhyme structure, lyrics, and
metadata. Sections 3-4 define two distinct protocols: shallow predictors over
five pretrained music encoders score ten professional and ten amateur
description dimensions with BGE semantic similarity, while structured-lyric
generation uses six weighted Gestalt-based structure and rhyme measures for
four LLM families. The later 6,066-song V2 is an expanded instruction-tuning
and alignment resource, not a replacement for the fixed V1 benchmark; it is
auto-gated, overlaps V1 on 724 songs, and warns about duplicate annotations.
Qwen-Audio-3.0-Gen-Preview section 6.1 reuses MuChin for VAE reconstruction,
directly connecting the family to audio-tokenizer pretraining evaluation, but
does not identify which release or rows were used. The index therefore maps
that citation to the family without inventing a derived split. V1 annotations
and audio are public, V2 is gated, and no Qwen reconstruction outputs or
manifest are released. Although the V1 repository and Hub card say MIT, the
owner separately restricts song audio to legally obtained academic use and
prohibits commercial model training without copyright-holder authorization;
underlying commercial-song, recording, lyric, and metadata rights remain.
The helper is metadata-only by default, with separate opt-ins for the 20.9 MB
V1 annotations, 3.59 GB V1 audio, and gated 31.3 GB V2 snapshot.

The July 2026 *Qwen-Audio-3.0-Gen-Preview* report is inventoried across
sections 6-6.1 and Tables 2-11 as a mixed public-family and unreleased-protocol
audit. Public evaluations map to the existing Seed-TTS Eval, AudioCaps, Song
Describer, MuChin, and LibriSpeech families; the cited SongBench source is
retained as a focused provenance follow-up rather than an inferred addition. The report also
defines an in-house reference-conditioned multi-speaker benchmark with a few
hundred English and Chinese cases and an in-house rich-timeline benchmark with
on the order of one hundred temporally specified scenes. Neither is released.
The AudioCaps fixed random judge subset, SongBench small-set selection, and
LibriSpeech-PC-200 manifest are likewise absent, as are generated comparison
audio, judge prompts and item-level records, evaluation code, and model
weights. This inventory is directly relevant to audio-foundation-model
pretraining and post-training: it separates VAE reconstruction and controlled
representation probes from evaluations of speaker consistency, caption
fulfillment, long-range generation, and temporal instruction following.
Version 2 provides no project or artifact link, and the established Qwen-Audio
repository plus exact-name GitHub and Hugging Face searches expose no matching
3.0 Gen Preview release. The paper is CC BY 4.0, but that does not license the
absent benchmarks, manifests, outputs, code, model, or upstream media. No
public family or download helper is added. A focused August 9 recheck confirms
that arXiv remains at version 2, last revised July 30. The established
Qwen-Audio repository's complete non-truncated main tree remains at
`b50fb958438081d36e1a14e93dbbc2f329c7f10e` and reports no push since July 5,
2024; it has no 3.0 Gen Preview materials. Exact-name GitHub and Hugging Face
model and dataset searches still return no matching owner release.

The August 2026 *C3PO* paper is recorded as an unreleased omnimodal
audio-reasoning and post-training audit. Sections 3-4 and appendices A-F define
25 templates for Information Composition and Counterfactual Conflict over
audio, video, image, and text, graded by normalized exact match followed by a
Qwen3-Omni semantic-equivalence judge. Base audio comes from HowTo100M, while
Qwen3-TTS and AudioLDM2 synthesize complementary speech and non-speech audio.
The protocol directly probes whether audio-capable models fuse acoustic
evidence or follow conflicting text and visual priors, and it adds mechanistic
attention, latent-recovery, and caption-fidelity diagnostics. The abstract and
internally additive Appendix Table 13 report 3,404 samples, but main Table 1
reports 3,342 and its four printed row totals do not equal their category
columns. The missing manifest leaves those count inconsistencies unresolved.
Version 1 gives no project, repository, dataset card, artifact URL, or release
commitment, and exact-title GitHub and Hugging Face searches found no matching
release. The
benchmark media, questions, answers, code, outputs, probe records, and
single-rating 250-item human subset therefore remain unreleased. The arXiv
license covers only the paper; upstream dataset and generation-model terms
require separate review. No public family or download helper is added.

The August 2026 *Vorch-Streamer* paper is recorded as a partially released
long-form speech-generation and post-training protocol. Sections 3-4 adapt a
bidirectional joint audio-video foundation model with causal training,
long-horizon Self Forcing, and a 25 Hz LLM speech planner, then evaluate
approximately two-minute native text-to-audio-video rollouts for transcript
WER, audio-lip synchronization, throughput, visual quality, and temporal
identity drift. Conditional avatar baselines receive complete Qwen3-TTS audio
and an initial frame, so their WER is explicitly not a measure of their own
speech generation. The official project repository releases a 100-row prompt
manifest, a viewer for every prompt, 26 selected Vorch-Streamer videos, and
nine selected outputs for each of six baselines. It does not release the full
scored output matrix, per-item scores, evaluation code and preprocessing,
model code or weights, the 80,000-clip synthetic training corpus, or its source
manifest. This directly audits post-training for causal speech progression and
long-horizon controllability, but the partial materials cannot reproduce the
reported tables and curves. The paper is CC BY 4.0; the separate project
repository has no detected license, so that paper license must not be inferred
for its prompts, media, code, or absent artifacts. No benchmark family or
download helper is added.

The August 2026 AffectDF paper adds a public emotional-speech deepfake family
that directly tests audio-language-model safety and post-training robustness.
Its 285,797 samples cover five emotions and 21 TTS, VC, EVC, and LALM attack
conditions, with speaker-disjoint train, development, and test partitions and
acted-versus-spontaneous test conditions. The ungated Hugging Face release
provides approximately 40.2 GB of audio plus protocol rows identifying speaker,
attack, emotion, generation method/model, and real/spoof status. The paper also
benchmarks prompted Qwen2.5-Omni, Qwen3-Omni, and Voxtral, plus LoRA-tuned
Voxtral; the owner GitHub repository publishes evaluation outputs and
checkpoints. AffectDF declares CC BY-NC 4.0 for research and non-commercial use
subject to the ESD, MSP-Podcast, and generation-model terms, while the separate
evaluation-output repository states no license. The helper therefore fetches
only documentation and metadata by default, with independent opt-ins for the
small protocol archive and explicitly selected large audio partitions.

The August 2026 *Beyond Prompt Adherence* paper is recorded as a released-
protocol audit of attribute preservation in instruction-controlled speech
generation. Sections 3, 5-6, and supplementary sections 9-13 pair neutral and
descriptor-conditioned outputs from CosyVoice3, VoxCPM2, and Fish-Speech-S2
over six LibriTTS-R reference speakers, ten texts, three seeds, and eleven
conditions, yielding 5,940 generated outputs. The protocol measures target
response and off-target acoustic movement while gating on ASR content and
speaker similarity, then compares VoDER-Cal with single-sample, target-only,
and oracle policies under a matched three-candidate budget. Two blinded
45-sample studies provide a limited perceptual check. This directly evaluates
post-training controllability and inference-time selection rather than merely
prompt adherence. The official MIT repository releases the six-item reference
manifest, frozen texts, descriptors, controls, prompt templates, model IDs,
generation and scoring scripts, and calibration-aware analysis code. The
LibriTTS-R audio remains an upstream download, however, and the 5,940 outputs,
candidate audio, derived features, ASR and embedding records, frozen split
assignments, per-item scores, listening stimuli, assignments, and raw ratings
are not released. MIT covers the VoDER code and configurations; the paper's
CC BY 4.0 license does not relicense LibriTTS-R, third-party models, or absent
evaluation records. LibriTTS is already indexed, so no duplicate family or
download helper is added.

The August 2026 AEGBench recheck records a metadata-only change, not a public
benchmark release. The official Hugging Face repository added a 660-byte
dataset card describing open-vocabulary temporal grounding for large
audio-language models, but its complete visible tree still contains only that
README and `.gitattributes`, and the Hub API reports zero bytes of dataset
storage. The paper's 3,427 human-verified audio items, 9,790 queries, interval
answers, six difficulty tags, and evaluation scripts therefore remain absent.
Appendix K promises CC BY 4.0 data and MIT code upon acceptance, but those
future terms do not license unavailable artifacts or override the terms of
AudioSet, FSD50K, BBC Sound Effects, and YouTube sources. AEGBench remains an
audited announced protocol with no download helper.

The August 2026 Macer paper is recorded as an existing-family protocol audit of
decoder-side audio/video token compression in pretrained OmniLLMs. Sections
5.1-5.2 and Appendix A run the full AVUTBench, Daily-Omni, WorldSense, and
no-subtitle Video-MME evaluations through LMMs-Eval with fixed greedy decoding
at 25%, 35%, and 45% multimodal-token retention. This is relevant to pretrained
audio-language-model interfaces because it tests whether audio-grounded and
cross-modal reasoning survives aggressive token pruning. All four benchmark
families and their access helpers are already indexed. The paper promises Macer
code and calibrated configurations upon publication, but version 1 supplies no
artifact URL, exact LMMs-Eval task revisions, calibration-split rows, published
random-baseline seed, predictions, runtime logs, or per-item scores. The arXiv
license covers only the article; AVUT has no stated data license, Daily-Omni is
CC BY-NC-SA 4.0, WorldSense has conflicting CC BY and CC BY-NC-SA statements,
and Video-MME retains custom academic-use and redistribution restrictions. No
duplicate family or new download helper is added.

The August 2026 *OmniPack* paper is recorded as an existing-family protocol
and release audit of training-free token compression for pretrained
OmniLLMs. Sections 4.1-4.4 and Appendix A evaluate Qwen2.5-Omni-7B/3B and
MiniCPM-o-2.6 on AVUT, WorldSense, Daily-Omni, Video-MME, and LVOmniBench
through LMMs-Eval, combining pre-LLM importance, coverage, and merging with
later query-conditioned audio-visual selection. The AVUT run is specifically
the public 691-video, 1,734-question human-annotated subset, not the full
family; the other evaluations map to existing entries. This directly audits
pretrained audio-language-model interfaces by measuring retained accuracy,
FLOPs, prefill latency, and peak memory under model-specific visual/audio
budgets down to 10% pre-LLM retention and a further 50% inner-LLM reduction.
The official repository contained only a two-line implementation announcement
on August 7, with no code, license, configurations, exact LMMs-Eval revision,
paper-specific AVUT manifest, predictions, token-selection records, or runtime
logs. Upstream terms remain controlling: AVUT is unspecified, Daily-Omni is CC
BY-NC-SA 4.0, WorldSense has conflicting license statements, Video-MME uses
custom academic restrictions, and LVOmniBench is gated with no benchmark-level
license stated. No duplicate benchmark family or helper is added.

The August 2026 *KVAE* report is recorded as an audio-tokenizer interface and
partial-release audit. Sections 6.5-6.7 compare posterior-mean reconstruction
on the existing AudioSet eval, MUSDB18-HQ, and EARS families, then train the
same 0.6B text-to-audio DiT separately over four frozen tokenizers and evaluate
generation on AudioCaps, Song Describer, and LibriSpeech test-clean. This
controlled swap is directly relevant to audio foundation-model pretraining
because it tests whether the tokenizer latent, rather than reconstruction
quality alone, supports prompt-conditioned generation. The public MIT
repository and ungated Hugging Face checkpoint support inference, and the
repository includes a generic reconstruction metric script plus three
qualitative same-prompt examples for four systems. However, it releases no
fixed dataset manifests, generation training or evaluation pipeline,
generator checkpoints, full benchmark outputs, or raw human-study records.
The public metric script also computes at 48 kHz, whereas the report states
that its reconstruction table was computed at 44.1 kHz. Human-study item and
annotator counts are not reported, and the internal ablation set is absent.
Repository and model-card MIT declarations do not relicense the six upstream
families, undisclosed proprietary training audio, generated outputs, or
listener records. No duplicate benchmark family or download helper is added.

The August 2026 *LILAC* paper is recorded as a speech-codec token-interface
and release-status audit, updated after its public artifacts appeared on
August 7. Sections 5-6 and supplementary sections 2-6 score
one-pass reconstruction on the existing LibriSpeech test-clean, LibriTTS-R,
and VCTK families, plus an unreleased 585-item HiFiTTS-2 holdout. Its central
evaluation checks exact token recovery across all 7,457 LibriSpeech and
LibriTTS-R utterances, runs 100 decode-re-encode cycles on a random balanced
100-clip LibriSpeech selection, and measures speaker EER and Whisper delta WER
through 100 cycles on 600 utterances. A separate uncontrolled MUSHRA-style
study has 40 retained listeners rate nine items from the three public
families. These protocols directly test whether a speech tokenizer remains a
stable interface for speech-LLM and generation pipelines. The official
Apache-2.0 GitHub repository now publishes a small PyTorch reproduction with
inference, training, and structural self-check code; its README corrects the
paper's stale `julianyi/lilac` URL to an ungated `julianyi1/lilac` repository
containing an approximately 224.6 MiB checkpoint. The public demo exposes
eight selected LibriSpeech items for five codecs at cycles 1, 10, and 100.
The fixed random 100-clip and 600-utterance selections, nine listening items,
HiFiTTS-2 holdout, benchmark metric and listening-test code, full outputs,
tokens, predictions, per-item scores, and raw listener records remain
unreleased. Apache 2.0 covers released code and checkpoint files, not upstream
audio or separate generated-output rights; upstream corpus terms still apply.
No new benchmark family or download helper is added.

The August 2026 *AudioScape-TTA* paper is recorded as an unreleased
text-to-audio instruction-following and evaluator audit. Sections 3-4 and
supplementary sections A-E define 2,258 roughly 9.95-second
movie/television-derived scenes, structured prompts, and 25,707 fixed binary
rubrics for event presence, acoustic attributes, and speech content.
Qwen3-Omni-Instruct judges event and attribute requirements, Qwen3-ASR checks
target utterances, and results are grouped by modality, composition, and
Easy/Medium/Hard complexity. A 26-participant study rates 130 generated
outputs and validates the automatic metrics at model level. This directly
evaluates fine-grained controllability, speech preservation, and
audio-language-model judging for generative post-training. However, version 1
links no project, repository, dataset card, archive, or artifact. Exact-name
GitHub and Hugging Face searches found no release, despite the paper calling
the benchmark final or released. The copyrighted production clips, prompts,
rubrics, splits, provenance, evaluator code, outputs, ratings, predictions,
and per-item scores remain unavailable. The paper is CC BY-NC-ND 4.0, which
does not license any absent benchmark artifact or underlying production
audio. No public family or download helper is added.
A focused August 9 recheck found arXiv version 1 unchanged and zero matching
GitHub repositories or Hugging Face datasets under either the exact benchmark
name or paper identifier. The claimed release therefore remains unlocatable.

The August 2026 *AudioRubrics* paper is recorded as a post-training,
reward-modeling, and existing-coverage audit. Sections 3-4 and appendices A,
C, and D train Qwen2.5-Omni with GRPO using audio-grounded per-question
rubrics that evolve from current rollouts, answer correctness, and an
overthinking penalty. Evaluation uses the already indexed public MMAU
Test-mini, MMAR, and MMSU families: respectively 1,000, 1,000, and 5,000
questions covering speech, sound, music, mixed audio, and fine-grained spoken
cues. The official repository releases training and evaluation code, prompts,
sample evolution logs, and a checkpoint. Its separate public Hugging Face
dataset contains 40,380 AVQA training rows with five weighted rubric criteria
per question, but no audio; it is reward/training annotation data rather than
an evaluation set. The card declares those annotations CC BY 4.0, while AVQA
media and all three evaluation families retain upstream terms. The code
repository has no detected license, and exact benchmark revisions, frozen
manifests, predictions, and per-item scores are not released. No duplicate
benchmark family or download helper is added.
A focused August 9 release recheck records the official repository's complete
47-path tree at `1c3dbdec5568f7366e76a992349b65e556903a18`. Its August 8 update
is an empty commit titled `Update README.md` and adds no license, frozen
evaluation manifest, predictions, or score records. The Hub remains a
three-file release at revision
`3472622d1791d5d2ddc7ad0a03bcd55d55b0f83c`: `.gitattributes`, the dataset
card, and one 73,543,963-byte training JSONL. This confirms that public rubric
training annotations should not be mistaken for a newly released benchmark.

The July 2026 *Cocktail-Talker* paper is recorded as a spoken-LLM
post-training and release-status audit. Sections 3-5 use Cocktail-DialogGen to
evaluate selective participation in noisy three- and four-speaker dialogs:
models must respond, listen, or ignore, and are scored for binary
Respond/Silent decisions and response quality across 7,200 seen-environment
and 4,000 unseen-environment mixtures. This directly tests multi-party turn
control and robustness after SFT and action/format-reward GRPO. The owner
repository publicly provides generator and inference code, processor files,
180 Freesound-derived background previews, and ten worked dialog examples,
but not the fixed 1,440/800-dialog evaluation sets, condition manifests,
complete evaluator, predictions, or per-item scores. It has no LICENSE file;
the background manifest also omits the per-clip author and license metadata
needed to interpret mixed Freesound terms. The README claims a roughly 2.4 GB
LoRA adapter, but its stated repository path is currently absent. The fixed
benchmark therefore remains unreleased, so no public family or download helper
is added; the generator and examples are documented only as public protocol
components.
A focused August 9 recheck records the unchanged 276-path repository tree at
`9d5eb0feb6228d778e372744c091fed09dbe9047`. The July 31 head deletes a LoRA
test file immediately after a commit titled `Add Cocktail-Talker (no ckpt
yet)`, and the live tree still contains no `adapters/` path, LICENSE, fixed
evaluation manifest, evaluator, predictions, or score records. The public
background manifest does identify Freesound IDs, URLs, original names, and
durations for all 180 previews, but it still omits author and license fields.
Thus neither the claimed adapter nor reusable fixed evaluation package is now
public, and the family count and helper inventory remain unchanged.

The July 2026 *From Semantics to Readout* paper is recorded as post-training
and representation-evaluation provenance for the existing public
AudioGrounding family. Sections 3-4 and appendices A and C-G convert upstream
phrase-level intervals into 11,586 event-centered AudioGrounding-QA rows and
fine-tune Qwen2.5-Omni-7B and Qwen2-Audio-7B-Instruct with decoder-only LoRA.
The 992-item test protocol reports mIoU, time-level F1, and recall at three IoU
thresholds, then diagnoses query-conditioned audio-token semantics, calibrated
decoder readout, temporal-window probes, and residual-delta erasure. This is
directly relevant to how post-training exposes pretrained audio evidence to an
LLM decoder. The public CC BY 4.0 AudioGrounding release supplies source audio
and temporal annotations, subject to upstream YouTube-media caveats, but the
paper releases no derived QA rows, exact cleaning manifest, adapters,
diagnostic implementation, 100-item probe/erasure selection, predictions, or
per-item scores. The absent derived artifacts have no specified license, so no
duplicate family or helper is added.
A focused August 9 release recheck found only arXiv version 1, zero exact-title
or AudioGrounding-QA GitHub repository results, and no matching Hugging Face
dataset or model. The complete 98-path upstream TextToAudioGrounding tree at
`40c2280139a9bd077a6c823319d6244f5aa7512d` still contains only the original
grounding implementation—not the derived QA rows, LoRA adapters, probe code,
predictions, or score records. The public-family count and helper inventory
therefore remain unchanged.

The June 2026 AfriSpeech Semantics paper is recorded as an unreleased derived
benchmark over four mixed-access owner-hosted speech corpora. Sections 3-6 and
appendices A-F define five zero-shot audio-semantic tasks: entailment,
consistency, plausibility, accent-conditioned semantic drift, and accent
restraint. The evaluation is directly relevant to spoken-LLM grounding,
hallucination, robustness, and accent fairness. The owner-hosted
AfriSpeech-200 and AfriSpeech-Dialog source-corpus pages are ungated, while
Afri-Names and Med-Convo-Nig require manual approval. They provide access
routes for the original speech and transcripts, but not the paper's generated
and human-corrected hypotheses, semantic labels, fixed splits, validation
subset, thresholds, label mapper, executable scorers, predictions, or per-item
scores. Section 5.6 promises benchmark artifacts for a future release, and
version 1 links no project or code repository. All four current owner dataset
cards declare CC BY-NC-SA 4.0; those source terms and the paper's CC BY 4.0
license do not cover the absent derived benchmark. No public family or
download helper is added.

The August 2026 ParaIntent paper is recorded as an unreleased spoken-LLM
post-training benchmark. Sections 3, 5, and 6 define a single-turn Chinese
spoken emotional-dialogue task with 14 intents, balanced explicit and implicit
expressions, 14,000 synthesized test examples, and 4,200 controlled
human-recorded test examples. Its protocol separately measures intent
fulfillment, response quality, emotion accuracy, and reference/target emotion
similarity, then adds LLM pairwise judgments and a five-listener study. This
directly evaluates whether SFT, DPO, GRPO, and the paper's ALPO method preserve
both lexical intent and paralinguistic expression. However, version 1 links no
project, repository, dataset card, or archive and releases none of the 140,000
training examples, test rows or audio, split manifests, evaluator prompts or
code, model checkpoints, generated responses, or per-item scores. The paper's
arXiv distribution license does not license those absent artifacts, and its
statement that the five speakers were authorized does not specify reusable
consent or voice-data terms. No public family or download helper is added.
A focused August 9 recheck found that arXiv still exposes only version 1 and
that exact-name and paper-identifier searches on GitHub and Hugging Face return
no matching repository or dataset, so the release classification is unchanged.

The August 2026 tiered sound-source-identification paper is recorded as an
unreleased audio-language-model evaluation protocol. It evaluates eleven
methods on 2,242 clips and separates task-aware closed-set audio foundation
models, fixed-vocabulary taggers, CLAP similarity, and open-vocabulary BAT
into four tiers whose scores are not treated as one leaderboard. The article
prints exact prompts, its 23-class taxonomy, the post-hoc AudioSet mapping,
aggregate metrics, and confusion matrices. It also audits 8,968 Gemini
responses and finds that 92.1-100% of wrong fine-grained answers still use
high-confidence language, making the protocol relevant to audio-LLM
hallucination calibration. However, version 1 links no project, repository,
dataset card, or archive and releases no audio, labels, item provenance,
manifest, evaluator, responses, predictions, or per-item scores. The paper's
CC BY 4.0 license does not cover those absent artifacts, so no family or
download helper is added.

The August 2026 ECCD paper adds decoding-time hallucination and
content-faithfulness evaluation provenance for the existing public Seed-TTS
Eval and CV3-Eval families. Sections 4-6 evaluate four codec-token TTS models
with WER/CER, speaker similarity, and UTMOS across all three Seed-TTS Eval
tracks and 25 supported model-language combinations on CV3-Eval. A 25-listener
test covers 30 Seed-TTS Eval hard cases per method, and a derived analysis
uses approximate ASR timestamps to compare alignment support at first-error
boundaries. The paper provides no official project page or repository and
does not release its exact manifests, implementation, generated audio, ASR
alignments, listener records, predictions, or item-level scores. Seed-TTS
Eval's unspecified repository license and upstream Common Voice/DiDiSpeech-2
terms, plus CV3-Eval's mixed-media rights caveat, therefore remain
authoritative. No duplicate benchmark family or download helper is added.

The August 2026 perceptual-narrowing study is recorded as an unreleased
paper-specific pretraining evaluation protocol over public source corpora.
Sections 3-6 hold a 7.1M-parameter four-layer speech encoder and its data
pipeline fixed while comparing masked-mel reconstruction with frame-contrastive
prediction. The primary and three-language crossover experiments use ten seeds
and 5,000 within-context cross-speaker phoneme-ABX triplets per English, French,
and Mandarin arm; supporting probes test layer choice, a raw-mel floor,
child-directed versus read speech, six objective configurations, and the
instability of three-seed significance. This directly audits speech foundation-
model pretraining because it isolates the learning objective's effect on
cross-lingual representation transfer. The article identifies Providence
CHILDES and ZeroSpeech 2017 as public inputs and says per-triplet scores were
retained, but version 1 links no project or repository and releases no exact
corpus selections, preprocessing, ABX manifests, fixed seed list, code,
checkpoints, representations, or score records. CC BY 4.0 covers the paper,
not those absent artifacts or the separately governed source assets. No new
public benchmark family, count increase, or download helper is added.

The June 2026 translation-enhanced speech-encoder study is recorded as
pretraining-transfer provenance over existing public evaluation families.
Sections 3-4 compare transcription-only, non-English-to-English translation,
and bidirectional-English encoder pretraining while holding the Whisper-medium
architecture and downstream adaptor recipe fixed. FLEURS and CoVoST 2 measure
ASR and translation across pretrained and unseen languages; SLURP and the
German Speech-MASSIVE subset measure intent classification; MELD checks whether
semantic abstraction harms acoustic emotion cues. Frozen Llama-3.2 1B/3B
backends isolate encoder quality, and an unfrozen-encoder translation study
tests whether the advantage survives joint adaptation. This directly evaluates
how a foundation-model pretraining objective transfers through a speech
interface into an LLM. Version 1 links no official project, repository, dataset
card, model release, or archive, and does not release its approximately
130,000-hour mixture manifest, synthetic translation pairs, 6,200-hour
speech-LLM training manifest, exact evaluation selections, code, checkpoints,
inference seeds, predictions, or item-level scores. The article's arXiv
distribution license does not cover upstream data or those absent derivatives;
each public family retains its own terms. All five tracks map to existing index
entries, including the independently audited Speech-MASSIVE family, and no
duplicate paper-specific family or helper is added.

The 2024 Speech-MASSIVE primary release now contributes a public multilingual
spoken-language-understanding evaluation family. Sections 2-4 and the appendix
define native-speaker recordings in 12 languages, retaining MASSIVE's 18
domains, 60 intents, and 55 slots. Every language has 2,033 validation and
2,974 test items plus a 115-item few-shot selection; French and German also
have 11,514-item full training splits. The paper compares cascaded mT5 systems
and end-to-end Whisper-large-v3 models under zero-shot and few-shot transfer,
reporting intent accuracy over three seeds with supplementary exact match,
slot micro-F1, slot-type F1, and slot-value CER. It also publishes ASR,
language-identification, and speech-translation baselines. This is directly
relevant to audio/speech LLM pretraining and post-training evaluation because
it tests whether pretrained speech encoders and language-model interfaces
transfer semantic intent and structured slots across languages and adaptation
budgets; a June 2026 study already uses its German test subset to isolate
speech-encoder pretraining objectives. The main Hugging Face repository is
ungated, while the separate test repository is auto-gated. Both are large, so
the helper fetches cards, live metadata, and the Apache-2.0 code license by
default and requires explicit opt-in for either snapshot or the code clone.
The dataset is explicitly CC BY-NC-SA 4.0; Apache-2.0 applies only to released
first-party code, and inherited MASSIVE annotations retain their upstream
terms.

The August 2026 LS-MOPD paper adds public WSYue-ASR-eval coverage and recent
post-training provenance for WenetSpeech, KeSpeech, and LibriSpeech. Section
4.1 evaluates an encoder-adaptor-LLM after language-specialized DAPO and
multi-teacher on-policy distillation on seven official test subsets, including
the Short and Long WSYue-ASR-eval tracks. The owner-hosted, ungated
[Cantonese benchmark](https://huggingface.co/datasets/ASLP-lab/WSYue-ASR-eval)
contains 11.4 hours of manually annotated speech and about 1.06 GiB of public
files under CC BY-NC 4.0. Its helper saves only the card and API metadata by
default and requires explicit opt-in for audio and annotations. The companion
21,800-hour WenetSpeech-Yue corpus is training data, not part of the benchmark
helper. The paper's in-house 560k-hour pretrained backbone, exact 50k-item
post-training manifest, training code, checkpoints, predictions, and scores
remain unreleased; Apache-2.0 on the official GitHub repository applies to
code and does not replace the benchmark's noncommercial data terms.

The August 2026 HyPASE paper is recorded as LALM post-training evaluation
provenance for the existing IEMOCAP, MELD, RAVDESS, and SAVEE families rather
than as a new benchmark. Section 4.1 compares Qwen2-Audio-7B-Instruct PEFT on
four-class IEMOCAP leave-one-session-out validation and the standard seven-class
MELD split; section 4.4 transfers the MELD-trained model to IEMOCAP, RAVDESS,
and SAVEE without target-domain adaptation. Although section 6 says code,
pretrained weights, and training logs are publicly available, the linked
[owner repository](https://github.com/LilSicko/HyPase) still contains only an
eight-byte, one-line README and no license, implementation, weights, logs,
manifests, prompts, predictions, or scores. A focused August 9 recheck found
the same complete, non-truncated one-file tree at
`419c7b0f8203c54fa36ecaf7c0ec8dab21dc5cfb`, and GitHub still reports no push
after August 1. Existing access terms therefore remain
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

The ICASSP 2026 LongSpeech paper now has a public but provenance-qualified
release candidate rather than a wholly unreleased record. The ungated
[Marco-LongSpeech snapshot](https://huggingface.co/datasets/ATH-MaaS/Marco_Longspeech)
cites the exact paper and exposes 101,822 WAV files plus train, validation, and
test JSONL manifests for all eight long-context speech tasks. Hugging Face
reports about 1.94 TB at revision `bb50d8c11fe9aa9fc5e899a0d941e3b40acbc740`.
It is not yet counted as a benchmark family: arXiv v1 names no artifact host,
and the card's linked [AIDC-AI repository](https://github.com/AIDC-AI/Marco-Longspeech)
returns 404. A same-name [ATH-MaaS repository](https://github.com/ATH-MaaS/Marco-Longspeech)
now establishes a same-organization release path, but its complete public tree
contains only an Apache-2.0 license and no README, code, manifests, or provenance
ledger. The card's 204,881 task rows also differ from Section 2.3's 202,400
without a release-version reconciliation. Apache-2.0 covers the repository's
released file and is the card's declaration, but does not establish relicensing
authority over every incorporated public, restricted, and custom speech source.
No bulk helper is added for this approximately 1.94 TB candidate; revisit after
a substantive owner repository confirms provenance, versions, and source-level
terms.

The July 2026 Local Information Disclosure paper adds coverage of the
[VoicePrivacy Challenge 2024](https://www.voiceprivacychallenge.org/vp2024/)
family. Its public GPL-3.0 recipe defines the LibriSpeech enrol/trial privacy
protocol and IEMOCAP utility evaluation, but official data/model downloads
require challenge registration and a password, and IEMOCAP has a separate
owner request. The paper's selected anonymized outputs, similarity matrices,
calibration artifacts, and LID implementation are not publicly released.

The July 2026 PINT invariant-speech-tokenization paper is recorded as a
coverage audit over the existing LibriSpeech, Libri-Light, VCTK, RAVDESS, and
TIMIT families. It reports LibriSpeech WER/CER and ABX, VCTK speaker and
parallel-invariance probes, RAVDESS emotion leakage, TIMIT-fitted baseline
tokenizers, and an underspecified 10,000-item noise evaluation. Section 3.3
also trains matched 85M-parameter autoregressive language models on token
streams from 6,000 hours of clean Libri-Light, reporting PINT perplexity 1.95
versus 2.78 for HuBERT and 2.67 for WavLM and roughly 23-times-faster
convergence to WavLM's final perplexity. This makes the protocol directly
relevant to speech-LLM pretraining efficiency rather than only codec analysis.
The model URL given in the paper still returned HTTP 404 on August 8; owner
repository, exact-title/arXiv-ID GitHub, and Hugging Face searches found no
release. Version 1 publishes no code, checkpoints, exact VCTK speaker holdout,
noise-item manifest, Libri-Light selection or token streams, LM split and
optimization recipe, trained probes, predictions, or artifact license.
Source-family access therefore does not reproduce the paper-specific protocol,
and no duplicate family or invented download route is added.

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
derived protocol for a later release recheck. A focused August 9 recheck found
the placeholder unchanged: GitHub reports size zero, no license, and no push
after its June 29 creation, while the default-branch tree endpoint returns 409
because the repository has no commits. The 1,127-item manifest, generated
candidates, decoding configuration, evaluator outputs, and per-item scores
therefore remain unreleased.

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

The July 2026 LALM audio-judge reliability paper now has a focused
release-status audit of its claimed-public supplement. Sections 3-4 and
Appendix E evaluate 152 production full-duplex conversations and 57
successfully rendered defect-injected clips, comparing three calibrated human
raters with Gemini audio judges across eight production dimensions. The paper
says anonymized ratings, prompts, schemas, analysis scripts, and figures are
public under CC BY 4.0 and Apache-2.0 declarations, but a focused August 8
recheck found that the cited Hugging Face page still redirects to sign-in and
that its API and raw README endpoints return HTTP 401. No public card, file
inventory, revision, or repository-side license can therefore be verified.
Appendix E separately says the production audio will not be released and that
the nominal 60 adversarial WAVs await a later v0.2 clearance review; only 57
enter the analysis. The paper license and stated supplement terms do not
license those absent recordings, so the index adds no benchmark family or
download helper until the tabular release is publicly verifiable.

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
A focused August 9 recheck found that arXiv still exposes only version 1;
exact-title and arXiv-identifier GitHub searches return no repository, and
identifier searches return no Hugging Face dataset or model. The segmented
fragment assignments, model-dependent item categories, evaluator
configuration, prompts, outputs, and per-item scores therefore remain
unreleased. No family, count increase, or helper is added.

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

The June 2026 STEB expressive speech-to-speech translation benchmark has a
focused release-completeness audit after reviewing Sections 3-4, Appendices
C-E, and the complete owner repository tree. Its reference-free
caption-then-summarize protocol measures translation fidelity, speaker and
duration preservation, emotion, scenario style, and non-verbal vocalizations
for cascaded, end-to-end, and speech-LLM systems. The public repository now
contains a 65-file evaluator (86 tree entries) with an end-to-end runner, judge prompts, and
metric implementations, but no top-level license. It requires a user-supplied
benchmark JSONL and reference audio. The official ungated Hugging Face dataset
still has zero stored data and exposes only `.gitattributes` plus a 96-byte
README promising a future preview. Thus the 20,370-item normal set, overlapping
901-item NV set, annotations, system outputs, per-item scores, and human
validation ratings remain unreleased. The paper uses arXiv's non-exclusive
license rather than CC BY 4.0, and source-media rights remain controlling. STEB
is not counted as a public family, and no helper or invented data link is added.

The July 2026 Sound Scene Story Benchmark (S3Bench) now has a consolidated
release-completeness audit after reviewing Sections 3.2, 3.5, 4.1-4.5, and
5.2-5.4 of version 2. Its 1,200 evaluation-only narrative prompts cover 300
two-event, 500 three-event, 200 four-event, and 200 overlapping-event cases;
an audio-language-model judge measures event exact match and micro accuracy,
temporal exact match, pairwise accuracy, Kendall's tau, and joint accuracy.
This directly evaluates post-training instruction following: the paper uses
S3Bench to compare online ALLM-guided DPO with CLAP-DPO, caption feedback, and
static preference datasets. The independently built public project page exposes
only 11 regenerated prompt demonstrations, each with outputs from six systems,
plus small JSON files with displayed demo scores and seven-system aggregate
perceptual metrics. It explicitly says it used no internal prompts, samples,
logs, or non-public training data. The full prompt and event manifest, judge
prompts and code, preference pairs, model checkpoints, generated evaluation
set, human-verification rows, and per-item results remain unreleased, while the
commented code repository still returns HTTP 404. The paper uses arXiv's
non-exclusive license, and the project states no separate license for its
metadata or audio. The overlapping duplicate YAML audit has been removed;
S3Bench remains uncounted and has no download helper.

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
A focused August 9 recheck found that arXiv still exposes only version 1 and
that the article still links no project or artifact repository. Exact-name
GitHub and Hugging Face searches, plus a broader Hugging Face search for audio
over-refusal, returned no matching release. The generated audio, item
manifest, moderation records, evaluator, outputs, and per-item scores therefore
remain unavailable; no counted family or helper is added.

The July 2026 *Qwen-Music* technical report now has a focused pretraining and
post-training evaluation audit after reviewing Sections 4.1-4.2 and Tables
4-9. Its quality-graded, five-million-hour pretraining curriculum and
SFT/offline-DPO/online-GSPO alignment are evaluated on an internal 600-item
bilingual text-to-music set, two internal 200-item cover-song sets, and an
internal 200-item bilingual semantic-token rendering set. The protocols cover
objective quality, lyric and tag following, melody control, professional blind
A/B preferences, renderer ablations, and stereo reconstruction. The public
exception is the [Song Describer Dataset](https://zenodo.org/records/10072001):
Section 4.2.2 uses all 546 tracks in its validated subset for codec-interface
reconstruction with seven spectral, mel, and stereo metrics. The paper and
source provide no artifact link; a focused August 8 check found no official
QwenLM repository, public Qwen Hugging Face model or dataset, or live Qwen
ModelScope model record. The four internal manifests, reference songs,
generated comparison audio, professional-rating rows, judge prompts, outputs,
and per-item scores remain unreleased. The arXiv license does not cover those
absent assets, while Song Describer retains CC BY-SA 4.0 plus per-track source
terms. No new family or helper is added; the existing Song Describer helper is
the only reproducible data path.

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

A focused August 9 release recheck confirms that those public applications are
interfaces to private or otherwise unidentified evaluation assets, not a
benchmark download. The consolidated Space remains at revision
`099d00123d14ccb80b6eaef514676838091f758a` and explicitly loads its leaderboard
JSON files and optional sample audio through a `LEADERBOARD_DATASET` runtime
setting; its source comments note that a private dataset requires an
`HF_TOKEN`, while neither the setting's value nor a dataset ID is published.
The separate ASR Space remains at revision
`740872a592296b28f407688eb551859af9e42691`. Their public trees still contain no
benchmark JSON tables, prompt or clip manifests, reference audio or
transcripts, generations, or human ratings, and an exact-name Hugging Face
dataset search returned no result. The paper remains CC BY 4.0 and the
applications Apache-2.0, but neither license covers the absent evaluation
data. No counted family or helper is added.

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
promises benchmark files and evaluation code "Coming Soon." A release-status
follow-up on August 7 found only five files in its complete main-branch tree:
README placeholders, `.gitignore`, and an empty `.gitkeep`. Its public,
ungated [Hugging Face repository](https://huggingface.co/datasets/OliviaWang1101/MeetingToM)
was last modified July 19 and still contains only `.gitattributes` and a
495-byte README, with zero bytes of dataset storage. AMI's public source corpus
does not make MeetingToM's exact selections, clip boundaries, labels, official
splits, prompts, scorer, or per-item results public. The paper is CC BY-NC-SA
4.0, but that does not establish reuse terms for absent derived benchmark
artifacts. No counted family or helper is added.
A focused August 9 recheck found the GitHub tree unchanged at
`f67b392863a1cc8948067c95e4ae385ecd1d4859`: eight total tree entries but only
five blobs, all placeholders or scaffolding, and no repository push after July
18. The Hugging Face repository likewise remains at revision
`52725e1dbdd69524a9040a41b6378383aa10ce8c`, with the same two small files and
zero bytes of dataset storage. Neither channel now supplies annotations,
clips, splits, prompts, evaluation code, results, or benchmark-specific terms.

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
rechecked on August 9 and still expose no matching artifact. A focused
owner-provenance check also found no matching release among coauthor Sripathi
Sridhar's 14 public GitHub repositories or public project-site repository.
The upstream Zenodo record remains a single AudioCards CSV and does not add
the paper's selected-item manifest, computed acoustic targets, perturbations,
or evaluator. The
public AudioCards family remains indexed separately and must not be treated as
the unreleased augmented subset.

The CVPR 2026 SVHalluc family is now indexed as a public, ungated speech-vision
hallucination benchmark after a focused August 9 release recheck. Sections
2.1-2.5 define 2,405 balanced, human-verified video-question pairs from 872
YouCook2-derived clips: 1,422 items diagnose global, fine-grained, and
cross-modal semantic alignment, while 983 test temporal alignment,
forecasting, and cross-modal temporal binding. This directly evaluates whether
audio-visual LLM post-training grounds what speech says and when narrated
events occur instead of treating speech as visual evidence. The author-linked
[Hugging Face release](https://huggingface.co/datasets/zcs15/SVHalluc) supplies
the complete 771 KB question-answer manifest and approximately 6.26 GB of 872
MP4s; its counts match the paper and every manifest path resolves within the
snapshot. The [owner repository](https://github.com/kaist-ami/SVHalluc)
supplies a downloader and documents option-letter accuracy, but no model
adapters, general response parser, construction pipeline, GPT prompts, human
verification rows, baseline outputs, predictions, or per-item scores. The
project page remains stale: Code points to GitHub's homepage and Data links
back to the project itself. The custom release notice is research-purpose only,
disclaims ownership of third-party video, and leaves YouCook2, YouTube, and
source-video terms controlling; it is not a standard open license. The safe
helper fetches primary documentation, terms, live metadata, and annotations by
default and requires explicit opt-in for media.

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
A focused August 10 release recheck found that the repository's complete
main-branch tree remains at commit
`9384c1b610a1261bdf5d7346c63d227095ab411f` from July 10 and still consists of
one README promising code and pretrained models. It has no license, speaker-
split or trial manifests, anonymized audio, preprocessing configuration,
implementation, checkpoints, predictions, or scores. The derived evaluation
therefore remains unreleased and no counted family or helper is added.

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
A focused August 9 release recheck found only arXiv version 1. Exact-title and
SpInv-plus-speech GitHub repository searches produced no matching owner
implementation, while Hugging Face SpInv dataset and model searches returned
only unrelated, pre-existing assets. The custom attack models, exposed speech-
LM representations, trial outputs, predictions, and score files therefore
remain unreleased; this does not change the separately indexed status of the
upstream VoxCeleb family.

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
nine pretrained checkpoints and eight fine-tuning configurations while
keeping the official SUPERB task pipelines fixed. Section 3.5 gives seed 1337
for the full matrix and two additional seeds, 2048 and 7395, for three base
checkpoints. Sections 3.6 and 4 say paired prediction/truth files underlie the
exact McNemar tests, but only aggregate tables are published. The public
Apache-2.0 S3PRL toolkit documents the component protocols; no author project
or repository supplies the paper's exact configs, trained checkpoints, paired
files, or score matrix. Component access and terms remain authoritative:
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

The July 2026 AV-SyncBench paper now contributes a public audiovisual
synchronization benchmark family. It describes 3,269 in-the-wild videos and
38,390 temporal and semantic challenge samples evaluated through pairwise
accuracy over non-overlapping 0.64-second chunks. On August 8, the official
[ModelScope release](https://modelscope.cn/datasets/coming245/AVSyncBench)
exposed seven split tar-gzip parts totaling approximately 68.2 GB at revision
`86c06579529a6e7b2cafb0dc386a50152a37fb98`. The official
[GitHub repository](https://github.com/fgt7t6g/AV-SyncBench) still says its
evaluation code and dataset will be released soon and contains no runner,
while the [Hugging Face repository](https://huggingface.co/datasets/coming245/AV-SyncBench)
remains a zero-storage placeholder. ModelScope declares MIT for its dataset
repository, but the source videos' copyright and platform terms remain
separately applicable. The safe helper downloads only metadata by default and
keeps the roughly 68.2 GB Git-LFS clone behind explicit opt-in.
A focused August 9 release recheck found no evaluation-code change. GitHub's
complete four-file tree still contains only the project page, two images, and
the README promise, with no push after March 21 and no detected license. The
Hugging Face placeholder remains at revision
`23329259e882f92acdfb8c0133e46b3a1c70cd0c` with only a README and
`.gitattributes`. The paper's Section 3.1 specifies five upstream model
codebases, 25 FPS video, 16 kHz audio, 0.64-second non-overlapping chunks, and
one pairwise decision criterion, but those prose settings do not replace the
missing common runner, preprocessing adapters, configurations, predictions,
or per-item scores.

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
A focused August 9 recheck found only arXiv version 1. The owner repository now
resolves to August 3 commit `a3708fd41d5dd2a2665c5f281cbfc9242b7642e1`,
but its two post-audit commits only revise the README and project page and add a
pipeline image. The complete ECoM tree still provides a placeholder math-test
JSONL path and selected demonstration WAVs, not the paper's benchmark JSONL,
frozen audio manifest, or evaluation scorer. The spoken evaluation package
therefore remains unreleased, with no family, count, or helper change.

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

The August 2026 JoyAI-Talker technical report adds current evaluation
provenance for the Full-Duplex-Bench family. Section 6 evaluates Joy-Duplex on
the public v1.5 overlap tracks and reports separate respond/resume behavior for
user interruption, backchannel, talking-to-other, and background-speech
conditions. The same section reuses indexed AIR-Bench and MER2025 sources for
speaker-attribute perception and derives three empathetic-response subsets
from EchoMind, while its Speech-ACEBench, Speech-BFCL, and
Speech-SmartInteract rows provide no citations, fixed manifests, or artifact
links. The report itself releases no JoyAI-Talker repository, weights,
paper-specific outputs, refined MER2025 labels, or judge records. The index
therefore adds the independently released Full-Duplex-Bench v1-v3 source
family, maps the Joy-Duplex result to v1.5, and does not manufacture separate
tool-calling benchmark families from untraceable table labels.

The July 2026 Context-Speech Bench audit has been updated against paper version
2. Sections 3-4 define an in-scope post-training evaluation of whether
audio-language models internalize audio-grounded scaffold clues without copying
answer-bearing text, including silent-audio controls, no-clue transcription,
overlap and noise robustness, clue maturity, and GDPO-trained streaming gates.
Version 2 now says AGSC code, benchmark manifests, result evidence, and
public-corpus audio recipes are released with the paper. It supplies no artifact
URL, however; the arXiv source bundle contains manuscript files and figures
only, while exact-name GitHub repository and Hugging Face dataset/model searches
found no owner release on August 7. CSB therefore remains an unavailable claimed
release rather than a counted public family. Its LibriSpeech, LibriMix,
AISHELL-3, WHAM!, MUSAN, and AMI inputs retain their separate upstream terms,
and no license can be inferred for the absent derived mixtures, manifests,
labels, code, or result records. No download helper is added.
A focused August 9 recheck confirmed that arXiv version 2 remains current and
that exact-title, exact-benchmark-name, and broader AGSC speech searches still
return no GitHub repository or Hugging Face dataset/model release. The primary
paper's Section 1 release sentence remains the only artifact claim and contains
no link, so the benchmark manifests, recipes, evidence, and evaluator remain
unlocatable.

The August 2026 SwanTale report is recorded as a partial-release audit of
three post-training evaluations for a GRPO-tuned unified speech/audio
generator. Section 4 evaluates reference-conditioned monologue and dialogue
generation on SwanBench-Speech; 180 instruct-TTS prompts across advertising,
comic drama, and general scenes on SwanBench-Scene; and 64 heterogeneous
speech/audio instructions on SwanBench-Caption. The protocols cover
pronunciation, timbre and reverb consistency, expressiveness, scene
appropriateness, acoustic quality, and instruction accuracy through automatic
metrics, Gemini and SpeechJudge scoring, and five-rater professional MOS.
They directly test whether post-training improves controllability, stability,
and complex instruction realization. The owner project publishes selected
demonstrations—103 SwanBench-Speech comparison audio links and 20 SwanTale
examples, including five Caption cases—but no complete fixed manifests,
baseline/ablation output set, human ratings, judge records, scorer, model
artifacts, or benchmark-data license. Its MIT repository license covers the
website software and documentation, not clearly the hosted prompts, reference
material, or generated media. The paper's four-domain SwanVAE reconstruction
panel maps VCTK, FSD50K, and MUSDB18-HQ to existing families, while its exact
selections and internal SwanVerifier held-out split remain unreleased. No
public benchmark family or helper is added from demonstrations alone.
A focused August 9 recheck found that arXiv version 2 remains current and the
complete, non-truncated 65-path owner repository tree remains at commit
`7363bb96f0788b2000c0da120439b8cc0e9aaf33`. It still contains only the static
site, selected demonstrations, and aggregate visualizations. Exact-name
Hugging Face model and dataset searches returned no SwanTale release, while
broader GitHub results contained no additional owner repository; the complete
manifests, evaluator, judging records, model artifacts, and data-specific
license therefore remain unavailable.

The August 2026 dots.tts.edit report is recorded as a partial-release audit of
doteBench, a directly in-scope post-training evaluation for precisely
controlled speech editing. Sections 3.2 and 6 define 1,541 English and Chinese
single-task cases across text, emotion, prosody, and pause editing, plus 240
two-to-four-operation compositional cases. Structural instructions localize
operations with transcript tags, and the protocol separately measures
instruction execution, preservation outside the edit, and complete-output
quality. The owner-published
[static demo Space](https://huggingface.co/spaces/dots-studio/dots.tts.edit-demo)
contains 29 selected cases, 136 audio files, and a hash inventory, but its
README explicitly excludes the model, training code, and inference source. It
does not publish the complete frozen manifests, structural instructions,
scorer, metric configuration, full outputs, per-item scores, or Gemini emotion
judge records. The Space card declares Apache-2.0, but no separate terms are
stated for its source, reference, or generated audio, and that code-oriented
license cannot be extended to absent benchmark artifacts. Seed-TTS-Eval
retention results map to the existing indexed family. Selected listening
examples therefore do not support counting doteBench as a downloadable family
or adding a helper yet.
A focused August 9 recheck found that the interactive playground runtime still
responds publicly, while its Hugging Face repository page and API now require
authentication. The separate public static demo advanced to revision
`3b45321043325be66c0e5507dd61e3b7c0581d8d`, but its refreshed inventory keeps
the same selection hash, 29 cases, and 136 audio files (72,926,078 bytes).
Exact-name Hugging Face dataset and model searches found no doteBench release,
and the only GitHub repository result was an unaffiliated paper list. The full
manifests, evaluator, outputs, and benchmark-specific license therefore remain
unreleased; the live playground is not treated as a reproducible release.

The July 2026 TORUS report is recorded as a partial-release audit of a directly
in-scope evaluation for unified audio language models. TORUS tests whether a
model's generation/editing and understanding heads agree about the same audio:
48 human-verified tests each progress through generation, edit, and
counterfactual-edit stages, with three six-option audio-grounded questions per
stage, totaling 144 rendered clips and 432 questions across speech, sound, and
music. The protocol measures coherence accuracy and also reports modality,
speech-recognition, distributional-generation, and human-preference checks.
The [official project repository](https://github.com/TORUS-benchmark/torus-benchmark.github.io)
is an unlicensed static demonstration page. It contains 90 MP3 outputs for five
selected tests—one per task family—but no complete seed/metadata manifest,
generation or edit prompts, questions, answer keys, authored transcripts,
evaluator, full model outputs, per-item scores, bootstrap records, or human
ratings. The paper is CC BY 4.0, but that article license does not license the
project assets or absent benchmark artifacts. Selected listening examples
therefore do not support counting TORUS as a public benchmark family or adding
a download helper yet.
A focused August 9 recheck found that the official repository remains at head
`c2ba66bc15b9b8396b48e375c79da05bd085abc5` from July 28, with the same complete
96-path tree, 90 audio files, and 4,136,118 audio bytes. The project page also
retains its July 28 Last-Modified timestamp. Exact-topic GitHub search found no
separate TORUS audio-benchmark repository, while Hugging Face dataset and model
searches found no release tied to the paper. The complete suite and evaluator
therefore remain unreleased.

The August 2026 *Vorch-Director* report is recorded as a partial-release audit
of a directly in-scope long-horizon audio-video generation evaluation. Sections
4.2-4.6 and Appendix F define a 16-case benchmark in which a unified LTX-2-based
generator produces 22 consecutive subject-referenced shots with speech, music,
and sound effects. The protocol measures speaker consistency, scripted-speech
accuracy, audiovisual quality, and progressive drift, making it relevant to
robust audio-visual post-training under self-generated history. The official
project repository is an unlicensed static page with three selected long-video
demonstrations and three reference-audio files, while code is marked “Coming
soon.” It does not release the complete prompt/reference manifest, 352-shot
scripts, baseline and model outputs, evaluator, metric configuration, or
per-case score records. CC BY 4.0 covers the paper, not the project media or
absent benchmark artifacts. ST-Bench and UnityShots rows are visual provenance
and do not become audio benchmark families merely because they share the
paper's evaluator. No counted family or download helper is added pending an
independently runnable release.

The August 2026 *Should We Type or Talk to LLM Agents?* paper is recorded as a
claimed-release audit of HIVE, a post-transcription robustness protocol for LLM
agents. Sections 3-6 and Appendices A-C define 11 voice-transcription
perturbations, six seeded QWERTY operators, and two controls over fixed subsets
of GSM8K, GSM-Symbolic, GSM1k, HumanEval, MMLU-Pro STEM, and TruthfulQA MC1.
Five open instruction-tuned text LLMs, five seeds, and 19 conditions yield
550,000 matched generations with paired accuracy deltas and corrected
significance tests. The voice arm is important but easy to misclassify: it uses
deterministic transformations and Qwen2.5-7B text-to-text style transfer to
model disfluency, register, dictation rewriting, homophones, and surface loss;
it contains no recorded speech or reported ASR run. The paper says code,
prompts, and analysis are released but supplies no artifact URL, and exact-name
GitHub and Hugging Face searches found no matching owner release on August 7.
CC BY 4.0 covers the article, not absent implementations, transformed stems,
cached verbalizations, outputs, or upstream benchmark data. HIVE is therefore
documented as an unavailable speech-interface protocol, not counted as a
public audio benchmark family, and receives no download helper.
A focused August 9 owner-provenance recheck found no matching release among
first author Zizhao Hu's 91 public GitHub repositories or on the author's
public project site. ArXiv still exposes only version 1, whose limitation
section explicitly says the reported spoken registers are text-to-text
synthetic verbalizations, not recorded speech or a real ASR distribution; an
implemented TTS-to-ASR branch was excluded from the reported runs. The claimed
code, transformed stems, cached verbalizations, generations, and score rows
therefore remain unavailable, and HIVE remains an audit rather than a counted
audio benchmark family.

The June 2026 *A Closer Look at Failure Modes in Temporal Understanding of
Large Audio-Language Models* paper is recorded as an unavailable derived-
benchmark audit. Sections 3-5 define 1,657 four-option questions from TACOS:
528 Earliest Onset, 499 Latest Offset, and 630 Longest Duration cases. Correct
temporal boundaries or durations are separated from every distractor by at
least one second, answer categories are distinct, and correct positions are
balanced. Audio-only, weak-caption-only, audio-plus-caption, and silence
conditions expose text reliance, while attention upweighting and scaling probe
whether inference-time redistribution repairs temporal reasoning failures.
This is directly relevant to pretraining and post-training evaluation of LALM
temporal robustness, but version 1 provides no artifact URL. The derived
question manifest, answer keys and clip mapping, construction code, prompts,
intervention configuration, outputs, and per-item scores are unavailable;
access to upstream TACOS does not reconstruct them. Exact-title and arXiv-ID
GitHub searches and an arXiv-ID Hugging Face dataset search found no matching
release on August 7. The article's arXiv license does not license the absent
benchmark, and TACOS/Freesound item terms require separate review. No public
family or download helper is added pending an author-controlled release.
A focused August 10 recheck found only arXiv version 1 and no artifact link;
exact-title and arXiv-ID GitHub repository searches still return zero results,
and the Hugging Face dataset API still returns no arXiv-ID match. The protocol
therefore remains unreleased, with no count or helper change.

The April 2026 Audio2Tool paper now has a focused release-completeness audit of
the claimed-public but partial speech-language-model tool-use release. Version
2 Sections 3-5 and the repository's complete 96-entry tree show approximately
30,000 English queries over 152 functions, 23 categories, three device domains,
and eight difficulty tiers, evaluated with
ordered Tool Accuracy, normalized Exact Match, and Slot F1. Noise ablations
cover babble, mechanical hum, and impulsive MS-SNSD noise at +15, +5, and -5
dB SNR. This directly tests post-training for audio-native function calling,
compositional instructions, dialogue state, argument grounding, speaker-aware
intent selection, and acoustic robustness. Although version 2 says code and
data are public on the project page, the linked owner repository is a static
demo: its tier metadata exposes 23 selected examples referencing 29 WAVs, but
not the complete query/audio release, tool schemas, fixed splits, generation
manifests, evaluator, baseline outputs, or per-item scores. Its bundled
`download_tier_samples.js` requires configured AWS CLI access to author-
development S3 paths and selects only three examples per Tier 1-7 for the demo;
it neither handles Tier 8 nor provides public benchmark access. The paper is CC
BY 4.0; the demo repository has no detected license, and its ambiguous “same as
the Audio2Tool paper/repository” statement does not clearly license hosted
recordings or metadata. Audio2Tool therefore remains uncounted and receives no
helper until a complete, licensed benchmark release appears.
A focused August 9 recheck found that the owner repository still resolves to
March 5 commit `9348131db97eea1e8cfedab4c034f61116cda17d`; its 96-entry tree,
missing GitHub license declaration, demo-only contents, and absent evaluator
are unchanged.

The May 2026 *Do Factual Recall Mechanisms Carry over from Text to Speech in
Multimodal Language Models?* paper is recorded as an unreleased derived
pretraining-transfer protocol audit. Sections 2.1-2.4, Section 3, and Appendix
A synthesize the public Known 1000 factual prompts with MeloTTS, filter
separate Known-t2t and Known-s2t sets by SpiritLM answer correctness, and use
causal mediation analysis to compare text- and speech-triggered factual recall.
Clean, subject-corrupted, and activation-restored runs patch hidden states,
five-layer MLP windows, and five-layer attention windows; HuBERT-LARGE CTC
alignment maps spoken subjects to SpiritLM speech-token ranges. Figure 2
reports aggregation over 754 filtered prompts, but the paper does not publish
separate frozen manifests or counts for its two conditions. This directly
tests whether knowledge learned by a text-pretrained backbone transfers into
an interleaved speech-token interface, with implications for spoken factuality
and hallucination. The authors explicitly state that they release no new model
or dataset, and exact-title/arXiv-ID GitHub plus arXiv-ID Hugging Face searches
found no owner artifacts on August 7. The synthesized WAVs, filtered row lists,
accepted close-answer annotations, alignment/causal-tracing code, intervention
configuration, activations, and per-prompt scores therefore remain
unreleased. CC BY-SA 4.0 covers the article, not those absent artifacts or the
separately licensed upstream components. No benchmark family or download
helper is added.

The June 2026 MOSS-Audio technical report is recorded as an existing-family
and unreleased-protocol audit of audio-language pretraining and post-training.
Sections 6.1-6.4 evaluate Instruct and reasoning-oriented Thinking variants on
the indexed MMAU, MMAU-Pro, MMAR, and MMSU families; a new internal 2,000-item
speech-captioning set with 13 human-reference dimensions; a 12-condition ASR
suite detailed as 38 dataset positions in Appendix Table 5; and CTC-derived
timestamp-ASR tests over indexed AISHELL-1 and LibriSpeech. Appendix Tables 6-8
add directly relevant encoder-pretraining and transfer ablations through the
indexed XARES-LLM framework, a controlled Qwen3-1.7B interface, and
MECAT-Caption. The official project and Hugging Face collection publicly
release four model repositories and inference implementation, but no complete
speech-captioning manifest or references, judge identity/prompt/parser, exact
ASR manifests and runner, derived timestamp alignments, baseline outputs, or
per-item scores. Apache-2.0 on the model cards covers those released model
repositories, not absent evaluation artifacts or third-party benchmark data.
The audit therefore adds no duplicate family, count increase, or download
helper.

The January 2026 Qwen3-ASR technical report is recorded as an existing-family
and internal-protocol inventory of speech-foundation-model transfer and
post-training. Sections 2-4 and Tables 2-9 trace continuous pretraining from
Qwen3-Omni through ASR SFT with context-biasing and streaming-enhancement data
and long-context fine-tuning, then evaluate public LibriSpeech, GigaSpeech,
Common Voice, FLEURS, MLS, VoxPopuli, WenetSpeech, KeSpeech, MLC-SLM Eval,
MIR-1K, and Opencpop families. The report also defines internal robustness,
15-language news, long-form English/Chinese song, forced-alignment timestamp,
and efficiency protocols. The official Apache-2.0 repository and ungated
Hugging Face collection release two ASR models, the forced aligner, inference,
streaming, alignment, and fine-tuning code, plus aggregate evaluation tables.
They do not release frozen public-benchmark manifests or an evaluation runner,
internal audio and annotations, MFA or human timestamp references, baseline
outputs, per-item scores, or raw timing logs. Apache-2.0 covers released code
and models, not absent internal artifacts or separately licensed upstream
datasets. No duplicate family, count increase, or download helper is added.

The May 2026 StepAudio 2.5 technical report is recorded as an existing-family,
public-derived-recipe, and internal-protocol inventory of unified audio-LLM
pretraining and post-training. Sections 3-6 evaluate ASR on indexed AISHELL-1,
WenetSpeech, FLEURS, LibriSpeech, Common Voice, VoxPopuli, and Earnings22
families; the owner-linked WenetSpeech TestNet Long repository releases a
7,385-row derived manifest and preparation script but no source audio or
license file. The report's distinctive post-training evaluations remain
unreleased: a 774-prompt human TTS arena against three commercial baselines
and five realtime spoken-dialogue suites spanning mobile human sessions,
general and in-car dialogue, 87 acoustic-attribute samples, and Step-SPQA.
No official StepAudio 2.5 model or evaluation release was identified, and the
exact ASR manifests and runner, TTS prompts and generations, realtime inputs
and harness, human judgments, outputs, and per-item scores are absent. The
article's arXiv license does not cover those missing materials; WenetSpeech
retains separate upstream terms, and the public derived repository supplies no
reuse license. No duplicate family, count increase, or helper is added.

The April 2026 MiniCPM-o 4.5 report is recorded as an existing-family and
paper-specific protocol inventory for speech alignment, joint omni-modal
pretraining, instruction tuning, GRPO/reward-model post-training, and
full-duplex interaction. Sections 6.3 and 6.5 evaluate indexed AISHELL-1,
WenetSpeech, LibriSpeech, GigaSpeech, VoxPopuli, CoVoST 2, MMAU, MELD,
VoiceBench, Daily-Omni, WorldSense, AVUT, and Video-MME families alongside
additional cited speech-QA, speech-generation, and audio-video suites. The
official Apache-2.0 repository and ungated model weights are public, but the
repository's evaluation code is vision-oriented: no audio-suite runner,
frozen manifests or revisions, preprocessing and prompts, judge configuration,
speech-generation references and outputs, cross-suite result bundle, per-item
scores, or timing logs were identified. The report's LiveSports-3K-CC row is
vision-only, and it does not report a released full-duplex audio-interaction
benchmark. Apache-2.0 does not relicense external benchmark assets or absent
evaluation artifacts, so upstream terms remain controlling. No duplicate
family, count increase, or download helper is added.

The August 2026 *EmpaAva* paper is recorded as an existing-family and
unreleased-derived-evaluation audit of spoken-agent empathetic post-training.
Sections 5.1-5.3 and Appendix E evaluate a text-only 5,255-item
EmpatheticDialogues track, end-to-end emotional-speech and avatar responses
derived from 6,288 filtered AvaMERG instances, a 100-output cross-modal subset,
a ten-participant questionnaire over five turns and four systems, and a 2,308-
item embodied-expression subset. The latter tracks measure response empathy,
emotion and cause understanding, lip synchronization, and speech-expression
consistency, directly testing an LLM planner that controls emotional speech
and embodied dialogue from acoustic-affect evidence. The Apache-2.0 owner
repository releases the complete agent system and separately packaged runtime
assets, but its non-truncated main tree at commit
`19e2d7f2309e7d716d61a8d9d01a6d2d9a2da411` contains no paper-level evaluation
runner, frozen 5,255/6,288/100/2,308-item manifests, comparison outputs, human
ratings, or per-item scores; the project page's Dataset control remains
disabled as “Coming soon.” Apache-2.0 covers first-party code, not upstream
datasets, absent ratings, or generated avatar media. No duplicate benchmark
family, count increase, or download helper is added.

The April 2026 SpeechParaling-Bench paper now contributes a public bilingual
paralinguistic speech-generation family. Sections 3-4 and Appendices A-C define
1,001 aligned Chinese-English queries (2,002 released input WAVs) spanning 691
paralanguage-control, 120 within-utterance dynamic-variation, and 190
situational-adaptation cases per language, with 101 features across 13 vocal
dimensions. Candidate responses are compared with fixed Chinese and English
baselines by a Gemini audio judge using randomized order, 0-3 dimension scores,
winner/tie decisions, and normalized task scores; Section 4.2 reports human
agreement over 416 response pairs. This directly evaluates post-training for
spoken instruction following, controllability, empathetic adaptation, and
paralinguistic alignment. The ungated Hugging Face release supplies inputs and
metadata under an Apache-2.0 card declaration, while the owner repository
supplies API adapters, judge prompts and runners, baseline outputs, score code,
and paper-era judge records. The code repository has no detected license, so
its software, third-party generations, and result records remain
rights-unspecified; individual human ratings and their frozen pair manifest
were not identified. A safe helper downloads documentation and live metadata
by default, with manifests, the approximately 1.66 GB Hub snapshot, and the
repository clone behind separate opt-ins.

The August 2026 BOSSA paper is recorded as an existing-family and unavailable-
derived-protocol audit of cross-modal music-language pretraining. Sections
4.1-5.2 and Appendices B-C evaluate a 32-query bridge that reads layer 25 of
frozen MusicGen-Large and conditions frozen MuseCoco-xLarge. The evaluations
include ten-round piano-cover generation on a paper-specific POP909 split,
100 randomly selected Ballroom/GTZAN tracks, ten resampled audio-to-MIDI
retrieval pools of 64 PIAST and 64 POP909 pairs, 450 randomly paired style-
transfer cases, and a 21-participant listening study over six selected pieces.
This directly tests whether audio-LM pretraining exposes implicit style that
can transfer into a symbolic LM. POP909 and GTZAN map to existing entries;
PIAST and Ballroom are upstream classic datasets rather than newly released
benchmark families here. The public [project page](https://zhaojw1998.github.io/bossa/)
hosts selected listening demos but no frozen split or selection manifests,
retrieval pools, evaluator, complete generated outputs, per-item scores,
participant ratings, model weights, or evaluation code. Its linked owner code
repository returned HTTP 404 on August 8, and no reuse license was identified
for the demo media. The article license does not cover those assets or the
separately governed upstream datasets, so no family or helper is added.

The August 2026 MSRT paper is recorded as an existing-family, public-example,
and incomplete-evaluation audit of pretrained speech-encoder transfer into an
LLM. Sections 3-5, Tables 3-7, and Figure 5 route 45 source languages between
frozen and trainable Whisper experts, compress speech through an 80-query
Q-Former, and condition a MiLMMT-4B language model. The main evaluation covers
all 1,980 non-identity FLEURS translation directions with spBLEU and COMET;
CoVoST 2 supplies an 11-direction cross-dataset and data-scaling evaluation,
while Common Voice 24 is ASR-pretraining data rather than an evaluation track.
This directly tests whether a pretrained high-resource speech interface can
be preserved while a second encoder specializes for medium- and low-resource
speech. The public [repository](https://github.com/yxduir/MSRT) releases
inference code, and the ungated [model repository](https://huggingface.co/yxdu/MSRT-4B)
releases approximately 13.1 GB of weights plus a 1,980-row format example made
from only 45 FLEURS test utterances—one source utterance crossed with all 44
targets. It does not release the full paper manifests, training recipe and
stage manifests, metric environment, baseline/API outputs, complete model
outputs, or per-item scores. No license was identified for the code repository
or top-level model repository. A nested language-model README invokes Gemma
terms, but that does not license the entire checkpoint, code, copied FLEURS
audio, or example manifest; upstream FLEURS and CoVoST 2 terms still apply.
The audit therefore adds no duplicate family, count increase, or helper.

The July 2026 *SimulS2ST-Omni* paper is recorded as an existing-family,
selected-demo, and incomplete-evaluation audit of streaming speech-to-speech
post-training. Section 4 and Appendices D, F, and H evaluate public CVSS-T;
indexed RealSI, LibriSpeech, WenetSpeech, CoVoST 2, and Seed-TTS families; and
the paper-specific, unreleased ACL60/60-dev protocol. The paper's distinctive
protocols compare Thinker–Talker and unified
decoders, full and 10% paired-S2ST budgets, auxiliary multitask supervision,
monotonicity-filtered trajectories, latency sampling schedules, three training
seeds, alternate ASR backends, computation-aware latency, a 15-item-per-
direction human study, and DeepSeek-V4-Pro VIP judging. This directly traces
post-training of a Qwen2.5-Omni-derived speech LM for joint text-code
read/wait/write behavior and tests quality, latency, long-form stability,
speech fidelity, and data efficiency. The public project repository exposes
selected sentence-level and long-form audio demonstrations, but its GitHub
control is still marked “Coming soon”; no model code or checkpoints, frozen
manifests, complete generations and baseline outputs, runtime logs, human
ratings, VIP prompts and records, or per-item scores are released. The paper
is CC BY 4.0, while the roughly 290 MB static demo repository has no detected
license file and does not separately state rights for source or generated
audio. Upstream benchmark terms remain controlling, so no duplicate family,
count increase, or helper is added.

The July 2026 *SpeechLLM Meets Federated Learning for End-to-End ASR* paper is
recorded as an existing-family and incomplete-protocol audit of decentralized
audio-encoder transfer. Sections 3-5 and Tables 1-2 connect frozen WavLM-Large
or Whisper-Medium to TinyLlama with a trainable projector and LoRA, then compare
centralized and 100-round federated adaptation on LibriSpeech train-clean-100 /
test-clean and an Italian Multilingual LibriSpeech selection. Speakers act as
clients, 30% are sampled per round, and WER tracks encoder choice, Adaptive
FedAvg, parameter-efficient alternatives, and monolingual versus joint-client
training. This directly tests whether pretrained speech representations survive
decentralized post-training, but it defines no new evaluation family. The
public [owner repository](https://github.com/mnabihali/Fed-SpeechLLM) contains
only a short README and MIT license: it has no implementation, exact Italian
selection or client manifests, seeds, checkpoints, outputs, or per-item scores.
MIT therefore covers only the released repository files, while LibriSpeech and
MLS retain their upstream terms. No duplicate family, count increase, or helper
is added.
A focused August 10 recheck found arXiv still at version 1 and the complete
owner-repository tree still fixed at commit
`1ffa95ddf30f5ed911a1d9395093a56d17e41e56` from January 30. Its only two
files remain the 110-byte README and MIT license, so the paper's claim that
training hyperparameters are publicly available there is still not fulfilled;
no implementation, configuration, or frozen evaluation artifact has appeared.

The May 2026 *jina-embeddings-v5-omni* paper is recorded as an existing-family
and released-model audit of frozen audio-encoder transfer into a language
embedding model. Sections 3-6 and Tables 1-5 connect the frozen Qwen2.5-Omni
audio encoder to frozen Jina v5 text backbones by training only one linear
audio projector and delimiter-token rows, then evaluate the Nano and Small
models on the indexed 30-task MAEB suite. Figure 8 additionally compares
projector-only, immediate encoder-unfreezing, and two-stage continuation on an
eight-task MAEB subset: UrbanSound8K, CommonVoiceMini21, MACS, GigaSpeech,
SpokenSQuAD, Clotho, JamAlt Artist, and JamAlt Lyric. This directly tests
whether an audio encoder already aligned through an audio LLM can transfer
through a compact learned interface while preserving the frozen language
space. The public, ungated [Hugging Face collection](https://huggingface.co/collections/jinaai/jina-embeddings-v5-omni-69f336b985c156b1d757029e)
releases two base models, eight pre-merged task variants, processors, and
inference code under model-card CC BY-NC 4.0 declarations; upstream MTEB
provides MAEB's public registry and runner. The release does not identify the
projector-training source datasets or item manifests, freeze the paper's MTEB
revision and environment, or supply baseline outputs, predictions, per-item
scores, per-task ablation values, or training logs. Model-card terms do not
relicense MAEB components or undisclosed training sources, and MTEB's
Apache-2.0 applies to code and registry rather than component media. No new
family, count increase, or helper is added.

The July 2026 *VAmoS Bench* paper is recorded as a public-agent-code but
unreleased-benchmark audit of tool-using spoken-agent post-training outcomes.
Sections 3-6 and Appendix A define 100 synthetic banking scenarios partitioned
into 30 simple, 38 complex, and 32 adversarial or guardrail cases. Each case
seeds an isolated PostgreSQL backend, gives an interactive audio caller a
private goal, exposes five card-operation tools, and fixes binary assertions.
The grader reads the dialogue together with tool calls, arguments, and returned
rows, so completion requires both a correct spoken response and correct state
change while preserving verification, confidentiality, and action order. The
paper compares eleven production voice agents over three runs each, totaling
3,300 calls, and reports completion plus connection, latency, call-duration,
turn, interruption, and cost measures. This directly evaluates spoken-agent
tool use, robustness, safety, and policy adherence. The public MIT-licensed
[Riley repository](https://github.com/veris-ai/riley-agent) supplies synthetic
database schemas and sixteen live agent implementations, but it does not
release the author-operated Veris benchmark platform, frozen paper snapshot,
100 scenarios and assertions, caller configuration, grader, call traces,
audio, transcripts, per-call verdicts, or timing and cost records. The paper's
CC BY 4.0 and repository's MIT/BSD notices do not cover those absent artifacts
or override vendor service terms. No counted family or helper is added.

The ZeroSpeech 2021 spoken-language-model benchmark is now indexed as a public,
ungated pretraining and tokenizer-evaluation family. Section 3.2 of the primary
paper defines four black-box, zero-shot levels: Libri-light ABX phonetic error,
sWUGGY word/nonword accuracy, sBLIMP grammaticality accuracy, and sSIMI
correlation with human lexical-semantic judgments. The official server still
exposes the approximately 30.61 GB `sLM21.dataset.zip`, and the owner baseline
repository supplies CPC, clustering, LSTM/BERT scoring, and submission code.
This family remains directly current: Section 6.6 of the July 2026 SylReg paper
uses sWUGGY and sBLIMP to compare syllabic speech-token interfaces, and its MIT
repository releases the corresponding evaluation implementation. No standalone
license was identified for the ZeroSpeech archive, while the baseline repository
has no detected license file; Libri-light/LibriSpeech, Google-synthesized voices,
and the thirteen source similarity datasets retain separate terms. The safe
helper fetches primary documentation and live archive headers by default and
requires explicit opt-in for the large archive or baseline clone.

The ZeroSpeech 2019 “TTS without T” challenge is now indexed as a mixed-access
pretraining, discrete-token, and resynthesis benchmark family. The primary
Interspeech paper and official Tasks page define an end-to-end zero-resource
protocol: discover speaker-invariant subword units from untranscribed speech,
measure submitted intermediate embeddings with minimal-pair ABX error and
entropy-based bitrate, then resynthesize novel-speaker utterances in a target
voice and score MOS, human-transcription CER, and voice similarity. English is
the development language and an Austronesian surprise language is the held-out
test, with the same model and hyperparameters required for both. The official
Data page still exposes direct 156 MB toy and 2.5 GB English archives; their
page states no standalone license. Its 1.5 GB surprise archive is password
protected and requires acceptance of custom terms limiting use to the challenge
and prohibiting redistribution and other research or commercial uses. The safe
helper therefore fetches owner pages and archive headers by default, makes only
the English archives opt-in, and leaves surprise-data access manual.

AudioAgentSecurity is now indexed as a gated audio-LLM safety and spoken-agent
benchmark family after reviewing Sections IV and VI and Appendix C of the July
2026 primary paper. It builds 200 verified benign/malicious instruction pairs
across eight tool-use scenarios and ten concurrent audio-injection methods,
then measures attack success, retained benign-task correctness, defenses,
physical-channel robustness, and human perceptual stealth on eleven audio
agents. This directly evaluates post-training safety, robustness, instruction
hierarchy, and tool-use behavior under adversarial speech. The public owner
repository releases evaluation, attack-generation, and CADV defense code plus
selected physical distance and angle recordings; its README uses AttackBench
as an alias. The approximately 21.8 GiB Hugging Face snapshot is auto-gated and
currently lists 200 benign and 1,997 mixed-attack WAVs, which does not exactly
match the paper's 2,160 generated-attack count. Neither release states a reuse
license, the gated card was not publicly readable, and the paper license does
not cover data or code. The safe helper downloads only primary documentation
and live metadata by default, with the code clone and gated snapshot behind
separate explicit opt-ins.

StreamArena is now indexed as a public, ungated audio-visual agent benchmark
after reviewing Sections 2.1-2.3 and Appendices B-C of the August 2026 primary
paper. Its 243 hour-scale streams average 88.8 minutes and support 3,646
bilingual open-ended tasks: 263 real-time-perception, 877 historical-recall,
1,732 external-tool, and 774 proactive-interaction questions. Query, evidence,
and expected proactive-response timestamps enforce causal access, while binary
LLM judging and timing-aware proactive accuracy test factuality, long-horizon
memory, tool use, and when to speak. This directly evaluates post-training
outcomes for always-on omni-modal agents that consume raw audio or ASR alongside
video. The ungated Hugging Face release supplies lightweight annotations and
metadata plus roughly 300 GB of per-video tar files. Release provenance is
internally inconsistent: Appendix C.7 says annotations are CC BY 4.0 and that
original YouTube videos are not redistributed, while the live card declares CC
BY-NC 4.0 and says it ships MP4s, subtitles, and source metadata under a fair-use
rationale. The paper-promised Apache-2.0 code repository also returned HTTP 404
on August 8. The helper therefore fetches only primary documentation, live Hub
metadata, and the four small JSONL files by default; media require explicit
opt-in, and no alternate code URL or media license is inferred.

The March 2026 *StyleBench* paper is recorded as a public-candidate but
owner-unverified release audit of speech-LLM post-training evaluation. Sections
2-3 define 14,400 bilingual three-turn dialogues and 86,400 synthesized
utterances across emotion, speed, volume, and pitch. Each dialogue preserves
answer text while moving from neutral speech through stronger or weaker style
instructions. The protocol filters on Qwen3-4B-Instruct single- and multi-turn
semantic relevance, then reports Valid Sample Percentage, Style Variation
Degree from syllable rate, RMS energy, or voiced F0, and manual emotion-
intensity judgments. It directly evaluates multi-turn instruction following
and controllability, while the paper also relates results to post-training data
mixtures and speech-tokenizer design. The paper says the dataset will be
released after acceptance and provides no artifact link. An ungated
[10.15 GB candidate snapshot](https://huggingface.co/datasets/ak0255/StyleBench)
reproduces the paper's semantic and emotion-annotation instructions, but
neither source links the `ak0255` account to the authors or identifies it as
the promised official release. A focused August 9 metadata recheck resolves an
earlier size overstatement: the unchanged Hub revision
`73bb23289347c970157386f7b3fb0d8fd93a3d58` exposes only a README and one
10,151,760,917-byte `eval.tar.gz`, whose LFS SHA-256 is
`f7ebbbe8052d05a991f7ab096f1593cf40fb3566171e1120eede7beeb6b2fa15`.
The card still names no paper, author, or arXiv identifier, while the uploader
profile identifies itself only as `hak`. It publishes no lightweight file
inventory, schema, frozen ten-percent split manifest, or executable evaluator
outside that large archive. An exact-name GitHub search found no matching
repository. Its card declares CC BY 4.0, which does not establish provenance or
override terms for CosyVoice2 outputs, RAVDESS-derived conditioning, responder
timbres, or other incorporated material. No family, count increase, or helper
is added pending primary owner confirmation.

The June 2026 *RAIL* paper is recorded as a claimed-release but presently
unlocatable audio-LLM benchmark audit after reviewing Sections 3-5 and
Appendices A-D. It defines 5,306 audio questions (30.6 hours) across 32
Cattell-Horn-Carroll-aligned tasks: seven auditory-processing, three fluid-
reasoning, six memory, nine processing-efficiency, and seven acquired-
knowledge abilities. Its protocol compares 26 large audio-language models
with exact or task-specific accuracy, an LLM judge, and reasoning-token-budget
B-AUC; a 640-item subset also has responses from 24 human participants. This
directly evaluates outcomes of audio-encoder pretraining and reasoning-oriented
post-training by separating perception, stateful auditory reasoning, memory,
knowledge access, and efficient chain-of-thought behavior. The NeurIPS
checklist claims that benchmark data, metadata, code, instructions, and
licensing information were supplied through an anonymous repository, but the
paper and its arXiv source bundle contain no artifact URL. Exact-title GitHub
and Hugging Face dataset searches returned no match on August 8. The article
also calls the full set approximately 6,000 items in Appendix D despite Table
2's exact 5,306. With no frozen manifest, evaluation package, model outputs,
human-response rows, or verifiable benchmark license, RAIL remains an
unreleased/unlocatable protocol and adds no counted family or helper.
A focused August 9 recheck found that arXiv still exposes only version 1 and
that exact-title and broader benchmark searches on GitHub and Hugging Face
still return no matching release. The audit also corrects the paper license to
CC BY 4.0; that article license does not license the absent benchmark package.

The July 2026 SPEARBench family now has a focused release-completeness audit
after reviewing Sections 3-5 and the complete public repository tree. Its
5,419 English question-answer dialogues (37.33 hours including context,
question, and human answer audio) derive from the Seamless Interaction dev and
test sets and directly evaluate streaming speech-LLM post-training outcomes:
latency, interruptions, turn-taking, intelligibility, speech quality, language
and dialect consistency, emotional naturalness, interpersonal stance, and
temporal and spectral behavior. The official project links a public SharePoint
`SPEARBench_inputs.zip`, but retrieval is browser mediated and a direct
non-browser request returns SharePoint access denied, so the existing safe
helper continues to fetch only lightweight owner metadata and instructions.
The MIT owner repository releases inference wrappers, leaderboard summaries,
per-subset metric CSVs, reports, and plots for seven models and the human
condition. Contrary to the paper's Sections 1 and 5 claim of complete
evaluation code, its public tree contains no metric implementation or
end-to-end evaluation runner. MIT covers the released repository files, not
the missing evaluator or the Seamless Interaction-derived audio; neither the
paper nor project states a separate benchmark-audio license. The counted
family and helper remain, with no count change, while access and reproducibility
are now described conservatively.

The June 2026 Japanese-dialect robustness paper is recorded as an unreleased
derived evaluation audit of speech-LLM post-training rather than as a new
benchmark family. Sections III-A and III-C through IV-D compare four base LLMs
and their Whisper-connected speech variants on Japanese-to-English translation.
The dialect side uses 2,640 CPJD1 and 2,401 CPJD2 human-spoken utterances across
20 dialects; the paired standard side has 1,250 items per split whose otherwise
absent audio was synthesized with an unnamed TTS system. BLEU and BLEURT are
reported both directly and as a dialect-to-standard score ratio, while crossed
CPJD-set adapter training and Whisper encoder fine-tuning test whether
post-training improves regional robustness. The paper releases aggregate
tables but no frozen item manifests, GPT-4o English references, standard-speech
audio, synthesis configuration, prompts, code, checkpoints, predictions, or
item scores, and it links no project or artifact repository. The article's
arXiv perpetual non-exclusive license does not cover CPJD or the absent derived
materials. No counted family or helper is added.

The July 2026 *Just A Rather Very Intelligent Spoken Agent* paper is recorded
as an unreleased JarvisBench protocol audit after reviewing Sections 2-5 and
the official project site. Its agent-collaboration track compares the same
worker with and without sparse spoken mediation on 34 text-only WildClawBench
tasks, using failure-sensitive checkpoints, simulated expert guidance, and the
original WildClaw task score. Its user-interaction track fixes a worker, varies
the mediator brain, and measures end-of-question to start-of-response latency
plus one-to-five LLM-judge scores for trace-grounded progress answers and
task-consistent topic answers. This directly evaluates spoken-agent
transparency, controllability, interaction, and human feedback injection during
long-horizon tool use. The public site supplies descriptions, aggregate tables,
and selected streaming demos, but no frozen 34-task manifest, reference
mediator implementation, checkpoint schedule, simulator or judge prompts,
worker traces, interventions, ratings, or per-item scores. Exact-name GitHub
and Hugging Face searches found no JarvisBench release on August 9. The paper
is CC BY 4.0, but that article license does not cover absent evaluation
artifacts; the project site states no separate artifact license, and upstream
WildClawBench and vendor-service terms remain applicable. No counted family or
download helper is added.
A focused August 9 recheck found only arXiv version 1, zero exact-name GitHub
repository results, and no Hugging Face dataset or model results. The benchmark
page remains at its July 30 Last-Modified state and still links only local site
pages plus upstream WildClawBench, with no JarvisBench repository, archive,
license, or evaluator.

The July 2026 *Q-TriM* paper's official implementation repository has a
focused release-status recheck. Section 4.1 evaluates the already indexed
MUSIC-AVQA, MUSIC-AVQA-R, and MUSIC-AVQA-v2.0 families using their official
splits; Section 4.3 reports standard, long-tail robustness, and bias-balanced
audio-visual question-answering accuracy. This is directly relevant to
post-training evaluation because the derived families test whether an
audio-visual language model generalizes beyond answer-frequency shortcuts and
spurious modality correlations. As of August 9, the official Q-TriM repository
still resolves to its June 22 head commit and its complete four-file tree
contains only a README, `.gitignore`, one figure, and an image-directory
placeholder. The README still promises code later, with no implementation,
configuration, checkpoint, predictions, or per-item scores, and the repository
has no license. This leaves Q-TriM's model-specific artifacts unreleased while
preserving the public status and separate provenance of MUSIC-AVQA-R and
MUSIC-AVQA-v2.0. No benchmark count or helper changes.
A focused August 9 recheck also found that the README's nominal Paper link is
still the literal `YOUR_PAPER_LINK` placeholder and arXiv exposes only version
1. The repository head remains `604f17f9b93e99ffbb920295ac33542a444a3082`
from June 22, so neither channel supplies a newer implementation or evaluation
artifact.

The August 2026 [*Do Audio Language Models Use Paralinguistic
Evidence?*](https://arxiv.org/abs/2608.06718) paper is recorded as an
announced-but-unreleased counterfactual audit of
audio-language-model judges after reviewing Sections 3-5 and Appendices B-E.
Its main `single-turn-emotions` task derives 189 controlled pairs (378
pointwise instances) from CAVA's EmoCF subset, holding the transcript fixed
while changing the synthesized emotion and the appropriate assistant response.
Its `positional-emotion` task derives 500 paired conversations (1,000
pointwise instances) from OD3, moving the onset and cause of an affective shift
while preserving lexical content. Pointwise response choice, pairwise
contrastive recoverability, perception and oracle response-mapping probes,
eight-state `(P,O,J)` diagnostics, and a bootstrapped pairwise-minus-pointwise
protocol gap directly evaluate whether audio-LLM judges and reward evaluators
actually use paralinguistic evidence during spoken-system post-training and
evaluation. The paper also reports an earlier 500-instance
`emotional-conversations` prototype and small human-validation samples, but
these do not constitute separate released families. The only release statement
says that the construction pipeline "will be released"; the paper contains no
project, repository, or dataset URL, and its external links expose no owner
artifact. The frozen pairs, synthesized audio, annotations, construction and
quality-control code, prompts, judge outputs, human ratings, and per-item scores
therefore remain unavailable. CC BY 4.0 covers the article, not those absent
artifacts or the upstream CAVA, NormBank, OD3, and component dialogue sources.
No counted benchmark family or download helper is added pending an official
release.
A focused August 10 recheck confirms that arXiv still exposes only version 1,
dated August 7, and that the paper's only non-bibliographic artifact statement
remains Appendix B.2.3's promise to release the full construction pipeline.
Exact-title and arXiv-ID GitHub repository searches and Hugging Face dataset and
model searches return no matching release, so the two frozen task families and
their evaluator remain unavailable rather than public-but-undocumented.

The August 2026 [*Separating Decision-Rule Misalignment from Readout-Coverage
Limitations in Speech Language Models*](https://arxiv.org/abs/2608.06409)
paper is recorded as an unreleased derived-protocol audit after reviewing
Sections III-V and Supplementary Sections S1-S8. It evaluates five speech
language models on filtered four-emotion subsets of the already indexed
CREMA-D family (4,900 clips, 91 speakers) and VESUS (10,073 clips, 10
speakers). Its generation-aligned diagnostic ladder measures the same first
answer-token event as emitted-answer accuracy, option-only logit accuracy,
affine option-contrast readout accuracy, and full hidden-state readout
accuracy; their successive differences isolate endpoint, decision-rule, and
readout-coverage gaps. Speaker-disjoint outer folds, label-free transductive
logit correction, held-out subspace decoding, matched minimal-pair activation
replacement, and acoustic-descriptor and loudness controls further distinguish
paralinguistic information availability from its behavioral use. This directly
audits speech-LLM post-training and evaluation because an apparently weak
emotion answer can reflect a misaligned decision rule or unused internal
evidence rather than failed acoustic representation. The paper supplies
aggregate and supplementary tables but links no project, repository, or
dataset artifact; exact-name GitHub and Hugging Face searches on August 9 found
no owner release. Frozen corpus selections and speaker folds, prompt bank,
parsers, extracted logits and states, subspace-selection seeds, receiver-donor
pairs, intervention and correction code, predictions, and per-item scores
therefore remain unavailable. CC BY 4.0 covers the article, not these absent
derived artifacts or the separately governed CREMA-D and VESUS source audio.
No counted benchmark family or download helper is added.
A focused August 10 recheck confirms that arXiv still exposes only version 1,
updated August 3, and that the paper contains no owner artifact link or release
statement. Exact-title and arXiv-ID GitHub repository searches and Hugging Face
dataset and model searches return no matching release. The structured audit is
now also recorded in the YAML source of truth; the count remains unchanged.

The July 2026 [*Hearing Like Humans? Sound Symbolism and Perceptual Alignment
in Speech Language Models*](https://arxiv.org/abs/2607.10162) paper remains an
unverified-release protocol audit after a focused August 10 recheck of Section
3 and Appendices B-C. Its four experiments test forced-choice and graded
rounded-versus-pointed judgments for human-recorded pseudowords, audio-to-shape
matching, and a visual-only control. The protocol compares model decisions with
human ratings and dissimilarity structures, acoustic-cue correlations, and
deep-layer logit-lens readouts across eight speech/omni models. This is directly
relevant to speech-LLM pretraining evaluation because it tests whether learned
speech representations capture human perceptual cues and support crossmodal
transfer. The paper's sole code link still redirects to a 4open.science API
endpoint returning HTTP 401 with `not_connected`; arXiv still exposes only
version 1, and exact-name GitHub and Hugging Face searches return no matching
release. The full translated prompts, selected-item manifests, evaluator code,
repeated outputs, and score records therefore remain unavailable. The paper is
CC BY-SA 4.0, but its McCormick pseudoword recordings and Lacey shapes and
human data are restricted to academic-research sharing described in Appendix
C; the article license does not release those inputs or the absent derived
artifacts. No counted family or download helper is added.

The April 2026 *Audio-Cogito* release received a focused August 10 provenance
recheck after reviewing Sections 2-3, especially Section 3.1.2's MMAR
evaluation protocol. The paper trains with a public 545,000-sample annotation
file and evaluates answer accuracy plus five-item, GPT-4o-judged reasoning
rubrics under the Interspeech 2026 Audio Reasoning Challenge protocol. This is
directly relevant to audio-LLM post-training, but Audio-Cogito remains training
data rather than an independent benchmark and its evaluation uses the already
indexed MMAR family. The complete official GitHub tree remains three entries—a
README and two pipeline figures—at revision
`c340904787dfdb7f660071e8c8b2f2a4c281a11e`; the ungated Hub repository remains
three files at revision `7a13c646a5bd39d82d045bf86e251e215a8dc568`,
last modified July 3. No Cogito-Pipe code, model checkpoint, MMAR predictions,
or item-level scores are released. The Hub card's CC BY-NC 4.0 declaration
covers the annotation release, not upstream audio or absent artifacts. No
benchmark count or download helper changes.

The July 2026 *Latent-IM* release received a focused August 10 provenance
recheck after reviewing Sections 3-7 and Appendices A, C, and G. Its directly
post-training-relevant protocol evaluates whether frozen speech LLMs select
and realize five conversational moves and predict when to yield the floor,
using dialogue-grouped derived splits of MapTask, FindTask, and CReST. The
paper prints generation and Qwen2.5-72B move-classifier prompts and reports a
500-response, three-annotator validation, but it provides no artifact URL.
ArXiv remains at version 1; exact-title, arXiv-ID, and author GitHub searches
and Hugging Face dataset/model searches found no owner release. The frozen
turn manifests, label mappings, preprocessing and steering implementation,
generated responses, per-item predictions, and individual MTurk annotations
therefore remain unavailable. CC BY 4.0 covers the article, not absent derived
artifacts or the separately governed upstream dialogue corpora. No counted
benchmark family or download helper is added.

The July 2026 *M3-DuplexBench* release received a focused August 10 provenance
correction after re-reading Sections III-V and inspecting the complete public
demo repository. The paper's four tracks and SHIFT, PAUSE, backchannel, and
barge-in protocol directly evaluate multilingual full-duplex speech-LLM
post-training for timing, contextual consistency, and multi-turn QA. A broader
search found a previously missed
[demo repository](https://github.com/fury00812/m3-duplexbench-demo) owned by an
account naming first author Ryo Fukuda; its commit metadata uses an NTT
laboratory email address. At revision
`0a81af772525a950bc3c5db7a7d2e25ab3d558a8`, the complete tree contains 54 MP4
files (49,938,966 bytes) across eight numbered asset groups, while the page
renders six qualitative reference/model-output examples. It releases no event
manifest, derived English/Japanese QA set, translations, scoring or inference
code, judge prompts, predictions, or per-item scores. ArXiv remains at version
1, and Hugging Face still has no matching dataset or model release. The demo
repository has no license; neither its media nor the absent benchmark assets
inherit the article's arXiv license. M3-DuplexBench therefore remains an
uncounted, non-reproducible derived protocol with no helper, now documented as
a partial qualitative-demo release rather than wholly unlocated.

The June 2026 *AuRA: Internalizing Audio Understanding into LLMs as LoRA*
paper is recorded as an existing-family evaluation audit after reviewing
Sections 3-4 and Appendix A. AuRA distills a frozen Whisper-large-v3 encoder
into early LoRA-adapted LLM layers and removes the teacher at inference, making
its results directly relevant to transfer from pretrained speech encoders into
LLMs. It evaluates the public HeySQuAD human validation data with PEDANTS and
the public 494-question SD-QA release with CFM across eleven dialect groups,
then reports mean end-to-end latency and peak H20 inference memory. The paper
describes an approximately 1,000-pair HeySQuAD selection but does not release
its frozen manifest. It links no project or artifact repository; exact-title
and arXiv-ID GitHub searches and arXiv-ID Hugging Face dataset/model searches
found no owner release. Code, configuration, LoRA weights, predictions,
per-item scores, and timing records remain unavailable. The article has only
the arXiv perpetual non-exclusive license. HeySQuAD's Hub card declares CC BY
4.0 for its owner-hosted data, while SD-QA and all underlying sources retain
their own terms; neither licenses absent AuRA artifacts. No benchmark count or
download helper changes because the paper contributes no independent public
evaluation family.

The July 2026 *Text-Prompted CLAP: Learning Query-Conditioned Audio
Representations via Contrastive Learning* paper is recorded as an
existing-family and unreleased-derived-protocol audit after reviewing Sections
3.1-3.2 and 4.1-4.4. TP-CLAP tests whether audio-caption contrastive pretraining
followed by AudioMCQ supervision transfers to AudioCaps and Clotho retrieval;
zero-shot classification on ESC-50, FSD50K, UrbanSound8K, VocalSound, CREMA-D,
GTZAN, Beijing Opera, and NSynth; and sound/music question answering on MMAU
and MMAR. Its distinct evaluation fine-tunes query-conditioned retrieval on
NSynth instrument, pitch, and source attributes and MagnaTagATune genre,
instrument, and tempo tags, reporting Precision@K and mAP or multi-label
SoftPrecision@K and SoftmAP. This directly audits audio-language pretraining
transfer and whether post-training exposes the acoustic attribute requested by
a text query. All counted evaluation sources map to existing public families;
Beijing Opera is only a conventional classification row and is not added in
this focused increment. The paper links no project or artifact repository, and
exact-title and arXiv-ID GitHub searches plus TP-CLAP Hugging Face dataset and
model searches found no owner release. Code, checkpoints, prompt templates,
class mappings, paper-specific audio-attribute pairs and splits, retrieval
rankings, predictions, and per-item scores therefore remain unavailable. CC BY
4.0 covers the article, not those absent artifacts; all upstream datasets and
source media retain their own terms. No benchmark count or download helper
changes.
