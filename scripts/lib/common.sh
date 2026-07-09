#!/usr/bin/env bash

set -euo pipefail

SCRIPT_LIB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_LIB_DIR/../.." && pwd)"
DOWNLOAD_ROOT="${DATASET_DOWNLOAD_DIR:-$REPO_ROOT/data/raw}"

require_cmd() {
  local cmd="$1"
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "Missing required command: $cmd" >&2
    exit 127
  fi
}

dataset_dir() {
  local name="$1"
  local dir="$DOWNLOAD_ROOT/$name"
  mkdir -p "$dir"
  printf '%s\n' "$dir"
}

download_url() {
  local url="$1"
  local out="$2"
  mkdir -p "$(dirname "$out")"
  require_cmd curl
  if [[ -s "$out" ]]; then
    echo "Already exists: $out"
    return 0
  fi
  echo "Downloading: $url"
  curl -L --fail --continue-at - --output "$out" "$url"
}

hf_download_dataset() {
  local repo_id="$1"
  local out_dir="$2"
  shift 2
  mkdir -p "$out_dir"
  echo "Downloading Hugging Face dataset: $repo_id -> $out_dir"
  if command -v huggingface-cli >/dev/null 2>&1 && huggingface-cli download --help >/dev/null 2>&1; then
    huggingface-cli download \
      --repo-type dataset \
      "$repo_id" \
      "$@" \
      --local-dir "$out_dir" \
      --local-dir-use-symlinks False
    return 0
  fi

  require_cmd python3
  python3 - "$repo_id" "$out_dir" "$@" <<'PY'
import sys

try:
    from huggingface_hub import snapshot_download
except ImportError:
    print(
        "Missing huggingface_hub. Install it with: "
        "python3 -m pip install -U huggingface_hub",
        file=sys.stderr,
    )
    raise SystemExit(127)

repo_id = sys.argv[1]
out_dir = sys.argv[2]
args = sys.argv[3:]

allow_patterns = []
i = 0
while i < len(args):
    arg = args[i]
    if arg == "--include":
        i += 1
        if i >= len(args):
            raise SystemExit("--include requires a pattern")
        allow_patterns.append(args[i])
    elif arg.startswith("--include="):
        allow_patterns.append(arg.split("=", 1)[1])
    elif arg.startswith("-"):
        raise SystemExit(f"Unsupported Hugging Face option in fallback: {arg}")
    else:
        allow_patterns.append(arg)
    i += 1

snapshot_download(
    repo_id=repo_id,
    repo_type="dataset",
    local_dir=out_dir,
    allow_patterns=allow_patterns or None,
    local_dir_use_symlinks=False,
)
PY
}

clone_or_update() {
  local repo_url="$1"
  local out_dir="$2"
  require_cmd git
  if [[ -d "$out_dir/.git" ]]; then
    echo "Updating repo: $out_dir"
    git -C "$out_dir" pull --ff-only
  else
    echo "Cloning repo: $repo_url -> $out_dir"
    git clone --depth 1 "$repo_url" "$out_dir"
  fi
}

manual_required() {
  local name="$1"
  shift
  echo "$name cannot be downloaded by this script without extra manual access." >&2
  printf '%s\n' "$@" >&2
  exit 2
}
