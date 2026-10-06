#!/usr/bin/env bash
set -euo pipefail

TARGET="all"
FORCE="0"

usage() {
  cat <<'EOF'
Install the Master Test skill for Codex and/or Cursor.

Usage:
  ./scripts/install.sh [--target all|codex|cursor] [--force]

Options:
  --target   Install target. Defaults to all.
  --force    Replace an existing master-test skill directory.
EOF
}

while [ "$#" -gt 0 ]; do
  case "$1" in
    --target)
      TARGET="${2:-}"
      shift 2
      ;;
    --force)
      FORCE="1"
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage >&2
      exit 2
      ;;
  esac
done

case "$TARGET" in
  all|codex|cursor) ;;
  *)
    echo "Invalid --target: $TARGET" >&2
    usage >&2
    exit 2
    ;;
esac

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
REPO_ROOT="$(cd -- "$SCRIPT_DIR/.." && pwd -P)"

install_skill() {
  local source_dir="$1"
  local dest_dir="$2"
  local label="$3"

  if [ ! -f "$source_dir/SKILL.md" ]; then
    echo "Missing source skill: $source_dir/SKILL.md" >&2
    exit 1
  fi

  if [ -e "$dest_dir" ]; then
    if [ "$FORCE" != "1" ]; then
      echo "$label already exists at $dest_dir"
      echo "Re-run with --force to replace it."
      exit 1
    fi
    rm -rf -- "$dest_dir"
  fi

  mkdir -p -- "$(dirname -- "$dest_dir")"
  cp -R -- "$source_dir" "$dest_dir"
  echo "Installed $label skill to $dest_dir"
}

if [ "$TARGET" = "all" ] || [ "$TARGET" = "codex" ]; then
  CODEX_HOME="${CODEX_HOME:-$HOME/.codex}"
  install_skill "$REPO_ROOT/.codex/skills/master-test" "$CODEX_HOME/skills/master-test" "Codex"
fi

if [ "$TARGET" = "all" ] || [ "$TARGET" = "cursor" ]; then
  install_skill "$REPO_ROOT/.cursor/skills/master-test" "$HOME/.cursor/skills/master-test" "Cursor"
fi

echo "Done. Restart Codex/Cursor or start a new chat so the skill is discovered."
