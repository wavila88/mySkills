#!/usr/bin/env bash
# Installs the skills in this repo for Claude Code and opencode (user level).
# Usage: ./install.sh [claude|opencode|both] [skill-name]
set -euo pipefail
target="${1:-both}"
skill="${2:-start-free-day}"
here="$(cd "$(dirname "$0")" && pwd)"
src="$here/$skill"
[ -f "$src/SKILL.md" ] || { echo "No SKILL.md in $src" >&2; exit 1; }

install_to() {
  mkdir -p "$1"
  cp -R "$src/." "$1/"
  echo "Installed $skill -> $1"
}

case "$target" in
  claude|both)   install_to "$HOME/.claude/skills/$skill" ;;
esac
case "$target" in
  opencode|both) install_to "$HOME/.config/opencode/skills/$skill" ;;
esac
